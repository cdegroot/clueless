#!/bin/sh
#
#  Quick and dirty update everything script
#
mix deps.get
npm install
mix ecto.setup
