require 'twilio-ruby'
require 'timecop'
require 'twilio_api'

describe TwilioAPI do
  let(:twilio_api) { TwilioAPI.new }

  describe "#time" do
    it "returns the current time plus one hour" do
      Timecop.freeze(Time.now) do
        expect(twilio_api.time).to eq(Time.now + (60 * 60))
      end
    end
  end

  describe "#send" do
    it "sends a message with the delivery time" do
      twilio = double("twilio")
      messages = double("messages")
      message = double("message", sid: "12345")

      expect(Twilio::REST::Client).to receive(:new).and_return(twilio)
      expect(twilio).to receive(:messages).and_return(messages)
      expect(messages).to receive(:create).and_return(message)

      expect(twilio_api.send.sid).to eq("12345")
    end
  end
end
