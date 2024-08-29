class PlansController < ApplicationController
  before_action :authenticate_user!

  def new
    @body_class = "bg-yellow"
    @plan = Plan.new
    @plan.polls.build
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user = current_user

    @plan.update(status: :pending)
    if @plan.save
      redirect_to invitation_plan_path(@plan), notice: 'Invite your friends to participate.'
    else
      render :new, status: :unprocessable_entity, notice: "Please answer this question."
    end
  end

  def index
    @plans = Plan.all
    @user = current_user.id
    @brewing_plans = current_user.invited_plans.where(bar: nil)
    @completed_plans = current_user.invited_plans.where.not(bar: nil)
    @body_class = "bg-yellow"
  end

  def invitation
    @users = User.all
    @plan = Plan.find(params[:id])
    @body_class = "bg-yellow"
  end

  def invite
    @body_class = "bg"
    @plan = Plan.find(params[:id])
    @poll = Poll.new
    create_poll
    LineMessageService.new("Sup? #{@plan.user.username} wants to have some Plans with you. Let them know if you're going: #{plan_url(@plan)}").call
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("invite-#{@poll.user.id}", partial: "shared/invited_btn")
      end
    end
  end

  def show
    @body_class = "bg"
    @plan = Plan.find(params[:id])
    @users = User.all
    @bar = @plan.bar

    if @bar
    @marker = [
      {
        lat: @bar.latitude,
        lng: @bar.longitude
      }
    ]
    end

    unless @plan.polls.find_by(user: current_user, submitted: true)
      redirect_to new_plan_poll_path(@plan)
    end
    # render turbo_stream: turbo_stream.replace(:polls, partial: "shared/waiting_show",
    #   locals: { poll: @poll, plan: @plan})
  end


  # def update
  #   @plan = Plan.find(params[:id])
  #   # @plan.polls.all = 'submitted'
  #   @plan.close_polls!
  #   redirect_to plan_path(@plan)
  # end
  def update
    @plan = Plan.find(params[:id])
    # Ensure the location is available and passed correctly
    location = @plan.location

    if @plan.close_polls!(location) # Pass the location argument
      redirect_to plan_path(@plan), notice: 'Plan was successfully updated.'
    else
      render :edit
    end
  end

  # def mark_as_done
  #   @plan = Plan.find(params[:id])
  #   @plan.update_status
  #   redirect_to @plan.user, notice: 'Plan was successfully marked as done'
  # end

  # def mark_as_pending
  #   @plan = Plan.find(params[:id])
  #   @plan.update(status: :pending)
  #   redirect_to @plan.user, notice: 'Plan was successfully marked as pending'
  # end

  # def mark_as_past
  #   @plan = Plan.find(params[:id])
  #   @plan.update(status: :past)
  #   redirect_to @plan.user, notice: 'Plan was successfully marked as past'
  # end

  private

  def create_poll
    @poll.submitted = false
    @poll.plan = @plan
    @poll.user_id = params[:user_id]
    @poll.save
  end

  def plan_params
    params.require(:plan).permit(:date_time, :deadline, :location, polls_attributes: [:mood, :alcohol, :smoking, :food, :user_id, :submitted])
  end
end
