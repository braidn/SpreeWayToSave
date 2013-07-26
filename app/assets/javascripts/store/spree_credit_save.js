//= require store/spree_core

if ($('.saved-card-list tbody tr:visible').length == 0) {
	$(this).closest('h4').text('No Cards On File');
	$(this).hide()
}
