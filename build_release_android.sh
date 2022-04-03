#!/bin/bash

flutter build appbundle -t lib/main_production.dart --flavor production --release
cd android && fastlane deploy_internal
