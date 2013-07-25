SpreeCreditSave
===============

A plugin for users to save their credit cards once they have bought something in 
your store. The user imputs the card that they were planning on using and selects a 
checkbox before authorizing payment. If the checkbox is selected the users's id will 
be associated with the card and a flag will be set to true (they have opted to save 
it for next time).

Once the user returns to your store, adds item(s) to your cart and proceeds to checkout, 
they will be greeted with a third payment option: "Pay with these saved cards". If a user 
selects a card, it will fill in the corresponding fields. From here the user could modify 
the card if needed. If the user wishes to remove the card, there would be a button off 
to the left, if clicked will remove the true flag on the card.


Hurdles
=======

1. One of the biggest issues was how I ran into was an interesting way that Spree 1.3.3
builds it's country codes. you need to modify the Rails/config/spree preferences from 
rspec and I had never previously done this. After a few minutes with the Spree folks on 
IRC, a binding.pry call in the gem code itself, we found out that this was the culprit 
2. Another being the oddness of the way you select states in the checkout process. My 
acceptance tests would never quite make it past here.



Testing
-------

- Bundle Install or do it the old fashion way with --binstubs
- rspec spec/acceptance or spec/model or spec/controller

Copyright (c) 2013 Braden Douglass, released under the Don't Use Yet License
