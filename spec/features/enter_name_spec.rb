feature "Enter names" do
  scenario 'Submitting names' do
    visit('/')
    fill_in :player_1_name, with: "Dave"
    fill_in :player_2_name, with: "Kittens"
    click_button "submit"
    expect(page).to have_content 'Dave vs. Kittens'
  end
end