Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2D8ECAAD2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Aug 2022 14:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBE3C40B7F;
	Mon, 29 Aug 2022 14:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBE3C40B7F
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eQxSi2De
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQ72dKoAMc8e; Mon, 29 Aug 2022 14:51:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 01D1840393;
	Mon, 29 Aug 2022 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01D1840393
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF5CAC0032;
	Mon, 29 Aug 2022 14:51:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 845E3C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 14:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EC5C60B93
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EC5C60B93
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=eQxSi2De
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwqpQn7T-a4E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 14:51:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B77760F4C
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B77760F4C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 14:51:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 915F3B810D2;
 Mon, 29 Aug 2022 14:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF870C433B5;
 Mon, 29 Aug 2022 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661784685;
 bh=1D0W+JUuTCSdI7AzrUhn/hlZUpEEwVpbMnzddha3JUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eQxSi2DeR2phw3xh3HceJX/KJGEAg8XqaNihdtr9RdIvSmSxvdhiVGbaCKcVJSTw3
 vQrazrLaQvkaShQZre7DNIMhsyfNWQT9IeVpDb4Z84L1ln3C3a8Ph2zilbCLrPI6/r
 hz58KOeq+9LbAAWUrVXbqECfqFBBaBz0jzwyYdgI=
Date: Mon, 29 Aug 2022 16:51:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Soumya Negi <soumya.negi97@gmail.com>
Subject: Re: [PATCH] Input: Check sanity of endpoint in pegasus_open()
Message-ID: <YwzSasZjvYDRGi1O@kroah.com>
References: <20220829123959.21298-1-soumya.negi97@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220829123959.21298-1-soumya.negi97@gmail.com>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On Mon, Aug 29, 2022 at 05:39:59AM -0700, Soumya Negi wrote:
> Fix WARNING in pegasus_open/usb_submit_urb
> Syzbot bug: https://syzkaller.appspot.com/bug?id=bbc107584dcf3262253ce93183e51f3612aaeb13
> 
> Add sanity check of endpoint for Pegasus URB in pegasus_open() so that
> transfer requests for bogus URBs are not submitted. If the URB is bogus
> pegasus_open() will fail.
> 
> Reported-by: syzbot+04ee0cb4caccaed12d78@syzkaller.appspotmail.com
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> ---
>  drivers/input/tablet/pegasus_notetaker.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
> index c608ac505d1b..5e47882ee4c0 100644
> --- a/drivers/input/tablet/pegasus_notetaker.c
> +++ b/drivers/input/tablet/pegasus_notetaker.c
> @@ -225,6 +225,15 @@ static int pegasus_open(struct input_dev *dev)
>  
>  	mutex_lock(&pegasus->pm_mutex);
>  	pegasus->irq->dev = pegasus->usbdev;
> +
> +	/* Sanity check of endpoint in Pegasus URB */
> +	error = usb_urb_ep_type_check(pegasus->irq);

That is not checking for the type of the endpoint, so are you sure this
works?

And this should happen at probe time, not when the device is opened.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
