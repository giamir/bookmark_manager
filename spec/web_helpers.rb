def fill_in_form_and_save(tag = 'dev')
  fill_in('title', with: 'Makers Academy')
  fill_in('url', with: 'www.makersacademy.com')
  fill_in('tag', with: tag)
  click_button 'Save'
end

def fill_in_register_form(name: 'Giamir',
                          email: 'giamir@email.com',
                          password: 'giamir',
                          password_confirmation: 'giamir')
  visit('/register')
  fill_in('name', with: name)
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('Register')
end
