require 'spec_helper'

describe Order do
  it { should belong_to :customer }
  it { should have_and_belong_to_many :items }
  
  specify { subject.methods.should include :search_address }
  
  describe "weight" do
    before do
      @order = Factory :order
      3.times { @order.items.build Factory.attributes_for(:item, :weight => 1.2) }
    end
    
    subject { @order.weight }
    
    it('sums the weights of its items'){ should == 3.6 }
    
    it "memoizes the result" do
      @order.expects(:items).returns([]).once
      2.times { @order.weight }
    end
  end
  
  describe "shipping_cost" do
    def self.calculates_cost_for delivery, method
      describe "when delivery is #{delivery}" do
        before { @order.delivery = delivery }
        subject { @order.shipping_cost }

        it { should == @order.send(method) }
      end
    end
    
    before do
      @order = Factory :order
      3.times { @order.items.build Factory.attributes_for(:item) }
    end
    
    calculates_cost_for 'USPS',  :usps_shipping_cost
    calculates_cost_for 'UPS',   :ups_shipping_cost
    calculates_cost_for 'FedEx', :fedex_shipping_cost
  end
  
  describe "shipping_days" do
    def self.calculates_days_for delivery, method
      describe "when delivery is #{delivery}" do
        before { @order.delivery = delivery }
        subject { @order.shipping_days }

        it { should == @order.send(method) }
      end
    end
    
    before do
      @order = Factory :order
      3.times { @order.items.build Factory.attributes_for(:item) }
    end
    
    calculates_days_for 'USPS',  :usps_shipping_days
    calculates_days_for 'UPS',   :ups_shipping_days
    calculates_days_for 'FedEx', :fedex_shipping_days
  end
  
  describe "usps delivery" do
    before do
      @order = Factory :order
      2.times { @order.items.build Factory.attributes_for(:item, :weight => 3, :price => 7) }
    end

    describe "usps_shipping_cost" do
      subject { @order.send(:usps_shipping_cost) }
      it("is $2 plus $1 per pound"){ should == 8 }
    end
    
    describe "usps_shipping_days" do
      subject { @order.send(:usps_shipping_days) }
      it { should == 5 }
    end
  end
  
  describe "ups delivery" do
    before do
      @order = Factory :order
      2.times { @order.items.build Factory.attributes_for(:item, :weight => 3, :price => 7) }
    end

    describe "ups_shipping_cost" do
      subject { @order.send(:ups_shipping_cost) }
      it("is $2 plus $1.50 per pound"){ should == 11 }
    end
    
    describe "ups_shipping_days" do
      subject { @order.send(:ups_shipping_days) }
      
      describe "when total weight is under 5 pounds" do
        before { @order.items.first.weight = 1 }
        it { should == 2 }
      end
      
      describe "when total weight is 5 pounds or more" do
        it { should == 6 }
      end
    end
  end
  
  describe "fedex delivery" do
    before do
      @order = Factory :order
      2.times { @order.items.build Factory.attributes_for(:item, :weight => 3, :price => 7) }
    end

    describe "fedex_shipping_cost" do
      subject { @order.send(:fedex_shipping_cost) }
      it{ should == 49.95 }
    end
    
    describe "fedex_shipping_days" do
      subject { @order.send(:fedex_shipping_days) }
      it { should == 1 }
    end
  end
end
