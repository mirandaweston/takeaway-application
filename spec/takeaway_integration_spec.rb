require 'order'
require 'menu'

RSpec.describe "menu integration" do
  it "initializes with a menu" do
    menu = Menu.new
    order = Order.new(menu)
    expect(order.menu).to eq(menu)
    expect(order.order).to be_empty
    expect(order.total).to eq(0)
  end
end
