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
		address = FactoryGirl.attributes_for(:address)
		within('#billing') do
			fill_in 'First Name', :with => address['firstname']
			fill_in 'Last Name', :with => address['lastname']
			fill_in 'Street Address', :with => address['address1']
			fill_in 'order_bill_address_attributes_state_name', :with => address['state_name'] 
			fill_in 'Zip', :with => address['zip']
			fill_in 'Phone', :with => address['phone']
		end
		within('#shipping') do
			check('Use Billing Address')
		end
end
