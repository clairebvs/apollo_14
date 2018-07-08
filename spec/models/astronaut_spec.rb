require "rails_helper"

describe 'Class Methods' do
    it 'knows about average age of comedians' do
      astronaut_1 = Astronaut.create(name: "Paul", age: 50, job: "Commander")
      astronaut_2 = Astronaut.create(name: "John", age: 20, job: "Mechanician")
      expected_result = 35

      expect(Astronaut.average_age).to eq(expected_result)
    end
  end

  describe Astronaut, type: :model do
    describe 'relationships' do
      it {should have_many(:space_missions).through(:astronaut_space_missions)}
    end
  end

  describe 'Instance methods' do
    it 'can sort alphabetically the space mission' do
      astronaut = Astronaut.create(name: "Paul", age: 50, job: "Commander")
      space_mission_1 = SpaceMission.create(title: "Apollo", trip_length: 34)
      space_mission_2 = SpaceMission.create(title: "Odysse", trip_length: 45)
      AstronautSpaceMission.create(astronaut_id: astronaut.id, space_mission_id: space_mission_1.id)
      AstronautSpaceMission.create(astronaut_id: astronaut.id, space_mission_id: space_mission_2.id)

      expect(astronaut.space_missions_order).to eq([space_mission_1, space_mission_2])
    end

    it 'can sum total time in space for each astronauts' do
      astronaut = Astronaut.create(name: "Paul", age: 50, job: "Commander")
      space_mission_1 = SpaceMission.create(title: "Apollo", trip_length: 34)
      space_mission_2 = SpaceMission.create(title: "Odysse", trip_length: 45)
      AstronautSpaceMission.create(astronaut_id: astronaut.id, space_mission_id: space_mission_1.id)
      AstronautSpaceMission.create(astronaut_id: astronaut.id, space_mission_id: space_mission_2.id)

      expected_result = 79

      expect(astronaut.total_time).to eq(expected_result)
    end


  end
