# Role php-modules

Install php modules

# Installation 

Include in a role like this:

```yaml
- hosts: all
  role: 
    - { role: php-modules }
```

This role needs variables in host_vars/ or group_vars/:

```yaml
php_modules:
#  - php5-gearman
#  - php5-sqlite	
#  - php5-xcache
#  - php5-xhprof
#  - libphp-adodb - ADOdb is a PHP database abstraction layer library
#  - libphp-embed - HTML-embedded scripting language (Embedded SAPI library) (default)
#  - libphp-jabber - Object-oriented PHP interface for the Jabber/XMPP protocol
#  - libphp-magpierss - provides an XML-based RSS parser in PHP
#  - libphp-pclzip - transitional dummy package
#  - libphp-phpmailer - full featured email transfer class for PHP
#  - libphp-predis - Flexible and feature-complete PHP client library for the Redis key-value store
#  - libphp-serialization-perl - Perl module to manipulate serialized PHP data structures
#  - libphp-simplepie - RSS and Atom feed parsing in PHP
#  - libphp-snoopy - Snoopy is a PHP class that simulates a web browser
#  - libphp-swiftmailer - transitional dummy package
#  - libphp7.0-embed - HTML-embedded scripting language (Embedded SAPI library)
#  - php7.0-mysqlnd
#  - php-apcu 		# APC User Cache for PHP
#  - php-bcmath 	# Bcmath module for PHP
#  - php-bz2 		# bzip2 module for PHP
#  - php-cgi		# server-side, HTML-embedded scripting language (CGI binary)
#  - php-curl		# CURL module for PHP
#  - php-dba		# DBA module for PHP
#  - php-dev		# Files for PHP7.0 module development
#  - php-enchant	# Enchant module for PHP
#  - php-fpm		# server-side, HTML-embedded scripting language (FPM-CGI binary)
#  - php-gd			# GD module for PHP
#  - php-gmp		# GMP module for PHP
#  - php-imagick	# Provides a wrapper to the ImageMagick library
#  - php-imap		# IMAP module for PHP
#  - php-interbase	# Interbase module for PHP
#  - php-intl		# Internationalisation module for PHP
#  - php-json		# JSON module for PHP
#  - php-ldap		# LDAP module for PHP
#  - php-mbstring	# MBSTRING module for PHP
#  - php-mcrypt		# libmcrypt module for PHP
#  - php-memcached  # memcached extension module for PHP5, uses libmemcached
#  - php-mysql		# MySQL module for PHP
#  - php-odbc		# ODBC module for PHP
#  - php-opcache	# Zend OpCache module for PHP
#  - php-pgsql		# PostgreSQL module for PHP
#  - php-phpdbg		# server-side, HTML-embedded scripting language (PHPDBG binary)
#  - php-pspell		# pspell module for PHP
#  - php-readline	# readline module for PHP
#  - php-recode		# recode module for PHP
#  - php-redis		# PHP extension for interfacing with Redis
#  - php-snmp		# SNMP module for PHP
#  - php-soap		# SOAP module for PHP
#  - php-sqlite3	# SQLite3 module for PHP
#  - php-sybase		# Sybase module for PHP
#  - php-tidy		# tidy module for PHP
#  - php-xml		# DOM, SimpleXML, WDDX, XML, and XSL module for PHP
#  - php-xmlrpc		# XMLRPC-EPI module for PHP
#  - php-xsl		# XSL module for PHP (dummy)
#  - php-zip		# Zip module for PHP

```


Default role variables:

```yaml
php_modules:
  - php-mysql
```

## Requirements / Dependencies

* php

## Supported system

* Ubuntu

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|Required|
|----|----|-----------|-------|-------|
`php_modules`|list|`List of modules`|`php-mysql`|`no`|
