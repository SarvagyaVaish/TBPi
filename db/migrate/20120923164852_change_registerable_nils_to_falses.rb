class ChangeRegisterableNilsToFalses < ActiveRecord::Migration
  def up
    Event.all.each do |e|
      e.registerable = false
      e.save
    end
  end

  def down
  end
end
