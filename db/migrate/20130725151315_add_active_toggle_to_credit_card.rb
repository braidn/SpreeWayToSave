class AddActiveToggleToCreditCard < ActiveRecord::Migration
	def change
		add_column :spree_credit_cards, :active_card, :boolean, default: false
	end
end
