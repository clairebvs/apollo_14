require "rails_helper"

describe "user_index" do
  scenario "user can see all astronauts" do
    astronaut_1 = Astronaut.create(name: "Paul", age: 50, job: "Commander")
    astronaut_2 = Astronaut.create(name: "John", age: 20, job: "Mechanician")

    visit '/astronauts'

    expect(page).to have_content("All Astronauts")
    expect(page).to have_content("#{astronaut_1.name}")
    expect(page).to have_content(astronaut_1.age)
    expect(page).to have_content(astronaut_1.job)
    expect(page).to have_content(astronaut_2.name)
    expect(page).to have_content(astronaut_2.age)
    expect(page).to have_content(astronaut_2.job)
  end

  scenario 'user_can_see_average_age_astronauts' do
    astronaut_1 = Astronaut.create(name: "Paul", age: 50, job: "Commander")
    astronaut_2 = Astronaut.create(name: "John", age: 20, job: "Mechanician")

    visit '/astronauts'
    expected_result = 35

    expect(page).to have_content("Average age: #{expected_result}")
  end

end
