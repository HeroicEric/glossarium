require 'spec_helper'

describe Definition do

  let(:definition) { Factory(:definition) }

  it { should validate_presence_of :text }

end
