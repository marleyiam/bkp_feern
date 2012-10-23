class Schedule
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  validates_presence_of :schedule_type, :schedule_text
  attr_accessor :schedule_type, :schedule_text

  def initialize(attributes = {})
    @attributes = attributes
    @attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

  def persisted?
    false
  end
  
  def self.get(type='feern-schedule')
    Schedule.new(schedule_type: type, schedule_text: $redis.get(type))
  end

  def update
    $redis.set @schedule_type, @schedule_text
    self
  end
end