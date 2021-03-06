require_relative '../app/models/user'

describe User do
  let!(:user) do
    User.create(name: 'Giamir',
                email: 'email@email.com',
                password: '123',
                password_confirmation: '123')
  end
  describe '::authenticate' do
    it 'returns user id if passwords match' do
      expect(described_class.authenticate('email@email.com', '123'))
        .to eq user.id
    end
    it 'returns nil if passwords do not match' do
      expect(described_class.authenticate('email@email.com', 'wrong'))
        .to be nil
    end
  end
  describe '#generate_token' do
    it 'saves a password recovery token when we generate a token' do
      expect { user.generate_token }.to change { user.password_token }
    end
    it 'saves a password recovery token time when we generate a token using' do
      Timecop.freeze do
        user.generate_token
        expect(user.password_token_time).to eq Time.now
      end
    end
  end
  describe '::find_by_valid_token' do
    it 'can find a user with a valid token' do
      user.generate_token
      expect(User.find_by_valid_token(user.password_token)).to eq user
    end
    it 'can\'t find a user with a token over 1 hour in the future' do
      user.generate_token
      Timecop.travel(60 * 60 + 1) do
        expect(User.find_by_valid_token(user.password_token)).to eq nil
      end
    end
  end
end
