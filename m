Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9E4C4361A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:37:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87E4A225AB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87E4A225AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D24E08783C;
	Fri,  4 Dec 2020 10:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXt1WS6xzsNM; Fri,  4 Dec 2020 10:37:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 624F186EB9;
	Fri,  4 Dec 2020 10:37:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49311C0FA8;
	Fri,  4 Dec 2020 10:37:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA7C1C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D4977873EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:37:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7aL_fYVbp0O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:37:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EB22E86EB9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:37:02 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id a9so7018304lfh.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 02:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Dnb2g8Upo0FOr6S0AYAIulpRk5vFPv7InqWLqIi5s84=;
 b=QLSkI+KCC/PenfSCZQXGZjVEZwLYnjD7p3jkdwILxr1x6PKKA30IKpnqEdxgZcadTm
 tDJ34q93Z9ShM2Cx6Ad14ceDzzWV3LiTuxQ2xlTs5R4oKWV60ERG/+Sl4AbACVjnjIWg
 lAr7ovBjGcifjUHKQDRWPNsWK5Nj9q/qKMTt/gqOVR+bm57H8dW4VsxZCC9IjRlvAOQJ
 66XjHD5kWTkdzAfJjeYbsOR92FCyw8I7Qa1SdododrumZ8BLZQ/eTL2oLskPHrIT3C22
 M29BsgPXIVo8cA8BCl7sYX8UB+93IPaqq7/KC6mPeoTXB0bQbcq1WNmAMKgSGQu0Fks9
 p92w==
X-Gm-Message-State: AOAM532gofj/MEyzupeixy944997om6IMypxpRI05Wungkdkq9E2Xipv
 ocrVNVXc5ynixW4P/hf2hSQ=
X-Google-Smtp-Source: ABdhPJyKpnuk/F7WOaI0Az5g7xR+VlkpKJieo8R7MQrmtuwfHLh7EGRuWYrxZ9eszx366qpVngQJnQ==
X-Received: by 2002:ac2:4d94:: with SMTP id g20mr2829254lfe.512.1607078221220; 
 Fri, 04 Dec 2020 02:37:01 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id p15sm1539338lfk.111.2020.12.04.02.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:37:00 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl8Sz-0005Xp-MK; Fri, 04 Dec 2020 11:37:34 +0100
Date: Fri, 4 Dec 2020 11:37:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8oRbaWuSoZSRAT8@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <20201104064703.15123-16-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-16-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 15/15] usb: serial: kl5kusb105:
 use usb_control_msg_recv() and usb_control_msg_send()
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

On Wed, Nov 04, 2020 at 12:17:03PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
> usb_control_msg() with proper error check. Hence use the wrappers
> instead of calling usb_control_msg() directly
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/usb/serial/kl5kusb105.c | 94 +++++++++++++++------------------
>  1 file changed, 44 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/usb/serial/kl5kusb105.c b/drivers/usb/serial/kl5kusb105.c
> index 5ee48b0650c4..75cfd1c907f3 100644
> --- a/drivers/usb/serial/kl5kusb105.c
> +++ b/drivers/usb/serial/kl5kusb105.c
> @@ -124,16 +124,17 @@ static int klsi_105_chg_port_settings(struct usb_serial_port *port,
>  {
>  	int rc;
>  
> -	rc = usb_control_msg(port->serial->dev,
> -			usb_sndctrlpipe(port->serial->dev, 0),
> -			KL5KUSB105A_SIO_SET_DATA,
> -			USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_INTERFACE,
> -			0, /* value */
> -			0, /* index */
> -			settings,
> -			sizeof(struct klsi_105_port_settings),
> -			KLSI_TIMEOUT);
> -	if (rc < 0)
> +	rc = usb_control_msg_send(port->serial->dev, 0,
> +				  KL5KUSB105A_SIO_SET_DATA,
> +				  USB_TYPE_VENDOR | USB_DIR_OUT |
> +				  USB_RECIP_INTERFACE,
> +				  0, /* value */
> +				  0, /* index */
> +				  settings,
> +				  sizeof(struct klsi_105_port_settings),
> +				  KLSI_TIMEOUT,
> +				  GFP_KERNEL);
> +	if (rc)
>  		dev_err(&port->dev,
>  			"Change port settings failed (error = %d)\n", rc);

The callers of this function already allocates a transfer-buffer which
you should now remove to avoid introducing an additional memdup() per
call.

Note that there was a related bug in open() which failed to release it's
transfer buffer on successful open. I CCed you on the fix which we
should get merged and backported before converting to using the new
helper.

> @@ -283,16 +276,17 @@ static int  klsi_105_open(struct tty_struct *tty, struct usb_serial_port *port)
>  		goto err_free_cfg;
>  	}
>  
> -	rc = usb_control_msg(port->serial->dev,
> -			     usb_sndctrlpipe(port->serial->dev, 0),
> -			     KL5KUSB105A_SIO_CONFIGURE,
> -			     USB_TYPE_VENDOR|USB_DIR_OUT|USB_RECIP_INTERFACE,
> -			     KL5KUSB105A_SIO_CONFIGURE_READ_ON,
> -			     0, /* index */
> -			     NULL,
> -			     0,
> -			     KLSI_TIMEOUT);
> -	if (rc < 0) {
> +	rc  = usb_control_msg_send(port->serial->dev, 0,
> +				   KL5KUSB105A_SIO_CONFIGURE,
> +				   USB_TYPE_VENDOR | USB_DIR_OUT |
> +				   USB_RECIP_INTERFACE,
> +				   KL5KUSB105A_SIO_CONFIGURE_READ_ON,
> +				   0, /* index */
> +				   NULL,
> +				   0,
> +				   KLSI_TIMEOUT,
> +				   GFP_KERNEL);
> +	if (rc) {

And again there's no need to change the control transfers without a data
stage.

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
