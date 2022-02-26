require "rails_helper"

feature "User searches Chuck Norris facts" do
  scenario "by category" do
    wait_for_ajax
    visit root_path

    click_link "Animal"

    expect(page).not_to have_css("#result", text: "")
  end

  scenario "by word" do
    visit root_path

    fill_in "query", with: "cow"

    expect(page).not_to have_css("#result", text: "")
  end

  scenario "randomly" do
    visit root_path

    click_link "Random"

    expect(page).not_to have_css("#result", text: "")
  end
end
