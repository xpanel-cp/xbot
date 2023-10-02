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
	فارسی
	</a>
</p>


### فهرست
- [معرفی](#معرفی)<br>
- [امکانات](#امکانات)<br>
- [لایسنس](#لایسنس)<br>
- [نصب](#نصب) <br>
  - [فعال سازی SSL](#فعال-سازی-ssl)<br>
 
## معرفی <br>
ربات فروشگاهی XPanel با اسم و نشان XBot به عزیزانی که از XPanel استفاده میکنند امکانی میدهد تا ربات تلگرامی مناسبی جهت فروش اشتراک ایجاد کنند.
این پنل استفاده تجاری دارد و با لایسنس ارائه می شود.

## امکانات <br>
:green_circle: نمایش و لیست کاربرانی که ربات را اجرا کرده اند <br>
:green_circle: فعال/غیرفعال سازی دسترسی کاربر<br>
:green_circle: لیست بندی کلیه فروش های انجام شده<br>
:green_circle: امکان تعریف بی نهایت سرور<br>
:green_circle: امکان تعریف ظرفیت برای هر سرور<br>
:green_circle: امکان تعریف بی نهایت پکیج<br>
:green_circle: لیست بندی کلیه تراکنش های صورت گرفته<br>
:green_circle: ارسال پیام عمومی به کلیه کاربران<br>
:green_circle: تعریف و تنظیم متن بخش های مختلف ربات<br>
:green_circle: ارائه اکانت تست (انتخابی)<br>
:green_circle: اجبار به وارد کردن شماره موبایل (انتخابی)<br>
:green_circle: قابلیت فعال سازی راهنمای بخش اتصال برای پلتفرم های مختلف (Android,Ios,Linux,Windows)<br>
:green_circle: نمایش پورت های اتصال (انتخابی)<br>
:green_circle: تمدید اشتراک (انتخابی)<br>
:green_circle: عدم نمایش سرورهای تکمیل ظرفیت شده در دسته بندی فروش (انتخابی)<br>
:green_circle: حذف اکانت های منقضی شده بعد از 4 روز (انتخابی)<br>
:green_circle: فعال سازی درگاه پرداخت ارز دیجیتال <a href="https://plisio.net/account/signup?ref=28752" target="_blank">(plisio.net)</a> (انتخابی)<br>
:green_circle: فعال سازی واریز کارت به کارت (انتخابی)<br>
:green_circle: فعال سازی تبدیل ارز USD  به تومان (انتخابی)<br>
:green_circle: امکان تهیه بکاپ<br>
:green_circle: تغییر مسیر ورود به پنل ادمین<br>
:green_circle: پشتیبانی از زبان فارسی و انگلیسی در پنل و ربات<br>
:green_circle: فعال سازی حالت روز/شب<br>


## Telegram Channel:
https://t.me/Xpanelssh

## لایسنس
پنل به صورت تجاری ارائه می شود و لایسنس روی دامنه صادر می شود امکان تغییر دامنه نیز فراهم می باشد (تهیه لایسنس و تغییر دامنه از طریق ربات تلگرامی XBot) <BR>
<b><a href="https://t.me/xpanel_bot" target="_blank">تهیه لایسنس</a></b>


# نصب
برای نصب کافیست دستور زیر را وارد کنید<br>

```
bash <(curl -Ls https://raw.githubusercontent.com/xpanel-cp/xbot/main/install.sh --ipv4)
```
<br>

**ست کردن وبهوک تلگرام:** 
<br>
https://api.telegram.org/bot{token}/setWebhook?url=https://sub.domain.com/api/bot <br>
{token}:همان توکن ربات شما <br>
sub.domain.com: دامنه یا ساب دامنه ای که روی پنل تنظیم کرده اید

**سیستم عامل مورد نیاز**

Ubuntu 18+ (پیشنهادی :Ubuntu 20)<br>
توجه داشته باشید منابع سرور متناسب با تعداد کاربرانی که از ربات استفاده میکنند باید ارتقاع دهید.

## فعال سازی SSL
جهت فعال سازی SSL روی دامنه از CDN های معروف مانند Cloudflare استفاده کنید و در بخش تنظیمات SSL/TLS گزینه flexible را انتخاب کنید.
<br>
<picture>
<img alt="XBot" src="https://github.com/xpanel-cp/xbot/blob/main/xbot.jpg">
</picture>
