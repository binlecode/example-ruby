
## MS Sql server

### install C lib dependencies

Install `FreeTds` in macos, Ruby `tiny_tds` lib depends on it.

```bash
brew install freetds
```

Install ruby gem `tiny_tds` as sql server ruby driver.
Ref link: [tiny_tds](https://github.com/rails-sqlserver/tiny_tds)

```bash
# first check rvm ruby and gemset
rvm current
# install gem
gem install tiny_tds
```


## Postgresql dependency

### install C lib

```bash
brew install libpq
```

### Rubygems & bundler

After installing libpq, need to install the pg gem. 
Specify the `--with-opt-dir` build option using the gem binary through the command line:

```bash
gem install pg -- --with-opt-dir="/usr/local/opt/libpq"
```

If install using bundler, save the build option in the bundler build config. This will create a hidden bundle directory in your projects tree structure holding your bundler configuration as a key value pair, where the key is the build option and the value the location of the custom extension.

```bash
bundle config --local build.pg --with-opt-dir="/usr/local/opt/libpq"
bundle install
```


## Appendix - OpenSSL

OpenSSL is installed as dependency of database drivers (OS native C libs).

Installation typically gives log info as below:
```
==> openssl@1.1
A CA file has been bootstrapped using certificates from the system
keychain. To add additional certificates, place .pem files in
  /usr/local/etc/openssl@1.1/certs

and run
  /usr/local/opt/openssl@1.1/bin/c_rehash

openssl@1.1 is keg-only, which means it was not symlinked into /usr/local,
because macOS provides LibreSSL.

If you need to have openssl@1.1 first in your PATH run:
  echo 'export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"' >> /Users/binle/.bash_profile

For compilers to find openssl@1.1 you may need to set:
  export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
  export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

For pkg-config to find openssl@1.1 you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
```


## Appendix - Python3

In homebrew python3 is installed as dependency.

If pyenv is installed, the pyenv (and its virtualenv if added) python path takes precedence.
Therefore,
`which python` will still return `/Users/binle/.pyenv/shims/python`.

Installation log is like below:
```
==> python@3.8
Python has been installed as
  /usr/local/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /usr/local/opt/python@3.8/libexec/bin

...
```

All homebrew installed python versions (not through pyenv) can be found under
`/usr/local/lib`.

If you need to have python@3.9 first in your PATH run:
  echo 'export PATH="/usr/local/opt/python@3.9/bin:$PATH"' >> /Users/binle/.bash_profile

For compilers to find python@3.9 you may need to set:
  export LDFLAGS="-L/usr/local/opt/python@3.9/lib"

For pkg-config to find python@3.9 you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/python@3.9/lib/pkgconfig"
