# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Test User model validation' do
    it 'create new user' do
      new_user = create(:user)
      expect(new_user).to be_valid
    end

    it 'Is invalid if lastname is nil/empty' do
      nil_lastname = build(:user, lastname: '')
      expect(nil_lastname).not_to be_valid
    end

    it 'Is invalid if firstname is nil/empty' do
      nil_firstname = build(:user, firstname: '')
      expect(nil_firstname).not_to be_valid
    end

    it 'Is invalid if email is nil/empty' do
      nil_email = build(:user, email: '')
      expect(nil_email).not_to be_valid
    end

    it 'Is invalid if dob is nil/empty' do
      nil_dob = build(:user, dob: '')
      expect(nil_dob).not_to be_valid
    end

    it 'Is invalid if gender is nil/empty' do
      nil_gender = build(:user, gender: '')
      expect(nil_gender).not_to be_valid
    end

    it 'Is invalid if password is nil/empty' do
      nil_password = build(:user, password: '')
      expect(nil_password).not_to be_valid
    end

    it 'Is invalid if password_confirmation is nil/empty' do
      nil_password_confirmation = build(:user, password_confirmation: '')
      expect(nil_password_confirmation).not_to be_valid
    end

    it 'password and password confirmation must match ' do
      user = create(:user)
      expect(user.password).to eql(user.password_confirmation)
    end
  end
  describe '.all_except' do
    it 'return all user record except the current user' do
      expect(described_class.all_except(@user)).not_to include(@user)
    end
  end
  describe '#names' do
    it 'return concat lastname and firstname' do
      user = create(:user)
      expect(user.names).to eql("#{user.lastname} #{user.firstname}")
    end
  end
  describe '#sent_and_received_requests' do
    it 'returns sent and recieved request' do
      user = create(:user)
      friend = create(:user)
      sent_req = create(:friendship, user_id: user.id, friend_id: friend.id, confirmed: 'true')
      received_req = create(:friendship, user_id: friend.id, friend_id: user.id, confirmed: 'true')
      expect(user.sent_and_received_requests).to include(received_req && sent_req)
    end
  end
  describe '#approved_friend' do
    it 'returns approved friendship users' do
      user = create(:user)
      friend = create(:user)
      create(:friendship, user_id: user.id, friend_id: friend.id, confirmed: true)
      create(:friendship, user_id: friend.id, friend_id: user.id, confirmed: true)
      expect(user.approved_friend).to eql([user.id && friend.id])
    end
  end
  describe '#mutual_friend' do
    it 'returns approved friendship users' do
      user = create(:user)
      friend = create(:user)
      intersect = create(:user)
      create(:friendship, user_id: user.id, friend_id: friend.id, confirmed: true)
      create(:friendship, user_id: intersect.id, friend_id: friend.id, confirmed: true)
      create(:friendship, user_id: intersect.id, friend_id: user.id, confirmed: true)
      create(:friendship, user_id: friend.id, friend_id: user.id, confirmed: true)
      expect(user.mutual_friend(user)).to eql([intersect.id, friend.id])
    end
  end
  describe '#mutual_friend_count' do
    it 'returns approved friendship counts' do
      user = create(:user)
      friend = create(:user)
      intersect = create(:user)
      create(:friendship, user_id: user.id, friend_id: friend.id, confirmed: true)
      create(:friendship, user_id: intersect.id, friend_id: friend.id, confirmed: true)
      create(:friendship, user_id: intersect.id, friend_id: user.id, confirmed: true)
      create(:friendship, user_id: friend.id, friend_id: user.id, confirmed: true)
      expect(user.mutual_friend_count(user)).to eql([intersect.id, friend.id].count)
    end
  end
  describe '#find_friend' do
    it 'return desired user' do
      user = create(:user)
      expect(user.find_friend(user.id)).to eql(user)
    end
  end
  describe '#pending_friends_arr' do
    it 'return id of unconfirmed request' do
      user = create(:user)
      friend = create(:user)
      create(:friendship, user_id: friend.id, friend_id: user.id, confirmed: false)
      expect(user.pending_friends_arr).to eql([friend.id])
    end
  end
  describe '#approved_friends_arr' do
    it 'return id of confirmed request' do
      user = create(:user)
      friend = create(:user)
      create(:friendship, user_id: user.id, friend_id: friend.id, confirmed: true)
      expect(user.approved_friends_arr).to eql([user.id])
    end
  end
  describe '#and_friends' do
    it 'return user and his friends post' do
      user = create(:user)
      friend = create(:user)
      my_post = create(:post, postcontent: 'hello', user_id: user.id)
      friend_post = create(:post, postcontent: 'olleh', user_id: friend.id)
      expect(user.and_friends).to include(my_post || friend_post)
    end
  end
  describe 'associations of user to other models' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:friendships) }
    context 'user assoc with image' do
      it 'checks association of user with image' do
        user_with_image = (create :user, :with_avatar)
        expect(user_with_image.avatar).to be_attached
      end
    end
    context 'has_many through assoc' do
      it { should have_many(:liked_posts).through(:likes) }
      it { should have_many(:friends).through(:confirmed_friendships) }
      it { should have_many(:inverted_friendships).class_name('Friendship') }
      it { should have_many(:received_but_unconfirmed).class_name('Friendship') }
      it { should have_many(:confirmed_friendships).class_name('Friendship') }
      it { should have_many(:pending_friends).through(:received_but_unconfirmed) }
    end
  end
end
