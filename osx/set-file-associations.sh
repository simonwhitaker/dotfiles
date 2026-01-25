#!/bin/bash

# Adapted from https://stackoverflow.com/a/70402997/263871

brew install duti

bundle_id=dev.zed.Zed
# bundle_id=com.microsoft.VSCode

# Use duti to set defaults for specific files to VSCode
duti -s $bundle_id public.plain-text all
duti -s $bundle_id public.source-code all
duti -s $bundle_id public.data all
duti -s $bundle_id .css all
duti -s $bundle_id .gitattributes all
duti -s $bundle_id .gitignore all
duti -s $bundle_id .htaccess all
duti -s $bundle_id .js all
duti -s $bundle_id .js all
duti -s $bundle_id .json all
duti -s $bundle_id .link all
duti -s $bundle_id .md all
duti -s $bundle_id .mv all
duti -s $bundle_id .mvt all
duti -s $bundle_id .py all
duti -s $bundle_id .scss all
duti -s $bundle_id .sh all
duti -s $bundle_id .ts all
duti -s $bundle_id .txt all
duti -s $bundle_id .xml all
duti -s $bundle_id .yaml all
duti -s $bundle_id .zsh all
