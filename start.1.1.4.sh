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
        yanzheng=$(cat "QMXX_MSL/agreement")
            if [[ $yanzheng =~ "true" ]];then
            {
                #日期时间显示
                shijian=`date '+%Y-%m-%d|%H:%M:%S'`
                echo '当前日期|时间：'$shijian && sleep 1s && clear
                break
            }
        else
            {
                clear
                echo "协议：不得对本脚本再次改动或创作" | tee "QMXX_MSL/agreement" && echo "如果了解并同意本协议，请输入'true'并回车开始使用"
                echo "输入'no'可以退出脚本"
                read xieyi
                case $xieyi in
                    [tT][rR][uU][eE] ) {
                        echo "$xieyi" >> "QMXX_MSL/agreement" && clear && echo "您已同意协议，正在加载脚本"
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
    if [ -f "QMXX_MSL/config" ];then 
        while true;do
                peizhi=$(cat "QMXX_MSL/config")
                if [[ $peizhi =~ "peizhi_false1" ]];then
                    echo "jvav -Xms1024M -XmxerrorM -jar mc.jar -nogui" > "QMXX_MSL/owo"
                    sed -i 's/peizhi_false1/peizhi_false/g' "QMXX_MSL/config"
                fi
            peizhi=$(cat "QMXX_MSL/config")
            if [[ $peizhi =~ "peizhi_false" ]];then
            {
                while true;do
                echo "进入配置模式" && sleep 1s && clear && echo "请选择配置目标"
                echo "1:配置java路径" && echo "2:配置内存大小" && echo "3:配置核心路径" && echo "4:检擦配置正确性" && echo "5:保存并退出"
                read -N 1 peizhi_xx
                case $peizhi_xx in
                    1 ) {
                        clear && echo "请输入java的绝对路径，或者选择其他选项" && echo '使用[\]的时候，请使用[-][_]来代替，这不会影响什么'
                        echo "输入（hj）将使用环境路径，不知道不要选择此选项" && echo "输入（no）将不配置路径，稍后自行配置"
                        read peizhi_lj
                        case $peizhi_lj in
                            [hH][jJ] ) {
                                sed -i 's/jvav/java/g' "QMXX_MSL/owo"
                                echo "使用环境路径" && sleep 2s && clear
                            };;
                            [nN][oO] ) {
                                echo "不配置路径" && sleep 2s && clear
                            };;
                            * ) {
                                sed -i "s/jvav/${peizhi_lj}/g" "QMXX_MSL/owo"
                                sed -i "s/-/\//g" "QMXX_MSL/owo" && sed -i "s/_/\//g" "QMXX_MSL/owo"
                                echo "使用自定义路径" && sleep 2s && clear
                            };;
                        esac
                    };;
                    2 ) {
                        clear && echo "请输入最大内存，默认MB为单位" && echo "输入（mr）将自动配置大小，有概率开服失败。"
                        read peizhi_nc
                        case $peizhi_nc in
                            [mM][rR] ) {
                                mem_sys_free=`free | grep Mem | awk '{print $4}'`
                                nc=$[$mem_sys_free/1024]
                                if [ "$nc" -gt "1024" ];then
                                    sed -i "s/error/${nc}/g" "QMXX_MSL/owo" && echo "使用自动配置内存" && sleep 2s && clear
                                else echo "自动配置失败，内存过低，建议关闭不必要的软件后再尝试" && sleep 2s && clear
                                fi
                            };;
                            * ) {
                                sed -i "s/error/${peizhi_nc}/g" "QMXX_MSL/owo"
                            };;
                        esac
                    };;
                    3 ) {
                        clear && echo "请输入核心的名字，或者选择其他选项"
                        echo "输入（no）将不配置核心，稍后自行配置"
                        read peizhi_hx
                        case $peizhi_hx in
                            [nN][oO] ) {
                                echo "不配置路径" && sleep 2s && clear
                            };;
                            * ) {
                                sed -i "s/mc/${peizhi_hx}/g" "QMXX_MSL/owo"
                                echo "使用自定义路径" && sleep 2s && clear
                            };;
                        esac
                    };;
                    4 ) {
                        clear
                        peizhi=$(cat "QMXX_MSL/owo")
                        if [[ $peizhi =~ "jvav" ]];then
                        echo "java路径错误"
                        fi
                        peizhi=$(cat "QMXX_MSL/owo")
                        if [[ $peizhi =~ "error" ]];then
                        echo "内存错误"
                        fi
                        peizhi=$(cat "QMXX_MSL/owo")
                        if [[ $peizhi =~ "mc" ]];then
                        echo "核心路径错误"
                        fi
                        echo "检测完成,输入任意键继续" && read -N 1 && clear
                    };;
                    5 ) {
                        sed -i 's/peizhi_false1/peizhi_true/g' "QMXX_MSL/config"
                        sed -i 's/peizhi_false/peizhi_true/g' "QMXX_MSL/config"
                        break
                    };;
                esac
                #java -Xms1M -Xmx2M -jar mc.jar -nogui
                #拍扁文件内容命令 xargs < "QMXX_MSL/config" | tee "QMXX_MSL/config"
            done
            }
            fi
    moshi=$(cat "QMXX_MSL/config")
    if [[ $moshi =~ "chongqi" ]];then
        echo "已选择（自动重启模式）" && sleep 1s && clear
        cp -p QMXX_MSL/owo owo
        chmod 777 owo
