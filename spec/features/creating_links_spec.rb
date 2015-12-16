feature 'creating links' do
  # As a User
  # So that I can come back to websites I like
  # I want to add new links to the list with their title
  scenario 'user adds a link' do
    visit '/links'
    click_button 'Add link'
    fill_in_form_and_save
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content 'Makers Academy'
    end
  end
end
