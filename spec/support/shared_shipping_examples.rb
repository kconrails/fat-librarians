module SharedShippingExamples
  shared_examples_for "shipping class" do
    subject { target.new 25.0 }
  
    specify { subject.name.should == name }
  
    it "stores the weight" do
      subject.weight.should == 25.0
    end
    
    it "defaults weight to 1 pound" do
      target.new.weight.should == 1.0
    end
  end
end