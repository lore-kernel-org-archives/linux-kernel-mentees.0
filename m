From: gregkh@linuxfoundation.org (Greg KH)
Date: Thu, 25 Jul 2019 08:01:27 +0200
Subject: [Linux-kernel-mentees] [SYZBOT REPORT] - KMSAN: uninit-value in
 friio_power_ctrl
In-Reply-To: <20190725044342.5cjwnf56y3avgdqo@rYz3n>
References: <20190725044342.5cjwnf56y3avgdqo@rYz3n>
Message-ID: <20190725060127.GA31256@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190725060127.i6gvbYvU-t6_OekCFajlP-95Z1es1AXzQ8Qi3lA-SYQ@z>

On Wed, Jul 24, 2019 at 11:43:43PM -0500, Jiunn Chang wrote:
> Hello,
> 
> This is an analysis of the following Syzbot report:
> 
> https://syzkaller.appspot.com/bug?id=cad92e4d55bb8904e263a7342259804a2b7797f6
> 
> I am able to reproduce this in KMSAN.  I compiled with clang 9.0.0 and used the
> syz program provided.
> 
> The syz program will open a specific dvb device:  0x7a69, 0x1, 0x1936
> 
> [  932.533552][ T8163] usb 1-1: New USB device found, idVendor=7a69, idProduct=0001, bcdDevice=19.36
> [  932.535827][ T8163] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [  932.540947][ T8163] usb 1-1: config 0 descriptor??
> [  932.589823][ T8163] usb 1-1: dvb_usb_v2: found a '774 Friio White ISDB-T USB2.0' in warm state
> 
> The code in question belongs to friio_reset() in drivers/media/usb/dvb-usb-v2/gl861.c:389.
> 
> There is nothing wrong with the logic of the code.  KMSAN is a code smell that
> is usually simple to fix.  In this case the read buffer, rbuf, looks to be the
> variable in question.  It just needs to be initialized before it is used.
> 
> Purposed fix:
> 
> If my analysis is correct, both wbuf and rbuf should be initialized to zero
> before they are used.
> 
> +	u8 wbuf[2] = {}, rbuf[2] = {};

Why would wbuf need to be set, it is properly initialized before using.

And rbuf should also not need to be set to anything as the call to
gl861_i2c_read_ex() properly sets it, if the call is successful.

If the call is not successful, the return value is correctly tested for
before accessing the data.

So I do not think any kernel driver code needs to be changed here.

thanks,

greg k-h