./owo
        rm -r owo
        sleep 1s && clear
        echo "20秒后重启服务器"
            read -N 3 -t 10 -p"等待时间内可以输入'yes'来关闭自动重启并退出  " tuichu
            case $tuichu in
                [yY][eE][sS]|[yY] ) {
                echo "  检测到输入，退出自动重启" && sed -i 's/chongqi/danci/g' "QMXX_MSL/config"
                break
                };;
                * ) {
                sleep 10s && echo "  未检测到输入，执行自动重启"
                };;
            esac
        echo "  未检测到输入，执行自动重启"
    else 
        clear && echo "请输入(数字)选择模式"
        echo "1:自动重启模式" && echo "2:单次启动模式" && echo "3:配置文件" && echo "0:退出脚本"
        IP=`ifconfig | grep inet | grep -vE 'inet6|127.0.0.1' | awk -F ' ' '{print $2}'`
        echo "IP 地址："$IP
            read -N 1 shuru
            case "$shuru" in
                1 ) {
                    echo "已选择（自动重启模式）" && echo "正在配置文件"
                    sed -i 's/danci/chongqi/g' "QMXX_MSL/config" && clear && sleep 1s && echo "完成，重启脚本中"
                };;
                2 ) {
                    clear && echo "已选择（单次启动模式）" && echo "正在启动服务端" && sleep 2s
                    clear && sed -i 's/chongqi/danci/g' "QMXX_MSL/config"
                    cp -p QMXX_MSL/owo owo
                    chmod 777 owo
./owo
                    rm -r owo
                    break
                };;
                3 ) {
                    if [ -f "QMXX_MSL/owo" ];then
                    sed -i 's/peizhi_true/peizhi_false/g' "QMXX_MSL/config"
                    else
                    sed -i 's/peizhi_true/peizhi_false1/g' "QMXX_MSL/config"
                    fi
                    break
                };;
                0 ) {
                    clear && sed -i 's/chongqi/danci/g' "QMXX_MSL/config" && echo "退出脚本" && exit
                };;
                * ) echo "异常参数，请重新输入";;
            esac
    fi
done
else
    echo "未检测到文件，正在生成"
QMXX_MSL_wenjian=danci
cat <<QMXX_MSL_chuanru>"QMXX_MSL/config"
$QMXX_MSL_wenjian
QMXX_MSL_chuanru
echo "peizhi_false1" >> "QMXX_MSL/config" && sleep 1s
fi
done
