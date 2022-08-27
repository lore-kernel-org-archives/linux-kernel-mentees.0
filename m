Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAF7ECAAD5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 27 Aug 2022 10:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B24C81C18;
	Sat, 27 Aug 2022 10:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B24C81C18
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IMA+D+gG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 91uDMjnFlkW6; Sat, 27 Aug 2022 10:36:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 82FC08146B;
	Sat, 27 Aug 2022 10:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82FC08146B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E3F3C0032;
	Sat, 27 Aug 2022 10:36:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C2FCC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Aug 2022 10:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10D4F409F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Aug 2022 10:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10D4F409F6
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IMA+D+gG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FptihFUTrHhM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Aug 2022 10:36:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70C0F409A2
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70C0F409A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Aug 2022 10:36:41 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id h1so1988983wmd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Aug 2022 03:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc;
 bh=3KdNmwQ5Eo4mNdRhZZD4nhR9AFPFsJ2ICC0mw9B8MGs=;
 b=IMA+D+gGlVerpOdwH6UOhJBppQJ11A1qiZKC6AW4gTnrDBwI8HHmeolvDU74GV0rfg
 Ysoy9iKFhgIiqwCvtN3L+C/zzDH782IRG1YCbbot5JuLaAv2RgcX6nsA/rZy4VBzk1tD
 BB02VykcQsOLblkEiD8xweR9Bt4QXx0f/j5ZBBcnZYkX/5b84kSCpog5pVutqTAx/QKa
 cbXRWqbhGN+PYc2oYolQeM/szmc2Ebfarew18c0ByiZHDKkruFO7lDw+L/cIXB4+ZOcm
 /ODVPtxHee1y4g/t80NbNXA1wORleJtZ1nVzLm21cgDNTdgIzCFGxJNRqOV9TkFObFLj
 Juow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc; bh=3KdNmwQ5Eo4mNdRhZZD4nhR9AFPFsJ2ICC0mw9B8MGs=;
 b=fVx6JwJo/nxrgYfRr/k/LGPdx+6HNRqzYxEs2UMewmaYtLMxkzvG8PFOwRR7w5OA1l
 30NtSrgjei3wWLhEDRWKPoVOjvDQxuA4440FYzNHZcBareWaofOKREycwc3XYQzfnuLn
 zePYDEvMi5ibcmnksVD96vvIBc0GPhgwzaQyWMgERk8H0sHeIlihHTw2VgZyaRccYDFb
 8BdZRsSi4GW4i/Tib/+axqiTTFDq7pga+QVkipLMLFBMki0ygYlGTXoQ/F0KrLziu2N3
 EOlEp2QInhYeFyQqnCEWVxQlnziv4PSfG0WYX1GUeNIfKbMBAg0DCq+ar0wKunXJmiBT
 Ce/w==
X-Gm-Message-State: ACgBeo1bSXLWwZnORKzU4LMsCR8B1b5JOm962SVCqqY68UP5ldmDlxN0
 d+fVqzQ2wOXB8JzaTanbGfY=
X-Google-Smtp-Source: AA6agR7L3WSvfGpwK8d3UEcMZdevgO2kd0FBzNAB3RIXaLZD378C68ZcHWsq4S0lmqLqJDVoEVynHw==
X-Received: by 2002:a1c:f709:0:b0:3a6:3452:fcbe with SMTP id
 v9-20020a1cf709000000b003a63452fcbemr1991486wmh.164.1661596599428; 
 Sat, 27 Aug 2022 03:36:39 -0700 (PDT)
Received: from localhost ([84.255.184.228]) by smtp.gmail.com with ESMTPSA id
 c6-20020adffb06000000b002250c35826dsm1952077wrr.104.2022.08.27.03.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 03:36:38 -0700 (PDT)
Mime-Version: 1.0
Date: Sat, 27 Aug 2022 13:36:29 +0300
Message-Id: <CMGQTZ9XBSTJ.5QY7JQCNULBN@Arch-Desktop>
Subject: Re: [PATCH] ar5523: check endpoints type and direction in probe()
From: "Mazin Al Haddad" <mazinalhaddad05@gmail.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.11.0-85-g6b1afc3ae3d8
References: <20220823222436.514204-1-mazinalhaddad05@gmail.com>
 <YwW/cw2cXLEd5xFo@kroah.com>
