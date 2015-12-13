#!/bin/bash
#

cd $(dirname $0)/..

source .google-oauth-secrets

mix phoenix.server
