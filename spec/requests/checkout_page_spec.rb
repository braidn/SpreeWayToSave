require 'spec_helper'

feature 'Checkbox on checkout to save cc', %q{
	As a user
	I want to see a checkbox to save my cc info
	When I imput my cc number for checkout
} do
	let(:user) { create(:user) }
	background do
		reset_spree_preferences do |config|
			config.default_country_id = create(:country).id
		end
		create(:payment_method)
		let(:order) { OrderWalkthrough.up_to(:payment)  }
		#@product = create(:product, name: 'awesome-sauce')
		#add_to_cart(@product.name)
	end

	scenario 'I want to add a credit card to my account' do
		#init_checkout
		#fill_out_address
		#save_and_continue
		page.should have_content 'Save Credit Card?'
	end
end
