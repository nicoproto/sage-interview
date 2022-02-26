require "rails_helper"

feature "User searches Chuck Norris facts" do
  scenario "by category" do
    visit root_path
    wait_for_ajax

    click_link "Animal"

    expect(page).not_to have_css("#result", text: "")
  end

  scenario "by word" do
    visit root_path
    wait_for_ajax

    fill_in "query", with: "cow"

    expect(page).not_to have_css("#result", text: "")
  end

  scenario "randomly" do
    visit root_path
    wait_for_ajax

    click_link "Random"

    expect(page).not_to have_css("#result", text: "")
  end
end
