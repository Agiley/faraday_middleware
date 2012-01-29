require 'faraday_middleware/response_middleware'

module FaradayMiddleware
  class ParseNokogiriXml < ResponseMiddleware
    dependency 'nokogiri'

    define_parser { |body|
      ::Nokogiri::XML(body, nil, "utf-8")
    }
  end
end

# deprecated alias
Faraday::Response::ParseNokogiriXml = FaradayMiddleware::ParseNokogiriXml
