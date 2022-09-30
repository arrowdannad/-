#!/bin/bash
# ██████╗ ███╗   ███╗██╗  ██╗██╗  ██╗
#██╔═══██╗████╗ ████║╚██╗██╔╝╚██╗██╔╝
#██║   ██║██╔████╔██║ ╚███╔╝  ╚███╔╝ 
#██║▄▄ ██║██║╚██╔╝██║ ██╔██╗  ██╔██╗ 
#╚██████╔╝██║ ╚═╝ ██║██╔╝ ██╗██╔╝ ██╗
# ╚══▀▀═╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
clear && echo "[ Q-MSL ]" && sleep 1s
while true;do
    if [ -d QMSL ];then
    {
        yanzheng=$(cat "QMSL/agreement")
        if [[ $yanzheng =~ "true" ]];then
        {
            break
        }
        else
        {
            clear
            echo "协议：不得对本脚本再次改动或创作" | tee "QMSL/agreement" && echo "本脚本由[ 阡溟晓雪 ]编写，未经许可，不得商用"
            echo "本脚本由[ 阡溟晓雪 ]编写，未经许可，不得商用" >> "QMSL/agreement" && echo "--------------------"
            echo "如果了解并同意本协议，请输入[ true ]并回车开始使用" && echo '提示:所有参数输入完成后都需要按回车键继续'
            echo "输入[ no ]可以退出[Q-MSL]开服器" && echo "--------------------"
            read xieyi
            case $xieyi in
                [tT][rR][uU][eE] ) {
                    echo "agreement=$xieyi" >> "QMSL/agreement" && clear && echo "您已同意协议，正在加载脚本"
                    break
                };;
                [nN][oO] ) {
                    clear
                    echo "您未同意协议，退出[Q-MSL]开服器" && rm -rf QMSL && exit
                };;
                * ) {
                    echo "参数错误，输入'no'可以退出[Q-MSL]开服器" && sleep 2
                };;
            esac
        }
        fi
    }    
    else mkdir -p QMSL/minecraft
    fi
