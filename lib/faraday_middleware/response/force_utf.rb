require 'faraday_middleware/response_middleware'

module FaradayMiddleware
  class ForceUtf < ResponseMiddleware
    define_parser { |body|
      body.encode("UTF-8", :invalid => :replace, :undef => :replace, :replace => "").force_encoding('UTF-8')
    }
  end
end

# deprecated alias
Faraday::Response::ForceUtf = FaradayMiddleware::ForceUtf