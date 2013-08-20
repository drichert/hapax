require "spec_helper"

describe Hapax::Finder do
  let(:text) { RSpec::Hapax.text }
  #let(:words)  { Sep.load(text).words }

  #subject { described_class.new(words) }
  subject { described_class.new(text) }

  #its(:words) { should == words }
  its(:words) { should == Sep.words(text) }

  describe "#hapaxes" do
    describe "0..4" do
      #subject { described_class.new(words).find.slice(0..4) }
      subject { described_class.new(text).hapaxes.slice(0..4) }

      #it { should match_array(%w{MEANING Aim 1 generally understood}) }
      it { should == %w{MEANING Aim 1 generally understood} }
    end
  end

  describe "#find" do
    describe "0..4" do
      subject { described_class.new(words).find.slice(0..4) }

      #it { should match_array(%w{MEANING Aim 1 generally understood}) }
      it { should == %w{MEANING Aim 1 generally understood} }
    end
  end
end
