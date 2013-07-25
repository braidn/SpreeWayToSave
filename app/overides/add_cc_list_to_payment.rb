Deface::Override.new(
	virtual_path: 'spree/checkout/payment/_gateway',
	name: 'add_cc_list_to_payment',
	insert_before: '[data-hook=card_number]',
	partial: 'spree/checkout/payment/reuse_cc'
)
