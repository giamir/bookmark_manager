# As a User
# So that I can visit useful websites
# I want to see a list of links

feature 'viewing links' do
  before(:all) do
    Link.create(title: 'Example Link', url: 'http://example.com')
  end

  scenario 'displays the link from the database' do
    visit ('/links')
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Example Link')
    end
  end
end
