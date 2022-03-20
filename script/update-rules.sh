#!/bin/sh
LC_ALL='C'

rm *.txt

# Create temporary folder
echo '新建TMP文件夹...'
mkdir -p ./tmp/
cd tmp
echo '新建TMP文件夹完成'

# Start Download Filter File
echo '开始下载规则...'
easylist=(
  "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt" #反广告屏蔽规则
  "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt" #反广告屏蔽规则
  "https://easylist-downloads.adblockplus.org/easylistchina+easylistchina_compliance+easylist.txt" #EasyChina和Easylist 基础规则
  "https://raw.githubusercontent.com/banbendalao/ADgk/master/ADgk.txt" #adgk规则 @坂本大佬
  "https://raw.githubusercontent.com/banbendalao/ADgk/master/kill-baidu-ad.txt" #百度超级净化 @坂本大佬
  "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt" #一个URL过滤器
  "https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/mv.txt" #乘风视频广告规则
  "https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt" #大萌主针的盗版网站的规则
  "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs%20for%20uBo/clear_urls_uboified.txt" #Clean Url 扩展的规则
  "https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad-pc.txt" #My AdFilter (For PC)
  "https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad-edentw.txt" #反广告拦截规则合集
  "https://raw.githubusercontent.com/hacamer/Adblist/master/adp-pc.txt" #杏梢的全量规则
  "https://raw.githubusercontent.com/Noyllopa/NoAppDownload/master/NoAppDownload.txt" #去APP下载按钮
)

easylist_plus=(
"https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad-pc.txt"
"https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad-edentw.txt" 
"https://raw.githubusercontent.com/banbendalao/ADgk/master/kill-baidu-ad.txt" #净化百度
"https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/rule.txt" #乘风规则
"https://raw.githubusercontent.com/uniartisan/adblock_list/master/adblock.txt" #uniartisan 基础
"https://raw.githubusercontent.com/uniartisan/adblock_list/master/adblock_lite.txt" #uniartisan lite
"https://raw.githubusercontent.com/uniartisan/adblock_list/master/adblock_plus.txt" #uniartisan plus
"https://raw.githubusercontent.com/uniartisan/adblock_list/master/adblock_privacy.txt" #uniartisan隐私
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt" #ubo烦人过滤器
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt" #
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt" #ubo基础过滤器
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt" #ubo隐私保护
"https://raw.githubusercontent.com/Noyllopa/NoAppDownload/master/NoAppDownload.txt" #去APP下载
"https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt" #大萌主的规则
"https://filters.adtidy.org/android/filters/2.txt" #adg基础过滤器
"https://filters.adtidy.org/android/filters/11.txt" #adg移动设备过滤器
"https://filters.adtidy.org/android/filters/3.txt" #adg防跟踪
"https://filters.adtidy.org/android/filters/224.txt" #adg中文过滤器
"https://filters.adtidy.org/android/filters/14.txt" #adg烦人过滤器
"https://filters.adtidy.org/android/filters/5.txt" #adg实验过滤器
"https://filters.adtidy.org/android/filters/4.txt" #adg社交过滤器
"https://filters.adtidy.org/android/filters/17.txt"  #adgURL过滤器
"https://raw.githubusercontent.com/Cats-Team/AdRule/main/url-filter.txt" #url过滤器 by Hacamer
"https://raw.githubusercontent.com/Cats-Team/AdRule/main/rules-admin.txt" #一些零碎规则 by Hacamer
  "https://easylist.to/easylist/fanboy-annoyance.txt" #烦人规则
)

adguard=(
  "https://filters.adtidy.org/android/filters/2_optimized.txt" #adg基础过滤器
  "https://filters.adtidy.org/android/filters/11_optimized.txt" #adg移动设备过滤器
  "https://filters.adtidy.org/android/filters/17_optimized.txt"  #adgURL过滤器
  "https://filters.adtidy.org/android/filters/3_optimized.txt" #adg防跟踪
  "https://filters.adtidy.org/android/filters/224_optimized.txt" #adg中文过滤器
  "https://filters.adtidy.org/android/filters/14_optimized.txt" #adg烦人过滤器
  "https://filters.adtidy.org/android/filters/5_optimized.txt" #adg实验过滤器
  "https://filters.adtidy.org/android/filters/4_optimized.txt" #adg社交过滤器
)

