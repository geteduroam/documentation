# geteduroam Frequently Asked Questions (FAQ)


## I tried the app and it asks me for a username/password, I thought it would use eduGAIN?

geteduroam uses CAT for the institution list.  If the institution has a CAT profile, the app will use that, so eduGAIN is not involved.  It is possible in CAT to mark a profile as geteduroam and then the user will be sent to a webpage where they have to log in.  This behaviour is opt-in.


## What happens with passwords entered in the app?

Passwords entered directly in the app are only used to configure a Wi-Fi profile in the application.  They are stored in the operating system to allow reconnecting to eduroam at a later time.  In most operating systems, the app will not be able to recover the password, so if a change is made to the profile the user will have to enter the password again.


## If geteduroam participation is opt-in, why do I see my institution in the list when I start the app?

Even though an institution doesn't participate in geteduroam, it still might be listed because it is in CAT.  The app will configure as a CAT configurator, configuring the same EAP type that was set in CAT.

geteduroam uses CAT for the institution list, so users can use the geteduroam app even if the institution doesn't offer geteduroam (EAP-TLS with client certificate obtained via eduGAIN).


## Which realm does geteduroam use?

There is no specific realm for geteduroam, since geteduroam is just another IdP solution with a RADIUS server.  If an institution sets up a geteduroam RADIUS server themselves, it will be the realm of the institution.  If an NREN sets up geteduroam, it will be a realm picked by that NREN.

There are plans to set up a hosted geteduroam solution with GÉANT, it's still on the drawing board but we won't act against the NRENs in providing it.


## As an NREN; Is there some access control to prevent my institutions from joining without my knowledge?

If your institution is barred from eduroam, they are also barred from geteduroam.  They can set up their own instance, in the same way they can set up any IdP solution locally, but a RADIUS delegation is stil required.  There is no central instance where every institution just can enroll themselves.

There are plans to set up a hosted geteduroam solution with GÉANT, it's still on the drawing board but we won't act against the NRENs in providing it.


## Will geteduroam replace CAT

geteduroam is not intended to replace the Configuration Assistance Tool that runs on cat.eduroam.org.  In fact, geteduroam uses CAT as the central database for EAP configurations to show the list of institutions when you start the app.  IdPs that only offer EAP-TLS must register in CAT in order to show up in the institution list in geteduroam.  geteduroam supplements CAT, it does not replace it.

The geteduroam Android app is intended to replace the eduroamCAT Android app.  The current eduroamCAT Android app is showing its age and it seems that development has stalled.  The geteduroam app will be a drop-in replacement, it can open eap-config files in the same way the eduroamCAT app does (in fact, geteduroam uses eap-config for all platforms)


## How does the geteduroam app know of participating IdPs

geteduroam uses CAT for the institution list.  A CAT profile can be marked as an geteduroam profile with a server URL, which then will cause the app to initiate a flow to obtain a client certificate instead of configuring a TTLS/PEAP profile.
