Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CD9C32792
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Aug 2022 06:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0DDF40604;
	Wed, 24 Aug 2022 06:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0DDF40604
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=VjcVhUpo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5FK-c9IsoFu; Wed, 24 Aug 2022 06:04:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B85A04046D;
	Wed, 24 Aug 2022 06:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B85A04046D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 891AAC0033;
	Wed, 24 Aug 2022 06:04:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE0C5C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 06:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75ED381397
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 06:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75ED381397
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=VjcVhUpo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A5y8sDQkiH0t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 06:04:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C0F581395
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C0F581395
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 06:04:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D13B7B82364;
 Wed, 24 Aug 2022 06:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10050C433C1;
 Wed, 24 Aug 2022 06:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661321078;
 bh=Vg8rTF4/cdtBoLL5ouYQ0cWuabQoYYlJa7ce+p3Xejs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VjcVhUpolXkOJk2e7Xbrrmm38DHGKJUqEQ00X9L5/ERNz4hgHNGGcDmsoZztq5NVl
 b7FlUW3xjkdUD6WyiHQxb5qoxbKQvrsY+cqOOr5MJiRYI0DnevOFXDAPh0EybbK7nv
 XlxhPjuGxasFT70mMeEtHy3TuazFglf1unjI9UCU=
Date: Wed, 24 Aug 2022 08:04:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mazin Al Haddad <mazinalhaddad05@gmail.com>
Subject: Re: [PATCH] ar5523: check endpoints type and direction in probe()
Message-ID: <YwW/cw2cXLEd5xFo@kroah.com>
References: <20220823222436.514204-1-mazinalhaddad05@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220823222436.514204-1-mazinalhaddad05@gmail.com>
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

On Wed, Aug 24, 2022 at 01:24:38AM +0300, Mazin Al Haddad wrote:
> Fixes a bug reported by syzbot, where a warning occurs in usb_submit_urb()
> due to the wrong endpoint type. There is no check for both the number
> of endpoints and the type which causes an error as the code tries to
> send a URB to the wrong endpoint.
> 
> Fix it by adding a check for the number of endpoints and the
> direction/type of the endpoints. If the endpoints do not match the 
> expected configuration -ENODEV is returned.
> 
> Syzkaller report:
> 
> usb 1-1: BOGUS urb xfer, pipe 3 != type 1
> WARNING: CPU: 1 PID: 71 at drivers/usb/core/urb.c:502 usb_submit_urb+0xed2/0x18a0 drivers/usb/core/urb.c:502
> Modules linked in:
> CPU: 1 PID: 71 Comm: kworker/1:2 Not tainted 5.19.0-rc7-syzkaller-00150-g32f02a211b0a #0
> Hardware name: Google Compute Engine/Google Compute Engine, BIOS Google 06/29/2022
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>  <TASK>
>  ar5523_cmd+0x420/0x790 drivers/net/wireless/ath/ar5523/ar5523.c:275
>  ar5523_cmd_read drivers/net/wireless/ath/ar5523/ar5523.c:302 [inline]
>  ar5523_host_available drivers/net/wireless/ath/ar5523/ar5523.c:1376 [inline]
>  ar5523_probe+0xc66/0x1da0 drivers/net/wireless/ath/ar5523/ar5523.c:1655
> 
> 
> Link: https://syzkaller.appspot.com/bug?extid=1bc2c2afd44f820a669f
> Reported-and-tested-by: syzbot+1bc2c2afd44f820a669f@syzkaller.appspotmail.com
> Signed-off-by: Mazin Al Haddad <mazinalhaddad05@gmail.com>
> ---
>  drivers/net/wireless/ath/ar5523/ar5523.c | 31 ++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ar5523/ar5523.c b/drivers/net/wireless/ath/ar5523/ar5523.c
> index 6f937d2cc126..5451bf9ab9fb 100644
> --- a/drivers/net/wireless/ath/ar5523/ar5523.c
> +++ b/drivers/net/wireless/ath/ar5523/ar5523.c
> @@ -1581,8 +1581,39 @@ static int ar5523_probe(struct usb_interface *intf,
>  	struct usb_device *dev = interface_to_usbdev(intf);
>  	struct ieee80211_hw *hw;
>  	struct ar5523 *ar;
> +	struct usb_host_interface *host = intf->cur_altsetting;
>  	int error = -ENOMEM;
>  
> +	if (host->desc.bNumEndpoints != 4) {
> +		dev_err(&dev->dev, "Wrong number of endpoints\n");
> +		return -ENODEV;
> +	}
> +
> +	for (int i = 0; i < host->desc.bNumEndpoints; ++i) {
> +		struct usb_endpoint_descriptor *ep = &host->endpoint[i].desc;
> +		// Check for type of endpoint and direction.
> +		switch (i) {
> +		case 0:
> +		case 1:
> +			if ((ep->bEndpointAddress & USB_DIR_OUT) &&
> +			    ((ep->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK)
> +			     == USB_ENDPOINT_XFER_BULK)){

Did you run your change through checkpatch?

> +				dev_err(&dev->dev, "Wrong type of endpoints\n");
> +				return -ENODEV;
> +			}
> +			break;
> +		case 2:
> +		case 3:
> +			if ((ep->bEndpointAddress & USB_DIR_IN) &&
> +			    ((ep->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK)
> +			     == USB_ENDPOINT_XFER_BULK)){
> +				dev_err(&dev->dev, "Wrong type of endpoints\n");
> +				return -ENODEV;
> +			}
> +			break;
> +		}

We have usb helper functions for all of this, why not use them instead
of attempting to roll your own?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
