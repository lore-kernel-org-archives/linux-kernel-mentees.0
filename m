Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B60FC0502C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Aug 2022 12:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD575405CB;
	Tue, 30 Aug 2022 12:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD575405CB
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gK/iqDo4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ouzcFnV95hg1; Tue, 30 Aug 2022 12:09:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BB2D9400D1;
	Tue, 30 Aug 2022 12:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB2D9400D1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91368C0033;
	Tue, 30 Aug 2022 12:09:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B10ECC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Aug 2022 12:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 843CB60F93
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Aug 2022 12:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 843CB60F93
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=gK/iqDo4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ERh3FSHZuGqH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Aug 2022 12:09:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F7D560F90
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F7D560F90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Aug 2022 12:09:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21A65B8162B;
 Tue, 30 Aug 2022 12:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AAEFC433C1;
 Tue, 30 Aug 2022 12:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661861353;
 bh=5SJoOLlqoi3wA7Tl35RDJpwiROFY/iHL4dfRvU6AjnM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gK/iqDo4C0Zmh3B/Nc+4CrNwNlp8phAoKQBEDV7U6eONb46Joz5lH14kH/W7okd4C
 z1/xe/VtSl+JhaXC5uMOa8EA3y0s3LfoUGzwklvFeUT74PRSuTWvBuLCnLJs608KOV
 rFmxIqtIm/n5DlS3PtzYHeWrVCeQrpFhCYQIdgOQ=
Date: Tue, 30 Aug 2022 14:09:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mazin Al Haddad <mazinalhaddad05@gmail.com>
Subject: Re: [PATCH] ar5523: check endpoints type and direction in probe()
Message-ID: <Yw395qJF+eDYaY4Z@kroah.com>
References: <20220823222436.514204-1-mazinalhaddad05@gmail.com>
 <YwW/cw2cXLEd5xFo@kroah.com>
 <CMGQTZ9XBSTJ.5QY7JQCNULBN@Arch-Desktop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CMGQTZ9XBSTJ.5QY7JQCNULBN@Arch-Desktop>
Cc: netdev@vger.kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com, pontus.fuchs@gmail.com,
 syzbot+1bc2c2afd44f820a669f@syzkaller.appspotmail.com, paskripkin@gmail.com,
 kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, Aug 27, 2022 at 01:36:29PM +0300, Mazin Al Haddad wrote:
> On Wed Aug 24, 2022 at 9:04 AM +03, Greg KH wrote:
> > On Wed, Aug 24, 2022 at 01:24:38AM +0300, Mazin Al Haddad wrote:
> > > Fixes a bug reported by syzbot, where a warning occurs in usb_submit_urb()
> > > due to the wrong endpoint type. There is no check for both the number
> > > of endpoints and the type which causes an error as the code tries to
> > > send a URB to the wrong endpoint.
> > > 
> > > Fix it by adding a check for the number of endpoints and the
> > > direction/type of the endpoints. If the endpoints do not match the 
> > > expected configuration -ENODEV is returned.
> > > 
> > > Syzkaller report:
> > > 
> > > usb 1-1: BOGUS urb xfer, pipe 3 != type 1
> > > WARNING: CPU: 1 PID: 71 at drivers/usb/core/urb.c:502 usb_submit_urb+0xed2/0x18a0 drivers/usb/core/urb.c:502
> > > Modules linked in:
> > > CPU: 1 PID: 71 Comm: kworker/1:2 Not tainted 5.19.0-rc7-syzkaller-00150-g32f02a211b0a #0
> > > Hardware name: Google Compute Engine/Google Compute Engine, BIOS Google 06/29/2022
> > > Workqueue: usb_hub_wq hub_event
> > > Call Trace:
> > >  <TASK>
> > >  ar5523_cmd+0x420/0x790 drivers/net/wireless/ath/ar5523/ar5523.c:275
> > >  ar5523_cmd_read drivers/net/wireless/ath/ar5523/ar5523.c:302 [inline]
> > >  ar5523_host_available drivers/net/wireless/ath/ar5523/ar5523.c:1376 [inline]
> > >  ar5523_probe+0xc66/0x1da0 drivers/net/wireless/ath/ar5523/ar5523.c:1655
> > > 
> > > 
> > > Link: https://syzkaller.appspot.com/bug?extid=1bc2c2afd44f820a669f
> > > Reported-and-tested-by: syzbot+1bc2c2afd44f820a669f@syzkaller.appspotmail.com
> > > Signed-off-by: Mazin Al Haddad <mazinalhaddad05@gmail.com>
> > > ---
> > >  drivers/net/wireless/ath/ar5523/ar5523.c | 31 ++++++++++++++++++++++++
> > >  1 file changed, 31 insertions(+)
> > > 
> > > diff --git a/drivers/net/wireless/ath/ar5523/ar5523.c b/drivers/net/wireless/ath/ar5523/ar5523.c
> > > index 6f937d2cc126..5451bf9ab9fb 100644
> > > --- a/drivers/net/wireless/ath/ar5523/ar5523.c
> > > +++ b/drivers/net/wireless/ath/ar5523/ar5523.c
> > > @@ -1581,8 +1581,39 @@ static int ar5523_probe(struct usb_interface *intf,
> > >  	struct usb_device *dev = interface_to_usbdev(intf);
> > >  	struct ieee80211_hw *hw;
> > >  	struct ar5523 *ar;
> > > +	struct usb_host_interface *host = intf->cur_altsetting;
> > >  	int error = -ENOMEM;
> > >  
> > > +	if (host->desc.bNumEndpoints != 4) {
> > > +		dev_err(&dev->dev, "Wrong number of endpoints\n");
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	for (int i = 0; i < host->desc.bNumEndpoints; ++i) {
> > > +		struct usb_endpoint_descriptor *ep = &host->endpoint[i].desc;
> > > +		// Check for type of endpoint and direction.
> > > +		switch (i) {
> > > +		case 0:
> > > +		case 1:
> > > +			if ((ep->bEndpointAddress & USB_DIR_OUT) &&
> > > +			    ((ep->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK)
> > > +			     == USB_ENDPOINT_XFER_BULK)){
> >
> > Did you run your change through checkpatch?
> 
> Yes.
> 
> > We have usb helper functions for all of this, why not use them instead
> > of attempting to roll your own?
> 
> Using the helpers is indeed a lot better. I wasn't aware of all of them.
> Since find_common_endpoints() won't work here, I used the helpers for 
> checking direction/type. 

I don't understand why usb_find_common_endpoints() will not work here.
It seems to be very generic and should work just fine.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
