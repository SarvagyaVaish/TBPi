class Event < ActiveRecord::Base
  attr_accessible :end, :event_type_id, :name, :start
end
