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
end
