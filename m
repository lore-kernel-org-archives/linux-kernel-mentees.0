Return-Path: <SRS0=3tBC=JO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E625C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Apr 2021 15:48:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BD6E610CC
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Apr 2021 15:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BD6E610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B75D640205;
	Sat, 17 Apr 2021 15:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3MhRzE0aGh4A; Sat, 17 Apr 2021 15:48:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBA5B40123;
	Sat, 17 Apr 2021 15:48:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DED8C001B;
	Sat, 17 Apr 2021 15:48:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91AABC0019
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Apr 2021 15:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B81E401FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Apr 2021 15:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSVqL-tcwN5n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Apr 2021 15:48:43 +0000 (UTC)
X-Greylist: delayed 00:06:41 by SQLgrey-1.8.0
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by smtp2.osuosl.org (Postfix) with SMTP id A886440123
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Apr 2021 15:48:43 +0000 (UTC)
Received: (qmail 73905 invoked by uid 1000); 17 Apr 2021 11:42:00 -0400
Date: Sat, 17 Apr 2021 11:42:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH] usb: gadget: dummy_hcd: fix gpf in gadget_setup
Message-ID: <20210417154200.GB73141@rowland.harvard.edu>
References: <20210417125212.6274-1-mail@anirudhrb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210417125212.6274-1-mail@anirudhrb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Felipe Balbi <balbi@kernel.org>,
 syzbot+eb4674092e6cc8d9e0bd@syzkaller.appspotmail.com,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-usb@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Ahmed S. Darwish" <a.darwish@linutronix.de>,
 Colin Ian King <colin.king@canonical.com>, Lee Jones <lee.jones@linaro.org>,
 Andrey Konovalov <andreyknvl@gmail.com>
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

On Sat, Apr 17, 2021 at 06:22:09PM +0530, Anirudh Rayabharam wrote:
> Fix a general protection fault reported by syzbot due to a race between
> gadget_setup() and gadget_unbind() in raw_gadget.
> 
> The gadget core is supposed to guarantee that there won't be any more
> callbacks to the gadget driver once the driver's unbind routine is
> called. That guarantee is enforced in usb_gadget_remove_driver as
> follows:
> 
>         usb_gadget_disconnect(udc->gadget);
>         if (udc->gadget->irq)
>                 synchronize_irq(udc->gadget->irq);
>         udc->driver->unbind(udc->gadget);
>         usb_gadget_udc_stop(udc);
> 
> usb_gadget_disconnect turns off the pullup resistor, telling the host
> that the gadget is no longer connected and preventing the transmission
> of any more USB packets. Any packets that have already been received
> are sure to processed by the UDC driver's interrupt handler by the time
> synchronize_irq returns.
> 
> But this doesn't work with dummy_hcd, because dummy_hcd doesn't use
> interrupts; it uses a timer instead.  It does have code to emulate the
> effect of synchronize_irq, but that code doesn't get invoked at the
> right time -- it currently runs in usb_gadget_udc_stop, after the unbind
> callback instead of before.  Indeed, there's no way for
> usb_gadget_remove_driver to invoke this code before the unbind
> callback.
> 
> To fix this, move the synchronize_irq() emulation code to dummy_pullup
> so that it runs before unbind. Also, add a comment explaining why it is
> necessary to have it there.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Reported-by: syzbot+eb4674092e6cc8d9e0bd@syzkaller.appspotmail.com
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>  drivers/usb/gadget/udc/dummy_hcd.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index ce24d4f28f2a..d0dae6406612 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -903,6 +903,21 @@ static int dummy_pullup(struct usb_gadget *_gadget, int value)
>  	spin_lock_irqsave(&dum->lock, flags);
>  	dum->pullup = (value != 0);
>  	set_link_state(dum_hcd);
> +	if (value == 0) {
> +		/*
> +		 * emulate synchronize_irq(): wait for callbacks to finish
> +		 * This seems to be the best to place to emulate the call
> +		 * to synchronize_irq(). Doing it in dummy_udc_stop() would
> +		 * be too late since it is called after the unbind callback.
> +		 * Also, there is no way for core:usb_gadget_remove_driver()
> +		 * to invoke this code before the unbind callback.
> +		 */

This comment could be edited a little better.  It should start with a 
capital letter, and there should be a period at the end of the first 
line.  There is an extra "to" before "place to emulate".  The last 
sentence isn't really needed.

Also, you could be more specific.  The call to synchronize_irq() which 
we want to emulate is the one in usb_gadget_remove_driver().  And the 
reason we want to do it before the unbind callback is because unbind 
shouldn't be invoked until all the other callbacks are finished.

Once those changes are made, you can add:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

> +		while (dum->callback_usage > 0) {
> +			spin_unlock_irqrestore(&dum->lock, flags);
> +			usleep_range(1000, 2000);
> +			spin_lock_irqsave(&dum->lock, flags);
> +		}
> +	}
>  	spin_unlock_irqrestore(&dum->lock, flags);
>  
>  	usb_hcd_poll_rh_status(dummy_hcd_to_hcd(dum_hcd));
> @@ -1004,14 +1019,6 @@ static int dummy_udc_stop(struct usb_gadget *g)
>  	spin_lock_irq(&dum->lock);
>  	dum->ints_enabled = 0;
>  	stop_activity(dum);
> -
> -	/* emulate synchronize_irq(): wait for callbacks to finish */
> -	while (dum->callback_usage > 0) {
> -		spin_unlock_irq(&dum->lock);
> -		usleep_range(1000, 2000);
> -		spin_lock_irq(&dum->lock);
> -	}
> -
>  	dum->driver = NULL;
>  	spin_unlock_irq(&dum->lock);
>  
> -- 
> 2.26.2
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
