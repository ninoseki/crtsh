# frozen_string_literal: true

RSpec.describe Crtsh::API, :vcr do
  subject { described_class.new }

  let(:query) { "crt.sh" }

  it do
    res = subject.search(query)
    expect(res).to be_a(Array)
  end
end
