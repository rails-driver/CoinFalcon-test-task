require 'rails_helper'

RSpec.describe GenerateAddressWorker, type: :request do
  it 'should not create new address when pool contains more or equal then 10' do
    allow(Address).to receive(:count).and_return(10)

    GenerateAddressWorker.new.perform

    allow(Address).to receive(:count).and_call_original
    expect(Address.count).to be 0
  end

  it 'should create new address when pool contains less then 10' do
    GenerateAddressWorker.new.perform
    expect(Address.count).to be 1
  end
end
