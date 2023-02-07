require 'twilio-ruby'

class TwilioAPI

  def time
    Time.now + (60 * 60)
  end

  def send
    account_sid = 'ACXXX'
    auth_token = 'XXX'

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      from: '+4477XXXXXXXX',
      to: '+4478XXXXXXXX',
      body: "Thank you for your order! Your order has been placed and should be with you around #{time}"
      )
  end
end


# twilio_api = TwilioAPI.new
# twilio_api.send