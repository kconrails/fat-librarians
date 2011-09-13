require 'spec_helper'

describe Shipping::FedEx do
  let(:target) { Shipping::FedEx.new 25 }

  specify { target.name.should == 'FedEx' }

  describe "weight" do
    subject { target.weight }
    it { should == 25 }
  end

  describe "cost" do
    subject { target.cost }
    it { should == 49.95}
  end
  
  describe "days" do
    subject { target.days }
    it { should == 1 }
  end
end
