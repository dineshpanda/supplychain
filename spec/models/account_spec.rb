require 'rails_helper'

RSpec.describe Account, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:supplier) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
