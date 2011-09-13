require 'spec_helper'

describe Shipping::Base do
  subject { Shipping::Base.new 25 }
  
  it_behaves_like "shipping class" do
    let(:target) { Shipping::Base }
    let(:name) { 'Base' }
  end

  it "costs ten cents per pound" do
    subject.cost.should == 2.5
  end
  
  it "ships in 1 day" do
    subject.days.should == 1
  end
end
