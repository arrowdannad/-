#!/bin/bash
# ██████╗ ███╗   ███╗██╗  ██╗██╗  ██╗
#██╔═══██╗████╗ ████║╚██╗██╔╝╚██╗██╔╝
#██║   ██║██╔████╔██║ ╚███╔╝  ╚███╔╝ 
#██║▄▄ ██║██║╚██╔╝██║ ██╔██╗  ██╔██╗ 
#╚██████╔╝██║ ╚═╝ ██║██╔╝ ██╗██╔╝ ██╗
# ╚══▀▀═╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
#QMXX Minecraft Server Launcher
clear && echo "[ Q-MSL ]" && sleep 0.3
version='1.1.8'
function ruanjianxinxi()
{
    clear
    echo '[ 关于 ]                                           | - < X |'
    Colortexto 6 0 1 "------------------------------------------------------------"
    echo '| 名称：QWQ Minecraft Server Launcher'
    echo "| 版本：$version"
    echo '| 作者：阡溟晓雪'
    echo '|  QQ ：2788581358'
    Colortexto 6 0 1 "------------------------------------------------------------"
    echo ' '
    echo '1：检查更新'
    echo ' '
    echo '0：退出关于'
    echo ' '
    Colortexto 6 0 1 "------------------------------------------------------------"
    read -N 1 -s a
    case $a in
    1 ) {
        sleep 0.5
        echo '无法连接至服务器'
        sleep 0.05
        read -N 1 -p '|->按任意键继续(不要按电源键啊喂！)' a
        ruanjianxinxi
    };;
    0 ) {
        echo '退出关于'
        sleep 0.5
        caidan_1=0
    };;
    * ) {
        ruanjianxinxi
    };;
    esac
}
############################################################################################################################
function Colortexto()
{
    if [ $# -ne 4  ];then
        echo "参数错误！"
    else
    {
        Fg="3""$1"
        Bg="4""$2"
        SetColor="\E[""$Fg;$Bg""m"
        Style="\033[""$3""m"
        Text="$4"
        EndStyle="\033[0m"
        echo -e "$SetColor""$Style""$Text""$EndStyle"
    }
    fi
}
############################################################################################################################
function Colortextn()
{
     if [ $# -ne 4  ];then
        echo "参数错误！"
    else
    {
        Fg="3""$1"
        Bg="4""$2"
        SetColor="\E[""$Fg;$Bg""m"
        Style="\033[""$3""m"
        Text="$4"
        EndStyle="\033[0m"
        echo -n -e "$SetColor""$Style""$Text""$EndStyle"
    }
    fi
}
############################################################################################################################
function build-folder_file() 
{
    echo '#!/bin/bash
    QMSL_path=`pwd`
    cd ~
    java_path_gen=`pwd`
    echo "开始查找java" > "${QMSL_path}/QMSL/search_java.temp.log"
    echo "#存储java路径" > "${QMSL_path}/QMSL/search_java.config"
    folder_bin=`find . -type d -name "bin"`
    if [[ "$folder_bin" =~ "bin" ]];then
    {
        echo "$folder_bin" > "${QMSL_path}/QMSL/search_java.temp.log"
        while true;do
        {
            testing_folder_java=`sed -n "1p" "${QMSL_path}/QMSL/search_java.temp.log"`
            if [[ $testing_folder_java == "" ]];then
            {
                echo "#列表搜索完成" >> "${QMSL_path}/QMSL/search_java.config"
                break
            }
            fi
            cd ~
            cd $testing_folder_java
            file_java=`find . -type f -name "java"`
            if [[ "$file_java" =~ "/java" ]];then
            {
                a=`echo "${testing_folder_java:1}"`
                echo ".${java_path_gen}${a}/java" >> "${QMSL_path}/QMSL/search_java.config"
            }
            fi
            sed -i "1d" "${QMSL_path}/QMSL/search_java.temp.log"
        }
        done
    }
    else
    {
        echo "#未找到java" >> "${QMSL_path}/QMSL/search_java.config"
    }
    fi
    cd ~
    cd $QMSL_path
    sed -i "s/.//" "QMSL/search_java.config"
    rm -rf QMSL/search_java.temp.log
    ' > "QMSL/folder_file.sh"
    chmod 777 QMSL/folder_file.sh
}
############################################################################################################################
function build-beifen_files() 
{
    if [ ! -d "QMSL/backups" ];then
        mkdir QMSL/backups
    fi
    if [ ! -f "QMSL/beifen.sh" ];then
    {
        echo '#!/bin/bash
        beifen=$(cat "QMSL/beifen.config")
        while [[ $beifen =~ "beifen=true" ]];do
        {
            beifen=$(cat "QMSL/beifen.config")
            shijian=`date "+%H:%M"`
            zdbf=$(cat "QMSL/beifen.config")
            if [[ $zdbf =~ $shijian ]];then
            {
                bf_bh=`sed -n "31,31p" "QMSL/beifen.config"`
                if [[ $bf_bh = bf_zt_false ]];then
                {
                    echo "[ Q-MSL ] 正在自动备份"
                    sed -i "31c bf_zt_true" "QMSL/beifen.config"
                    mkdir QMSL/backups/temp
                    bf_lj_sj=25
                    while true;do
                        if [[ $bf_lj_sj = 31 ]];then
                        {
                            wjm=`date "+%m-%d_%H-%M"`
                            tar -cf QMSL/backups/$wjm.tar QMSL/backups/temp/
                            rm -r QMSL/backups/temp
                            echo "[ Q-MSL ] 备份完成"
                            find QMSL/backups/ -mtime +7 -name "*"  -exec rm -rf {} \;
                            break
                        }
                        fi
                        bf_lj=`sed -n "${bf_lj_sj},${bf_lj_sj}p" "QMSL/beifen.config"`
                        if [[ $bf_lj = 未配置 ]];then
                            sleep 1s
                        else  
                            cp -rp $bf_lj QMSL/backups/temp/
                        fi
                        bf_lj_sj=$((bf_lj_sj+1))
                    done
                }
                fi
            }
            else sed -i "31c bf_zt_false" "QMSL/beifen.config"
            fi
            sleep 1s
        }
        done' > "QMSL/beifen.sh"
        chmod 777 "QMSL/beifen.sh"
    }
    fi
    if [[ ! -f "QMSL/beifen.config" ]];then
    {
        echo '自动备份配置文件' > "QMSL/beifen.config" && sed -i '1d' "QMSL/beifen.config" && a=1
        while [ $a -le 30 ];do
        {
            echo "未配置" >> "QMSL/beifen.config"
            ((a++))
        }
        done
        echo 'bf_zt_false' >> "QMSL/beifen.config"
        echo 'beifen=false' >> "QMSL/beifen.config"
    }
    fi
    beifen_peizhi
}
############################################################################################################################
function peizhi_jiance()
{
    if [ -f "QMSL/qidong.sh" ];then
        peizhi=$(cat "QMSL/qidong.sh")
        if [[ $peizhi =~ "未配置" ]];then
        {
            Colortexto 1 0 1 "存在未配置的项目, 是否进入配置页面？" && echo '输入[ yes ]进入' && echo '输入[ no ]取消启动'
            read queren
            case $queren in
                [yY][eE][sS] ) {
                    caidan_1=3
                    fanhui_qidong=0
                };;
                * ) {
                    Colortexto 7 0 1 '取消本次执行' && sleep 0.5
                    caidan_1=0
                    fanhui_qidong=0
                };;
            esac
        }
        else
            fanhui_qidong=1
        fi
    else
    {
        Colortexto 1 0 1 '未检测到配置文件！请重新配置' && sleep 0.5
        caidan_1=3
        fanhui_qidong=0
    }
    fi
}
############################################################################################################################
function xieyi()
{
    while true;do
        if [ -d QMSL ];then
        {
            yanzheng=`sed -n '3p' "QMSL/agreement"`
            if [[ $yanzheng =~ "true" ]];then
            {
                break
            }
            else
            {
                clear
                echo "协议：不得对本脚本进行改动" | tee "QMSL/agreement" && echo "本脚本由[ 阡溟晓雪 ]编写，未经许可，不得商用"
                echo "本脚本由[ 阡溟晓雪 ]编写，未经许可，不得商用" >> "QMSL/agreement" && Colortexto 6 0 1 "------------------------------------------------------------"
                echo "如果了解并同意本协议，请输入[ true ]并回车开始使用"
                echo "输入[ no ]并回车退出[Q-MSL]开服器" && Colortexto 6 0 1 "------------------------------------------------------------"
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
}
############################################################################################################################
function qidong_peizhi()
{
    if [ ! -f "QMSL/qidong.sh" ];then
    {
        echo '#!/bin/bash cd QMSL/minecraft 未配置 -Xms128M -Xmx未配置M -jar 未配置 -nogui' > "QMSL/qidong.sh"
        sed -i "s/bash /bash\n/g" "QMSL/qidong.sh" && sed -i "s/minecraft /minecraft\n/g" "QMSL/qidong.sh"
        chmod 777 "QMSL/qidong.sh"
    }
    fi
    if [[ ! -f "QMSL/folder_file.sh" ]];then
    build-folder_file
    fi
    ./QMSL/folder_file.sh &
    qidong_nc=`sed -n "3,3p" "QMSL/qidong.sh"`
    echo "$qidong_nc" > "QMSL/qidong_nc" && sed -i "s/ /\n/g" "QMSL/qidong_nc"
    clear && echo '[ 配置开服必要项目 ]' && sleep 0.15
    while true;do
        clear
        echo '[ 配置开服必要项目 ]                               | - < X |'
        Colortexto 6 0 1 "------------------------------------------------------------"
        peizhi_qidong_nc=`sed -n "1,1p" "QMSL/qidong_nc"`
        Colortexto 3 0 1 "[ 1:配置java路径 ]" && echo -e "当前java路径：\n$peizhi_qidong_nc" && echo ' '
        peizhi_qidong_nc=`sed -n "3,3p" "QMSL/qidong_nc"`
        echo -e -n "\E[""33;40""m""\033[""1""m""[ 2:配置内存大小 ]""\033[0m" && echo " 当前最大内存：$peizhi_qidong_nc" | tr -d '\-Xmx' && echo ' '
        peizhi_qidong_nc=`sed -n "5,5p" "QMSL/qidong_nc"`
        echo -e -n "\E[""33;40""m""\033[""1""m""[ 3:配置核心路径 ]""\033[0m" && echo " 当前核心名称：$peizhi_qidong_nc" && echo ' '
        Colortexto 3 0 1 "[ 0:保存并退出 ]" && echo " "
        Colortexto 6 0 1 "------------------------------------------------------------"
        read -N 1 peizhi_xx
        case $peizhi_xx in
            1 ) {
                clear
                echo '[ 配置java路径 ]                                   | - < X |'
                Colortexto 6 0 1 "------------------------------------------------------------"
                echo -n "请输入java的路径，或者选择其他选项" && Colortexto 1 0 1 "请再三确认路径正确性!"
                echo ' '
                echo "输入[ hj ]将使用环境路径，不知道不要选择此选项"
                echo "输入[ no ]将不配置路径，稍后自行配置"
                Colortexto 6 0 1 "------------------------------------------------------------"
                a=2
                Colortexto 5 0 1 "自动搜索java路径(可能不是正确的，请自行检查真假)"
                while true;do
                {
                    java_path=`sed -n "${a},${a}p" "QMSL/search_java.config"`
                    if [[ $java_path =~ '列表搜索完成' ]];then
                        break
                    fi
                    echo $java_path
                    if [[ $java_path =~ '未找到java' ]];then
                        break
                    fi
                    let a=a+1
                }
                done
                Colortexto 6 0 1 "------------------------------------------------------------"
                peizhi_qidong_nc=`sed -n "1,1p" "QMSL/qidong_nc"`
                echo -e -n "\E[""33;40""m""\033[""1""m""当前java路径：""\033[0m"
                echo -e "\E[""37;40""m""\033[""1""m""$peizhi_qidong_nc""\033[0m"
                Colortexto 6 0 1 "------------------------------------------------------------"
                read peizhi_lj
                case $peizhi_lj in
                    [hH][jJ] ) {
                        sed -i "1c java" "QMSL/qidong_nc"
                        echo "使用环境路径" && sleep 1s && clear
                    };;
                    [nN][oO] ) {
                        echo "不配置路径" && sleep 1s && clear
                    };;
                    * ) {
                        sed -i "1c $peizhi_lj" "QMSL/qidong_nc"
                        echo "使用自定义路径" && sleep 1s && clear
                    };;
                esac
            };;
            2 ) {
                clear
                echo '[ 配置最大内存 ]                                   | - < X |'
                Colortexto 6 0 1 "------------------------------------------------------------"
                echo "请输入最大内存，只能使用MB单位"
                echo ' '
                echo "换算提示：1G=1024MB"
                echo ' '
                Colortexto 6 0 1 "------------------------------------------------------------"
                echo "输入[ mr ]将自动配置大小，有概率开服失败。"
                echo ' '
                echo "输入[ no ]将不配置大小。"
                echo -e ' \n'
                Colortexto 6 0 1 "------------------------------------------------------------"
                read peizhi_nc
                case $peizhi_nc in
                    [mM][rR] ) {
                        mem_sys_free=`free | grep Mem | awk '{print $4}'`
                        nc=$[$mem_sys_free/1024]
                        if [ "$nc" -gt "1024" ];then
                            sed -i "3c -Xmx${nc}M" "QMSL/qidong_nc" && echo "使用自动配置内存" && sleep 0.5
                        else
                        {
                            echo "自动配置失败，内存过低，建议关闭不必要的软件后再尝试"
                            read -N -p "按任意键继续" a
                        }
                        fi
                    };;
                    [nN][oO] ) {
                        echo '不配置内存' && sleep 1s && clear
                    };;
                    * ) {
                        if [[ $peizhi_nc -gt '127' ]];then
                        {
                            sed -i '7d' "QMSL/qidong_nc"
                            sed -i "3c -Xmx${peizhi_nc}M" "QMSL/qidong_nc"
                            echo '使用自定义大小' && sleep 0.5
                        }
                        else 
                            echo '请输入有效的数字！' && read -N 1 -p '按任意键继续' -s a
                        fi
                    };;
                esac
            };;
            3 ) {
                clear
                echo '[ 配置核心路径 ]                                   | - < X |'
                Colortexto 6 0 1 "------------------------------------------------------------"
                echo "请输入核心的路径，或者选择其他选项"
                echo ' '
                echo '提示：开服的文件都在[QMSL/MC]文件夹下哦'
                echo ' '
                Colortexto 1 0 1 "请再三确认路径正确性!"
                echo ' '
                Colortexto 6 0 1 "------------------------------------------------------------"
                echo "输入[ no ]将不配置核心，稍后自行配置"
                echo -e ' \n'
                Colortexto 6 0 1 "------------------------------------------------------------"
                read peizhi_hx
                case $peizhi_hx in
                    [nN][oO] ) {
                        echo "不配置路径" && sleep 1s && clear
                    };;
                    * ) {
                        cp -r $peizhi_hx QMSL/minecraft/
                        echo "$peizhi_hx" > "QMSL/qidong_nc_hx"
                        sed -i "s/\//\n/g" "QMSL/qidong_nc_hx"
                        peizhi_hx=`sed -n '$p' "QMSL/qidong_nc_hx"`
                        sed -i "5c $peizhi_hx" "QMSL/qidong_nc"
                        rm -r QMSL/qidong_nc_hx
                        echo "使用自定义核心" && sleep 2s && clear
                    };;
                esac
            };;
            0 ) {
                peizhi=$(cat "QMSL/qidong_nc")
                if [[ $peizhi =~ "未配置" ]];then
                {
                    Colortexto 1 0 1 "存在未配置的项目, 是否退出？" && echo '输入[ yes ]退出' && echo '按任意键继续编辑'
                    read -N 3 queren
                    case $queren in
                        [yY][eE][sS] ) {
                            echo '正在保存'
                            xargs < "QMSL/qidong_nc" | tee -a "QMSL/qidong.sh"
                            sed -i '3,3d' "QMSL/qidong.sh"
                            rm -r QMSL/qidong_nc
                            echo '退出编辑' && sleep 0.5
                            caidan_1=0
                            break
                        };;
                        * ) {
                            echo '继续编辑' && sleep 0.5
                        };;
                    esac
                }
                else
                {
                    xargs < "QMSL/qidong_nc" | tee -a "QMSL/qidong.sh"
                    sed -i '3,3d' "QMSL/qidong.sh"
                    rm -r QMSL/qidong_nc
                    echo '退出编辑' && sleep 0.5
                    caidan_1=0
                    break
                }
                fi
            };;
            * ) clear;;
        esac
    done
}
############################################################################################################################
function beifen_peizhi()
{
    clear && echo '[ 配置自动备份 ]' && sleep 0.15
    while true;do
        config=`sed -n '32,32p' "QMSL/beifen.config"`
        clear
        echo '[ 配置自动备份 ]                                   | - < X |'
        Colortexto 6 0 1 "------------------------------------------------------------"
        echo "请选择配置目标"
        Colortexto 6 0 1 "------------------------------------------------------------"
        if [[ $config =~ "beifen=true" ]];then
            echo '1:自动备份<状态[开启]>'
        else
            echo '1:自动备份<状态[关闭]>'
        fi
        echo ' '
        echo "2:配置备份路径"
        echo ' '
        echo "3:配置备份时间"
        echo ' '
        echo "0:保存并退出"
        echo ' '
        Colortexto 6 0 1 "------------------------------------------------------------"
        read -N 1 -s beifen_xx
        case $beifen_xx in
            1 ) {
                if [ -f "QMSL/beifen.config" ];then
                {
                    if [[ $config =~ "beifen=true" ]];then
                    {
                        sed -i '32c beifen=false' "QMSL/beifen.config"
                    }
                    else
                    {
                        sed -i '32c beifen=true' "QMSL/beifen.config"
                        ./QMSL/beifen &
                    }
                    fi                        
                }
                else
                {
                    clear && echo '未检测到配置文件！即将重启自动备份模块' && read -N 1 -p '按任意键继续' -s a && break
                }
                fi
            };;
            2 ) {
                if [[ $config =~ "beifen=true" ]];then
                    echo '未关闭自动备份，无法设置' && sleep 2s
                else
                {
                    while true;do
                    {
                        clear
                        bflj=`sed -n '25,30p' "QMSL/beifen.config"`
                        echo '[ 配置备份路径 ]                                   | - < X |'
                        Colortexto 6 0 1 "------------------------------------------------------------"
                        echo '[a/d]+[1~6]:增加/删除  路径 []+[]指每个框的内容都需要选择'
                        Colortextn 4 0 1 '7:快速设置备份存档(占用1~3行路径)  '  
                        Colortexto 5 0 1 '  0:保存并退出路径设置'
                        Colortexto 6 0 1 "------------------------------------------------------------"
                        echo '当前路径情况' && echo "$bflj"
                        Colortexto 6 0 1 "------------------------------------------------------------"
                        read -s bf_lj
                        case $bf_lj in
                            [aA][1-6] ) {
                                bf_lj_1=`echo "$bf_lj" | tr -d '[a-zA-Z]'`
                                read -p "[编辑第${bf_lj_1}行路径]" bf_lj_2
                                bf_lj_1=$((24+$bf_lj_1))
                                sed -i "${bf_lj_1}c $bf_lj_2" "QMSL/beifen.config"
                            };;
                            [dD][1-6] ) {
                                bf_lj_1=`echo "$bf_lj" | tr -d '[a-zA-Z]'`
                                echo "[删除第${bf_lj_1}行路径]" && sleep 0.5
                                bf_lj_1=$((24+$bf_lj_1))
                                sed -i "${bf_lj_1}c 未配置" "QMSL/beifen.config"
                            };;
                            7 ) {
                                sed -i '25c QMSL/minecraft/world' "QMSL/beifen.config"
                                sed -i '26c QMSL/minecraft/world_nether' "QMSL/beifen.config"
                                sed -i '27c QMSL/minecraft/world_the_end' "QMSL/beifen.config"
                                echo '设置备份存档' && sleep 0.5
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
                if [[ $config =~ "beifen=true" ]];then
                    echo '未关闭自动备份，无法设置' && sleep 2s
                else
                {
                    while true;do
                    {
                        clear
                        echo '[ 配置备份时间 ]<时间采用24时间格式>               | - < X |'
                        Colortexto 6 0 1 "------------------------------------------------------------"
                        Colortexto 7 0 1 '[a/d]+[1~24]:编辑/删除  []+[]指每个框的内容都需要选择'
                        Colortextn 4 0 1 '1:每小时备份一次  '  
                        Colortextn 5 0 1 '  2:删除所有时间点  '
                        Colortexto 4 0 1 '  0:保存并退出'
                        Colortexto 6 0 1 "------------------------------------------------------------"
                        echo '当前时间情况'
                        xunhuan_1=1 && xunhuan_2=1
                        while [[ $xunhuan_1 -le 24 ]];do
                        {
                            if [[ $xunhuan_2 -gt '4' ]];then
                                echo -e " "
                                xunhuan_2=1
                            fi
                            if [[ $xunhuan_1 -le '9' ]];then
                            echo -n ' '
                            fi
                            xunhuan_3=`sed -n "${xunhuan_1},${xunhuan_1}p" "QMSL/beifen.config"`
                            echo "$xunhuan_3" | xargs -I {} echo -n " ${xunhuan_1}：{} "
                            if [[ ! $xunhuan_3 =~ '未配置' ]];then
                                echo -n ' '
                            fi
                            echo -n "|"
                            let xunhuan_1++ xunhuan_2++
                        }
                        done
                        echo '' && Colortexto 6 0 1 "------------------------------------------------------------"
                        read -s bf_lj_sj
                        case $bf_lj_sj in
                            [aA][0-9]|[aA][0-9][0-9] ) {
                                bf_lj_sj_1=`echo "$bf_lj_sj" | tr -d '[a-zA-Z]'`
                                if [[ $bf_lj_sj_1 -le "24" ]];then
                                {
                                    while true;do
                                        clear && echo "[正在编辑第${bf_lj_sj_1}个时间]"
                                        echo '不论大小都是二位数字' && echo '例子：01'
                                        read -n 2 -p "请输入[ 小时 ](请勿输入无效数值)" bf_lj_sj_2
                                        if echo "$bf_lj_sj_2" | grep "[0-9][0-9]" >> "QMSL/beifen.config";then
                                            bf_lj_sj_4=`sed -n '33,33p' "QMSL/beifen.config" | grep -o -E "[1-9]+"`
                                            sed -i '33d' "QMSL/beifen.config"
                                            if [[ $bf_lj_sj_4 -le "23" ]];then
                                            {
                                                sed -i "${bf_lj_sj_1}c ${bf_lj_sj_2}:00" "QMSL/beifen.config"
                                                echo -e '\n时钟设置成功' && sleep 0.5 && break
                                            }
                                            else 
                                                echo -e "\n请输入有效的数字！" && read -N 1 -p '按任意键继续' -s a
                                            fi
                                        else echo -e "\n请输入有效的数字！" && read -N 1 -p '按任意键继续' -s a
                                        fi
                                    done
                                    while true;do
                                        clear && echo "[正在编辑第${bf_lj_sj_1}个时间]"
                                        echo '不论大小都是二位数字' && echo '例子：01'
                                        read -n 2 -p "请输入[ 分钟 ](请勿输入无效数值)" bf_lj_sj_3
                                        if echo "$bf_lj_sj_3" | grep "[0-9][0-9]" >> "QMSL/beifen.config";then
                                            bf_lj_sj_4=`sed -n '33,33p' "QMSL/beifen.config" | grep -o -E "[1-9]+"`
                                            sed -i '33d' "QMSL/beifen.config"
                                            if [[ $bf_lj_sj_4 -le "59" ]];then
                                            {
                                                sed -i "${bf_lj_sj_1}c ${bf_lj_sj_2}:${bf_lj_sj_3}" "QMSL/beifen.config"
                                                echo -e '\n分钟设置成功' && sleep 0.5 && break
                                            }
                                            else 
                                                echo -e "\n请输入有效的数字！" && read -N 1 -p '按任意键继续' -s a
                                            fi
                                        else echo -e "\n请输入有效的数字！" && read -N 1 -p '按任意键继续' -s a
                                        fi
                                    done
                                }
                                else echo '未输入有效数字' && sleep 0.5
                                fi
                            };;
                            [dD][0-9]|[dD][0-9][0-9] ) {
                                bf_lj_sj_1=`echo "$bf_lj_sj" | tr -d '[a-zA-Z]'`
                                if [[ $bf_lj_sj_1 -le "24" ]];then
                                {
                                    echo "[删除第${bf_lj_sj_1}个时间]" && sleep 0.5
                                    sed -i "${bf_lj_sj_1}c 未配置" "QMSL/beifen.config"
                                }
                                else echo '未输入有效数字' && sleep 0.5
                                fi
                            };;
                            1 ) {
                                a_1=1
                                while [ $a_1 -le 24 ];do
                                {
                                    if [[ $a_1 -le '9' ]];then
                                        sed -i "${a_1}c 0${a_1}:00" "QMSL/beifen.config"
                                    else
                                        sed -i "${a_1}c ${a_1}:00" "QMSL/beifen.config"
                                    fi
                                    let a_1++
                                }
                                done
                            };;
                            2 ) {
                                a_1=1
                                while [ $a_1 -le 24 ];do
                                {
                                    sed -i "${a_1}c 未配置" "QMSL/beifen.config"
                                    let a_1++
                                }
                                done
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
                caidan_1=0
                break
            };;
        esac
    done
}
############################################################################################################################
function yichangjiance()
{
    case $fanhuizhi in
        1 ) {
            Colortexto 7 0 1 "|->"
            Colortexto 1 0 1 "---------------------------------------"
            Colortexto 1 0 1 "error:${fanhuizhi}"
            Colortexto 7 0 1 "异常退出:请检查[ 配置开服脚本 ]"
            Colortexto 1 0 1 "---------------------------------------"
        };;
        130 ) {
            Colortexto 7 0 1 "|->"
            Colortexto 1 0 1 "---------------------------------------"
            Colortexto 1 0 1 "error:${fanhuizhi}"
            Colortexto 7 0 1 "异常退出:请检查mod、插件、核心等文件"
            Colortexto 1 0 1 "---------------------------------------"
        };;
        126 ) {
            Colortexto 7 0 1 "|->"
            Colortexto 1 0 1 "---------------------------------------"
            Colortexto 1 0 1 "error:${fanhuizhi}"
            Colortexto 7 0 1 "异常退出:请配置java执行权限"
            Colortexto 1 0 1 "---------------------------------------"
        };;
    esac
    read -N 1 -p '|->按任意键继续(不要按电源键啊喂！)' a
}
############################################################################################################################
function qidong_chongqi()
{
    js_congqi_1=0
    peizhi_jiance
    if [[ $fanhui_qidong = '1' ]];then
        clear
        ./QMSL/qidong.sh
        fanhuizhi=`echo $?`
        stty echo
        if [[ ${fanhuizhi} == 0 ]];then
        {
            dengdai_2=20
            Colortexto 7 0 1 "---------------------------------------"
            echo '输入[ stop ]退出自动重启模式'
            while [[ $dengdai_2 -gt 0 ]];do
            {
                sleep 1
                echo -n $'\e'7$'\r'"${dengdai_2}秒后重启服务器"$'\e'8
                let dengdai_2--
                if read -t0 ;then
                {
                    read js_congqi_1
                    if [[ $js_congqi_1 == "stop" ]];then
                        dengdai_2=0
                        fanhui_qidong=0
                        echo "检测到输入，退出自动重启" && sleep 0.3
                    fi
                }
                fi    
            }
            done
            if [[ $js_congqi_1 == "stop" ]];then
                caidan_1=0
            else
                echo "未检测到输入，即将自动重启" && sleep 0.3
                caidan_1=1
            fi
        }
        else
            yichangjiance
            caidan_1=0
        fi
    fi
}
############################################################################################################################
function qidong_danci()
{
    peizhi_jiance
    if [[ $fanhui_qidong -eq '1' ]];then
        clear
        ./QMSL/qidong.sh
        fanhuizhi=`echo $?`
        stty echo
        Colortexto 7 0 1 "---------------------------------------"
        yichangjiance
    fi
    caidan_1=0
}
############################################################################################################################
function kjzq()
{
    clear
    echo "[ 开机自启 ]"
    Colortexto 1 0 1 "警告：开机自启暂未完善，请自行配置开机启动！"
    sleep 0.05
    read -N 1 -p '|->按任意键继续(不要按电源键啊喂！)' a
    while true;do {
        clear
        config=`sed -n '3,3p' "QMSL/QMSL.config"`
        echo "[ 开机自启 ]                                       | - < X |"
        Colortexto 6 0 1 "------------------------------------------------------------"
        echo " "
        if [[ $config =~ "ziqidong=true" ]];then
            echo -n '1:开机自启<状态[开启]>' && Colortexto 1 0 1 "此功能无效！"
        else
            echo '1:开机自启<状态[关闭]>'
        fi
        echo " " && echo -n '2:启动软件后任务<当前'
        config=`sed -n '4,4p' "QMSL/QMSL.config"`
        if [[ $config =~ "zqdRenwu=cqms" ]];then
            echo '[重启模式]>'
        elif [[ $config =~ "zqdRenwu=dcms" ]];then
            echo '[单次模式]>'
        else
            echo '[不执行]>'
        fi
        echo " " && echo '0:退出开机自启'
        echo " "
        Colortexto 6 0 1 "------------------------------------------------------------"
        read -N 1 a
        case $a in
            1 ) {
                config=`sed -n '3,3p' "QMSL/QMSL.config"`
                if [[ $config =~ "ziqidong=true" ]];then
                    sed -i "3c ziqidong=false" "QMSL/QMSL.config"
                else
                    sed -i "3c ziqidong=true" "QMSL/QMSL.config"
                fi
            };;
            2 ) {
                config=`sed -n '4,4p' "QMSL/QMSL.config"`
                if [[ $config =~ "zqdRenwu=false" ]];then
                    sed -i "4c zqdRenwu=dcms" "QMSL/QMSL.config"
                elif [[ $config =~ "zqdRenwu=dcms" ]];then
                    sed -i "4c zqdRenwu=cqms" "QMSL/QMSL.config"
                elif [[ $config =~ "zqdRenwu=cqms" ]];then
                    sed -i "4c zqdRenwu=false" "QMSL/QMSL.config"
                fi
            };;
            0 ) {
                caidan_1=0
                break
            };;
            * ) {
                clear
            };;
        esac
    }
    done
}
############################################################################################################################
############################################################################################################################
xieyi
if [ ! -f "QMSL/QMSL.config" ];then
{
    echo 'QMSL配置文件' > "QMSL/QMSL.config"
    echo 'screen=false' >> "QMSL/QMSL.config"
    echo 'ziqidong=false' >> "QMSL/QMSL.config"
    echo 'zqdRenwu=false' >> "QMSL/QMSL.config"
    echo 'first_start' >> "QMSL/QMSL.config"
    echo "未检测到配置文件，正在生成" && sleep 0.5
}
fi
config=`sed -n '2,2p' "QMSL/QMSL.config"`
if [[ $config =~ 'screen=false' ]];then
{  
    screen -v > "QMSL/beifen"
    sed -i "s/ /\n/g" "QMSL/beifen"
    screen_1=`sed -n '3,3p' "QMSL/beifen"`
    if [[ $screen_1 =~ [0-9] ]];then
        sed -i "2c screen=${screen_1}" "QMSL/QMSL.config"
        echo '[ screen ]检测通过'
        sleep 0.5        
    else
    {
        clear && echo '未检测到必要组件，请自己安装软件[ screen ]'
        echo '或者无视此警告继续运行，导致的一些bug将不做处理'
        read -p '输入[ yes ]继续使用，或[ no ]退出' a
        case $a in
        [yY][eE][sS] ) {
            echo '继续使用[QMSL]'
            sed -i '2c screen=未知版本' "QMSL/QMSL.config"
            sleep 0.5
        };;
        * ) {
            clear
            echo '退出[Q-MSL]开服器'
            exit
        };;
        esac
    }
    fi
    rm -r QMSL/beifen
}
fi
config=`sed -n '5,5p' "QMSL/QMSL.config"`
if [[ $config =~ 'first_start' ]];then
    qidong_peizhi
    sed -i '5d' "QMSL/QMSL.config"
