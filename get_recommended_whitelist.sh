#!/bin/bash
#  
# Use the provided lists or add you own
# https://oisd.nl/includedlists/whitelists
# by creating an empty whitelist.csv file
touch whitelist.csv

# declare an array of urls
urls=(
    https://raw.githubusercontent.com/nextdns/click-tracking-domains/main/domains
    https://raw.githubusercontent.com/im-sm/Pi-hole-Torrent-Blocklist/main/all-torrent-trackres.txt
    https://raw.githubusercontent.com/AdguardTeam/HttpsExclusions/master/exclusions/banks.txt
    https://raw.githubusercontent.com/hagezi/dns-blocklists/main/whitelist.txt
    https://raw.githubusercontent.com/TogoFire-Home/AD-Settings/main/Filters/whitelist.txt
    https://raw.githubusercontent.com/freekers/whitelist/master/domains/whitelist.txt
)

# loop through the urls and download each file with curl
for url in "${urls[@]}"; do
  # get the file name from the url
  file=$(basename "$url")
  # download the file with curl and save it as file.txt
  curl -o "$file.txt" "$url"
  # append the file contents to whitelist.csv and add a newline
  cat "$file.txt" >> whitelist.csv
  echo "" >> whitelist.csv
  # remove the file.txt
  rm "$file.txt"
done

# print a message when done
echo "Done. The whitelist.csv file contains merged data from recommended whitelists."
