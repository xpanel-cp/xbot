<p align="center">
<picture>
<img width="160" height="160"  alt="XBot" src="https://raw.githubusercontent.com/xpanel-cp/xbot/main/xlogo.png">
</picture>
  </p> 
<h1 align="center"/>XBot</h1>
<h6 align="center">XPanel Shopping Telegram Bot<h6>
<p align="center">
<a href="https://t.me/Xpanelssh" target="_blank">
<img alt="Telegram Channel" src="https://img.shields.io/endpoint?label=Channel&style=flat-square&url=https%3A%2F%2Ftg.sumanjay.workers.dev%2FXpanelssh&color=blue">
</a>
</p>
 
<p align="center">
	<a href="./README-EN.md">
	English
	</a>
	/
	<a href="./README.md">
	Persian (فارسی)
	</a>
</p>


### Table of Contents
- [Introduction](#introduction)<br>
- [Features](#features)<br>
- [License](#license)<br>
- [Installation](#installation) <br>
  - [Enabling SSL](#enabling-ssl)<br>
 
## Introduction <br>
The XPanel Shopping Robot, known as XBot, provides users of XPanel with a Telegram bot for managing subscription sales. This panel is for commercial use and is provided with a license. <br>

<b><a href="https://t.me/xpanel_bot" target="_blank">Obtain License</a></b>

## Features <br>
:green_circle: Connect to XPanel (SSH direct, SSH dropbear, SSH tls, SSH websocket) <br>
:green_circle: Connect to Sanaei (Vmess, Vless, Trojan, Shadowsocks) <br>
:green_circle: Display and list users who have executed the bot <br>
:green_circle: Enable/Disable user access <br>
:green_circle: List all completed sales <br>
:green_circle: Ability to define an infinite number of servers <br>
:green_circle: Ability to define capacity for each server <br>
:green_circle: Ability to define an infinite number of packages <br>
:green_circle: List all transactions that have taken place <br>
:green_circle: Wallet <br>
:green_circle: Send a public message to all users <br>
:green_circle: Define and set text for different sections of the bot <br>
:green_circle: Provide a test account (optional) <br>
:green_circle: Mandatory entry of mobile number (optional) <br>
:green_circle: Activate the connection guide for different platforms (Android, iOS, Linux, Windows) <br>
:green_circle: Display connection ports (optional) <br>
:green_circle: Extend subscription (optional) <br>
:green_circle: Do not display servers that have reached capacity in the sales category (optional) <br>
:green_circle: Delete expired accounts after 4 days (optional) <br>
:green_circle: Activate digital currency payment gateway <a href="https://plisio.net/account/signup?ref=28752" target="_blank">(plisio.net)</a> (optional) <br>
:green_circle: Activate card-to-card transfers (optional) <br>
:green_circle: Activate USD to Toman currency conversion (optional) <br>
:green_circle: Ability to take backups <br>
:green_circle: Change the admin panel login path <br>
:green_circle: Support for Persian and English languages in the panel and bot <br>
:green_circle: Activate day/night mode <br>
:green_circle: Notify the admin of card-to-card transaction confirmation <br>
:green_circle: Notify the user of card-to-card transaction approval <br>
:green_circle: Ability to choose a custom username for subscription <br>
:green_circle: Mandatory membership in a channel <br>
:green_circle: Ability for users to add manual configurations (xpanel) <br>
:green_circle: Agency with a percentage discount <br>
:green_circle: Set the bot menu from the panel <br>
:green_circle: Backup every 12 hours from xpanel servers <br>
:green_circle: Connection QR Code for SSH, V2Ray subscriptions<br>

https://github.com/xpanel-cp/XPanel-SSH-User-Management <br>
https://github.com/MHSanaei/3x-ui <br>

## Telegram Channel:
https://t.me/Xpanelssh

## License
The panel is provided for commercial use, and the license is issued on the domain. Changing the domain is also possible through the XBot Telegram bot.

# Installation
To install, simply enter the following command:<br>

```
bash <(curl -Ls https://raw.githubusercontent.com/xpanel-cp/xbot/main/install.sh --ipv4)
```
<br>

**Setting up a Telegram webhook:** <br>
https://api.telegram.org/bot{token}/setWebhook?url=https://sub.domain.com/api/bot
<br>
{token}: Your bot's token<br>
sub.domain.com: The domain or subdomain you have configured in your panel<br><br>

**Required Operating System**

Ubuntu 18+ (Recommended: Ubuntu 20)<br>
Please note that you should upgrade server resources according to the number of users using the bot.

## Enabling SSL
To enable SSL on the domain, use popular CDNs such as Cloudflare and select the "flexible" option in the SSL/TLS settings.

<br>
<picture>
<img alt="XBot" src="https://github.com/xpanel-cp/xbot/blob/main/xbot.jpg">
</picture>
