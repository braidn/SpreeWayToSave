class AddPaymentUriToCreditCard < ActiveRecord::Migration
	def change
		add_column :spree_credit_cards, :gateway_uri, :string
	end
end
