feature 'Creating a new account' do
  scenario 'a welcome message is shown' do
    sign_up
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome Giamir!'
  end

  scenario 'user count increases by 1' do
    expect { sign_up }.to change { User.count }.by(1)
  end

  scenario 'user email address entered matches the one saved in database' do
    sign_up
    expect(User.last.email).to eq 'giamir@email.com'
  end

  scenario 'if the there is a mismatching password confirmation no new users are created' do
    expect { sign_up(password_confirmation: 'nomatch') }.not_to change { User.count }
  end

  scenario 'if the password does not match stay in register page and display a messsage' do
    sign_up(password_confirmation: 'nomatch')
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'if the password does not match should keep email address' do
    sign_up(password_confirmation: 'nomatch')
    expect(find('input[name="email"]')['value']).to eq 'giamir@email.com'
  end

  scenario 'if the submitted email is blank display a message' do
    sign_up(email: '')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'if the submitted email is invalid display a message' do
    sign_up(email: 'no_valid_email')
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'if the submitted email is already in the database display a message' do
    sign_up
    sign_up
    expect(page).to have_content 'Email is already taken'
  end
end
