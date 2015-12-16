feature 'when a user creates a new account' do
  scenario 'a welcome message is shown' do
    visit('/register')
    fill_in('name', with: 'Giamir')
    fill_in('email', with: 'giamir.buoncristiani@gmail.com')
    fill_in('password', with: 'giamir90')
    click_button('Register')
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome Giamir!'
  end

  scenario 'user count increases by 1' do
    visit('/register')
    fill_in('name', with: 'Giamir')
    fill_in('email', with: 'giamir.buoncristiani@gmail.com')
    fill_in('password', with: 'giamir90')
    expect { click_button('Register') }.to change { User.last.id }.by(1)
  end

  scenario 'user email address entered matches the one saved in database' do
    visit('/register')
    fill_in('name', with: 'Giamir')
    fill_in('email', with: 'giamir.buoncristiani@gmail.com')
    fill_in('password', with: 'giamir90')
    expect(User.last.email).to be eq 'giamir.buoncristiani@gmail.com'
  end
end
