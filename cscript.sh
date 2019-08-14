#!/bin/bash
#title           :cscript.sh
#description     :This script will make a script and  header for it.
#author          :a.jaberansari
#date            :2019-08-13
#version         :1.0.0
#usage           :bash cscript.sh
#notes           :Install and run the ./instalation.sh
#bash_version    :4.2.46(2)-release
#==============================================================================
echo -e "which \e[31mtype of \e[4mscript\e[0m do you want to create?\n"
echo -e  "1-\e[32mbash\e[0m 2-\e[90mpython\e[0m 3-\e[34mperl\e[0m 4-\e[35mawk\e[0m 5-\e[36msed\e[0m 6-\e[97mother\e[0m" 
read Type
defult_path=~/script
echo -e "The \e[91mDefult\e[0m path for save is $defult_path Do you agree?y||n\n"
read OR;
if [ $OR == "n" ];then 
   echo -e "Enter the \e[101mnew\e[0m absolute\e[0m path="
   read defult_path
   test -d $defult_path || mkdir -p $defult_path
else
   test -d $defult_path || mkdir -p $defult_path 
fi
read -p "Enter the description for this script=
" description ;
read  -p "Enter the Version of this script=" Version
if [ $Type -eq 1 ];then
   Type_script="sh"
   usage="bash"
elif [ $Type -eq 2 ];then
    Type_script="py"
    usage="python"
elif [ $Type -eq 3 ];then
    Type_script="pl"
    usage="perl"
elif [ $Type -eq 4 ];then
     Type_script="awk"
     usage="awk"
elif [ $Type -eq 5 ];then
     Type_script="sed"
     usage="sed"
fi
if [ $Type -eq 6 ];then 
    read -p "Enter the type of script=" Type_script
    echo -e "Enter the name of the script \e[31mwhitout\e[0m .$Type_script="
    read Name
    read -p "Enter how to use this script=" usage
else 
    
    echo -e  "Enter the name of the script \e[31mwhitout\e[0m .$Type_script="
    read Name
fi

description="`#!whereis $usage |awk  '{print $2}'`
#title           :$Name.$Type_script
#description     :$description
#author          :$USER
#date            :`date  +%Y-%m-%d`
#version         :$Version
#usage           :$usage $Name.$Type_script 
#bash_version    :${BASH_VERSION}
#=============================================================================="


echo "$description" >$defult_path/$Name.$Type_script
chmod +x $defult_path/$Name.$Type_script 
vim $defult_path/$Name.$Type_script
