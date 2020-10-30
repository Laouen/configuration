## Tuneling with a proxy server and a firewall between the proxy server and the final server 

<username_proxy> example: lbelloli
<proxy> example: zorzal.dc.uba.ar
<username_server> example: lbelloli
<server> example: signos.liaa.inv.dc.uba.ar
<P1> example: 4321
<P2> example: 4321
<P3> example: 8001


* In my local computar I do a tunel to the proxy on local port <P1> and proxy port <P2>:
	ssh <username_proxy>@<proxy> -L <P1>:localhost:<P2>

* Once in the proxy server I go to the final server with ssh
	ssh <username_server>@<server>

* Once in the final server I do a reverse tunel on server port <P3> and proxy port <P2>:
	ssh -R <P2>:localhost:<P3> <username_proxy>@<oroxy>