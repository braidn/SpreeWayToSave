require 'spec_helper'

describe 'Checkout', :js => true do
	let(:user) { create(:user) }
	let(:product) { create(:product, name: 'awesome-sauce') }

	context 'with no existing cards', :js => true do
		before(:each) do
			visit spree.root_path
			create(:payment_method)
		end

		it 'displays a checkbox to save your cc info' do
			add_to_cart(product.name)
			init_checkout
			fill_out_address
			save_and_continue
			page.should have_content 'Save Credit Card?'
		end
	end
end
