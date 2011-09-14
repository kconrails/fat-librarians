require 'spec_helper'

describe Customer do
  it { should have_many :orders }

  specify { subject.methods.should include :search_address }
end
