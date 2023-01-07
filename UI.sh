#!/bin/bash
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
function UI_zifu()
{
    lenght_changdu_ch=`echo "$UI_wj_dq" | awk '{print gensub(/[!-~]/,"","g",$O)}'`
    lenght_changdu_en=`echo "$UI_wj_dq" | awk '{print gensub(/[^!-~]/,"","g",$O)}'`
    lenght_changdu_1=${#lenght_changdu_ch}
    lenght_changdu_2=${#lenght_changdu_en}
    let lenght_changdu=lenght_changdu_1*2+lenght_changdu_2
}
############################################################################################################################
#UI_zhs=UI_主函数
function UI_zhs()
{
    #x=x轴,y=y轴
    #zd=最大
    UI_zd_x=60 && UI_zd_y=15
    #sj=实际
    UI_sj_x=0 && UI_sj_y=0
    #gb=光标
    UI_gb_x=0 && UI_gb_y=0

    #UI_API_zxh=UI_API_最小化 dy=调用 xz=选择
    UI_API_zxh_dy=1 && UI_API_zxh_xz=0
    #UI_API_fh=UI_API_返回 dy=调用 xz=选择
    UI_API_fh_dy=1 && UI_API_fh_xz=0
    #UI_API_tc=UI_API_退出 dy=调用 xz=选择
    UI_API_tc_dy=1 && UI_API_tc_xz=0

    #lenght_changdu=计算_长度
    lenght_changdu=0
    a=0
    while true;do
    {
        let a=a+1
        #UI_wj_dq=UI_文件_读取 
        UI_wj_dq=`sed -n '${a},${a}p' "QMSL/UI.config"`
        if [[ -z $UI_wj_dq ]];then
            echo -e -n "\E[""37;40""m""\033[""1""m""[ Q-MSL ]""\033[0m"
            lenght_changdu=40
        else
        {
            UI_zifu
            let lenght_changdu=49-lenght_changdu
            if [[ lenght_changdu -lt 0 ]];then
            {
                lenght_changdu_3=1
                while [[ $lenght_changdu_3 -gt 0 ]];do
                    lenght_changdu_3=${#UI_wj_dq}
                    let lenght_changdu_3=lenght_changdu_3-1
                    UI_wj_dq=`echo -e "${UI_wj_dq:0:$lenght_changdu_3}"`
                    UI_zifu
                    let lenght_changdu_4=49-lenght_changdu
                    if [[ ! lenght_changdu_4 -lt 0 ]];then
                        echo -e -n "\E[""37;40""m""\033[""1""m""${UI_wj_dq:0:$lenght_changdu}""\033[0m"
                        break
                    fi
                done
                lenght_changdu=$lenght_changdu_4
            }
            else
                echo -e -n "\E[""37;40""m""\033[""1""m""${UI_wj_dq}""\033[0m"
            fi
        }
        fi
        a=0
        while [[ $a -lt $lenght_changdu ]];do
        {
            echo -e -n "\E[""37;40""m""\033[""1""m"" ""\033[0m"
            let a=a+1
        }
        done
        read -s -N 1 UI_API_zxh_cs
        echo -e -n "\E[""37;40""m""\033[""1""m""|""\033[0m"
        if [[ $UI_API_zxh_dy -eq 1 ]];then
        {
            if [[ $UI_API_zxh_xz -eq 1 ]];then
                echo -e -n "\E[""37;40""m""\033[""7""m"" - ""\033[0m"
            else
                echo -e -n "\E[""37;40""m""\033[""1""m"" - ""\033[0m"
            fi
        }
        fi
        if [[ $UI_API_fh_dy -eq 1 ]];then
        {
            if [[ $UI_API_fh_xz -eq 1 ]];then
                echo -e -n "\E[""37;40""m""\033[""7""m"" < ""\033[0m"
            else
                echo -e -n "\E[""37;40""m""\033[""1""m"" < ""\033[0m"
            fi
        }
        fi
        if [[ $UI_API_tc_dy -eq 1 ]];then
        {
            if [[ $UI_API_tc_xz -eq 1 ]];then
                echo -e -n "\E[""37;40""m""\033[""7""m"" X ""\033[0m"
            else
                echo -e -n "\E[""37;40""m""\033[""1""m"" X ""\033[0m"
            fi
        }
        fi
        Colortexto 7 0 1 "|"
        Colortexto 6 0 1 "------------------------------------------------------------"
        while [[ $UI_Y -le 11 ]];do
        {
            read UI_wj_dq
            if [[ $UI_wj_dq == '分割' ]];then
                Colortexto 6 0 1 "------------------------------------------------------------"
            fi
            let UI_Y=UI_Y+1
        }
        done
        Colortexto 6 0 1 "------------------------------------------------------------"
        #UI_yh_sr=UI_用户_输入
        read -N 1 -s UI_yh_sr
    }
    done
}
UI_zhs