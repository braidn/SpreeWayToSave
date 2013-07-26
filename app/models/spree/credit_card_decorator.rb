Spree::CreditCard.class_eval do
	attr_accessible :user_id, :gateway_uri, :active_card
end
