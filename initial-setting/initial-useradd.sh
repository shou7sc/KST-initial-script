#/bin/bash

if [ "`id | grep root`" = "" ]
then
    echo "root de execute sitene!"
    exit 1
fi

if [ "`dpkg -l |grep expect`" = "" ]
then
    echo "expect install sitene!"
    echo "#------------------------------------------------------------------------"
    echo " apt-get -y install expect                                               "
    echo "#------------------------------------------------------------------------"
    exit 1
fi

user1="stakamura"
PW1="stakamura"
user2="skaneko"
PW2="skaneko"
user3="kanon"
PW3="kanon"

############
# user1
############

expect -c "
set timeout 5
spawn adduser ${user1}
expect \"Enter new UNIX password:\"
send -- \"${PW1}\n\"
expect \"Retype new UNIX password:\"
send -- \"${PW1}\n\"
expect \"Full Name []:\"
send -- \"\n\"
expect \"Room Number []:\"
send -- \"\n\"
expect \"Work Phone []:\"
send -- \"\n\"
expect \"Home Phone []:\"
send -- \"\n\"
expect \"Other []:\"
send -- \"\n\"
expect \"Is the information correct?\"
send -- \"Y\n\"
expect \"$\"
exit 0
"
gpasswd -a "$user1" sudo

if [ $? = 0 ];then
    echo "#------------------------------------------------------------------------"
    echo " 正常に $user1 ユーザ追加が完了しました\n"
    echo "#------------------------------------------------------------------------"
else
    echo "#------------------------------------------------------------------------"
    echo " $user1 ユーザの追加が未完了です。再度実行してください"
    echo "#------------------------------------------------------------------------"
fi

cd /home/$user1/ &&
mkdir .ssh ; sleep 1s &&
chmod 700 .ssh ; sleep 1s &&
    echo "#------------------------------------------------------------------------" &&
    echo " ".ssh"ファイルが permission 700 own $user1:$user1 であること確認する " &&
    echo "#------------------------------------------------------------------------" &&
ls -al .ssh &&
cd .ssh &&
echo -e 'Host git-<リポジトリ名>\n    HostName github.com\n    IdentityFile ~/.ssh/secret-key\n    User git' > config &&
chmod 600 config ; sleep 1s &&
    echo "#------------------------------------------------------------------------" &&
    echo " "config"ファイルが permission 600 own $user1:$user1 であること確認する " &&
    echo "#------------------------------------------------------------------------" &&
ls -al config

###########
# user2
############


expect -c "
set timeout 5
spawn adduser ${user2}
expect \"Enter new UNIX password:\"
send -- \"${PW2}\n\"
expect \"Retype new UNIX password:\"
send -- \"${PW2}\n\"
expect \"Full Name []:\"
send -- \"\n\"
expect \"Room Number []:\"
send -- \"\n\"
expect \"Work Phone []:\"
send -- \"\n\"
expect \"Home Phone []:\"
send -- \"\n\"
expect \"Other []:\"
send -- \"\n\"
expect \"Is the information correct?\"
send -- \"Y\n\"
expect \"$\"
exit 0
"

gpasswd -a "$user2" sudo

if [ $? = 0 ];then
    echo "#------------------------------------------------------------------------"
    echo " 正常に $user2 ユーザ追加が完了しました"
    echo "#------------------------------------------------------------------------"
else
    echo "#------------------------------------------------------------------------"
    echo " $user2 ユーザの追加が未完了です。再度実行してください\n"
    echo "#------------------------------------------------------------------------"
fi

cd /home/$user2/ &&
mkdir .ssh ; sleep 1s &&
chmod 700 .ssh ; sleep 1s &&
echo "#------------------------------------------------------------------------" &&
echo " ".ssh"ファイルが permission 700 own $user2:$user2 であること確認する " &&
echo "#------------------------------------------------------------------------" &&
ls -al .ssh &&
cd .ssh &&
echo -e 'Host git-<リポジトリ名>\n    HostName github.com\n    IdentityFile ~/.ssh/secret-key\n    User git' > config &&
chmod 600 config ; sleep 1s &&
echo "#------------------------------------------------------------------------\n" &&
echo " "config"ファイルが permission 600 own $user2:$user2 であること確認する \n" &&
echo "#------------------------------------------------------------------------\n" &&
ls -al config

###########
# user3
############

expect -c "
set timeout 5
spawn adduser ${user3}
expect \"Enter new UNIX password:\"
send -- \"${PW3}\n\"
expect \"Retype new UNIX password:\"
send -- \"${PW3}\n\"
expect \"Full Name []:\"
send -- \"\n\"
expect \"Room Number []:\"
send -- \"\n\"
expect \"Work Phone []:\"
send -- \"\n\"
expect \"Home Phone []:\"
send -- \"\n\"
expect \"Other []:\"
send -- \"\n\"
expect \"Is the information correct?\"
send -- \"Y\n\"
expect \"$\"
exit 0
"
gpasswd -a "$user3" sudo

if [ $? = 0 ];then
    echo "#------------------------------------------------------------------------"
    echo " 正常に $user3 ユーザ追加が完了しました"
    echo "#------------------------------------------------------------------------"
else
    echo "#------------------------------------------------------------------------"
    echo " $user3 ユーザの追加が未完了です。再度実行してください"
    echo "#------------------------------------------------------------------------"
fi

cd /home/$user3/ &&
mkdir .ssh ; sleep 1s &&
chmod 700 .ssh ; sleep 1s &&
    echo "#------------------------------------------------------------------------" &&
    echo " ".ssh"ファイルが permission 700 own $user3:$user3 であること確認する " &&
    echo "#------------------------------------------------------------------------" &&
ls -al .ssh &&
cd .ssh &&
echo -e 'Host git-<リポジトリ名>\n    HostName github.com\n    IdentityFile ~/.ssh/secret-key\n    User git' > config &&
chmod 600 config ; sleep 1s &&
    echo "#------------------------------------------------------------------------" &&
    echo " "config"ファイルが permission 600 own $user3:$user3 であること確認する " &&
    echo "#------------------------------------------------------------------------" &&
ls -al config
