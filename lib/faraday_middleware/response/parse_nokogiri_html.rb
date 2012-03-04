require 'faraday_middleware/response_middleware'

module FaradayMiddleware
  class ParseNokogiriHtml < ResponseMiddleware
    dependency 'nokogiri'

    define_parser { |body|
      ::Nokogiri::HTML(body, nil, "utf-8")
    }
  end
end

# deprecated alias
Faraday::Response::ParseNokogiriHtml = FaradayMiddleware::ParseNokogiriHtml