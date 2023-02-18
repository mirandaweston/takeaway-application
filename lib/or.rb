require 'twilio-ruby'
require_relative 'menu'
require_relative 'twilio_api'

class Order
  attr_reader :menu, :order, :total

  def initialize(menu)
    @menu = menu
    @order = {}
    @total = 0
  end

  def select_dishes
    loop do
      menu.display_menu
      puts 'Enter the name of the dish you want to order or type "finish" when done:'
      dish = gets.chomp
      break if dish == 'finish'
      raise ArgumentError, "Sorry, we don't have #{dish} on our menu." unless menu.menu.key?(dish)
      @order[dish] = menu.menu.fetch(dish)
      @total += menu.menu[dish]
    
      
    
    end
  end
  
  def show_receipt
    puts 'Receipt'
    puts '-------'
    @order.each { |dish, price| puts "#{dish} = £#{price}" }
    puts "Total: £#{total}"

    sms = TwilioAPI.new
    sms.send
  end
end

# class TwilioAPI

#   def time
#     Time.now + (60 * 60)
#   end

#   def send
#     account_sid = 'AC5e12015d02b9c7cbc4ff3a48c2277c94'
#     auth_token = '10fd204383bfa444acd31a2b6bb5638a'

#     @client = Twilio::REST::Client.new(account_sid, auth_token)

#     @client.messages.create(
#       from: '+19377095726',
#       to: '+447732340122',
#       body: "Thank you for your order! Your order has been placed and should be with you around #{time}"
#       )
#   end
# end

# menu = Menu.new
# order = Order.new(menu)
# order.select_dishes
# order.show_receipt
