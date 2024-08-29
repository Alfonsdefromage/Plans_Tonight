class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :bar, optional: true # optional if bar is assigned after polls are submitted
  has_many :polls, dependent: :destroy
  has_many :users, through: :polls
  accepts_nested_attributes_for :polls, allow_destroy: true

  validates :date_time, presence: true
  validates :deadline, presence: true
  validates :location, presence: true

  enum status: { pending: 0, done: 1, past: 2}

  scope :past, -> { where(status: :past) }
  scope :pending, -> { where(status: :pending) }
  scope :done, -> { where(status: :done) }

  before_validation :set_deadline, if: -> { date_time.present? && deadline.blank?}

  def all_polls_filled?
    polls.all?(&:filled?)
  end

  def deadline_passed?
    deadline.present? && deadline < Time.current
  end

  # def close_polls!
  #   update(deadline: DateTime.now, status: :done)
  #   moods = polls.pluck(:mood)
  #   moods.delete(nil)
  #   self.bar = Bar.find_by(mood: moods&.max) || Bar.all.sample
  #   self.save
  # end
  def close_polls!(location)

    location = location.capitalize
    update(deadline: DateTime.now, status: :done)

    self.bar = Bar.where(location: location).first

    self.bar ||= Bar.all.sample

    self.save
  end

  private

  def set_deadline
    self.deadline = date_time - 1.hour
  end

  def deadline_presence
    errors.add(:deadline, "can't be blank") if date_time.present? && deadline.blank?
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
