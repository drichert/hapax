require "spec_helper"

describe Hapax do
  describe ".find" do
    let(:text) { "a b c" }
    let(:hf)   { double("Hapx::Finder") }

    it "finds hapaxes for words" do
      Hapax::Finder.should_receive(:new).with(text).and_return(hf)
      hf.should_receive(:hapaxes)

      Hapax.find(text)
    end
  end
end
