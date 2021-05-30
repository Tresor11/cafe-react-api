require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:name) { "test item" }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:category) }
end
