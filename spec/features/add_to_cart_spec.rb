require 'rails_helper'

RSpec.feature "Visitor adds item to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    @category.products.create!(
      name: 'Product',
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )

    9.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the cart in nav updated" do
    # ACT
    visit root_path
    expect(page).to have_css 'article.product', count: 10
    expect(page).to have_content 'My Cart (0)', count: 1

    click_button("Add", :match => :first)

    # VERIFY
    expect(page).to have_content 'My Cart (1)', count: 1

    # DEBUG
    # save_screenshot
  end

end