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
      if menu.menu.key?(dish)
        @order[dish] = menu.menu.fetch(dish)
        @total += menu.menu[dish]
      else
        raise ArgumentError, "Sorry, we don't have #{dish} on our menu."
      end
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