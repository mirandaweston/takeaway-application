require 'order'

RSpec.describe Order do
  let(:menu) { instance_double('Menu', menu: { 'Pizza' => 5, 'Pasta' => 7, 'Lasagne' => 8 }) }
  subject { described_class.new(menu) }

  describe '#select_dishes' do
    before do
      allow(menu).to receive(:display_menu).and_return({ 'Pizza' => 5, 'Pasta' => 7, 'Lasagne' => 8 })
    end

    it 'adds selected dishes to the order' do
      allow(subject).to receive(:gets).and_return('Pizza', 'finish')
      subject.select_dishes
      expect(subject.order).to eq({ 'Pizza' => 5 })
    end

    it "raises an error if dish does not exist" do
      allow(subject).to receive(:gets).and_return('Sushi', 'finish')
      expect { subject.select_dishes }.to raise_error("Sorry, we don't have Sushi on our menu.")
    end

    it "updates the total cost of order" do
      allow(subject).to receive(:gets).and_return('Pizza', 'finish')
      subject.select_dishes
      expect(subject.total).to eq (5)
    end
  end

  describe '#show_receipt' do
      before do
        allow(menu).to receive(:display_menu).and_return(nil)
        allow(subject).to receive(:gets).and_return("Pizza", "finish")
        subject.select_dishes
      end

    it "provides a receipt and sends an SMS" do
      sms = instance_double('TwilioAPI')
      allow(TwilioAPI).to receive(:new).and_return(sms)
      expect(sms).to receive(:send)
      
      expect {subject.show_receipt}.to output("Receipt\n-------\nPizza = £5\nTotal: £5\n").to_stdout
    end
  end
end

