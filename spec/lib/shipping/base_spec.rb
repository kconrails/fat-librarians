require 'spec_helper'

describe Shipping::Base do
  subject { Shipping::Base.new 25 }
  
  specify { subject.name.should == 'Base' }
  
  it "stores the weight" do
    subject.weight.should == 25
  end

  it "costs ten cents per pound" do
    subject.cost.should == 2.5
  end
  
  it "ships in 1 day" do
    subject.days.should == 1
  end
end
