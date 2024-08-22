class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :bar, optional: true # optional if bar is assigned after polls are submitted
  has_many :polls, dependent: :destroy
  accepts_nested_attributes_for :polls, allow_destroy: true

  validates :date_time, presence: true

  enum status: { pending: 'pending', done: 'done', past: 'past'}

  scope :past, -> { where(status: :past) }
  scope :pending, -> { where(status: :pending) }
  scope :done, -> { where(status: :done) }

  def all_polls_filled?
    polls.all?(&:filled?)
  end

  def deadline_passed?
    deadline.present? && deadline < Time.current
  end

  # def update_status
  #   if deadline_passed? || all_polls_filled?
  #     assign_bar
  #     update(status: :done)
  #   end
  # end

  # private
  # def assign_bar
  #   mood = polls.group(:mood).order('count_all DESC').count.first&.first
  #   drinking = polls.group(:alcohol).order('count_all DESC').count.first&.first
  #   smoking = polls.group(:smoking).order('count_all DESC').count.first&.first
  #   food = polls.group(:food).order('count_all DESC').count.first&.first

  #   selected_bar = Bar.where(
  #     mood: mood,
  #     alcohol: drinking,
  #     smoking_allowed: smoking,
  #     food: food
  #   ).first

  #   update(bar: selected_bar) if selected_bar.present?
  # end
end
