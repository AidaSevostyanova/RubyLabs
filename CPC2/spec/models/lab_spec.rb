require 'rails_helper'

RSpec.describe Lab, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_most(250) }
  it { is_expected.to validate_length_of(:description).is_at_most(250) }
end
