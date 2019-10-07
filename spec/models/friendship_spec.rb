# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'describes associations' do
    context 'describes association between user and post ' do
      it { should belong_to(:friend).class_name('User') }
      it { should belong_to(:user).class_name('User') }
    end
  end
end
