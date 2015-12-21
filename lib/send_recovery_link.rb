require 'mailgun'

class SendRecoverLink
  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
  end

  def self.call(user, mailer = nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message(
      ENV['MAILGUN_DOMAIN_NAME'],
      from: 'postmaster@' << ENV['MAILGUN_DOMAIN_NAME'],
      to: user.email,
      subject: 'reset your password',
      text: "click here to reset your password http://bookmark-manager-giamir.com/reset_password?token=#{user.password_token}"
    )
  end

  private

  attr_reader :mailer
end
