Summary: NethServer webtop configuration
Name: nethserver-webtop4
Version: 1.3.4
Release: 1%{?dist}
License: GPL
URL: %{url_prefix}/%{name} 
Source0: %{name}-%{version}.tar.gz
Source3: WebtopPassEncode.java
BuildArch: noarch

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
rm -rf %{buildroot}
(cd root; find . -depth -print | cpio -dump %{buildroot})
ln -sf /usr/share/java/postgresql-jdbc.jar $RPM_BUILD_ROOT/usr/share/tomcat/lib/postgresql-jdbc.jar

%post

%preun

%files
%defattr(-,root,root)
%config %ghost %attr (0644,root,root) %{_sysconfdir}/httpd/conf.d/webtop.conf
%attr(755, tomcat, tomcat) /var/lib/nethserver/webtop
%attr(755, postgres, postgres) /var/lib/nethserver/webtop/backup
%attr(777, tomcat, tomcat) /var/lib/nethserver/webtop/tmp
%dir %{_nseventsdir}/%{name}-update
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
/etc/e-smith/templates/etc/httpd/conf.d/webtop.conf/10base
/etc/e-smith/templates/var/lib/tomcat/webapps/webtop
/etc/e-smith/templates/etc/dovecot/dovecot.conf/90webtop
/etc/e-smith/templates/var/lib/pgsql/data/pg_hba.conf/10webtop
/etc/e-smith/templates/usr/share/webtop/z-push
/etc/e-smith/templates/usr/share/webtop/updates/post/main/3372_0@webtop.sql
/etc/e-smith/templates/etc/httpd/conf.d/default-virtualhost.inc/20webtop4
/etc/e-smith/db/configuration/defaults/webtop
/usr/share/tomcat/lib/postgresql-jdbc.jar
/etc/sudoers.d/webtop
/etc/nethserver/todos.d/70webtop
/usr/share/nethesis/NethServer/Module/Dashboard/Applications/WebTop.php
/etc/backup-data.d/nethserver-webtop4.exclude
%doc COPYING
%doc README.rst

%changelog
* Wed Sep 14 2016 Giacomo Sanchietti <giacomo.sanchietti@nethesis.it> - 1.3.4-1
- Fix domain configuration and avoid errors during db creation. PR #6

* Tue Sep 06 2016 Giacomo Sanchietti <giacomo.sanchietti@nethesis.it> - 1.3.3-1
- Webtop: Active Directory configuration lost - Bug #3421 [NethServer 6]

* Thu Sep 01 2016 Giacomo Sanchietti <giacomo.sanchietti@nethesis.it> - 1.3.2-1
- Apache vhost-default template expansion - NethServer/dev#5088

* Thu Aug 25 2016 Giacomo Sanchietti <giacomo.sanchietti@nethesis.it> - 1.3.1-1
- pst2webtop_card: support for Outlook 2016
- Fix apache ACL - Bug #5084

* Thu Jul 07 2016 Stefano Fancello <stefano.fancello@nethesis.it> - 1.3.0-1
- First NS7 release

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

