require 'send_recovery_link'

describe SendRecoverLink do
  let(:user) { double :user, email: 'test@test.com', password_token: '12345678' }
  let(:mail_gun_client) { double :mail_gun_client }
  let(:sandbox_domain_name) { ENV['MAILGUN_DOMAIN_NAME'] }

  it 'sends a message to mailgun when it is called' do
    params = { from: 'postmaster@sandbox3eac17a519364cc8b7b1760d526e3efc.mailgun.org',
               to: user.email,
               subject: 'reset your password',
               text: "click here to reset your password http://bookmark-manager-giamir.com/reset_password?token=#{user.password_token}" }
    expect(mail_gun_client).to receive(:send_message).with(sandbox_domain_name, params)
    described_class.call(user, mail_gun_client)
  end
end
