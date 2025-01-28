# checkmk-version-checker
CheckMK script, which prints prints the current version and compares it with the most-up-to-date minor release.

## INSTALLATION
### agent-updater
Upgrade agent and its plugins to the newest version

Create a file `/etc/check_mk/agent-updater.cfg` with the following content:

```
URL=https://www.example.com/checkmk
```

You may skip selected plugin upgrades with:
```
PLUGIN_SKIP_UPDATE=smart mk_apt
```

### drupal-version
Copy the script `drupal-version` to `/usr/lib/check_mk_agent/local`.  Requires [jq](https://jqlang.github.io/jq/) installed.

Create a file `/etc/check_mk/drupal-version.cfg` with the path(s) of your drupal installation(s) (one per line):

```
/var/www/drupal
/home/homepage/drupal
```

### matomo-version
Copy the script `matomo-version` to `/usr/lib/check_mk_agent/local`.  Requires [jq](https://jqlang.github.io/jq/) installed.

Create a file `/etc/check_mk/matomo-version.cfg` with the path(s) of your matomo installation(s) (one per line):

```
/var/www/matomo/
```

### wordpress-version
Copy the script `wordpress-version` to `/usr/lib/check_mk_agent/local`.

Create a file `/etc/check_mk/wordpress-version.cfg` with the path(s) of your drupal installation(s) (one per line):

```
/var/www/wordpress
/home/user/public_html
```

### mediawiki-version
Copy the script `mediawiki-version` to `/usr/lib/check_mk_agent/local`.

Create a file `/etc/check_mk/mediawiki-version.cfg` with the path(s) of your mediawiki installation(s) (one per line):

```
/var/www/mediawiki
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

### rainloop-version
Copy the script `rainloop-version` to `/usr/lib/check_mk_agent/local`.

Create a file `/etc/check_mk/rainloop-version.cfg` with the path(s) of your drupal installation(s) (one per line):

```
/var/www/rainloop
```

### roundcube-version
Copy the script `roundcube-version` to `/usr/lib/check_mk_agent/local`.

Create a file `/etc/check_mk/roundcube-version.cfg` with the path(s) of your drupal installation(s) (one per line):

```
/var/www/roundcube
```

### repository-git-version
Checks a Git Repository if newer tags are available. The script will execute 'git fetch', that's why a user in the configuration script is necessary.

Copy the script `repository-git-version` to `/usr/lib/check_mk_agent/local`.
Create a file `/etc/check_mk/repository-git-version.cfg` with Name, path and username (one per line):
```
Name:/path/to/repository:username
```

### docker-image-version
Checks all docker images if a new version on Docker Hub is available. Requires [jq](https://jqlang.github.io/jq/) installed.

Copy the script `docker-image-version` to `/usr/lib/check_mk_agent/local`.

You can watch images for new version which do not run directly, by listing them in `/etc/check_mk/docker-image-version.cfg` (one per line):
```
discourse/base
```

### check-mk-version
Checks if a new check-mk-raw version is available.

You need to install 'jq' (e.g. `apt install jq`)

Copy the script `check-mk-version` to `/usr/lib/check_mk_agent/local`.
