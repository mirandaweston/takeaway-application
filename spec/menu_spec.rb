require './lib/menu'

RSpec.describe Menu do
    let(:menu) {{ 'pizza' => 5, 'pasta' => 7, 'lasagne' => 8 }}
    subject { described_class.new }
    
    it "displays the menu to the customer" do
        expect { subject.display_menu }.to output("Menu\n-------\nPizza: 5\nPasta: 7\nLasagne: 8\n").to_stdout
    end
end