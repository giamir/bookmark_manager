feature 'Multiple tags' do
  # As a time-pressed user
  # So that I can organise my links into different categories for ease of search
  # I would like to add tags to the links in my bookmark manager
  scenario 'user is able to add multiple tags' do
    visit '/links'
    click_button 'Add link'
    fill_in('title', with: 'Makers Academy')
    fill_in('url', with: 'www.makersacademy.com')
    fill_in('tag', with: 'bubbles, dev,, tag1,tag2')
    click_button 'Save'
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content 'bubbles, dev, tag1, tag2'
    end
  end
end
