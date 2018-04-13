class Tag < ApplicationRecord
  has_many :tag_subscriptions
  has_many :tasks, through: :tag_subscriptions
  
  class << self
    def method_missing(name, *args, **kwargs)
        t = self.where(name: name.to_s).first
        if t.present?
            t
        else
            raise NoMethodError.new
        end
    end
  end
end
