Deface::Override.new(
	virtual_path: 'spree/checkout/payment/_gateway',
	name: 'add_save_credit_card_checkbox',
	insert_after:'[data-hook=card_code]',
	partial: 'save_credit_card'
)
