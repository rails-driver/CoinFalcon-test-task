class Api::ProfileController < Api::ApplicationController
  before_action :authenticate_user!

  def assign_address
    @result = AddressService.new.assign_address current_user
    return head :no_content if @result.success?

    render status: 424, json: { next_generating_at: @result.next_generating_at }
  end
end
