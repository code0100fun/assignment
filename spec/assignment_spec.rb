require 'spec_helper'

describe Assignment do
  it 'has a version number' do
    expect(Assignment::VERSION).not_to be nil
  end

  it 'allows assignment of attributes with a hash' do

    class Cat
      include Assignment::Attributes
      attr_accessor :name, :status
    end

    cat = Cat.new

    expect(cat.respond_to?(:assign_attributes)).to eq(true)
    cat.assign_attributes(name: "Gorby", status: "yawning")

    expect(cat.name).to eq('Gorby')
    expect(cat.status).to eq('yawning')

    cat.assign_attributes(status: "sleeping")

    expect(cat.name).to eq('Gorby')
    expect(cat.status).to eq('sleeping')
  end

  it 'throws UnknownAttributeError when attribute not found' do

    class Cat
      include Assignment::Attributes
      attr_accessor :name, :status
    end

    cat = Cat.new

    expect do
      cat.assign_attributes(name: "Gorby", state: "yawning")
    end.to raise_error(
      Assignment::UnknownAttributeError, "unknown attribute 'state' for Cat."
    )
  end
end
