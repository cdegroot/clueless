[![Build Status](https://travis-ci.org/cdegroot/clueless.svg)](https://travis-ci.org/cdegroot/oauth2_example)

# Google OAuth2/Phoenix Example Application

> This is an example application showing how one can integrate with the
> [OAuth2](https://github.com/scrogson/oauth2) library and
> the [Phoenix](https://github.com/phoenixframework/phoenix) framework.

It's basically a whittled-down version of the [generic OAuth2 example on Github](https://github.com/scrogson/clueless),
just leaving in Google because that's all I want to use and simpler is better :-)

In case you want to use this template, create a file named ".google-auth-secrets" (which
is gitignored - do NOT check it in!) having GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET and
GOOGLE_REDIRECT_URL (your host plus "/auth/google/callback") as exported environment variables. 
Then "bin/run.sh" will source this file and run Phoenix. Example:

    export GOOGLE_CLIENT_ID="<lotsofstuff>.apps.googleusercontent.com"
    export GOOGLE_CLIENT_SECRET="<secret here>"
    export GOOGLE_REDIRECT_URI="http://localhost:4000/auth/google/callback"

Make sure that in the Google developer console you enable the Google+ API which is used to fetch
the username and profile picture.
