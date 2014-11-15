bugzilla-freebsd
================

bugzilla client for freebsd repos.

I use this after submitting an phabricator request.

Workflow looks like:

```

cd /usr/ports
/usr/ports % git checkout py-websocket-client # my port
/usr/ports % arc diff `git merge-base origin/master HEAD`
# ignore the lack of reviewers, something isn't right here.
....
    You have not specified any reviewers. Continue anyway? [y/N] y

Linting...
No lint engine configured for this project.
Running unit tests...
No unit test engine is configured for this project.
Created a new Differential revision:
        Revision URI: https://reviews.freebsd.org/D1171

Included changes:
  A       www/py-websocket-client/Makefile
  A       www/py-websocket-client/distinfo
  A       www/py-websocket-client/pkg-descr
/usr/ports % bugzilla-fbsd newport --name www/py-websocket-client --fabid D1171
Making sure fabric request exists...
['/usr/local/bin/bugzilla', '--bugzilla', 'https://bugs.freebsd.org/bugzilla/xmlrpc.cgi', '--nosslverify', '-s', 'new port: www/py-websocket-client', '-l', 'new port for www/py-websocket-client is available in phabricator at https://reviews.freebsd.org/D1171', '--url', 'https://reviews.freebsd.org/D1171']
/usr/local/lib/python2.7/site-packages/requests/packages/urllib3/connectionpool.py:730: InsecureRequestWarning: Unverified HTTPS request is being made. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.org/en/latest/security.html (This warning will only appear once by default.)
  InsecureRequestWarning)
#195032 Needs Triage - freebsd-ports-bugs@FreeBSD.org - new port: www/py-websocket-client
```
