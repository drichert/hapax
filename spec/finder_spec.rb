require "spec_helper"

describe Hapax::Finder do
  let(:text) { RSpec::Hapax.text }

  subject { described_class.new(text) }

  describe "#hapaxes" do
    describe "0..4" do
      subject { described_class.new(text).hapaxes.slice(0..4) }

      it { should == %w{MEANING Aim 1 generally understood} }
    end
  end
end
