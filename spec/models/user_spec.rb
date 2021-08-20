require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }
  
  it { expect(subject).to respond_to(:email) }
  it { is_expected.to be_valid }
end
