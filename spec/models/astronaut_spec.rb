require "rails_helper"

describe 'Class Methods' do
    it 'knows about average age of comedians' do
      astronaut_1 = Astronaut.create(name: "Paul", age: 50, job: "Commander")
      astronaut_2 = Astronaut.create(name: "John", age: 20, job: "Mechanician")
      expected_result = 35

      expect(Astronaut.average_age).to eq(expected_result)
    end
  end
