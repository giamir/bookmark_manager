feature 'Signing in' do
  scenario 'a welcome message is displayed to him' do
    sign_in
    expect(page).to have_content('Welcome Giamir!')
  end
  scenario 'a log out button is displayed' do
    sign_in
    expect(page).to have_content('Welcome Giamir!')
  end
end
