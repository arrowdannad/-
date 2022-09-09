#!/bin/sh
while true;do
    clear && echo "
 ██████╗ ███╗   ███╗      ███╗   ███╗███████╗██╗     
██╔═══██╗████╗ ████║      ████╗ ████║██╔════╝██║     
██║   ██║██╔████╔██║█████╗██╔████╔██║███████╗██║     
██║▄▄ ██║██║╚██╔╝██║╚════╝██║╚██╔╝██║╚════██║██║     
╚██████╔╝██║ ╚═╝ ██║      ██║ ╚═╝ ██║███████║███████╗
 ╚══▀▀═╝ ╚═╝     ╚═╝      ╚═╝     ╚═╝╚══════╝╚══════╝                                                     
" && sleep 1s
while true;do
if [ -d QMXX_MSL ];then
{
yanzheng=$(cat "QMXX_MSL/awa")
if [[ $yanzheng =~ "true" ]];then
{
#日期时间显示
shijian=`date '+%Y-%m-%d|%H:%M:%S'`
echo '当前日期|日期：'$shijian && sleep 1s && clear
break
}
else
{
clear
    echo "协议：不得对本脚本再次改动或创作" | tee "QMXX_MSL/awa" && echo "如果了解并同意本协议，请输入'true'并回车开始使用"
    echo "输入'no'可以退出脚本" && sleep 2
    read xieyi
case $xieyi in
    [tT][rR][uU][eE] ) {
    echo "$xieyi" >> "QMXX_MSL/awa" && clear && echo "您已同意协议，正在加载脚本"
    #拍扁文件内容命令
    #xargs < "QMXX_MSL/awa" | tee "QMXX_MSL/awa"
    break
    };;
    [nN][oO] ) {
clear
    echo "您未同意协议，退出脚本" && rm -rf QMXX_MSL && exit
    };;
    * ) {
    echo "参数错误，输入'no'可以退出脚本" && sleep 2
    };;
esac
}
fi
}
else mkdir QMXX_MSL
fi
done
if [ -f "QMXX_MSL/qwq" ];then 
    while true;do
    moshi=$(cat "QMXX_MSL/qwq")
    if [ $moshi -eq 1 ];then
    echo "已选择（自动重启模式）" && sleep 1s && clear
java路径/java -Xms1024M -Xmx3000M -jar 核心名称.jar -nogui
    sleep 1s && clear
    echo "20秒后重启服务器"
    read -N 3 -t 10 -p"等待时间内可以输入'yes'来关闭自动重启并退出  " tuichu
    case $tuichu in
    [yY][eE][sS]|[yY] ) {
    echo "  检测到输入，退出自动重启" && sed -i 's/1/0/g' "QMXX_MSL/qwq"
    break
    };;
    * ) {
        sleep 10s && echo "  未检测到输入，执行自动重启"
    };;
    esac
    echo "  未检测到输入，执行自动重启"
    else 
    clear && echo "请输入数字1~3选择模式"
    echo "1:自动重启模式" && echo "2:单次启动模式" && echo "3:退出脚本"
read -N 1 shuru
case "$shuru" in
    1 ) {
        echo "已选择（自动重启模式）" && echo "正在配置文件"
        sed -i 's/0/1/g' "QMXX_MSL/qwq" && clear && sleep 1s && echo "完成，重启脚本中"
};;
    2 ) {
        clear && echo "已选择（单次启动模式）" && echo "正在启动服务端" && sleep 2s
        clear && sed -i 's/1/0/g' "QMXX_MSL/qwq"
java路径/java -Xms1024M -Xmx3000M -jar 核心名称.jar -nogui
        break
};;
    3 ) {
        clear && sed -i 's/1/0/g' "QMXX_MSL/qwq" && echo "退出脚本" && exit
};;
* ) echo "异常参数，请重新输入";;
esac
    fi
    done
else
    echo "未检测到文件，正在生成" && sleep 1s
QMXX_MSL_wenjian=0
cat <<QMXX_MSL_chuanru>"QMXX_MSL/qwq"
$QMXX_MSL_wenjian
QMXX_MSL_chuanru
fi
done
