class Api::ProfileController < Api::ApplicationController
  before_action :authenticate_user!

  api :POST, '/profile/assign_address'
  returns code: 204, desc: 'Address assigned successfully'
  returns code: 424, desc: 'Address was not assigned' do
    property :next_generating_at, String, desc: 'Datetime when new address will be generated'
  end
  def assign_address
    @result = AddressService.new.assign_address current_user
    return head :no_content if @result.success?

    render status: 424, json: { next_generating_at: @result.next_generating_at }
  end
end
