require 'spec_helper'

describe Customer do
  it { should have_many :orders }
  
  describe "search_address" do
    before { @customer = Factory.build :customer }
    subject { @customer.search_address }
    
    describe "when all address fields are present" do
      it { should include(@customer.address) }
      it { should include(@customer.zip) }

      it { should_not include(@customer.city) }
      it { should_not include(@customer.state) }
      it { should_not include(@customer.phone) }
    end
    
    describe "when zip is missing" do
      before { @customer.zip = '' }

      it { should include(@customer.address) }
      it { should include(@customer.city) }
      it { should include(@customer.state) }

      it { should_not include(@customer.phone) }
    end
    
    describe "when city, state, and zip are missing" do
      before { @customer.attributes = {:city => '', :state => '', :zip => ''} }
      
      it { should include(@customer.address) }
    end
    
    it "should memoize the result" do
      @customer.expects(:region).once
      2.times { @customer.search_address }
    end
  end
end
