# foreman-formula

Install and configure the Foreman with Salt.

 - https://theforeman.org/plugins/foreman_salt/7.0/index.html

## How to use test-kitchen on MacOSX

Install and setup brew:
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install vagrant with brew:
```
brew install cask
brew cask install vagrant
```

Install test-kitchen:
```
sudo gem install test-kitchen
sudo gem install kitchen-vagrant
sudo gem install kitchen-salt
```

or with bundler:

```
gem install bundler
bundle install
```

Run a converge on the default configuration:
```
kitchen converge
```

Run the tests:
```
kitchen test
```
