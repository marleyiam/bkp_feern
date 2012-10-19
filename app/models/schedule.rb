class Schedule
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  validates_presence_of :schedule_text
  attr_accessor :schedule_text

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
  
  def self.get
    Schedule.new(schedule_text: $redis.get('feern-schedule'))
  end

  def update
    $redis.set 'feern-schedule', @schedule_text
    self
  end
end