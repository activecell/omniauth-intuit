require 'spec_helper'

describe "OmniAuth::Strategies::Intuit" do
  subject do
    OmniAuth::Strategies::Intuit.new(nil, @options || {})
  end

  it 'should add a camelization for itself' do
    OmniAuth::Utils.camelize('intuit').should == 'Intuit'
  end

  context 'client options' do
    it 'has correct Intuit site' do
      subject.options.client_options.site.should eq('https://oauth.intuit.com')
    end

    it 'has correct request token path' do
      subject.options.client_options.request_token_path.should eq('/oauth/v1/get_request_token')
    end

    it 'has correct access token path' do
      subject.options.client_options.access_token_path.should eq('/oauth/v1/get_access_token')
    end

    it 'has correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://appcenter.intuit.com/Connect/Begin')
    end
  end

  context '#uid' do
    before :each do
      subject.stub(:raw_info) { { 'id' => '123' } }
    end

    it 'returns the id from raw_info' do
      subject.uid.should eq('123')
    end
  end
end
