feature 'when a user creates a new account' do
  scenario 'a welcome message is shown' do
    fill_in_register_form
    fill_in('password_confirmation', with: 'giamir90')
    click_button('Register')
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome Giamir!'
  end

  scenario 'user count increases by 1' do
    fill_in_register_form
    fill_in('password_confirmation', with: 'giamir90')
    expect { click_button('Register') }.to change { User.count }.by(1)
  end

  scenario 'user email address entered matches the one saved in database' do
    fill_in_register_form
    fill_in('password_confirmation', with: 'giamir90')
    click_button('Register')
    expect(User.last.email).to eq 'giamir.buoncristiani@gmail.com'
  end

  scenario 'if the there is a mismatching password confirmation no new users are created' do
    fill_in_register_form
    fill_in('password_confirmation', with: 'giamir')
    expect { click_button('Register') }.not_to change { User.count }
  end
end
