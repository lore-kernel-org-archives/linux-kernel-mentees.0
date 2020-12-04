Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC139C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:23:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10F5722571
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10F5722571
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8801F87C41;
	Fri,  4 Dec 2020 09:23:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3iz5sk6vSmt; Fri,  4 Dec 2020 09:23:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F0EBC87C40;
	Fri,  4 Dec 2020 09:23:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3D4BC0FA7;
	Fri,  4 Dec 2020 09:23:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1834C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BB04287C41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id co0iYM3h1TX9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:23:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C613F87C40
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:23:54 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id j205so6738053lfj.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 01:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sKKiM0BRn5/pdbr70PL9ZPEPCJsdCcavt38dAiUxSQA=;
 b=KvRqHD6sgk0+XXpRpR+Bs9UFvHH33TzrhhwpQ/kMwTaxDok55+cLyEpfEx5qKNr/Ml
 5nFkA8rLPRWveTZ07GIzhV+qhbX86J4gPolqJdKSaRh5j0Pttl/u648ar9Db6vNn0Rgf
 xDvEyrzLSI0V5JBImxTYU3dZCHKtF4TAT2qto30emB7vUuYFJjLOErYWd09ecFVcQpHK
 yeYVYo0BzgXYlFWAAvLKkeJCca0uNcVNeT5hynlylzxyxnigwMB7KD5elg4tIMtZKUvr
 rgCp0mw3juwprJX0okO5v8pecO4dXJ4C4ucL8scuMeeO1IKlt/dmkG1Sv54k53eUuMc/
 DNuA==
X-Gm-Message-State: AOAM531dcDNkqmNWXXjqY+O/o1cybvtl7H13pL2pdOskyxnVEGEsvtcw
 zJejZsuPgFrgBYodRPjiSxU=
X-Google-Smtp-Source: ABdhPJwaonjDxHe2/7wGMsZBBV/dILmNjWutydsh7per1UQR/cnVx3utsnM0EF8LGzJuvLt1zBUNQQ==
X-Received: by 2002:ac2:5985:: with SMTP id w5mr3061729lfn.386.1607073833035; 
 Fri, 04 Dec 2020 01:23:53 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id f1sm1495042lfm.184.2020.12.04.01.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:23:52 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl7KD-0005Lt-5H; Fri, 04 Dec 2020 10:24:25 +0100
Date: Fri, 4 Dec 2020 10:24:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8oASVHmeoCmM5RM@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <20201104064703.15123-4-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-4-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 03/15] usb: serial: ch314: use
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

On Wed, Nov 04, 2020 at 12:16:51PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
> usb_control_msg() with proper error check. Hence use the wrappers
> instead of calling usb_control_msg() directly.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/usb/serial/ch341.c | 45 ++++++++++++--------------------------
>  1 file changed, 14 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index a2e2f56c88cd..58c5d3ce4f75 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -111,10 +111,10 @@ static int ch341_control_out(struct usb_device *dev, u8 request,
>  	dev_dbg(&dev->dev, "%s - (%02x,%04x,%04x)\n", __func__,
>  		request, value, index);
>  
> -	r = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), request,
> -			    USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
> -			    value, index, NULL, 0, DEFAULT_TIMEOUT);
> -	if (r < 0)
> +	r = usb_control_msg_send(dev, 0, request, USB_TYPE_VENDOR |
> +				 USB_RECIP_DEVICE | USB_DIR_OUT, value, index,
> +				 NULL, 0, DEFAULT_TIMEOUT, GFP_KERNEL);
> +	if (r)
>  		dev_err(&dev->dev, "failed to send control message: %d\n", r);
>  
>  	return r;
> @@ -129,23 +129,14 @@ static int ch341_control_in(struct usb_device *dev,
>  	dev_dbg(&dev->dev, "%s - (%02x,%04x,%04x,%u)\n", __func__,
>  		request, value, index, bufsize);
>  
> -	r = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), request,
> -			    USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
> -			    value, index, buf, bufsize, DEFAULT_TIMEOUT);
> -	if (r < (int)bufsize) {
> -		if (r >= 0) {
> -			dev_err(&dev->dev,
> -				"short control message received (%d < %u)\n",
> -				r, bufsize);
> -			r = -EIO;
> -		}
> -
> +	r = usb_control_msg_recv(dev, 0, request, USB_TYPE_VENDOR |
> +				 USB_RECIP_DEVICE | USB_DIR_IN, value, index,
> +				 buf, bufsize, DEFAULT_TIMEOUT, GFP_KERNEL);
> +	if (r)
>  		dev_err(&dev->dev, "failed to receive control message: %d\n",
>  			r);
> -		return r;
> -	}
>  
> -	return 0;
> +	return r;
>  }

The callers of these functions are allocating temporary transfers buffer
for each request so this is a case where the new helpers may be of worth
if you fix up the callers as well (otherwise, you're adding redundant
memdup + memcpy for each call here).

>  
>  #define CH341_CLKRATE		48000000
> @@ -343,22 +334,18 @@ static int ch341_detect_quirks(struct usb_serial_port *port)
>  	struct usb_device *udev = port->serial->dev;
>  	const unsigned int size = 2;
>  	unsigned long quirks = 0;
> -	char *buffer;
> +	u8 buffer[2];
>  	int r;
>  
> -	buffer = kmalloc(size, GFP_KERNEL);
> -	if (!buffer)
> -		return -ENOMEM;
> -
>  	/*
>  	 * A subset of CH34x devices does not support all features. The
>  	 * prescaler is limited and there is no support for sending a RS232
>  	 * break condition. A read failure when trying to set up the latter is
>  	 * used to detect these devices.
>  	 */
> -	r = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0), CH341_REQ_READ_REG,
> -			    USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
> -			    CH341_REG_BREAK, 0, buffer, size, DEFAULT_TIMEOUT);
> +	r = usb_control_msg_recv(udev, 0, CH341_REQ_READ_REG, USB_TYPE_VENDOR |
> +				 USB_RECIP_DEVICE | USB_DIR_IN, CH341_REG_BREAK,
> +				 0, &buffer, size, DEFAULT_TIMEOUT, GFP_KERNEL);
>  	if (r == -EPIPE) {
>  		dev_info(&port->dev, "break control not supported, using simulated break\n");
>  		quirks = CH341_QUIRK_LIMITED_PRESCALER | CH341_QUIRK_SIMULATE_BREAK;
> @@ -366,17 +353,13 @@ static int ch341_detect_quirks(struct usb_serial_port *port)
>  		goto out;
>  	}
>  
> -	if (r != size) {
> -		if (r >= 0)
> -			r = -EIO;
> +	if (r) {
>  		dev_err(&port->dev, "failed to read break control: %d\n", r);
>  		goto out;
>  	}
>  
>  	r = 0;
>  out:
> -	kfree(buffer);
> -
>  	if (quirks) {
>  		dev_dbg(&port->dev, "enabling quirk flags: 0x%02lx\n", quirks);
>  		priv->quirks |= quirks;

This is a good example of when to use the helpers. But it seems you
should remove the "r = 0" and "out" label as well, right?

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
