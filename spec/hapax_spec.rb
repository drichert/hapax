require "spec_helper"

describe Hapax do
  describe ".find" do
    let(:words) { %w{a b c} }
    let(:hf)    { double("Hapx::Finder") }

    it "finds hapaxes for words" do
      Hapax::Finder.should_receive(:new).with(words).and_return(hf)
      hf.should_receive(:find)

      Hapax.find(words)
    end
  end
end
