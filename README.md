SpreeCreditSave
===============

A plugin for users to save their credit cards once they have bought something in 
a store. The user inputs the card that they were planning on using and selects a 
checkbox before authorizing payment. If the checkbox is selected the users's id will 
be associated with the card and a flag will be set to true (they have opted to save 
it for next time).

Once the user returns to your store, adds item(s) to your cart and proceeds to checkout, 
they will be greeted with a third payment option: "Pay with these saved cards". If a user 
selects a card, it will fill in the corresponding fields. From here the user could modify 
the card if needed. If the user wishes to remove the card, there would be a button off 
to the left, clicking it would remove the true flag on the card.


Hurdles
=======

1. One of the biggest issues was how Spree 1.3.3
builds it's country codes. A dev needs to modify the Rails/config/spree preferences from 
rspec and I had never previously done this. After a few minutes with the Spree folks on 
IRC, a binding.pry call in the gem code itself, we found out that this was the culprit 
2. Another being the oddness of the way you select states in the checkout process. My 
acceptance tests would never quite make it past here. And so those were slowly abandoned.
3. Spree doesn't currently have a credit_card controller and through some cowboy coding
I got the destroy (by far the easiest) action working but it can't be seen by the controller 
tests due to a route matching error. The logical next step being to jump into the dummy app 
and see if rake routes produces the desired 'spree/credit_card#destroy' route... it does. 

Going Forward
=============

To actually save information that is this sensitive in the database, it makes sense to rely/lean
heavily on the Gateway to save cards, and return a uri representation of the card. This way the 
Uri could be saved in the clients DB (currently a place for it). Then a developer could 
build a lookup for these saved cards (sort of implemented), display the last 4 digits, perhaps a few 
other bits of info and allow the user to delete them.

If the user deleted the card we would just change the bool-flag of active_card on credit cards 
associated with the user to false, and not show them on subsequent checkouts. Since we are now relying 
on Uris, we need to use that and a gateway api to look up the user's actual cards and 
update the specific cc fields prior to checkout.


Testing
-------

- Bundle Install or do it the old fashion way with --binstubs
- rspec spec/acceptance or spec/model or spec/controller

Copyright (c) 2013 Braden Douglass, released under the Don't Use Yet License
