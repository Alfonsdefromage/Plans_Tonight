class Poll < ApplicationRecord
  belongs_to :user
  belongs_to :plan

  # validates :mood, presence: true
  # validates :alcohol, presence: true
  # validates :smoking, inclusion: { in: [true, false] }
  # validates :food, inclusion: { in: [true, false] }
  validates :submitted, inclusion: { in: [true, false] }
  validates :user, uniqueness: { scope: :plan }

  def filled?
    submitted == true
  end

  after_update_commit :broadcast_poll
  after_update_commit :broadcast_poll2

  private

  def broadcast_poll
    broadcast_replace_to "plan_#{plan.id}_submitted",
                        partial: "plans/submitted",
                        locals: { poll: self, plan: plan },
                        target: 'submitted'
  end

  def broadcast_poll2
    broadcast_replace_to "plan_#{plan.id}_not_submitted",
                        partial: "plans/not_submitted",
                        locals: { poll: self, plan: plan },
                        target: 'not_submitted'
  end
end
