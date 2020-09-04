# Geteduroam goals

## Primary goal

**Allow users to easily and securely connect to eduroam**


## Subgoals

The geteduroam project has two subgoals

1. Create apps to allow users to easily set up eduroam correctly on their devices
2. Develop server software to issue client certificates that the apps can use


## Rationale

In the EAP-PEAP or EAP-TTLS protocols, the users password is sent over the air encrypted every time they log in to eduroam.  There are multiple known attacks that can be used to obtain this password.  Because of this, we believe that users get the best security by using EAP-TLS, which is why we develop server software that can issue client certificates to be used with EAP-TLS.

Not every institution or roaming operator will have this infrastructure from day one.  Because of this, we will also support EAP-PEAP and EAP-TTLS so that users can still have the highest possible level of protection available when they use the geteduroam app.
