module SessionHelpers
  def sign_up(name: 'Giamir',
              email: 'giamir@email.com',
              password: 'giamir',
              password_confirmation: 'giamir')
    visit('/users/new')
    fill_in('name', with: name)
    fill_in('email', with: email)
    fill_in('password', with: password)
    fill_in('password_confirmation', with: password_confirmation)
    click_button('Register')
  end

  def sign_in(email: 'giamir@email.com', password: 'giamir')
    User.create(name: 'Giamir',
                email: 'giamir@email.com',
                password: 'giamir',
                password_confirmation: 'giamir')
    visit('/sessions/new')
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button('Log in')
  end

  def sign_out
    sign_in
    click_button('Log out')
  end

  def recover_password
    visit '/users/recover'
    fill_in :email, with: 'giamir@email.com'
    click_button 'Submit'
  end
end
