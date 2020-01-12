# frozen_string_literal: true

RSpec.describe Crtsh::API, :vcr do
  subject { described_class.new }

  let(:identity) { "crt.sh" }

  it do
    res = subject.search(identity)
    expect(res).to be_a(Array)
  end

  context "when given match param" do
    it do
      res = subject.search(identity, match: "LIKE")
      expect(res).to be_a(Array)
    end
  end

  context "when given exclude param" do
    it do
      res = subject.search(identity, exclude: "expired")
      expect(res).to be_a(Array)
    end
  end

  context "when given match & exclude params" do
    it do
      res = subject.search(identity, match: "LIKE", exclude: "expired")
      expect(res).to be_a(Array)
    end
  end
end
