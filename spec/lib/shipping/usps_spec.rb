require 'spec_helper'

describe Shipping::USPS do
  let(:target) { Shipping::USPS.new 25 }

  specify { target.name.should == 'USPS' }
  
  describe "weight" do
    subject { target.weight }
    it { should == 25 }
  end

  describe "cost" do
    subject { target.cost }
    it("is $2 plus $1 per pound"){ should == 27 }
  end
  
  describe "days" do
    subject { target.days }
    it { should == 5 }
  end
end
