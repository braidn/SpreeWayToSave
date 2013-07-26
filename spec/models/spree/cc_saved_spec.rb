require 'spec_helper'

describe 'spree_credit_cards' do
	let(:user) { create(:user) }
	let(:credit_card) { create(:credit_card, gateway_payment_profile_id: 'Gateway1', 
														 user_id: user.id, 
														 gateway_uri: 'uri/v1/939394u9s9fa8da9f8sdff') }

	context 'when a user' do
		it 'is able to associate themselves to one card' do
			expect(user.id).to eq(credit_card.user_id)
			credit_card.should respond_to(:user_id) 
		end
		it 'is able to save more than one card' do
			card1 = credit_card #love you lazy loading
			card2 = create(:credit_card, gateway_payment_profile_id: 'Gateway1', user_id: user.id)
			expect(user.credit_cards.count).to eq(2)
		end
	end
	context 'active switch' do
			it { credit_card.should respond_to :active_card }
	end
	context 'gateway uri' do
		it { credit_card.should respond_to :gateway_uri }
	end
end
