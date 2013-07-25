require 'spec_helper'

describe 'Credit Cards' do
	let(:user) { create(:user) }
	let(:credit_card) { create(:credit_card, gateway_payment_profile_id: 'Gateway1', user_id: user.id) }

	it 'are associated to a user' do
		expect(user.id).to eq(credit_card.user_id)
		credit_card.should respond_to(:user_id) 
	end
end
