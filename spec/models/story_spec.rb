require 'spec_helper'

describe Story do
  it 'is true' do
    subject.should be_true
  end
  it 'is not valid' do
    subject.should_not be_valid
  end

  it 'requires url if no body' do
    subject.url = 'http://foo.com'
    subject.body = nil
    subject.should be_valid
  end

  it 'requires body if no url' do
    subject.body = 'foo bar'
    subject.url = nil
    subject.should be_valid
  end
end  
