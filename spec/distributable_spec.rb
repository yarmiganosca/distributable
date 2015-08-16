require 'spec_helper'

describe Distributable do
  it 'has a version number' do
    expect(Distributable::VERSION).not_to be nil
  end

  it 'includes an extension in Numeric' do
    expect(Numeric.included_modules).to include Distributable
  end
end
