

## install dependencies

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


## Appendix - brew install freetds log


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

==> python@3.8
Python has been installed as
  /usr/local/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /usr/local/opt/python@3.8/libexec/bin

You can install Python packages with
  pip3 install <package>
They will install into the site-package directory
  /usr/local/lib/python3.8/site-packages

See: https://docs.brew.sh/Homebrew-and-Python
==> glib
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
==> python@3.9
Python has been installed as
  /usr/local/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /usr/local/opt/python@3.9/libexec/bin

You can install Python packages with
  pip3 install <package>
They will install into the site-package directory
  /usr/local/lib/python3.9/site-packages

See: https://docs.brew.sh/Homebrew-and-Python

python@3.9 is keg-only, which means it was not symlinked into /usr/local,
because this is an alternate version of another formula.

If you need to have python@3.9 first in your PATH run:
  echo 'export PATH="/usr/local/opt/python@3.9/bin:$PATH"' >> /Users/binle/.bash_profile

For compilers to find python@3.9 you may need to set:
  export LDFLAGS="-L/usr/local/opt/python@3.9/lib"

For pkg-config to find python@3.9 you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/python@3.9/lib/pkgconfig"
