require 'faraday'

module FaradayMiddleware
  autoload :OAuth,              'faraday_middleware/request/oauth'
  autoload :OAuth2,             'faraday_middleware/request/oauth2'
  autoload :EncodeJson,         'faraday_middleware/request/encode_json'
  autoload :Mashify,            'faraday_middleware/response/mashify'
  autoload :Rashify,            'faraday_middleware/response/rashify'
  autoload :ParseJson,          'faraday_middleware/response/parse_json'
  autoload :ParseXml,           'faraday_middleware/response/parse_xml'
  autoload :ParseNokogiriXml,   'faraday_middleware/response/parse_nokogiri_xml'
  autoload :ParseNokogiriHtml,  'faraday_middleware/response/parse_nokogiri_html'
  autoload :ForceUtf,           'faraday_middleware/response/force_utf'
  autoload :ParseMarshal,       'faraday_middleware/response/parse_marshal'
  autoload :ParseYaml,          'faraday_middleware/response/parse_yaml'
  autoload :Caching,            'faraday_middleware/response/caching'
  autoload :RackCompatible,     'faraday_middleware/rack_compatible'
  autoload :FollowRedirects,    'faraday_middleware/response/follow_redirects'
  autoload :Instrumentation,    'faraday_middleware/instrumentation'

  if Faraday.respond_to? :register_middleware
    Faraday.register_middleware :request,
      :oauth    => lambda { OAuth },
      :oauth2   => lambda { OAuth2 },
      :json     => lambda { EncodeJson }

    Faraday.register_middleware :response,
      :mashify          =>  lambda { Mashify },
      :rashify          =>  lambda { Rashify },
      :json             =>  lambda { ParseJson },
      :json_fix         =>  lambda { ParseJson::MimeTypeFix },
      :xml              =>  lambda { ParseXml },
      :nokogiri_xml     =>  lambda { ParseNokogiriXml },
      :nokogiri_html    =>  lambda { ParseNokogiriHtml },
      :force_utf        =>  lambda { ForceUtf },
      :marshal          =>  lambda { ParseMarshal },
      :yaml             =>  lambda { ParseYaml },
      :caching          =>  lambda { Caching },
      :follow_redirects =>  lambda { FollowRedirects }

    Faraday.register_middleware \
      :instrumentation  => lambda { Instrumentation }
  end
end

require 'faraday_middleware/backwards_compatibility'
