module Spree
	CheckoutController.class_eval do
		scope :active, where(active_card: true)
		private

		def prior_payment
			@cards = CreditCards.find(spree_current_user).active
		end

		#def object_params
		#overide to take in the user preference to save a card
		#end

	end
end
