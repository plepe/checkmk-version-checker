# checkmk-version-checker
CheckMK script, which prints prints the current version and compares it with the most-up-to-date minor release.

## INSTALLATION
### drupal-version
Copy the script `drupal-version` to `/usr/lib/check_mk_agent/local`.

Create a file `/etc/check_mk/drupal-version.cfg` with the path(s) of your drupal installation(s) (one per line):

```
/var/www/drupal
/home/homepage/drupal
```

### nextcloud-version
Copy the script `nextcloud-version` to `/usr/lib/check_mk_agent/local`.

Create a file `/etc/check_mk/nextcloud-version.cfg` with the path(s) of your nextcloud installation(s) (one per line):

```
/var/www/nextcloud
```

### apt-pkg-version
Checks the version of specific apt packages and warn when a newer version is available.

Copy the script `apt-pkg-version` to `/usr/lib/check_mk_agent/local`.

Create a file `/etc/check_mk/apt-pkg-version.cfg` with names of apt packages (one per line):
```
apache2
gitlab-ce
```
