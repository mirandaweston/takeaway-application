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
  end
end

# class SMS
#   def initialize(account_sid, auth_token)
#     @client = Twilio::REST::Client.new(account_sid, auth_token)
#   end

#   def send
#     message = "We've got your order! \u{1F372} It will be delivered before #{delivery_time.strftime('%H:%M')}."
#     # \u{1F372} is food bowl emoji
#     @client.messages.create(
#       to: ENV['MY_NUM'], # my phone number
#       from: ENV['MY_TWILIO_NUM'], #my twilio phone number
#       body: message
#     )
#   end
# end

# menu = Menu.new
# order = Order.new(menu)
# order.select_dishes
# order.show_receipt
# order.send_confirmation_text
