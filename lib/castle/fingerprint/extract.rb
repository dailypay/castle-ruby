# frozen_string_literal: true

module Castle
  module Fingerprint
    # used for extraction of cookies and headers from the request
    class Extract
      # @param headers [Hash]
      # @param cookies [NilClass|Hash]
      def initialize(headers, cookies)
        @headers = headers
        @cookies = cookies || {}
      end

      # extracts client id
      # @return [String]
      def call
        @headers['X-Castle-Client-Id'] || @cookies['__cid'] || ''
      end
    end
  end
end
