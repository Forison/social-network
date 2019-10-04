require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'describes associations' do
    context 'describes association between user, post and comment ' do
      it { should belong_to(:commentator).class_name('User') }
      it { should belong_to(:post).class_name('Post') }
    end
  end
end
