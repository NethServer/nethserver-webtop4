Summary: NethServer webtop configuration
Name: nethserver-webtop4
Version: 1.0.1
Release: 1%{?dist}
License: GPL
URL: %{url_prefix}/%{name} 
Source0: %{name}-%{version}.tar.gz
Source1: http://git.nethesis.it/install/webtop/webtop.war
Source2: http://git.nethesis.it/install/webtop/z-push.tar.gz
Source3: WebtopPassEncode.java
BuildArch: noarch
AutoReq: no

Requires: nethserver-mail-server, nethserver-postgresql, nethserver-tomcat, nethserver-httpd
Requires: php-process, php-pgsql, php-imap, php-ldap, postgresql-jdbc
Requires: perl-libintl, perl-DBD-Pg

BuildRequires: perl, unzip, java-1.7.0-openjdk-devel
BuildRequires: nethserver-devtools 

%description
NethServer webtop configuration

%prep
%setup

%build
%{makedocs}
perl createlinks
mkdir -p root/var/lib/tomcat/webapps/webtop
mkdir -p root/var/www/html
mkdir -p root/var/log/z-push
mkdir -p root/var/lib/nethserver/z-push/state
mkdir -p root/usr/share/webtop
mkdir -p root/usr/share/tomcat/lib
mkdir -p root/var/lib/nethserver/webtop/backup
mkdir -p root/usr/share/webtop/bin/
unzip %{SOURCE1} -d root/var/lib/tomcat/webapps/webtop
tar xvzf %{SOURCE2} -C root/usr/share/webtop
cp %{SOURCE3} root/usr/share/webtop
javac root/usr/share/webtop/WebtopPassEncode.java
rm -f root/usr/share/webtop/WebtopPassEncode.java

%install
rm -rf $RPM_BUILD_ROOT
(cd root; find . -depth -print | cpio -dump $RPM_BUILD_ROOT)
ln -sf /usr/share/java/postgresql-jdbc.jar $RPM_BUILD_ROOT/usr/share/tomcat/lib/postgresql-jdbc.jar

%post

%preun

%files
%defattr(-,root,root)
%attr(755, tomcat, tomcat) /var/lib/nethserver/webtop
%attr(755, postgres, postgres) /var/lib/nethserver/webtop/backup
%attr(755, apache, apache) /var/log/z-push
%attr(755, apache, apache) /var/lib/nethserver/z-push
%attr(777, tomcat, tomcat) /var/lib/nethserver/webtop/tmp
/var/lib/tomcat/webapps/webtop
/usr/share/webtop
/etc/e-smith/events/nethserver-webtop4-update
/etc/e-smith/events/actions/nethserver-webtop4-conf
/etc/e-smith/events/actions/nethserver-webtop4-domain
/etc/e-smith/events/actions/nethserver-webtop4-backup
/etc/e-smith/events/actions/nethserver-webtop4-restore
/etc/e-smith/events/actions/nethserver-webtop4-delete
/etc/e-smith/events/user-delete/S70nethserver-webtop4-delete
/etc/e-smith/events/post-restore-data/S50nethserver-webtop4-restore
/etc/e-smith/events/post-restore-data/services2adjust/tomcat
/etc/e-smith/events/pre-backup-data/S50nethserver-webtop4-backup
/etc/e-smith/templates/httpd/vhost-default/50webtop
/etc/e-smith/templates/var/lib/tomcat/webapps/webtop
/etc/e-smith/templates/etc/dovecot/dovecot.conf/90webtop
/etc/e-smith/templates/var/lib/pgsql/data/pg_hba.conf/10webtop
/etc/e-smith/templates/usr/share/webtop/z-push
/etc/e-smith/db/configuration/defaults/webtop
/usr/share/tomcat/lib/postgresql-jdbc.jar
/etc/sudoers.d/webtop
/etc/nethserver/todos.d/70webtop
/usr/share/nethesis/NethServer/Module/Dashboard/Applications/WebTop.php
%doc COPYING

%changelog
