require 'spec_helper'

describe "OmniAuth::Strategies::Intuit" do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }
  end

  subject do
    OmniAuth::Strategies::Intuit.new(nil, @options || {}).tap do |strategy|
      strategy.stub(:request) { @request }
    end
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
      subject.options.client_options.authorize_url.should eq('https://workplace.intuit.com/Connect/Begin')
    end
  end

end
