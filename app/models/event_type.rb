class EventType < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

  has_many :events, :dependent => :destroy
end
