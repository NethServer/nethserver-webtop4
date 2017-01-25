Summary: NethServer webtop configuration
Name: nethserver-webtop4
Version: 1.3.6
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
%{genfilelist} %{buildroot} \
  --dir /var/lib/nethserver/nextcloud 'attr(0755,apache,apache)' \
  --dir /var/lib/nethserver/webtop 'attr(755, tomcat, tomcat)' \
  --dir /var/lib/nethserver/webtop/backup 'attr(755, postgres, postgres)' \
  --dir /var/lib/nethserver/webtop/tmp 'attr(777, tomcat, tomcat)' \
  > %{name}-%{version}-filelist

%post

%preun

%files -f %{name}-%{version}-filelist
%defattr(-,root,root)
%config %ghost %attr (0644,root,root) %{_sysconfdir}/httpd/conf.d/webtop.conf
%dir %{_nseventsdir}/%{name}-update
%doc COPYING
%doc README.rst

%changelog
* Mon Nov 07 2016 Giacomo Sanchietti <giacomo.sanchietti@nethesis.it> - 1.3.6-1
- pst2webtop: missing "description" field in contacts category - Bug NethServer/dev#5140

* Mon Oct 17 2016 Giacomo Sanchietti <giacomo.sanchietti@nethesis.it> - 1.3.5-1
- Webtop 4: missing fields during import from SOGo - NethServer/dev#5125

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

