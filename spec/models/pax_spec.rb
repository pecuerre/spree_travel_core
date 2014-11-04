require 'spec_helper'

describe Spree::Pax do

  it 'haves a valid default factory' do
    expect(build(:pax)).to be_valid
  end

  it 'is not valid without a first name' do
    expect(build(:pax, first_name: nil)).not_to be_valid
  end

  it 'is not valid without a last name' do
    expect(build(:pax, last_name: nil)).not_to be_valid
  end

  #TODO Create specs for only two sexes

end