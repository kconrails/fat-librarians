require 'spec_helper'

describe Order do
  it { should belong_to :customer }
  it { should have_and_belong_to_many :items }
  
  specify { subject.methods.should include :search_address }
  
  describe "weight" do
    before do
      @order = Factory :order
      2.times { @order.items.build Factory.attributes_for(:item, :weight => 1.2) }
    end
    
    subject { @order.weight }
    
    it('sums the weights of its items'){ should == 2.4 }
    
    it "memoizes the result" do
      @order.expects(:items).returns([]).once
      2.times { @order.weight }
    end
  end
  
  describe "shipping" do
    before do
      @order = Factory :order, :delivery => 'FedEx'
      2.times { @order.items.build Factory.attributes_for(:item, :weight => 1.2) }
    end
    
    subject { @order.shipping }
    
    specify { subject.methods.should include(:name) }
    specify { subject.methods.should include(:weight) }
    specify { subject.methods.should include(:cost) }
    specify { subject.methods.should include(:days) }
  end
end
