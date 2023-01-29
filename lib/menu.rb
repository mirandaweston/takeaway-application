class Menu
    attr_reader :menu
      
    def initialize
        @menu = { 'Pizza' => 5,
        'Pasta' => 7,
        'Lasagne' => 8 }
    end
  
    def display_menu
        puts 'Menu'.center(19),"*"*18
        @menu.each do |dish, cost|
        puts "#{dish}: #{cost}"
        end
    end
  end