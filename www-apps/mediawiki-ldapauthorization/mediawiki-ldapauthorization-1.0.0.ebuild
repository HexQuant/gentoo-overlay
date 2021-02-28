# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="MediaWiki extension LDAPAuthorization"
HOMEPAGE="https://www.mediawiki.org/wiki/Extension:LDAPAuthorization"
SRC_URI="
	REL1_31? ( https://extdist.wmflabs.org/dist/extensions/LDAPAuthorization-REL1_31-53e1ada.tar.gz )
	REL1_35? ( https://extdist.wmflabs.org/dist/extensions/LDAPAuthorization-REL1_35-e037664.tar.gz )
	"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="REL1_31 REL1_35"
REQUIRED_USE="^^ ( REL1_31 REL1_35 )"

DEPEND="
	REL1_31? (
		<=www-apps/mediawiki-1.35
		>=www-apps/mediawiki-ldapprovider-1.0.3[REL1_31]
		>=www-apps/mediawiki-pluggableauth-5.7[REL1_31]
		)
	REL1_35? (
		>=www-apps/mediawiki-1.35
		>=www-apps/mediawiki-ldapprovider-1.0.3[REL1_35]
		>=www-apps/mediawiki-pluggableauth-5.7[REL1_35]
		)
	"

RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/LDAPAuthorization"
MY_HTDOCSDIR="/var/www/localhost/htdocs"

src_install()
{
	insinto "${MY_HTDOCSDIR}/mediawiki/extensions/"
	doins -r "${S}"

}

pkg_postinst()
{
	einfo "Add the following code at the bottom of your LocalSettings.php:"
	einfo "wfLoadExtension('LDAPAuthorization');"
	einfo "then run 'php update.php'"
}

pkg_postrm()
{
	einfo "Don't forget to remove wfLoadExtension('LDAPAuthorization') from LocalSettings.php"
}
