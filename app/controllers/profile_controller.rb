class ProfileController < ApplicationController
  before_action :authenticate_user!

  def my_address
  end

  def assign_address
    @result = AddressService.new.assign_address current_user

    if @result.success?
      flash[:notice] = 'Address successfully assigned'
    else
      minutes = ((@result.next_generating_at - Time.now) / 1.minutes).round
      flash[:alert] = "Address Pool empty, please try again in #{minutes} #{'minute'.pluralize minutes}"
    end

    redirect_to action: :my_address
  end
end
