require 'spec_helper'

describe Shipping::USPS do
  let(:target) { Shipping::USPS }

  it_behaves_like "shipping class" do
    let(:name) { 'USPS' }
  end

  describe "cost" do
    subject { target.new(25).cost }
    it("is $2 plus $1 per pound"){ should == 27 }
  end
  
  describe "days" do
    subject { target.new.days }
    it { should == 5 }
  end
end
