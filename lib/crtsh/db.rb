# frozen_string_literal: true

require "pg"

module Crtsh
  class DB
    #
    # Returns a connection to certwatch DB
    #
    # @return [PG::Connection]
    #
    def connection
      @connection ||= PG.connect(
        host: "crt.sh",
        user: "guest",
        dbname: "certwatch"
      )
    end
  end
end
