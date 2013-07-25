def add_to_cart(name, variant=nil)
	visit spree.root_path
	click_link name
	choose variant if variant
	click_button 'add-to-cart-button'
end

def user_login(user)
	fill_in 'spree_user_email', :with => user.email
	fill_in 'spree_user_password', :with => 'secret'
	click_button 'Login'
end

def init_checkout
	visit spree.cart_path
	click_on "Checkout"
	user_login(user)
end

def fill_out_address
		state = create(:state)
		address = attributes_for(:address, state: state)
		within('#billing') do
			fill_in 'First Name', :with => address[:firstname]
			fill_in 'Last Name', :with => address[:lastname]
			fill_in 'Street Address', :with => address[:address1]
			fill_in 'City', :with => address[:city]
			fill_in 'Zip', :with => address[:zipcode]
			fill_in 'Phone', :with => address[:phone]
			print page.html
			select attributes_for(:country)[:name], :from => 'Country'
			fill_in "order_bill_address_attributes_state_name", :with => address[:state][:name]

		end
		within('#shipping') do
			check('Use Billing Address')
		end
		save_and_continue
end

def save_and_continue
	#there are lots of these little guys
	click_button 'Save and Continue'
end

def reset_spree_preferences
	Spree::Preferences::Store.instance.persistence = false
	config = Rails.application.config.spree.preferences
	config.reset
	yield(config) if block_given?
end
