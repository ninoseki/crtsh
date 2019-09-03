# frozen_string_literal: true

require "json"
require "net/https"
require "uri"

module Crtsh
  class API
    HOST = "crt.sh"
    BASE_URL = "https://#{HOST}"

    def search(query)
      get("/", q: query, output: "json") { |json| json }
    end

    private

    def https_options
      if proxy = ENV["HTTPS_PROXY"] || ENV["https_proxy"]
        uri = URI(proxy)
        {
          proxy_address: uri.hostname,
          proxy_port: uri.port,
          proxy_from_env: false,
          use_ssl: true
        }
      else
        { use_ssl: true }
      end
    end

    def request(req)
      Net::HTTP.start(HOST, 443, https_options) do |http|
        response = http.request(req)

        case response.code
        when "200"
          yield JSON.parse(response.body)
        else
          raise(Error, "Unsupported response code returned: #{response.code}")
        end
      end
    end

    def url_for(path)
      URI(BASE_URL + path)
    end

    def get(path, params = {}, &block)
      uri = url_for(path)
      uri.query = URI.encode_www_form(params)
      get = Net::HTTP::Get.new(uri)

      request(get, &block)
    end
  end
end
