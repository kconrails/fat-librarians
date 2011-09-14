require 'spec_helper'

describe Shipping::FedEx do
  let(:target) { Shipping::FedEx }

  it_behaves_like "shipping class" do
    let(:name) { 'FedEx' }
  end

  describe "cost" do
    subject { target.new.cost }
    it { should == 49.95}
  end
  
  describe "days" do
    subject { target.new.days }
    it { should == 1 }
  end
end
