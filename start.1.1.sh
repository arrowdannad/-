#!/bin/sh
echo "欢迎使用AWD-MX开服脚本"
if [ -f qwq ]
then
while true
do
a=$(cat qwq)
if [ $a -eq 1 ]
then
  echo "请在qwq文件中删除数字1来关闭自动重启!开启方法相反"
/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin/java -Xms1024M -Xmx3000M -jar mohist-1.16.5-1075-server.jar -nogui
echo "30秒后重启服务器"
sleep 20s
else
  echo "检测到文件变动，正在关闭自动重启。。。"
  echo "请在qwq文件中删除数字1来关闭自动重启!开启方法相反"
  echo "或者删除qwq文件"
  exit
fi
done
else
echo "未检测到文件，已自动生成"
echo "请手动重启脚本，默认自动重启服务器"
awd_mx-wenjian=1
cat <<awd_mx-chuanru>qwq
$awd_mx-wenjian
awd_mx-chuanru
fi