adguard_full=(
  "https://filters.adtidy.org/android/filters/2.txt" #adg基础过滤器
  "https://filters.adtidy.org/android/filters/11.txt" #adg移动设备过滤器
  "https://filters.adtidy.org/android/filters/3.txt" #adg防跟踪
  "https://filters.adtidy.org/android/filters/224.txt" #adg中文过滤器
  "https://filters.adtidy.org/android/filters/14.txt" #adg烦人过滤器
  "https://filters.adtidy.org/android/filters/5.txt" #adg实验过滤器
  "https://filters.adtidy.org/android/filters/4.txt" #adg社交过滤器
  "https://filters.adtidy.org/android/filters/17.txt"  #adgURL过滤器
)

allow=(
  "https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt"
  "https://raw.githubusercontent.com/banbendalao/ADgk/master/ADgk.txt"
  "https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad-pc.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/ChineseFilter/sections/whitelist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/GermanFilter/sections/whitelist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/TurkishFilter/sections/whitelist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/SpywareFilter/sections/whitelist.txt"
)

dns=(
  #以下规则不做阐述
  "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt"
  "https://easylist.to/easylist/fanboy-annoyance.txt"
  "https://raw.githubusercontent.com/reek/anti-adblock-killer/master/anti-adblock-killer-filters.txt"
  "https://raw.githubusercontent.com/cjx82630/cjxlist/master/cjx-annoyance.txt"
  "https://raw.githubusercontent.com/cjx82630/cjxlist/master/cjxlist.txt"
  "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt"
  "https://easylist-downloads.adblockplus.org/easyprivacy.txt"
  "https://easylist-downloads.adblockplus.org/easylistchina+easylistchina_compliance+easylist.txt"
  "https://raw.githubusercontent.com/banbendalao/ADgk/master/ADgk.txt"
  "https://raw.githubusercontent.com/banbendalao/ADgk/master/kill-baidu-ad.txt"
  "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt"
  "https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/mv.txt"
  "https://raw.githubusercontent.com/Noyllopa/NoAppDownload/master/NoAppDownload.txt"
  "https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt"
  "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs%20for%20uBo/clear_urls_uboified.txt"
  "https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt"
  "https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad-pc.txt"
  "https://adaway.org/hosts.txt" #adaway规则
  "https://abp.oisd.nl/basic/"
)

hosts=(
  "https://adaway.org/hosts.txt"
)

ad_domains=(
  "https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt"
)

allow_domains=(
  "https://raw.githubusercontent.com/privacy-protection-tools/dead-horse/master/anti-ad-white-list.txt"
  "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt"
  "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/optional-list.txt"
  #"https://raw.githubusercontent.com/Ultimate-Hosts-Blacklist/whitelist/master/domains.list"
  #"https://raw.githubusercontent.com/neodevpro/neodevhost/master/customallowlist"
)

