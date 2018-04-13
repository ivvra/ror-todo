class Task < ApplicationRecord
  belongs_to :bucket
  has_many :tag_subscriptions
  has_many :tags, through: :tag_subscriptions

  def complete
    self.done = true
    self.completed_at = DateTime.now
    self.save
  end

end
