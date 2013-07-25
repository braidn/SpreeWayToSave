require 'spec_helper'

feature 'Checkbox on checkout to save cc', %q{
	As a user
	I want to see a checkbox to save my cc info
	When I imput my cc number for checkout
} do
	let (:user) { create(:user) }
	background do
		create(:country)
		Spree::Config[:default_country_id] = Spree::Country.first.id
		@product = create(:product, name: 'awesome-sauce')
		add_to_cart(@product.name)
	end

	scenario 'I want to add a credit card to my account' do
		init_checkout
		fill_out_address
		click_button 'Save and Continue'
		page.should have_content 'Save Credit Card'
	end
end