for i in "${!easylist[@]}" "${!easylist_plus[@]}" "${!adguard_full[@]}" "${!adguard[@]}" "${!allow[@]}" "${!hosts[@]}" "${!dns[@]}" "${!ad_domains[@]}"  "${!allow_domains[@]}"
do
  curl --parallel --parallel-immediate -k -L -C - -o "easylist${i}.txt" --connect-timeout 60 -s "${easylist[$i]}" | iconv -t UTF-8 -c
  curl --parallel --parallel-immediate -k -L -C - -o "plus-easylist${i}.txt" --connect-timeout 60 -s "${easylist_plus[$i]}" | iconv -t UTF-8 -c
  curl --parallel --parallel-immediate -k -L -C - -o "full-adguard${i}.txt" --connect-timeout 60 -s "${adguard_full[$i]}" | iconv -t UTF-8 -c
  curl --parallel --parallel-immediate -k -L -C - -o "adguard${i}.txt" --connect-timeout 60 -s "${adguard[$i]}" | iconv -t UTF-8 -c
  curl --parallel --parallel-immediate -k -L -C - -o "allow${i}.txt" --connect-timeout 60 -s "${allow[$i]}" | iconv -t UTF-8 -c
  curl --parallel --parallel-immediate -k -L -C - -o "dns${i}.txt" --connect-timeout 60 -s "${dns[$i]}" | iconv -t UTF-8 -c
  curl --parallel --parallel-immediate -k -L -C - -o "hosts${i}.txt" --connect-timeout 60 -s "${hosts[$i]}" | iconv -t UTF-8 -c
  curl --parallel --parallel-immediate -k -L -C - -o "ad-domains${i}.txt" --connect-timeout 60 -s "${ad_domains[$i]}" | iconv -t UTF-8 -c
  curl --parallel --parallel-immediate -k -L -C - -o "allow-domains${i}.txt" --connect-timeout 60 -s "${allow_domains[$i]}" |iconv -t UTF-8 -c
  # shellcheck disable=SC2181
done
curl --connect-timeout 60 -s -o - https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanProgramAD.list \
 | grep -F 'DOMAIN-SUFFIX,' | sed 's/DOMAIN-SUFFIX,/127.0.0.1 /g' > hosts999.txt
curl --connect-timeout 60 -s -o - https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanAD.list \
 | grep -F 'DOMAIN-SUFFIX,' | sed 's/DOMAIN-SUFFIX,/127.0.0.1 /g' > hosts998.txt

echo '规则下载完成'

# Pre Fix rules
echo '处理规则中...'
cat hosts*.txt| grep -Ev '#|\$|@|!|/|\\|\*'| sed 's/127.0.0.1 //' | sed 's/0.0.0.0 //' |sed "s/^/||&/g" |sed "s/$/&^/g"| sed '/^$/d'| grep -v '^#' | grep -v 'local' | sort -n | uniq | awk '!a[$0]++' > abp-hosts.txt  #Hosts规则转ABP规则

cat allow-domains*.txt | grep -v '#' |sed "s/^/@@||&/g" | sed "s/$/&^/g" | sort -n | uniq | awk '!a[$0]++' >> pre-allow.txt  #将允许域名转换为ABP规则

