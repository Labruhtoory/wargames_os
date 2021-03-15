#!/bin/bash

echo 'adding apt repo'
#repo
echo "" > /etc/apt/sources.list
apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6
echo '# Kali linux repositories | Added by Katoolin' >> /etc/apt/sources.list
echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
apt-get update
sudo apt install -fy python3 python3-pip golang nasm default-jdk

#programming language support
sudo python3 -m pip install --upgrade pip

echo 'moving to /opt'
#init
mkdir server
mkdir /ctf
mkdir /thm
mkdir /htb

#networking
echo "nameserver 1.1.1.1" > /etv/resolv.conf
echo "nameserver 1.0.0.1" >> /etv/resolv.conf

echo 'keep in mind the default answer is yes...'
read -p 'Full? y/n> ' full
if [ $(full) == 'n' ] 
then
  echo "OK, Please choose you packages (y/n)..."
  read -p 'Net?> ' net
  read -p 'Recon?> ' recon
  read -p 'Enum?> ' enum
  read -p 'revfor?> ' revfor
  read -p 'Xploit?> ' xploit
  read -p 'Post?> ' post
  read -p 'Anon?> ' anon
  if [ $(net) == 'n' ]
  then
  echo 'No net...'
  else
  sudo apt install -fy nmap masscan aircrack-ng wifite pixiewps bettercap clusterssh netdiscover reaver rtpflood
  fi
  if [ $(recon) == 'n' ]
  then
  echo 'No recon...'
  else
  sudo apt install -fy recon-ng aircrack-ng rtlsdr-scanner gqrx-sdr osrframework dnsrecon thc-ipv6 uniscan ffuf

  #unicorn
  git clone https://github.com/trustedsec/unicorn.git

  #urh
  git clone https://github.com/jopohl/urh.git

  #photon
  git clone https://github.com/s0md3v/Photon.git
  fi
  if [ $(enum) == 'n' ]
  then
  echo 'No enum...'
  else
  sudo apt install -fy nikto voiphopper zaproxy enum4linux dmitry dnstracer dirb dirbuster gobuster wpscan siparmyknife theharvester

  #linenum
  wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh
  mv LinEnum.sh /opt/server/linenum.sh

  #kerbrute
  wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
  mv kerbrute_linux_amd64 /usr/bin/kerbrute

  #linpeas
  git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git
  mkdir peas
  mv privilege-escalation-awesome-scripts-suite/* peas/
  rm -rf privilege-escalation-awesome-scripts-suite/
  cp peas/linPEAS/linpeas.sh /opt/server/
  cp peas/winPEAS/winPEASbat/winPEAS.bat /opt/server/

  #dirsearch
  git clone https://github.com/maurosoria/dirsearch.git
  fi
  if [ $(revfor) == 'n' ]
  then
  echo 'No revfor...'
  else
  sudo apt install -fy exiftool binwalk radare2 gdb arduino

  #rphp
  git clone https://github.com/pentestmonkey/php-reverse-shell.git 
  mv php-reverse-shell/php-reverse-shell.php /opt/server/rphp.php
  rm -rf php-reverse-shell

  #pspy
  wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
  wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
  mv pspy32 /opt/server/
  mv pspy64 /opt/server/

  #PSEmpire
  git clone https://github.com/EmpireProject/Empire.git
  fi
  if [ $(post) == 'n' ]
  then
  echo 'No post...'
  else
  sudo apt install -fy wordlists backdoor-factory crunch hash-identifier john johnny hashcat
  fi
  if [ $(anon) == 'n' ]
  then
  echo 'No anon...'
  else
  sudo apt install -fy openvpn tor
  fi
  if [ $(cus) == 'n' ]
  then
  echo 'No custom...'
  else
  sudo apt install -fy gnome-tweaks					

  #poor mans pentest
  git clone https://github.com/JohnHammond/poor-mans-pentest.git
  mkdir pmp
  mv poor-mans-pentest/* pmp/
  rm -rf poor-mans-pentest
  fi
else
  echo "OK, installing all packages"
  sudo apt install -fy python3 python3-pip golang openvpn exiftool nasm binwalk default-jdk radare2 gdb gqrx-sdr clusterssh neo4j tor nmap masscan exploitdb set nikto osrframework recon-ng netdiscover zaproxy enum4linux dmitry dnsrecon dnstracer theharvester thc-ipv6 reaver aircrack-ng rtlsdr-scanner gqrx-sdr wifite pixiewps dirb dirbuster gobuster wpscan wordlists sqlmap sqlninja uniscan websploit ffuf siparmyknife powersploit backdoor-factory bettercap beef-xss rtpflood crunch hash-identifier john johnny hashcat arduino
  
  #unicorn
  git clone https://github.com/trustedsec/unicorn.git

  #urh
  git clone https://github.com/jopohl/urh.git
    
  #linpeas
  git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git
  mkdir peas
  mv privilege-escalation-awesome-scripts-suite/* peas/
  rm -rf privilege-escalation-awesome-scripts-suite/
  cp peas/linPEAS/linpeas.sh /opt/server/
  cp peas/winPEAS/winPEASbat/winPEAS.bat /opt/server/
    
  #PSEmpire
  git clone https://github.com/EmpireProject/Empire.git

  #poor mans pentest
  git clone https://github.com/JohnHammond/poor-mans-pentest.git
  mkdir pmp
  mv poor-mans-pentest/* pmp/
  rm -rf poor-mans-pentest

  #dirsearch
  git clone https://github.com/maurosoria/dirsearch.git

  #photon
  git clone https://github.com/s0md3v/Photon.git
    
  #rphp
  git clone https://github.com/pentestmonkey/php-reverse-shell.git 
  mv php-reverse-shell/php-reverse-shell.php /opt/server/rphp.php
  rm -rf php-reverse-shell
    
  #pspy
  wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
  wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
  mv pspy32 /opt/server/
  mv pspy64 /opt/server/
    
  #linenum
  wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh
  mv LinEnum.sh /opt/server/linenum.sh

  #kerbrute
  wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
  mv kerbrute_linux_amd64 /usr/bin/kerbrute
fi

#wireless drivers
apt install -y build-essential libelf-dev linux-headers-`uname -r`
apt install -y realtek-rtl88xxau-dkms
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au/
make && make install
cd /opt/
    
#aliases
touch ~/.bash_aliases
echo "alias up='python3 -m http.server 8000'" >> ~/.bash_aliases
echo "alias room='bash /opt/wagames_os/notes/room-box_notes_start.sh'" >> ~/.bash_aliases
echo "alias dirsearch='python3 /opt/dirsearch/dirsearch.py'" >> ~/.bash_aliases
echo "alias ghidra='bash /opt/ghidra/ghidraRun'" >> ~/.bash_aliases
echo "alias photon='python3 /opt/Photon/photon.py'" >> ~/.bash_aliases
echo "alias bloodhound='cd /opt/bloodbound && ./Bloodhound && cd'" >> ~/.bash_aliases
echo "alias screenres='bash /opt/screenres.sh'" >> ~/.bash_aliases

chmod -R 777 /opt/
reboot now
