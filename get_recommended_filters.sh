#!/bin/bash

# create an empty input.csv file
touch input.csv

# declare an array of urls
urls=(
https://raw.githubusercontent.com/bigdargon/hostsVN/master/option/hosts-VN
https://raw.githubusercontent.com/Yhonay/antipopads/master/hosts
https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/light-onlydomains.txt
https://gitlab.com/fusionjack/adhell3-hosts/-/raw/master/hosts
https://abpvn.com/android/abpvn.txt
https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-Xiaomi-Extension.txt
https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/xiaomi
https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-Samsung-AdBlock.txt
https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/samsung
https://malware-filter.gitlab.io/malware-filter/vn-badsite-filter-hosts.txt
https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
https://small.oisd.nl/domainswild2
)

# loop through the urls and download each file with curl
for url in "${urls[@]}"; do
  # get the file name from the url
  file=$(basename "$url")
  # download the file with curl and save it as file.txt
  curl -o "$file.txt" "$url"
  # append the file contents to input.csv and add a newline
  cat "$file.txt" >> input.csv
  echo "" >> input.csv
  # remove the file.txt
  rm "$file.txt"
done

# print a message when done
echo "Done. The input.csv file contains merged data from recommended filter lists."