done
while true;do
    if [ -f "QMSL/config" ];then
    config=$(cat "QMSL/config")
    if [[ $config =~ 'screen=false' ]];then
    {
        screen -v > "QMSL/beifen"
        sed -i "s/ /\n/g" "QMSL/beifen" && sed -n '3P' "QMSL/beifen" |tee "QMSL/neicun1"
        sed -i "s/\./\n/g" "QMSL/neicun1" && sed '2,$d' "QMSL/neicun1" > "QMSL/beifen"
        bianliang1=$(cat "QMSL/beifen")
        xargs < "QMSL/neicun1" > "QMSL/beifen" && sed -i "s/ /\./g" "QMSL/beifen"
        rm -r "QMSL/neicun1"
        zujian_jiance=$(cat "QMSL/beifen") && sed -i "2c screen=$zujian_jiance" "QMSL/config"
        rm -r "QMSL/beifen"
        case $bianliang1 in
            [0-9] ) {
                clear && echo '[ screen ]检测通过' && sleep 1s
            };;
            * ) {
                clear && echo '未检测到必要组件，请自己安装软件[ screen ]' && echo '没有screen将会使脚本无法在ssh下运行' && read -N 1 -p '按任意键继续'
                sed -i '2c screen=false' "QMSL/config"
                clear && echo '退出[Q-MSL]开服器' && exit
            };;
        esac
    }
    fi
    while true;do
        config=$(cat "QMSL/config")
        if [[ $config =~ "qidong_false1" ]];then
            echo '#!/bin/bash cd QMSL/minecraft jvav -Xmserror1M -Xmxerror2M -jar .jar -nogui' > "QMSL/qidong"
            sed -i "s/bash /bash\n/g" "QMSL/qidong" && sed -i "s/minecraft /minecraft\n/g" "QMSL/qidong"
            chmod 777 "QMSL/qidong"
            sed -i 's/qidong_false1/qidong_false/g' "QMSL/config"
        fi
        if [[ $config =~ "qidong_false" ]];then
        {
            while true;do
            clear && echo "请选择配置目标"
            echo "--------------------"
            echo "1:配置java路径" && echo "2:配置内存大小" && echo "3:配置核心路径" && echo "4:检查配置未配置项目" && echo "0:保存并退出"
            echo "--------------------"
            read -N 1 peizhi_xx
            case $peizhi_xx in
            1 ) {
                qidong_nc=`sed -n "3,3p" "QMSL/qidong"`
                echo "$qidong_nc" > "QMSL/qidong_nc" && sed -i "s/ /\n/g" "QMSL/qidong_nc"
                clear && echo "请输入java的路径，或者选择其他选项" 
                echo "--------------------"
                echo "输入（hj）将使用环境路径，不知道不要选择此选项" && echo "输入（no）将不配置路径，稍后自行配置"
                echo "--------------------"
                read peizhi_lj
                case $peizhi_lj in
                    [hH][jJ] ) {
                        sed -i "1c java" "QMSL/qidong_nc"
                        echo "使用环境路径" && sleep 2s && clear
                    };;
                    [nN][oO] ) {
                        sed -i "1c jvav" "QMSL/qidong_nc"
                        echo "不配置路径" && sleep 2s && clear
                    };;
                    * ) {
                        sed -i "1c $peizhi_lj" "QMSL/qidong_nc"
                        echo "使用自定义路径" && sleep 2s && clear
                    };;
                esac
                xargs < "QMSL/qidong_nc" | tee -a "QMSL/qidong"
                sed -i '3,3d' "QMSL/qidong"
                rm -r QMSL/qidong_nc
            };;
            2 ) {
                qidong_nc=`sed -n "3,3p" "QMSL/qidong"`
                echo "$qidong_nc" > "QMSL/qidong_nc" && sed -i "s/ /\n/g" "QMSL/qidong_nc"
                clear && echo "请输入最小内存，默认MB为单位" && echo "1G=1024MB" && echo "输入（mr）将自动配置大小，有概率开服失败。"
                read peizhi_nc
                case $peizhi_nc in
                    [mM][rR] ) {
                        mem_sys_free=`free | grep Mem | awk '{print $4}'`
                        nc=$[$mem_sys_free/1024]
                        if [ "$nc" -gt "1024" ];then
                            sed -i "2c -Xms1000M" "QMSL/qidong_nc" && echo "使用自动配置内存" && sleep 2s && clear
                        else echo "自动配置失败，内存过低，建议关闭不必要的软件后再尝试" && sleep 2s && clear
                        fi
                    };;
                    * ) {
                        sed -i "2c -Xms${peizhi_nc}M" "QMSL/qidong_nc"
                    };;
                    esac
                clear && echo "请输入最大内存，默认MB为单位" && echo "1G=1024MB" && echo "输入（mr）将自动配置大小，有概率开服失败。"
                read peizhi_nc
                case $peizhi_nc in
                    [mM][rR] ) {
                        mem_sys_free=`free | grep Mem | awk '{print $4}'`
                        nc=$[$mem_sys_free/1024]
                        if [ "$nc" -gt "1024" ];then
                            sed -i "3c -Xmx${nc}M" "QMSL/qidong_nc" && echo "使用自动配置内存" && sleep 2s && clear
                        else echo "自动配置失败，内存过低，建议关闭不必要的软件后再尝试" && sleep 2s && clear
                        fi
                    };;
                    * ) {
                        sed -i "3c -Xmx${peizhi_nc}M" "QMSL/qidong_nc"
                    };;
                esac
                xargs < "QMSL/qidong_nc" | tee -a "QMSL/qidong"
                sed -i '3,3d' "QMSL/qidong"
                rm -r QMSL/qidong_nc
            };;
            3 ) {
                qidong_nc=`sed -n "3,3p" "QMSL/qidong"`
                echo "$qidong_nc" > "QMSL/qidong_nc" && sed -i "s/ /\n/g" "QMSL/qidong_nc"
                clear && echo "请输入核心的路径，或者选择其他选项" && echo '提示：开服的文件都在[QMSL/MC]文件夹下哦'
                echo "输入（no）将不配置核心，稍后自行配置"
                read peizhi_hx
                case $peizhi_hx in
                    [nN][oO] ) {
                        sed -i "5c .jar" "QMSL/qidong_nc"
                        echo "不配置路径" && sleep 2s && clear
                    };;
                    * ) {
                        cp -r $peizhi_hx QMSL/minecraft/
                        echo "$peizhi_hx" > "QMSL/qidong_nc_hx"
                        sed -i "s/\//\n/g" "QMSL/qidong_nc_hx"
                        peizhi_hx=`sed -n '$p' "QMSL/qidong_nc_hx"`
                        sed -i "5c $peizhi_hx" "QMSL/qidong_nc"
                        echo "使用自定义核心" && sleep 2s && clear
                    };;
                esac
                xargs < "QMSL/qidong_nc" | tee -a "QMSL/qidong"
                sed -i '3,3d' "QMSL/qidong"
                rm -r QMSL/qidong_nc && rm -r QMSL/qidong_nc_hx
                };;
            4 ) {
                clear
                peizhi=$(cat "QMSL/qidong")
                if [[ $peizhi =~ "jvav" ]];then
                echo "未配置 java路径"
                fi
                peizhi=$(cat "QMSL/qidong")
                if [[ $peizhi =~ "error" ]];then
                echo "未配置 内存"
                fi
                peizhi=$(cat "QMSL/qidong")
                if [[ $peizhi =~ ' .jar' ]];then
                echo "未配置 核心路径"
                fi
                echo "检测完成,输入任意键继续" && read -N 1 && clear
            };;
            0 ) {
                sed -i 's/qidong_false/qidong_true/g' "QMSL/config"
                break
            };;
            * ) echo "异常参数，请重新输入" && sleep 1s;;
            esac
            done
        }
        fi
        if [[ $config =~ "beifen_peizhi_false1" ]];then
        {
            if [ -d "QMSL/backups" ];then
            echo 'beifen' > "QMSL/beifen"
            else mkdir QMSL/backups
            fi
            echo '#!/bin/bash
            beifen=$(cat "QMSL/config")
            while [[ $beifen =~ "beifen_true" ]];do
            {
                beifen=$(cat "QMSL/config")
                shijian=`date "+%H:%M"`
                zdbf=$(cat QMSL/bf_config)
                if [[ $zdbf =~ $shijian ]];then
                {
                    bf_bh=`sed -n "31,31p" "QMSL/bf_config"`
                    if [[ $bf_bh = bf_zt_false ]];then
                    {
                        echo "[ Q-MSL ] 正在自动备份"
                        sed -i "31c bf_zt_true" "QMSL/bf_config"
                        mkdir QMSL/backups/temp
                        bf_lj_sj=25
                        while true;do
                        if [[ $bf_lj_sj = 31 ]];then
                            {
                                tar -cf QMSL/backups/$wjm.tar QMSL/backups/temp/
                                rm -r QMSL/backups/temp
                                echo "[ Q-MSL ] 备份完成"
                                break
                            }
                            fi
                            bf_lj=`sed -n "${bf_lj_sj},${bf_lj_sj}p" "QMSL/bf_config"`
                            if [[ $bf_lj = bflj ]];then
                            sleep 1s
                            else
                            {
                                wjm=`date "+%m-%d_%H-%M"`
                                cp -rp $bf_lj QMSL/backups/temp/
                            }
                            fi
                            bf_lj_sj=$((bf_lj_sj+1))
                        done
                    }
                    fi
                }
                else sed -i "31c bf_zt_false" "QMSL/bf_config"
                fi
                sleep 1s
            }
            done' > "QMSL/beifen"
            chmod 777 "QMSL/beifen"
            if [[ -f "QMSL/bf_config" ]];then
                sleep 1s
            else
            {
                echo '00:00' > "QMSL/bf_config" && a=30
                while [ $a -ge 1 ];do
                {
                    echo '00:00' >> "QMSL/bf_config"
                    ((a--))
                }
                done
                sed -i '25,30s/00:00/bflj/' "QMSL/bf_config" && sed -i '31c bf_zt_false' "QMSL/bf_config"
            }
            fi
        }
        fi
        if [[ $config =~ "beifen_peizhi_false" ]];then
        {
            while true;do
            config=$(cat "QMSL/config")
            clear && echo "请选择配置目标"
            echo "--------------------"
            if [[ $config =~ "beifen_true" ]];then
            echo '1:[ (关闭/ ]自动备份'
            else
            echo '1:[ /开启) ]自动备份'
            fi
            echo "2:配置备份路径" && echo "3:配置备份时间" && echo "0:保存并退出"
            echo "--------------------"
            read -N 1 beifen_xx
            case $beifen_xx in
                1 ) {
                    if [ -f "QMSL/bf_config" ];then
                    {
                        if [[ $config =~ "beifen_true" ]];then
                        {
                            sed -i '5c beifen_false' "QMSL/config"
                            echo '关闭自动备份' && sleep 1s
                        }
                        else
                        {
                            sed -i '5c beifen_true' "QMSL/config"
                            ./QMSL/beifen &
                            echo '开启自动备份' && sleep 2s
                        }
                        fi                        
                    }
                    else
                    {
                        clear && echo '未设置备份时间或备份路径！开启自动备份失败！' && read -N 1 -p '输入任意键继续'
                    }
                    fi
                };;
                2 ) {
                    if [[ $config =~ "beifen_true" ]];then
                    echo '未关闭自动备份，无法设置' && sleep 2s
                    else
                    {
                        while true;do
                        {
                            clear && bflj=`sed -n '25,30p' "QMSL/bf_config"`
                            echo '请输入数字选择选项或者编辑路径' && echo '删除路径只需要把对应的改成[ bflj ]'
                            echo "--------------------"
                            echo '[1~6]:编辑路径(第几个的路径,最多6个路径)' && echo '7:快速设置备份存档(默认占用1~3行路径)' && echo '0:保存并退出路径设置'
                            echo "--------------------"
                            echo '当前路径情况' && echo "$bflj"
                            echo "--------------------"
                            read -N 1 bf_lj
                            case $bf_lj in
                            [1-6] ) {
                                read -p " [编辑第${bf_lj}行路径]" bf_lj_lj
                                bf_lj=$((24+$bf_lj))
                                sed -i "${bf_lj}c $bf_lj_lj" "QMSL/bf_config"
                            };;
                            7 ) {
                                sed -i '25c QMSL/minecraft/world' "QMSL/bf_config"
                                sed -i '26c QMSL/minecraft/world_nether' "QMSL/bf_config"
                                sed -i '27c QMSL/minecraft/world_the_end' "QMSL/bf_config"
                                echo '设置备份存档' && sleep 2s
                            };;
                            0 ) {
                                break
                            };;
                            esac
                        }
                        done
                    }
                    fi
                };;
                3 ) {
                    if [[ $config =~ "beifen_true" ]];then
                    echo '未关闭自动备份，无法设置' && sleep 2s
                    else
                    {
                        while true;do
                        {
                            clear && echo '请选择备份的时间' && echo '时间采用24时间格式'
                            echo "--------------------"
                            echo '[1~24]:编辑时间(第几个的时间,最多24个时间点)'
                            echo '0:保存并退出'
                            echo "--------------------"
                            echo '当前时间情况'
                            sed -n '1,24p' "QMSL/bf_config" |xargs -n 6
                            echo "--------------------"
                            read -N 1 bf_lj_sj
                            case $bf_lj_sj in
                            [1-24] ) {
                                read -p " [编辑第${bf_lj}行路径]" bf_lj_lj
                                sed -i "${bf_lj_sj}c $bf_lj_lj" "QMSL/bf_config"
                            };;
                            0 ) {
                                break
                            };;
                            esac
                        }
                        done
                    }
                    fi
                };;
                0 ) {
                    sed -i '4c beifen_peizhi_true' "QMSL/config"
                    break
                };;
            esac
            done
        }
        fi
    if [[ $config =~ "chongqi" ]];then
    {
        ./QMSL/qidong && rm -r "QMSL/minecraft/qidong"
        echo "20秒后重启服务器"
            read -N 4 -t 10 -p"等待时间内可以输入[ stop ]来关闭自动重启并退出  " tuichu
            case $tuichu in
                [sS][tT][oO][pP] ) {
                echo "  检测到输入，退出自动重启" && sed -i 's/chongqi/chushi/g' "QMSL/config" && stty echo
                break
                };;
                * ) {
                sleep 10s && echo "  未检测到输入，执行自动重启"
                };;
            esac
        echo "  未检测到输入，执行自动重启"
    }
    elif [[ $config =~ "danci" ]];then
    {
        ./QMSL/qidong && rm -r "QMSL/minecraft/qidong"
        sed -i 's/danci/chushi/g' "QMSL/config" && stty echo
        break
    }
    else
    { 
        clear && echo "欢迎使用我的世界linux版开服器" && echo "--------------------" && echo "请输入(数字)选择模式"
        echo "--------------------"
        echo "1:自动重启模式" && echo "2:单次启动模式" && echo "3:配置开服脚本" && echo '4:配置自动备份' && echo "0:退出[Q-MSL]开服器"
        IP=`ifconfig | grep inet | grep -vE 'inet6|127.0.0.1' | awk -F ' ' '{print $2}'`
        echo "--------------------" && echo "本地IP："$IP
        shijian=`date '+%Y-%m-%d|%H:%M:%S'` && echo '当前日期|时间：'$shijian
        read -N 1 -t 1 shuru
        case "$shuru" in
            1 ) {
                sed -i 's/chushi/chongqi/g' "QMSL/config"
                echo "已选择（自动重启模式）" && echo "正在启动服务端" && sleep 2s && clear
                break
            };;
            2 ) {
                sed -i 's/chushi/danci/g' "QMSL/config"
                clear && echo "已选择（单次启动模式）" && echo "正在启动服务端" && sleep 2s && clear
                break
            };;
            3 ) {
                if [ -f "QMSL/qidong" ];then
                    sed -i 's/qidong_true/qidong_false/g' "QMSL/config"
                else
                    sed -i 's/qidong_true/qidong_false1/g' "QMSL/config"
                fi
                break
            };;
            4 ) {
                if [ -f "QMSL/beifen" && -f "QMSL/bf_config" ];then
                    sed -i '4c beifen_peizhi_false' "QMSL/config"
                else
                    sed -i '4c beifen_peizhi_false1' "QMSL/config"
                fi
                break
            };;
            0 ) {
                if [ -f "QMSL/config" ];then
                    clear && sed -i '1c chushi' "QMSL/config" && sed -i '5c beifen_false' "QMSL/config" && echo "退出[Q-MSL]开服器" && exit
                else
                {
                    echo 'chushi' > "QMSL/config" && echo 'screen=false' >> "QMSL/config"
                    echo 'qidong_false1' >> "QMSL/config"
                    echo 'beifen_peizhi_no' >> "QMSL/config" && echo 'beifen_false' >> "QMSL/config"
                    clear && echo "退出[Q-MSL]开服器" && exit
                }
                fi
            };;
        esac
    }
    fi
done
else
{
echo 'chushi' > "QMSL/config" && echo 'screen=false' >> "QMSL/config"
echo 'qidong_false1' >> "QMSL/config"
echo 'beifen_peizhi_no' >> "QMSL/config" && echo 'beifen_false' >> "QMSL/config"
echo "未检测到配置文件，正在生成" && sleep 1s
}
fi
done