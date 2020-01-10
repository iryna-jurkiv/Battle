feature 'Attacking' do
  scenario 'Attack Player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Dave attacked Mittens'
  end

  scenario 'Attack Player 1' do
    sign_in_and_play
    attack_and_confirm
    click_button 'Attack'
    expect(page).to have_content "Mittens attacked Dave"
  end

  context 'when dealing set damage' do
    before do
      allow(Kernel).to receive(:rand).and_return(10)
  end

  scenario "reduce Player 2 HP by 10 " do
    sign_in_and_play
    attack_and_confirm
    expect(page).not_to have_content "Mittens: 60 HP"
    expect(page).to have_content "Mittens: 50 HP"
  end

  scenario "reduce Player 1 HP by 10" do
    sign_in_and_play
    2.times { attack_and_confirm }
    expect(page).not_to have_content "Dave: 60 HP"
    expect(page).to have_content "Dave: 50 HP"
  end
end
end 
