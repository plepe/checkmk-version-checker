# checkmk-drupal-version
CheckMK script, which prints the current version and compares it with the most-up-to-date minor release.

## INSTALLATION
Copy the script `drupal-version` to `/usr/lib/check_mk_agent/local`.

Create a file `/etc/check_mk/drupal-version.cfg` with the path(s) of your drupal installation(s) (one per line):

```
/var/www/drupal
/home/homepage/drupal
```
