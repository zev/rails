class Person
  class RecordNotFound < StandardError; end

  include GlobalID::Identification

  attr_reader :id

  def self.find(id)
    # THIS IS NOT AN AR ERROR
    raise RecordNotFound.new("#{self.name} could not find id=#{id}") if id.to_i==404 # "Cannot find person with ID=404"
    #raise ActiveRecord::RecordNotFound.new(self.name, "id=#{id}") if id.to_i==404 # "Cannot find person with ID=404"
    new(id)
  end

  def initialize(id)
    @id = id
  end

  def ==(other_person)
    other_person.is_a?(Person) && id.to_s == other_person.id.to_s
  end
end
