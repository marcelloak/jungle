require 'rails_helper'

RSpec.feature "Visitor navigates to specific product page from home page", type: :feature, js: true do

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

  scenario "They see specific product details" do
    # ACT
    visit root_path
    expect(page).to have_css 'article.product', count: 10
    
    find("img[alt='Product']").click

    # VERIFY
    expect(page).to have_content 'Apparel', count: 1
    expect(page).to have_content 'Name', count: 1
    expect(page).to have_content 'Product', count: 2
    expect(page).to have_content 'Description', count: 1
    expect(page).to have_content 'Quantity', count: 1
    expect(page).to have_content '10', count: 1
    expect(page).to have_content 'Price', count: 1
    expect(page).to have_content '$64.99', count: 1

    # DEBUG
    # save_screenshot
  end

end