require 'rails_helper'

RSpec.describe Supplier, type: :model do
  
    describe "Direct Associations" do

    it { should have_one(:account) }

    end

    describe "InDirect Associations" do

    it { should have_one(:history) }

    end

    describe "Validations" do

    end
end
