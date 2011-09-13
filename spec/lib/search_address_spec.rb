require 'spec_helper'

class DummyObject
  include SearchAddress
  
  attr_accessor :address, :city, :state, :zip, :phone
  
  def initialize address, city, state, zip, phone
    @address = address
    @city = city
    @state = state
    @zip = zip
    @phone = phone
  end
end

describe SearchAddress do
  before { @object = DummyObject.new('123 Way Street', 'Lenexa', 'KS', '66215', '913-123-4567') }
  subject { @object.search_address }
  
  describe "when all address fields are present" do
    it { should include(@object.address) }
    it { should include(@object.zip) }

    it { should_not include(@object.city) }
    it { should_not include(@object.state) }
    it { should_not include(@object.phone) }
  end
  
  describe "when zip is missing" do
    before { @object.zip = '' }

    it { should include(@object.address) }
    it { should include(@object.city) }
    it { should include(@object.state) }

    it { should_not include(@object.phone) }
  end
  
  describe "when city, state, and zip are missing" do
    before do
      @object.city  = ''
      @object.state = ''
      @object.zip   = ''
    end
    
    it { should include(@object.address) }
  end
  
  it "should memoize the result" do
    @object.expects(:region).once
    2.times { @object.search_address }
  end
end