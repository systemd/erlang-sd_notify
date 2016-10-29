%global realname sd_notify
%global upstream systemd
%global upstream_version 0.12



Name:		erlang-%{realname}
Version:	%{upstream_version}
Release:	1%{?dist}
Summary:	Erlang interface to systemd notify subsystem
License:	MIT
URL:		https://github.com/%{upstream}/%{realname}
VCS:		scm:git:https://github.com/%{upstream}/%{realname}.git
Source0:	https://github.com/%{upstream}/%{realname}/archive/%{version}/erlang-%{realname}-%{version}.tar.gz
Source1:	erlang-sd_notify-rebar.config
BuildRequires:	erlang-rebar
BuildRequires:	systemd-devel
%{?__erlang_nif_version:Requires: %{__erlang_nif_version}}


%description
%{summary}.

%prep -c .
%setup  -c .

%build
rebar compile


%install
mkdir -p $RPM_BUILD_ROOT%{_libdir}/erlang/lib/%{realname}-%{version}/{ebin,priv}
install -m 644 -p ebin/%{realname}.app $RPM_BUILD_ROOT%{_libdir}/erlang/lib/%{realname}-%{version}/ebin
install -m 644 -p ebin/%{realname}.beam $RPM_BUILD_ROOT%{_libdir}/erlang/lib/%{realname}-%{version}/ebin
install -m 755 -p priv/%{realname}_drv.so $RPM_BUILD_ROOT%{_libdir}/erlang/lib/%{realname}-%{version}/priv


%files
%doc LICENSE
%dir %{_libdir}/erlang/lib/%{realname}-%{version}/
%dir %{_libdir}/erlang/lib/%{realname}-%{version}/ebin/
%dir %{_libdir}/erlang/lib/%{realname}-%{version}/priv/
%{_libdir}/erlang/lib/%{realname}-%{version}/ebin/%{realname}.app
%{_libdir}/erlang/lib/%{realname}-%{version}/ebin/%{realname}.beam
%{_libdir}/erlang/lib/%{realname}-%{version}/priv/%{realname}_drv.so


%changelog
* Sat Oct 29 2016 Igor Gnatenko <g.santomaggio@gmail.com> - 0.12
- nitial build for 0.12


