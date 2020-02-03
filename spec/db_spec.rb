# frozen_string_literal: true

RSpec.describe Crtsh::DB do
  subject { described_class.new }

  describe "#connection" do
    it do
      expect(subject.connection).to be_a(PG::Connection)
    end

    it do
      sql = File.read(File.expand_path("./fixtures/test.sql", __dir__))
      result = subject.connection.exec_params(sql, ["github.com"])
      expect(result).to be_an(PG::Result)
    end
  end
end