cat *.txt |grep '^/' |grep -v './\|.?\|.\$\|.js\|._\|.\*\|.(php|png)\|.[0-9]\|.\^\|.=\|.~\|.[A-Z]\|.-' |sort -u > l.txt
#cat l.txt
# Start Merge and Duplicate Removal
#set LC_ALL='C'
cat .././mod/rules/adblock-rules.txt easylist*.txt | grep -v '^!' | grep -v '.!' | grep -v '^！' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' | grep -v 'local.adguard.org' | sort -n | uniq | awk '!a[$0]++' > tmp-adblock.txt #处理主规则
cat .././mod/rules/adblock-rules.txt plus-easylist*.txt | sort -u | sort -n | uniq | awk '!a[$0]++' | grep -v '.!' |grep -v '^!' | grep -v '^！' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' | grep -v 'local.adguard.org'  >> tmp-adblock+adguard.txt #处理Plus规则
cat adguard*.txt | grep -v '.!' | grep -v '^!' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' | sort -n | uniq | awk '!a[$0]++' > tmp-adguard.txt #处理AdGuard的规则
cat full-adguard*.txt | grep -v '.!' | grep -v '^!' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' | sort -n | uniq | awk '!a[$0]++' > tmp-adguard-full.txt #处理AdGuard的规则
cat .././mod/rules/*-rules.txt dns*.txt abp-hosts.txt *easylist*.txt l.txt | grep '^||\|^@@||' | grep -v './' | grep -v '\*' | grep -v '^\[' | grep -v '.\[' | grep -v '.\$'|grep -Ev "([0-9]{1,3}.){3}[0-9]{1,3}" | grep -v '^!' | sed 's/\^|/\^/' |sort -n | uniq | awk '!a[$0]++' > ll.txt 
cat ll.txt l.txt |sort -n |uniq >> tmp-dns.txt  #处理DNS规则
cat dns*.txt abp-hosts.txt tmp-dns.txt | grep '^|' | grep -v '\*'| grep -v './'| grep -v '^\[' | grep -v '.!' | grep -v '.\$'|grep -Ev "([0-9]{1,3}.){3}[0-9]{1,3}" |sed 's/||/0.0.0.0 /' | sed 's/\^//' | grep -v "^|" | sort -n | uniq | awk '!a[$0]++' > tmp-hosts.txt  #处理Hosts规则
cat tmp-hosts.txt | sed 's/0.0.0.0 //' | sort -n | uniq | awk '!a[$0]++' > tmp-ad-domains.txt #处理广告域名
cat *.txt | grep '^@' | sort -n | uniq | awk '!a[$0]++' > tmp-allow.txt #允许清单处理
echo '规则去重处理完成'

# Python 处理重复规则
python .././script/rule.py
# Move to Pre Filter
echo '移动规则到Pre目录'
cd ../
mkdir -p ./pre/
mv ./tmp/tmp-*.txt ./pre
cd ./pre
echo '移动完成'

# Start Count Rules

echo '正在计算规则总数..'
adblock_num=`cat tmp-adblock.txt | wc -l`
adblock_plus_num=`cat tmp-adblock+adguard.txt | wc -l`
adguard_num=`cat tmp-adguard.txt | wc -l`
full_adguard_num=`cat tmp-adguard-full.txt | wc -l`
dns_num=`cat tmp-dns.txt | wc -l`
hosts_num=`cat tmp-hosts.txt | wc -l`
ad_domains_num=`cat tmp-ad-domains.txt | wc -l`
allow_num=`cat tmp-allow.txt | wc -l`
echo '规则计算完毕'

# Start Add title and date
echo "! Version: $(TZ=UTC-8 date +'%Y-%m-%d %H:%M:%S')（北京时间） " >> tpdate.txt
echo "! Total count: $adblock_num" >> adblock-tpdate.txt
echo "! Total count: $adblock_plus_num" >> adblock+adguard-tpdate.txt
echo "! Total count: $adguard_num" >> adguard-tpdate.txt
echo "! Total count: $dns_num" >> dns-tpdate.txt
echo "! Total count: $hosts_num" >> hosts-tpdate.txt
echo "! Total count: $allow_num" >> allow-tpdate.txt
echo "! Total count: $ad_domains_num" >> ad-domains-tpdate.txt
echo "! Total count: $full_adguard_num" >> full-adguard-tpdate.txt
# Start Marge Rules
cat tpdate.txt adblock-tpdate.txt tmp-adblock.txt > adblock.txt
cat tpdate.txt adblock+adguard-tpdate.txt tmp-adblock+adguard.txt > adblock+adguard.txt
cat tpdate.txt adguard-tpdate.txt tmp-adguard.txt > adguard.txt
cat tpdate.txt full-adguard-tpdate.txt tmp-adguard-full.txt > adguard-full.txt
cat tpdate.txt dns-tpdate.txt tmp-dns.txt > dns.txt
cat tpdate.txt hosts-tpdate.txt tmp-hosts.txt > hosts.txt
cat tpdate.txt allow-tpdate.txt tmp-allow.txt > allow.txt
cat tpdate.txt ad-domains-tpdate.txt tmp-ad-domains.txt > ad-domains.txt
rm tmp*.txt *tpdate.txt

# Add Title
cd ../
diffFile="$(ls pre |sort -u)"
for i in $diffFile; do
 titleName=$(echo "$i" |sed 's#.txt#-title.txt#')
 cat ./mod/title/$titleName ./pre/$i | awk '!a[$0]++'> ./$i
 sed -i '/^$/d' $i
 echo "合并${i}的标题中"
done
echo '规则处理完成'
rm -rf pre tmp
exit