fi
caidan_1=0
fanhui_qidong=0
config=`sed -n '4,4p' "QMSL/QMSL.config"`
if [[ $config =~ "zqdRenwu=dcms" ]];then
    echo '正在执行开机自启任务...'
    sleep 0.05
    caidan_1=2
elif [[ $config =~ "zqdRenwu=cqms" ]];then
    echo '正在执行开机自启任务...'
    sleep 0.05
    caidan_1=1
fi
while true;do
{
    if [[ $caidan_1 =~ '1' ]];then
        echo "已选择（自动重启模式）" && echo "正在启动服务端" && sleep 0.5
        qidong_chongqi
    elif [[ $caidan_1 =~ '2' ]];then
        echo "已选择（单次启动模式）" && echo "正在启动服务端" && sleep 0.5
        qidong_danci
    elif [[ $caidan_1 =~ '3' ]];then
        qidong_peizhi
    elif [[ $caidan_1 =~ '4' ]];then
        if [[ -f "QMSL/beifen.sh" && -f "QMSL/beifen.config" ]];then
            beifen_peizhi
        else
            build-beifen_files
        fi
    elif [[ $caidan_1 =~ '5' ]];then
        kjzq
    elif [[ $caidan_1 =~ '6' ]];then
        ruanjianxinxi
    elif [[ $shuru =~ '0' ]];then
        clear && echo "退出[Q-MSL]开服器" && exit
    else
        clear && caidan_1=0
    fi
    if [[ $caidan_1 =~ '0' ]];then
    {
        clear
        echo "[ Q-MSL ]                                          | - < X |"
        Colortexto 6 0 1 "------------------------------------------------------------"
        echo " " && echo '1:自动重启模式  2:单次启动模式'
        echo " " && echo '3:配置开服脚本  4:配置自动备份  5:配置开机自启'
        echo " " && echo '6: 关于Q-MSL   0:退出Q-MSL'
        echo " "
        Colortexto 6 0 1 "------------------------------------------------------------"
        IP=`ip addr show | grep "inet " | awk '{ print $2}' | sed -n '2,2p'` && echo "本地 I  P："$IP
        shijian=`date '+%Y-%m-%d|%H:%M'` && echo '日期|时间：'$shijian
        Colortexto 6 0 1 "------------------------------------------------------------"
        read -N 1 -t 10 -s shuru
        caidan_1=$shuru
    }
    fi
}
done
