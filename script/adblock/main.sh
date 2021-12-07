#!/bin/bash
cd ./src

# Start Download
curl -o i1.txt https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad-pc.txt
curl -o i2.txt https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad-edentw.txt
curl -o i3.txt https://raw.githubusercontent.com/banbendalao/ADgk/master/ADgk.txt
#curl -o i4.txt https://file.trli.club/dns/hosts.txt
curl -o i5.txt https://raw.githubusercontent.com/banbendalao/ADgk/master/kill-baidu-ad.txt
curl -o i6.txt https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/rule.txt
curl -o i7.txt https://raw.githubusercontent.com/uniartisan/adblock_list/master/adblock.txt
curl -o i8.txt https://raw.githubusercontent.com/uniartisan/adblock_list/master/adblock_lite.txt
#curl -o i9.txt https://raw.githubusercontent.com/uniartisan/adblock_list/master/adblock_plus.txt
curl -o i10.txt https://raw.githubusercontent.com/uniartisan/adblock_list/master/adblock_privacy.txt
#curl -o i11.txt https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt
#curl -o i12.txt https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt
#curl -o i13.txt https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt
#curl -o i14.txt https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt
curl -o i15.txt https://raw.githubusercontent.com/Noyllopa/NoAppDownload/master/NoAppDownload.txt


# Start Merge and Duplicate Removal
cat i*.txt > mergd.txt
cat mergd.txt | grep -v '^!' | grep -v '^！' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' > tmpp.txt
sort -n tmpp.txt | uniq > tmp.txt


# Start Count Rules
num=`cat tmp.txt | wc -l`

# Start Add title and date
echo "[Adblock Plus 2.0]
! Title: AdRules (For AdBlock)
! Homepage: https://github.com/Cats-Team/AdRules
! Powerd by CatsTeam
! Expires: 12 Hours
! Description: 该规则合并自My AdFilters（for PC），EdentwCustom，adgk，Adaway，Uniartisan，规则以及乘风规则等" >> title.txt
echo "! Version: `date +"%Y-%m-%d %H:%M:%S"`" >> tpdate.txt
echo "! Total count: $num" >> tpdate.txt
cat title.txt tpdate.txt tmp.txt > final.txt

mv final.txt ../../../adblock.txt
rm *.txt
cd ../../
exit
