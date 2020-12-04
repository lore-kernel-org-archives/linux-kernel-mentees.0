Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6E6C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:27:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 985CF22518
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 985CF22518
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1D1112E2F1;
	Fri,  4 Dec 2020 10:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8aFPWqeZSD4D; Fri,  4 Dec 2020 10:27:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0EAC420763;
	Fri,  4 Dec 2020 10:27:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECBAFC0FA8;
	Fri,  4 Dec 2020 10:27:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7397FC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 570DE88281
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEvwlKZtmJQk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:27:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3495588267
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:27:00 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id y7so5992589lji.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 02:27:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4KvxB+d+5ywy9A6/0ZnwzTyeIWoINes9xRZQbwOh07Y=;
 b=lW07UlCigp2ZkvZSIEPqlxghugzQeBVvxNKPaa9Rmp6RRCFmb/rh5mMZeS0y0jsfO2
 PxIc88bapHwfw5NBEfWynAOeIgsJTzcN93l6oV2XZqo2G9Y36CiOCTALkIU7+u+VLvIF
 azlDnOHfafnJOlNsuctaMfNXITpDrwN9+qMNnIdjfM54wN6GqotMXhzV7zf//v59n3Wl
 pgP1uVbHVfoJWKTiE1J0FHtAunkuC58Snr2QfyP53Nl3Tz7qWKhHr6KzQKxUmumx0No1
 XRCzjGDbPpwj9FwE98rpI4xA99PmSIKlQTIAOyPble+K09Z372I9wIMYxsOfL+rUH6c8
 qGOg==
X-Gm-Message-State: AOAM532NOqlRop03PZO3mFzLqzAYIO258zbZouRu1OkxvS10Yf8LAoIM
 OrmBLK8f9N2qqjSjhAUnxPw=
X-Google-Smtp-Source: ABdhPJyNIHYkmXLpt3Qd8nNLlH/+1UYSHSQIu240NgH1te5ESuM9AmYrvldHOyXkbrogbJGn5dfjdQ==
X-Received: by 2002:a2e:330d:: with SMTP id d13mr3161448ljc.463.1607077618515; 
 Fri, 04 Dec 2020 02:26:58 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id f24sm1568176ljc.54.2020.12.04.02.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:26:57 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl8JH-0005WC-Jk; Fri, 04 Dec 2020 11:27:31 +0100
Date: Fri, 4 Dec 2020 11:27:31 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8oPEybfSt/pOrqY@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <20201104064703.15123-13-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-13-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 12/15] usb: serial: ipw: use
	usb_control_msg_send()
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

On Wed, Nov 04, 2020 at 12:17:00PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_send() nicely wraps usb_control_msg() with proper
> error check. Hence use the wrapper instead of calling usb_control_msg()
> directly.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/usb/serial/ipw.c | 107 +++++++++++++--------------------------
>  1 file changed, 36 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/usb/serial/ipw.c b/drivers/usb/serial/ipw.c
> index d04c7cc5c1c2..3c3895b4dff8 100644
> --- a/drivers/usb/serial/ipw.c
> +++ b/drivers/usb/serial/ipw.c
> @@ -134,26 +134,16 @@ static int ipw_open(struct tty_struct *tty, struct usb_serial_port *port)
>  	struct usb_device *udev = port->serial->dev;
>  	struct device *dev = &port->dev;
>  	u8 buf_flow_static[16] = IPW_BYTES_FLOWINIT;
> -	u8 *buf_flow_init;
>  	int result;
>  
> -	buf_flow_init = kmemdup(buf_flow_static, 16, GFP_KERNEL);
> -	if (!buf_flow_init)
> -		return -ENOMEM;
> -
>  	/* --1: Tell the modem to initialize (we think) From sniffs this is
>  	 *	always the first thing that gets sent to the modem during
>  	 *	opening of the device */
>  	dev_dbg(dev, "%s: Sending SIO_INIT (we guess)\n", __func__);
> -	result = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> -			 IPW_SIO_INIT,
> -			 USB_TYPE_VENDOR | USB_RECIP_INTERFACE | USB_DIR_OUT,
> -			 0,
> -			 0, /* index */
> -			 NULL,
> -			 0,
> -			 100000);
> -	if (result < 0)
> +	result = usb_control_msg_send(udev, 0, IPW_SIO_INIT, USB_TYPE_VENDOR |
> +				      USB_RECIP_INTERFACE | USB_DIR_OUT, 0,
> +				      0,  NULL, 0, 100000, GFP_KERNEL);

Try to keep the existing indentation style and also avoid breaking the
request argument (USB_TYPE_VENDOR | ...) over multiple lines.

> +	if (result)
>  		dev_err(dev, "Init of modem failed (error = %d)\n", result);
>  
>  	/* reset the bulk pipes */
> @@ -166,31 +156,22 @@ static int ipw_open(struct tty_struct *tty, struct usb_serial_port *port)
>  
>  	/*--3: Tell the modem to open the floodgates on the rx bulk channel */
>  	dev_dbg(dev, "%s:asking modem for RxRead (RXBULK_ON)\n", __func__);
> -	result = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> -			 IPW_SIO_RXCTL,
> -			 USB_TYPE_VENDOR | USB_RECIP_INTERFACE | USB_DIR_OUT,
> -			 IPW_RXBULK_ON,
> -			 0, /* index */
> -			 NULL,
> -			 0,
> -			 100000);
> -	if (result < 0)
> +	result = usb_control_msg_send(udev, 0, IPW_SIO_RXCTL, USB_TYPE_VENDOR |
> +				      USB_RECIP_INTERFACE | USB_DIR_OUT,
> +				      IPW_RXBULK_ON, 0, NULL, 0, 100000,
> +				      GFP_KERNEL);
> +	if (result)
>  		dev_err(dev, "Enabling bulk RxRead failed (error = %d)\n", result);
>  
>  	/*--4: setup the initial flowcontrol */
> -	dev_dbg(dev, "%s:setting init flowcontrol (%s)\n", __func__, buf_flow_init);
> -	result = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> -			 IPW_SIO_HANDFLOW,
> -			 USB_TYPE_VENDOR | USB_RECIP_INTERFACE | USB_DIR_OUT,
> -			 0,
> -			 0,
> -			 buf_flow_init,
> -			 0x10,
> -			 200000);
> -	if (result < 0)
> +	dev_dbg(dev, "%s:setting init flowcontrol (%s)\n", __func__, buf_flow_static);
> +	result = usb_control_msg_send(udev, 0, IPW_SIO_HANDFLOW,
> +				      USB_TYPE_VENDOR | USB_RECIP_INTERFACE |
> +				      USB_DIR_OUT, 0, 0, &buf_flow_static, 0x10,
> +				      200000, GFP_KERNEL);
> +	if (result)
>  		dev_err(dev, "initial flowcontrol failed (error = %d)\n", result);

Note that sending a short control message is always an error so there's
nothing wrong with the current errors checks.

In fact, since all but this control request lacks a data stage, I'd just
leave this one as is as well.

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
