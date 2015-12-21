feature 'Signing out' do
  scenario 'is redirected to the links page and a goodbye message is displayed' do
    sign_out
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Goodbye Giamir!'
  end
end
