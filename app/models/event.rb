class Event < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :event_type, presence: true, inclusion: { 
    in: %w[workout meeting personal work other],
    message: "%{value} is not a valid event type" 
  }
  
  validate :end_time_after_start_time
  
  scope :upcoming, -> { where('start_time > ?', Time.current) }
  scope :past, -> { where('start_time < ?', Time.current) }
  scope :today, -> { where(start_time: Date.current.beginning_of_day..Date.current.end_of_day) }
  scope :by_type, ->(type) { where(event_type: type) }
  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where(completed: false) }
  
  def duration_in_hours
    return 0 unless start_time && end_time
    ((end_time - start_time) / 1.hour).round(2)
  end
  
  def status
    return 'completed' if completed?
    return 'ongoing' if ongoing?
    return 'upcoming' if upcoming?
    'past'
  end
  
  def upcoming?
    start_time > Time.current
  end
  
  def ongoing?
    start_time <= Time.current && end_time >= Time.current
  end
  
  def toggle_completion!
    update!(completed: !completed)
  end
  
  private
  
  def end_time_after_start_time
    return unless start_time && end_time
    
    if end_time <= start_time
      errors.add(:end_time, "must be after start time")
    end
  end
end