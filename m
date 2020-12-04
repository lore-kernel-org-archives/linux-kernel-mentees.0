Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14196C0018C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:03:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94E32227C3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94E32227C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 11F558827E;
	Fri,  4 Dec 2020 10:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9XIQD3cU8CHh; Fri,  4 Dec 2020 10:03:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0C5D588293;
	Fri,  4 Dec 2020 10:03:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7B08C0FA8;
	Fri,  4 Dec 2020 10:03:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7ECC1C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 65EF98771F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7hvNQECgOpPP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:03:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1D0E687716
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:03:24 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id r24so6867911lfm.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 02:03:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xMrdek2B9lwcQxC9EmxKMrAzrWC0Z4gLKFIOEp3HsgI=;
 b=VymHpMVCwdjBaJkZpUuZ6OeUQJPcwkCjPON0ww460mHBLMQ0aSAblXhVSW16gwSZTo
 wHfitWIzA+/iqf5eIDj44yLon4vDEhB/IUwkzrJZrB3ZO042+tlD0JzPrcgKjXT5rR/K
 NCC45DLk8kzvcvV/AV9dm8IniCXDHr6W9gmeJ0naKnRgo/f6j5KExEt1lAzMJAQvFneB
 GDps2kcwd72VmY6Uzlk4THES5z/S7xVH2P+yQZMXg6focBqA7vx0wWQ0sOpRTSGiMOfd
 ytl92JlcmAoeFS+tgJt5f+6r4PyHllsCqdfZDS5uXszofljao2uzvEFhI4dUpELavcz2
 hF7A==
X-Gm-Message-State: AOAM533+9rvmg3pBdzfamqI55OJsYeEJHSKeZvK0LItCF1xnUsZ0FFS1
 UbvwXbjGUu9e7SiBjUmUJWg=
X-Google-Smtp-Source: ABdhPJwaAMR55VgpO0A8krOrHeXKRU655Zt25tnxro5IbmPsH541TkHzZbRwTkvMtwU+U2E2eTqUyw==
X-Received: by 2002:a19:8c13:: with SMTP id o19mr2878240lfd.573.1607076202331; 
 Fri, 04 Dec 2020 02:03:22 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id s23sm1495539ljs.75.2020.12.04.02.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:03:21 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl7wQ-0005Rs-L1; Fri, 04 Dec 2020 11:03:55 +0100
Date: Fri, 4 Dec 2020 11:03:54 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8oJimVHyGxGodZd@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <20201104064703.15123-9-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-9-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 08/15] usb: serial: ftdi_sio: use
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

On Wed, Nov 04, 2020 at 12:16:56PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
> usb_control_msg() with proper error check. Hence use the wrappers
> instead of calling usb_control_msg() directly.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/usb/serial/ftdi_sio.c | 182 +++++++++++++++-------------------
>  1 file changed, 78 insertions(+), 104 deletions(-)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index e0f4c3d9649c..37e9e75b90d0 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1245,13 +1245,12 @@ static int update_mctrl(struct usb_serial_port *port, unsigned int set,
>  		value |= FTDI_SIO_SET_DTR_HIGH;
>  	if (set & TIOCM_RTS)
>  		value |= FTDI_SIO_SET_RTS_HIGH;
> -	rv = usb_control_msg(port->serial->dev,
> -			       usb_sndctrlpipe(port->serial->dev, 0),
> -			       FTDI_SIO_SET_MODEM_CTRL_REQUEST,
> -			       FTDI_SIO_SET_MODEM_CTRL_REQUEST_TYPE,
> -			       value, priv->interface,
> -			       NULL, 0, WDR_TIMEOUT);
> -	if (rv < 0) {
> +	rv = usb_control_msg_send(port->serial->dev, 0,
> +				  FTDI_SIO_SET_MODEM_CTRL_REQUEST,
> +				  FTDI_SIO_SET_MODEM_CTRL_REQUEST_TYPE,
> +				  value, priv->interface,
> +				  NULL, 0, WDR_TIMEOUT, GFP_KERNEL);
> +	if (rv) {
>  		dev_dbg(dev, "%s Error from MODEM_CTRL urb: DTR %s, RTS %s\n",
>  			__func__,
>  			(set & TIOCM_DTR) ? "HIGH" : (clear & TIOCM_DTR) ? "LOW" : "unchanged",

As I mentioned earlier there's no point in using these helper for
control transfers without a data stage so please drop those conversions
and only update _read_latency_timer() ftdi_read_cbus_pins().

> @@ -2311,6 +2285,7 @@ static int ftdi_NDI_device_setup(struct usb_serial *serial)
>  {
>  	struct usb_device *udev = serial->dev;
>  	int latency = ndi_latency_timer;
> +	int ret;
>  
>  	if (latency == 0)
>  		latency = 1;
> @@ -2320,12 +2295,12 @@ static int ftdi_NDI_device_setup(struct usb_serial *serial)
>  	dev_dbg(&udev->dev, "%s setting NDI device latency to %d\n", __func__, latency);
>  	dev_info(&udev->dev, "NDI device with a latency value of %d\n", latency);
>  
> -	/* FIXME: errors are not returned */
> -	usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> -				FTDI_SIO_SET_LATENCY_TIMER_REQUEST,
> -				FTDI_SIO_SET_LATENCY_TIMER_REQUEST_TYPE,
> -				latency, 0, NULL, 0, WDR_TIMEOUT);
> -	return 0;
> +	ret = usb_control_msg_send(udev, 0,
> +				   FTDI_SIO_SET_LATENCY_TIMER_REQUEST,
> +				   FTDI_SIO_SET_LATENCY_TIMER_REQUEST_TYPE,
> +				   latency, 0, NULL, 0, WDR_TIMEOUT,
> +				   GFP_KERNEL);
> +	return ret;

Also note that returning ret here is an unrelated change which could
potentially break probing in case there are devices which do not support
this request (and would need to be done in a separate patch if at all).

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
