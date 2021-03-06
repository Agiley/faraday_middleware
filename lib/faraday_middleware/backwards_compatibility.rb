# deprecated constants

Faraday::Request.class_eval do
  autoload :OAuth,        'faraday_middleware/request/oauth'
  autoload :OAuth2,       'faraday_middleware/request/oauth2'
end

Faraday::Response.class_eval do
  autoload :Mashify,              'faraday_middleware/response/mashify'
  autoload :Rashify,              'faraday_middleware/response/rashify'
  autoload :ParseJson,            'faraday_middleware/response/parse_json'
  autoload :ParseXml,             'faraday_middleware/response/parse_xml'
  autoload :ParseNokogiriXml,     'faraday_middleware/response/parse_nokogiri_xml'
  autoload :ParseNokogiriHtml,    'faraday_middleware/response/parse_nokogiri_html'
  autoload :ForceUtf,             'faraday_middleware/response/force_utf'
  autoload :ParseMarshal,         'faraday_middleware/response/parse_marshal'
  autoload :ParseYaml,            'faraday_middleware/response/parse_yaml'
end
