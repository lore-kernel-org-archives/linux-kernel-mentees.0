Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767B4C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:55:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C92F822795
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C92F822795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 77F3420477;
	Fri,  4 Dec 2020 09:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CehqnfdFNbN3; Fri,  4 Dec 2020 09:55:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1D88F20460;
	Fri,  4 Dec 2020 09:55:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A28AC0FA7;
	Fri,  4 Dec 2020 09:55:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6D73C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 950E587BD3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 599cDw22v-7o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:55:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B5D2B87A76
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:55:25 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id r18so5933691ljc.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 01:55:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KR7bvZk9IL0aVDrbxk4V05QNkr638YolAIwhooQDGYw=;
 b=E5hvlce21owxhABIADm53uYGBD4X4bZjSOez+CBtTojBZMxcrBtTtL3w9wHULoZPQ0
 iCKtaNKYf7GjrCRwBI/h7Zq01GJo+rLno1ha0T1H4+IIrImk/PrR3jvgIPp4abwqtXbA
 iYuSX5GehkVvxysGMNDfghgNpsWpXwgrRKjjjYpVEuiMA6dIg0E9Mu7vuzPxSEG1btYO
 27zbxyrWk0wCCrBXyxUPVq8zpzsGZnPuVyEEeNgfJQw+WME/FkPheopF6FLBkGp5tEiM
 Tvqbd6LaSLoMv3ray1ujMY3COflVQrujPICXUInC8ZPj6C7dXDidV9cDI14t+JZ51E0n
 XcXg==
X-Gm-Message-State: AOAM531YklCz5SvE9yLmugRB26qAacvRJiHCFm8wiDUFtQME1CTsbSTm
 oMK9sBbe55pMYTZXSRoQpyw=
X-Google-Smtp-Source: ABdhPJwYmkZIAkj2nS8w7vSQfiok7d0nOZTQfC3LwYpXyrsx61HYASrW0XIagI6VSqfdyyUVNwyf4Q==
X-Received: by 2002:a05:651c:1195:: with SMTP id
 w21mr3043489ljo.427.1607075724025; 
 Fri, 04 Dec 2020 01:55:24 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id f21sm1545449ljk.0.2020.12.04.01.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:55:23 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl7oi-0005Qc-D0; Fri, 04 Dec 2020 10:55:57 +0100
Date: Fri, 4 Dec 2020 10:55:56 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8oHrKbjAg3nnJ1n@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <20201104064703.15123-8-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-8-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 07/15] usb: serial: f81534: use
 usb_control_msg_recv() and usb_control_msg_send()
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

On Wed, Nov 04, 2020 at 12:16:55PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
> usb_control_msg() with proper error check. Hence use the wrappers
> instead of calling usb_control_msg() directly.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/usb/serial/f81534.c | 63 +++++++++++--------------------------
>  1 file changed, 18 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/usb/serial/f81534.c b/drivers/usb/serial/f81534.c
> index 5661fd03e545..23eb17a2c052 100644
> --- a/drivers/usb/serial/f81534.c
> +++ b/drivers/usb/serial/f81534.c
> @@ -217,38 +217,26 @@ static int f81534_set_register(struct usb_serial *serial, u16 reg, u8 data)
>  	struct usb_device *dev = serial->dev;
>  	size_t count = F81534_USB_MAX_RETRY;
>  	int status;
> -	u8 *tmp;
> -
> -	tmp = kmalloc(sizeof(u8), GFP_KERNEL);
> -	if (!tmp)
> -		return -ENOMEM;
> -
> -	*tmp = data;
>  
>  	/*
>  	 * Our device maybe not reply when heavily loading, We'll retry for
>  	 * F81534_USB_MAX_RETRY times.
>  	 */
>  	while (count--) {
> -		status = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
> -					 F81534_SET_GET_REGISTER,
> -					 USB_TYPE_VENDOR | USB_DIR_OUT,
> -					 reg, 0, tmp, sizeof(u8),
> -					 F81534_USB_TIMEOUT);
> -		if (status > 0) {
> -			status = 0;
> -			break;
> -		} else if (status == 0) {
> -			status = -EIO;
> +		status = usb_control_msg_send(dev, 0, F81534_SET_GET_REGISTER,
> +					      USB_TYPE_VENDOR | USB_DIR_OUT,
> +					      reg, 0, &data, sizeof(u8),
> +					      F81534_USB_TIMEOUT, GFP_KERNEL);
> +		if (status) {
> +			/* Try again */
> +			continue;
>  		}
>  	}

Here too this change breaks the logic and the control transfer is now
repeated also after successful transfer (ten times!).

This change would also introduce an additional malloc + memcpy for every
retry.

As this is a function that is used often and the comment suggest that
having to retry isn't that rare, I suggest dropping this patch as well.

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
