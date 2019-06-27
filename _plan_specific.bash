do_ansible_latest_version() {
    echo "$(curl -s https://releases.ansible.com/ansible/ \
      | grep 'href="ansible' \
      | grep -v latest \
      | grep -v sha \
      | grep -v -E "(a|b|rc|dev)[0-9]+" \
      | sed 's/^.*gz">\([^<]*\)<\/a>/\1/' \
      | sed -E 's/([0-9]{4})-([0-9]{2})-([0-9]{2})/\1\2\3/' \
      | sed -E 's/ +/ /g' \
      | sort -k2 \
      | sed -E 's/\.tar\.(gz|bz2|xz)//' \
      | tail -1 \
      | awk '{print $1}')"
    return 0
}
