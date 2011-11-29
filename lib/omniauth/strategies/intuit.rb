require 'omniauth/strategies/oauth'

module OmniAuth
  module Strategies
    class Intuit < OmniAuth::Strategies::OAuth
      option :name, "intuit"

      option :client_options, {
        :site => 'https://oauth.intuit.com',
        :request_token_path => '/oauth/v1/get_request_token',
        :access_token_path => '/oauth/v1/get_access_token',
        :authorize_url => "https://appcenter.intuit.com/Connect/Begin"
      }

      uid{ raw_info['id'] }

      info do
        {
          :first_name => raw_info['firstName'],
          :last_name => raw_info['lastName'],
          :name => "#{raw_info['firstName']} #{raw_info['lastName']}",
          :urls => {
            'public_profile' => raw_info['publicProfileUrl']
          }
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get("https://appcenter.intuit.com/Connect").body)
      end
    end
  end
end

OmniAuth.config.add_camelization 'intuit', 'Intuit'

