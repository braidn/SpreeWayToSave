require 'spec_helper'
module Spree
	describe CreditCardsController do

		let(:credit_card) { create(:credit_card, gateway_payment_profile_id: 'Gateway1', 
															 gateway_uri: 'uri/v1/939394u9s9fa8da9f8sdff') }

		context 'DELETE #destroy' do
			it 'no longer is a saved card' do
				expect{ delete :destroy, id: credit_card }
				.to change(credit_card, :active_card).to false
			end
		end
	end
end
