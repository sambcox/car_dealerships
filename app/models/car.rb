class Car < ApplicationRecord
  belongs_to :dealership, counter_cache: true

  def self.filter_by_name(name_input)
    name = arel_table[:name]
    where(name.matches("%#{name_input}%"))
  end
end
