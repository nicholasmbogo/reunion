class Activity

  attr_reader :name,
              :participants,
              :total_cost

  def initialize(name = "hiking", participants = {}, total_cost = 120)
    @name = name
    @participants = participants
    @total_cost = total_cost
  end

  def add_participants
    participants
  end

  def total_paid
    participants.values.sum
  end

  def amount_owed(name)
    per_person = total_cost / participants.length
    per_person - participants[name]
  end
end
