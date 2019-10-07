# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'describes associations' do
    context 'describes association between user, post and like ' do
      it { should belong_to(:post).class_name('Post') }
      it { should belong_to(:user).class_name('User') }
    end
  end
end
