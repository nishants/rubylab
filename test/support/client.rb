require 'http' # URI is required by Net::HTTP by default
require 'json' # URI is required by Net::HTTP by default

module RubyLab
  class Client
    def initialize(root, default_headers = {'Content-Type' => "application/json"})
      @root     = root
      @headers  = default_headers
    end

    def get(request_url, request_headers = {})
      HTTP.headers(headers(request_headers)).get(url(request_url)).body.to_s
    end

    def put(request_url, body, request_headers = {})
      HTTP.headers(headers(request_headers)).put(url(request_url), :body => body).to_s
    end

    def headers(request_headers)
      @headers.merge(request_headers)
    end

    def url(url)
      "#{@root}#{url}"
    end

  end
end