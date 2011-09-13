require 'spec_helper'

describe Item do
  it { should have_and_belong_to_many :orders }
end
