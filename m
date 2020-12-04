Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25481C4361A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:49:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8210F227C3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8210F227C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0A5148787D;
	Fri,  4 Dec 2020 09:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W1ywqQlY0Xm4; Fri,  4 Dec 2020 09:49:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 256EC8775B;
	Fri,  4 Dec 2020 09:49:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13713C0FA7;
	Fri,  4 Dec 2020 09:49:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E849C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6429E2041D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F62aAdKpFjnJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:49:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by silver.osuosl.org (Postfix) with ESMTPS id EB9342041A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:49:12 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id s9so5856326ljo.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 01:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yfKg58xkwXSx71ApTWNauMGgiUBJzBDMz0afZorcj6g=;
 b=NXLYsnW23Tj1dU+yV2lITPpBSpjSyzlgpoCBcPkAGH97E83H1G6p02nyTncsI9AcXx
 3aOQKn55qihFsvtV7VYNhgLZKQcwHXeZ0wDDr29sjzZgRhImTkPQgaL+iK+wYNQatifn
 6J3YjqpqmrlLzO56Y3aMYejULTnnQ/Xb4Rwy2FFr0kqqD1bP3LP3fyiQ9+xn4NRgXTUR
 Wzv/WufCuVez7s1Yei++pKWcgzFiGIh5ERsZYGls9HUfkY9EEjQXsQha0PzxVl8JyxRt
 +I8jvBPphEEySSAZz58o+mu3b6f7hjOVxut/2YVqfxyZwjd5+XYM6HyiU4/PVQa9oIUV
 +ztA==
X-Gm-Message-State: AOAM530/SAg41D5xLYD4EMUIB6qeeqgbrmXArhZvR+Jd8zK5WHcDnYta
 xQju4mfxkyVLUXskVazuVbw=
X-Google-Smtp-Source: ABdhPJxr10bCWAeW8yV/PU74dvNZ4dJz19Ik47TU1YQU5WuqIYQbLqZVR7Otpqa43hR1seN9Oz1bOA==
X-Received: by 2002:a2e:9f4b:: with SMTP id v11mr2917769ljk.96.1607075351218; 
 Fri, 04 Dec 2020 01:49:11 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id t6sm1482833lfc.231.2020.12.04.01.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:49:10 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl7ih-0005PO-Hu; Fri, 04 Dec 2020 10:49:44 +0100
Date: Fri, 4 Dec 2020 10:49:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8oGN9G+i9rQM9eX@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <20201104064703.15123-7-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-7-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 06/15] usb: serial: f81232: use
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

On Wed, Nov 04, 2020 at 12:16:54PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
> usb_control_msg() with proper error check. Hence use the wrappers
> instead of calling usb_control_msg() directly.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/usb/serial/f81232.c | 88 ++++++++-----------------------------
>  1 file changed, 18 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/usb/serial/f81232.c b/drivers/usb/serial/f81232.c
> index 0c7eacc630e0..78107feef8a8 100644
> --- a/drivers/usb/serial/f81232.c
> +++ b/drivers/usb/serial/f81232.c
> @@ -139,71 +139,36 @@ static int calc_baud_divisor(speed_t baudrate, speed_t clockrate)
>  static int f81232_get_register(struct usb_serial_port *port, u16 reg, u8 *val)
>  {
>  	int status;
> -	u8 *tmp;
>  	struct usb_device *dev = port->serial->dev;
>  
> -	tmp = kmalloc(sizeof(*val), GFP_KERNEL);
> -	if (!tmp)
> -		return -ENOMEM;
> -
> -	status = usb_control_msg(dev,
> -				usb_rcvctrlpipe(dev, 0),
> -				F81232_REGISTER_REQUEST,
> -				F81232_GET_REGISTER,
> -				reg,
> -				0,
> -				tmp,
> -				sizeof(*val),
> -				USB_CTRL_GET_TIMEOUT);
> -	if (status != sizeof(*val)) {
> +	status = usb_control_msg_recv(dev, 0, F81232_REGISTER_REQUEST,
> +				      F81232_GET_REGISTER, reg, 0, val,
> +				      sizeof(*val), USB_CTRL_GET_TIMEOUT,
> +				      GFP_KERNEL);

This driver use tabs for indentation consistently so please stick to
that style. That should also amount to a smaller patch (and less noise
in the logs, e.g. for git blame).

> +	if (status) {
>  		dev_err(&port->dev, "%s failed status: %d\n", __func__, status);
>  
> -		if (status < 0)
> -			status = usb_translate_errors(status);
> -		else
> -			status = -EIO;
> -	} else {
> -		status = 0;
> -		*val = *tmp;
> +		status = usb_translate_errors(status);
>  	}
>  
> -	kfree(tmp);
>  	return status;
>  }

> @@ -866,32 +831,16 @@ static int f81534a_ctrl_set_register(struct usb_interface *intf, u16 reg,
>  	struct usb_device *dev = interface_to_usbdev(intf);
>  	int retry = F81534A_ACCESS_REG_RETRY;
>  	int status;
> -	u8 *tmp;
> -
> -	tmp = kmemdup(val, size, GFP_KERNEL);
> -	if (!tmp)
> -		return -ENOMEM;
>  
>  	while (retry--) {
> -		status = usb_control_msg(dev,
> -					usb_sndctrlpipe(dev, 0),
> -					F81232_REGISTER_REQUEST,
> -					F81232_SET_REGISTER,
> -					reg,
> -					0,
> -					tmp,
> -					size,
> -					USB_CTRL_SET_TIMEOUT);
> -		if (status < 0) {
> +		status = usb_control_msg_send(dev, 0, F81232_REGISTER_REQUEST,
> +					      F81232_SET_REGISTER, reg, 0, val,
> +					      size, USB_CTRL_SET_TIMEOUT, GFP_KERNEL);
> +		if (status) {
> +			/* Retry on error or short transfers */
>  			status = usb_translate_errors(status);
>  			if (status == -EIO)
>  				continue;

So this now depends on the new helper returning an errno on short
transfers which gets mapped to -EIO by usb_translate_errors(). This
works currently (and with my suggested change to use -EREMOTEIO) but
could possibly lead to subtle regressions later.

I don't think we need to worry about it, but just wanted to highlight
the kind of impact these changes can have.

Note that this change also replaces a single memdup with a memdup+memcpy
for each iteration. But as this helper is used rarely (e.g. probe,
resume and disconnect), and hopefully the retries are exceptions, the
overhead could be acceptable.

> -		} else if (status != size) {
> -			/* Retry on short transfers */
> -			status = -EIO;
> -			continue;
> -		} else {
> -			status = 0;
>  		}
>  
>  		break;
> @@ -902,7 +851,6 @@ static int f81534a_ctrl_set_register(struct usb_interface *intf, u16 reg,
>  				reg, status);
>  	}
>  
> -	kfree(tmp);
>  	return status;
>  }

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
