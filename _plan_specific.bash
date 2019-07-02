# ansible
do_ansible_latest_version() {
  echo "$(curl -s https://releases.ansible.com/ansible/ \
    | grep 'href="ansible' \
    | grep -v latest \
    | grep -v sha \
    | grep -v -E "(a|b|rc|dev|pre)[0-9]+" \
    | sed 's/^.*gz">\([^<]*\)<\/a>/\1/' \
    | sed -E 's/([0-9]{4})-([0-9]{2})-([0-9]{2})/\1\2\3/' \
    | sed -E 's/ +/ /g' \
    | sort -k2 \
    | sed -E 's/\.tar\.(gz|bz2|xz)//' \
    | tail -1 \
    | awk '{print $1}')"
  return 0
}

# R
do_r_latest_version() {
  echo "$(curl -s https://cran.r-project.org/src/base/VERSION-INFO.dcf \
    | grep "^Release: " \
    | awk '{print $2}')"
  return 0
}

# acl
do_acl_latest_version() {
  echo "$(curl -s http://download.savannah.nongnu.org/releases/acl/ \
    | grep 'href="acl' \
    | grep -v ".sig" \
    | sed 's/^.*gz">\([^<]*\)<\/a>.*/\1/' \
    | sed -E 's/(\.src)?\.tar\.gz//' \
    | sort \
    | tail -1)"
  return 0    
}

# alex
do_alex_latest_version() {
  echo "$(curl -s https://hackage.haskell.org/package/alex \
    | grep "<base" \
    | sed -E 's/.*(alex-[^"\/]+)\/".*/\1/')"
  return 0
}

# alsa-lib
do_alsa_lib_latest_version() {
  echo "$(curl -s ftp://ftp.alsa-project.org/pub/lib/ \
    | grep "alsa-lib" \
    | awk '{print $9}' \
    | grep -v -E "(a|b|rc|dev|pre)[0-9]+" \
    | sed 's/\.tar\.bz2//' \
    | sort \
    | tail -1)"
  return 0
}

# artifactory and artifactory-pro
do_artifactory_latest_version() {
  echo "$(curl -s https://bintray.com/jfrog/artifactory/ \
    | grep 'Version:' \
    | sed -E 's/.*Version: ([0-9\.]+).*/\1/' \
    | sort \
    | uniq \
    | tail -1)"
  return 0
}

# lsof
do_lsof_latest_version() {
  echo "$(curl -s "https://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/" \
    | egrep 'lsof_[0-9\.]+\.tar\.bz2' \
    | grep -v ".sig" \
    | sed -E 's/^.*(gz|bz2|xz|Z)">([^<]*)\.tar\.(gz|bz2|xz|Z)<\/a>.*/\2/')"
  return 0
}

# Takes a postgresql short version code (Eg: "96", "95")
do_postgresql_latest_version() {
  local code="$(echo "${1}" | sed 's/-client//')"
  local version_prefix=""
  if [ "${code}" = "11" ]; then
    version_prefix="11."
  else
    # 96 => 9.6.
    # 95 => 9.5.
    version_prefix="$(echo "${code}" | sed -E 's/(.)/\1./g')"
  fi
  echo "$(curl -s "https://ftp.postgresql.org/pub/source/" \
    | grep 'class="d"' \
    | sed -E 's/^.*<a href[^>]+>v([^<]+)<.*$/\1/' \
    | grep -v '\.\.' \
    | grep "^${version_prefix}" \
    | grep -v 'beta' \
    | sort --version-sort \
    | tail -1)"
  return 0
}