class AddressService
  ALLOWED_CHARS = (('A'..'Z').to_a + ('a'..'z').to_a + ((1..9).to_a.map &:to_s))
                    .reject { |char| %w(O I l 0).include? char }
                    .freeze

  def assign_address(user)
    affected = Address
      .where(user_id: nil)
      .limit(1)
      .update_all(user_id: user.id)

    if affected == 1
      OpenStruct.new success?: true
    else
      OpenStruct.new success?: false, next_generating_at: next_generating_enqueue_time
    end
  end

  def generate_address
    Address.create! name: generate_address_name
  end

  def next_generating_enqueue_time
    Time.at Sidekiq::Cron::Job.find(:generate_address).formated_enqueue_time.to_i + 12 * 60
  end

  def generate_address_name
    ALLOWED_CHARS.shuffle.slice(0, 34).join
  end
end
