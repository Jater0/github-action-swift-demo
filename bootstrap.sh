#!/bin/sh
echo "Checking for Homebrew updates";
brew update

if [ -e "Podfile" ]; then
  echo "Installing pod";
  gem install cocoapods || echo "Failed to install cocoapods";
  pod install || echo "Failed to install project dependencies";
fi

if [ -e "Gemfile" ]; then
  echo "Installing ruby gems";
  gem install bundler --no-document || echo "Failed to install bundle";
  bundle config set deployment 'true';
  bundle config path vendor/bundle;
  bundle install --jobs 4 --retry 3 || echo "Failed to install bundle";
fi