In-Reply-To: <YwW/cw2cXLEd5xFo@kroah.com>
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

On Wed Aug 24, 2022 at 9:04 AM +03, Greg KH wrote:
> On Wed, Aug 24, 2022 at 01:24:38AM +0300, Mazin Al Haddad wrote:
> > Fixes a bug reported by syzbot, where a warning occurs in usb_submit_urb()
> > due to the wrong endpoint type. There is no check for both the number
> > of endpoints and the type which causes an error as the code tries to
> > send a URB to the wrong endpoint.
> > 
> > Fix it by adding a check for the number of endpoints and the
> > direction/type of the endpoints. If the endpoints do not match the 
> > expected configuration -ENODEV is returned.
> > 
> > Syzkaller report:
> > 
> > usb 1-1: BOGUS urb xfer, pipe 3 != type 1
> > WARNING: CPU: 1 PID: 71 at drivers/usb/core/urb.c:502 usb_submit_urb+0xed2/0x18a0 drivers/usb/core/urb.c:502
> > Modules linked in:
> > CPU: 1 PID: 71 Comm: kworker/1:2 Not tainted 5.19.0-rc7-syzkaller-00150-g32f02a211b0a #0
> > Hardware name: Google Compute Engine/Google Compute Engine, BIOS Google 06/29/2022
> > Workqueue: usb_hub_wq hub_event
> > Call Trace:
> >  <TASK>
> >  ar5523_cmd+0x420/0x790 drivers/net/wireless/ath/ar5523/ar5523.c:275
> >  ar5523_cmd_read drivers/net/wireless/ath/ar5523/ar5523.c:302 [inline]
> >  ar5523_host_available drivers/net/wireless/ath/ar5523/ar5523.c:1376 [inline]
> >  ar5523_probe+0xc66/0x1da0 drivers/net/wireless/ath/ar5523/ar5523.c:1655
> > 
> > 
> > Link: https://syzkaller.appspot.com/bug?extid=1bc2c2afd44f820a669f
> > Reported-and-tested-by: syzbot+1bc2c2afd44f820a669f@syzkaller.appspotmail.com
> > Signed-off-by: Mazin Al Haddad <mazinalhaddad05@gmail.com>
> > ---
> >  drivers/net/wireless/ath/ar5523/ar5523.c | 31 ++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> > 
> > diff --git a/drivers/net/wireless/ath/ar5523/ar5523.c b/drivers/net/wireless/ath/ar5523/ar5523.c
> > index 6f937d2cc126..5451bf9ab9fb 100644
> > --- a/drivers/net/wireless/ath/ar5523/ar5523.c
> > +++ b/drivers/net/wireless/ath/ar5523/ar5523.c
> > @@ -1581,8 +1581,39 @@ static int ar5523_probe(struct usb_interface *intf,
> >  	struct usb_device *dev = interface_to_usbdev(intf);
> >  	struct ieee80211_hw *hw;
> >  	struct ar5523 *ar;
> > +	struct usb_host_interface *host = intf->cur_altsetting;
> >  	int error = -ENOMEM;
> >  
> > +	if (host->desc.bNumEndpoints != 4) {
> > +		dev_err(&dev->dev, "Wrong number of endpoints\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	for (int i = 0; i < host->desc.bNumEndpoints; ++i) {
> > +		struct usb_endpoint_descriptor *ep = &host->endpoint[i].desc;
> > +		// Check for type of endpoint and direction.
> > +		switch (i) {
> > +		case 0:
> > +		case 1:
> > +			if ((ep->bEndpointAddress & USB_DIR_OUT) &&
> > +			    ((ep->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK)
> > +			     == USB_ENDPOINT_XFER_BULK)){
>
> Did you run your change through checkpatch?

Yes.

> We have usb helper functions for all of this, why not use them instead
> of attempting to roll your own?

Using the helpers is indeed a lot better. I wasn't aware of all of them.
Since find_common_endpoints() won't work here, I used the helpers for 
checking direction/type. 

I'll send v3 now. If there are any more changes that you feel
are necessary please let me know, I'll be happy to incorporate them. 

Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
