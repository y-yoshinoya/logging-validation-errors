require "spec_helper"

RSpec.describe Logging::Validation::Errors do
  it "has a version number" do
    expect(Logging::Validation::Errors::VERSION).not_to be nil
  end
end
