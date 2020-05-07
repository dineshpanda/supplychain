require 'rails_helper'

RSpec.describe AccountHistory, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:owner) }

    end

    describe "InDirect Associations" do

    it { should have_one(:supplier) }

    end

    describe "Validations" do

    end
end
