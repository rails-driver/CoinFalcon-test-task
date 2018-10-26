class GenerateAddressWorker
  include Sidekiq::Worker

  def perform
    AddressService.new.generate_address if Address.count < 10
  end
end
