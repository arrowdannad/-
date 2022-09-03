#!/bin/sh
while true
do
    clear && echo "欢迎使用AWD-MX开服脚本"
    sleep 1s && clear
if [ -f qwq ];then 
    echo "已检测到配置文件"
    sleep 1s
    while true;do
    a=$(cat qwq)
    if [ $a -eq 1 ];then
    echo "已选择（自动重启模式）"
    sleep 1s && clear
java路径/java -Xms1024M -Xmx3000M -jar 核心名称.jar -nogui
    sleep 1s && clear
    echo "20秒后重启服务器"
    read -N 3 -t 10 -p"等待时间内可以输入'yes'来关闭自动重启并退出  " a
    acse $a in
    [yY][eE][sS]|[yY] ) {
    echo "  检测到输入，退出自动重启"
    sed -i 's/1/0/g' qwq
    break
    };;
    * ) {
        sleep 10s
        echo "  未检测到输入，执行自动重启"
    };;
    esac
    echo "  未检测到输入，执行自动重启"
    else 
    sleep 1s && clear
    echo "请输入数字1~3选择模式"
    echo "1:自动重启模式" && echo "2:单次启动模式" && echo "3:退出脚本"
read shuru
case "$shuru" in
    1 ) {
        echo "已选择（自动重启模式）" && echo "正在配置文件"
        sed -i 's/0/1/g' qwq
        clear && sleep 1s
        echo "完成，重启脚本中"
};;
    2 ) {
        clear
        echo "已选择（单次启动模式）" && echo "正在启动服务端"
        sleep 2s && clear && sed -i 's/1/0/g' qwq
java路径/java -Xms1024M -Xmx3000M -jar 核心名称.jar -nogui
};;
    3 ) {
        clear && sed -i 's/1/0/g' qwq
        echo "退出脚本" && exit
};;
* ) echo "异常参数，请重新输入";;
esac
    fi
    done
else
    echo "未检测到文件，已自动生成" && sleep 2s
awd_mx_wenjian=0
cat <<awd_mx_chuanru>qwq
$awd_mx_wenjian
awd_mx_chuanru
    echo "正在重启脚本"
fi
done
