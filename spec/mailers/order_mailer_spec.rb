require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do

  # SETUP
  before :each do
    @user = User.create! first_name: 'First', last_name: 'Last', email: 'email@gmail.com', password: 'password', password_confirmation: 'password'
    @category = Category.create! name: 'Apparel'
    @product = Product.create!(
      name: 'Product',
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99,
      category: @category
    )
    @order = Order.create! total_cents: 6499, stripe_charge_id: '1', email: 'marcello.kuenzler@gmail.com'
    @line_items = LineItem.create! order: @order, product: @product, quantity: 1, item_price_cents: 6499, total_price_cents: 6499
    @line_items = [@line_items]
    @line_items = @line_items.map {|item| { quantity: item[:quantity], product: @product }}
  end

  scenario "They get an email when order is placed" do
    email = OrderMailer.order_email(@user, @order, @line_items)

    expect(ActionMailer::Base.deliveries.empty?).to be_truthy

    expect(email.from).to eq ['no-reply@jungle.com']
    expect(email.to).to eq ['email@gmail.com']
    expect(email.subject).to eq "Order ##{@order.id} from Jungle"

    puts email
  end
end
