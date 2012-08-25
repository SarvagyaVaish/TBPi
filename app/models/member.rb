class Member < ActiveRecord::Base
  attr_accessible :first_name, :gtid, :last_name, :role_id, :gtusername

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :gtid, :presence => true
  validates :role_id, :presence => true
  validates :gtusername, :presence => true

  has_many :attendances, :dependent => :destroy
  has_many :events, :through => :attendances
  belongs_to :role

  def isWebmaster?
    begin
      return true if role.name == 'Webmaster'
    rescue
    end
    return false
  end

  def isOfficer?
    begin
      return true if role.name == 'Officer'
    rescue
    end
    return false
  end

  def name
    "#{first_name} #{last_name}"
  end

end
