Summary: NethServer webtop configuration
Name: nethserver-webtop4
Version: 1.2.2
Release: 1%{?dist}
License: GPL
URL: %{url_prefix}/%{name} 
Source0: %{name}-%{version}.tar.gz
Source3: WebtopPassEncode.java
BuildArch: noarch
AutoReq: no

Requires: nethserver-mail-server, nethserver-postgresql, nethserver-tomcat, nethserver-httpd
Requires: php-process, php-pgsql, php-imap, php-ldap, postgresql-jdbc
Requires: perl-libintl, perl-DBD-Pg
Requires: webtop4-core, webtop4-zpush

BuildRequires: perl, java-1.7.0-openjdk-devel
BuildRequires: nethserver-devtools 

%description
NethServer webtop configuration

%prep
%setup

%build
%{makedocs}
perl createlinks
mkdir -p root/usr/share/tomcat/lib
mkdir -p root/var/lib/nethserver/webtop/backup
mkdir -p root/var/lib/nethserver/webtop/public/main/images
mkdir -p root/usr/share/webtop/bin/
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
%attr(777, tomcat, tomcat) /var/lib/nethserver/webtop/tmp
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
/etc/e-smith/templates/usr/share/webtop/updates/post/main/3372_0@webtop.sql
/etc/e-smith/db/configuration/defaults/webtop
/usr/share/tomcat/lib/postgresql-jdbc.jar
/etc/sudoers.d/webtop
/etc/nethserver/todos.d/70webtop
/usr/share/nethesis/NethServer/Module/Dashboard/Applications/WebTop.php
/etc/backup-data.d/nethserver-webtop4.exclude
%doc COPYING

%changelog
* Tue Sep 06 2016 Giacomo Sanchietti <giacomo.sanchietti@nethesis.it> - 1.2.2-1
- Webtop: Active Directory configuration lost - Bug #3421 [NethServer 6]

* Thu Aug 25 2016 Giacomo Sanchietti <giacomo.sanchietti@nethesis.it> - 1.2.1-1
- Import contacts from Outlook 2016 - Enhancement #3419

* Fri May 20 2016 Giacomo Sanchietti <giacomo.sanchietti@nethesis.it> - 1.2.0-1
- WebTop: upgrade to upstream release 0405 and upgrade to upstream release z-push 2.2.8 - Enhancement #3372 [NethServer]

* Mon Jan 25 2016 Giacomo Sanchietti <giacomo.sanchietti@nethesis.it> - 1.1.2-1
- WebTop: upgrade to upstream release 0352 - Enhancement #3338 [NethServer]
- WebTop: Outlook PST import - Enhancement #3337 [NethServer]

* Mon Nov 16 2015 Giacomo Sanchietti <giacomo.sanchietti@nethesis.it> - 1.1.1-1
- WebTop: upgrade to upstream release 0341 - Bug #3313 [NethServer]
- WebTop: images upload doesn't work from admin section - Bug #3297 [NethServer]
- WebTop: upgrade to up 0334 - Bug #3296 [NethServer]

* Wed Oct 14 2015 Giacomo Sanchietti <giacomo.sanchietti@nethesis.it> - 1.1.0-1
- WebTop 4 groupware - Feature #3184 [NethServer]

