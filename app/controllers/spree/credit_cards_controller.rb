class Spree::CreditCardsController < Spree::BaseController
	respond_to :js

	def destroy
		@credit_card = Spree::CreditCard.find(params[:id])
		@credit_card.active_card = false
		if @credit_card.save
			respond_with @credit_card
		end
	end
end
