# noc-dotmanaged-blacklist
This is a script collection for Linux machines which would like to use the dotManaged Centralized IP-Blacklist where IP address reputation information is collected from various self-operated servers such as webservers, mailservers and general purpose servers.
Banning impacts (e.g. ports or whole IP addresses) and durations depend on how often incidents caused by an IP address are captured. You may select the degree of protection by choosing which components you'd like to install. This repository will be updated regularly whenever a new security measure is released.

## Install IP-Blacklist with IPTables support

This option requires IPTables on your machine. [Need help installing? Click here.](#iptables-instructions)
Download the noc-dotmanaged-bl-iptables.sh file in this repository for example via wget and place it in (`/usr/lib/noc-dotmanaged/`):

    mkdir /usr/lib/noc-dotmanaged/
    wget https://raw.githubusercontent.com/chmaeuer/noc-dotmanaged-blacklist/master/noc-dotmanaged-bl-iptables.sh -O /usr/lib/noc-dotmanaged/noc-dotmanaged-bl-iptables.sh
    chmod +x /usr/lib/noc-dotmanaged/noc-dotmanaged-bl-iptables.sh

It's recommended to run the script regularly, for example via a Cronjob. You may configure it to run every minute as follows:

    * * * * * root /usr/lib/noc-dotmanaged/noc-dotmanaged-bl-iptables.sh
    
or

    * * * * * sudo /usr/lib/noc-dotmanaged/noc-dotmanaged-bl-iptables.sh
    
Need help with Cronjobs? [Have a look at the instructions here.](#cronjob-instructions)
    
## IPTables Instructions

IPTables is a handy firewall tool for most Linux distributions. If not yet installed, please use this command to do it (Debian and Ubuntu):

    apt install iptables

## Cronjob Instructions

In order to successfully run the scripts in this repository, you'll need root privileges or at least a sudoer user.
An easy way to edit the Cronjob configuration is to execute the following command as either the root or sudoer user because the command will always be executed in the name of the user who added the job to the configuration:

    crontab -e
    
If this command fails, the most likely reason is that you haven't got Cron installed. In Debian and Ubuntu, this command should do the trick:

    apt install cron
