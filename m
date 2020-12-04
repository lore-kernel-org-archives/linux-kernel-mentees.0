Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9B6C4361A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:37:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8CAF227BF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8CAF227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4628E876AA;
	Fri,  4 Dec 2020 09:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLKZmKICmLzV; Fri,  4 Dec 2020 09:37:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE726874C7;
	Fri,  4 Dec 2020 09:37:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A586C0FA7;
	Fri,  4 Dec 2020 09:37:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD424C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C5A5A87A31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJbEjTJCTe6v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:37:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4B4298720E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:37:16 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id s30so6794653lfc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 01:37:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rCis0KUuTW9MGXUF26gw5+ReaZfnt50i53XCblKc1Wc=;
 b=n0iWe6VCgBQGqC7uCIa0YdWVe5JDxu+kN2wtmoNTbe1EwDn2tcKYUHArFScAawILE5
 pfbeGmNKJ2Uqd4oivR/5Th3SuoCEqgpMcy+jvHcu5dF23hYl4SnpLFWiopOZxqD7ORMM
 k7lb1liIWTNMG9QTDsXr7tWSgXRE4uCDqA7vcx8YTwaJdaxp7D+Qit8yd851YNeUrzON
 VzSXPK9oEWm3h2QWmnHgcK+V+kRv/2Sm4T0uQ/9kEbNHcEQ3F4/rDtoeFAgaka/dZGa5
 lUI3y33SXtinhoaoKEjAyQ5usK6htu8HH9uLxHiuYUVwmUC4oayQdxSMcjggwxfp6SHy
 CsRA==
X-Gm-Message-State: AOAM531C3qz3Foy9nMF31IgIx16fQKzy4ne7rLb0iEOuLwchT53qf0id
 EdZ74b8LdbFnYUQ9fga4vmEqyKu3NEDI+g==
X-Google-Smtp-Source: ABdhPJylHu3wEWK+g+aeq+PFtsJgpSrucwZEYGSqo2cpTcXTOSxrbVnYcNp1CRlFhYPcZT6/WnGu3Q==
X-Received: by 2002:ac2:50d2:: with SMTP id h18mr2723674lfm.169.1607074633924; 
 Fri, 04 Dec 2020 01:37:13 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id m28sm1491799lfo.10.2020.12.04.01.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:37:13 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl7X8-0005Ni-UI; Fri, 04 Dec 2020 10:37:47 +0100
Date: Fri, 4 Dec 2020 10:37:46 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8oDaiqW2K+t69JI@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <20201104064703.15123-6-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-6-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 05/15] usb: serial: cypress_m8:
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

On Wed, Nov 04, 2020 at 12:16:53PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
> usb_control_msg() with proper error check. Hence use the wrappers
> instead of calling usb_control_msg() directly.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/usb/serial/cypress_m8.c | 38 +++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
> index cc028601c388..4d66cab8eece 100644
> --- a/drivers/usb/serial/cypress_m8.c
> +++ b/drivers/usb/serial/cypress_m8.c
> @@ -341,20 +341,21 @@ static int cypress_serial_control(struct tty_struct *tty,
>  			feature_buffer[4]);
>  
>  		do {
> -			retval = usb_control_msg(port->serial->dev,
> -					usb_sndctrlpipe(port->serial->dev, 0),
> -					HID_REQ_SET_REPORT,
> -					USB_DIR_OUT | USB_RECIP_INTERFACE | USB_TYPE_CLASS,
> -					0x0300, 0, feature_buffer,
> -					feature_len, 500);
> +			retval = usb_control_msg_send(port->serial->dev, 0,
> +						      HID_REQ_SET_REPORT,
> +						      USB_DIR_OUT |
> +						      USB_RECIP_INTERFACE |
> +						      USB_TYPE_CLASS, 0x0300,
> +						      0, feature_buffer,
> +						      feature_len, 500,
> +						      GFP_KERNEL);
>  
>  			if (tries++ >= 3)
>  				break;
>  
> -		} while (retval != feature_len &&
> -			 retval != -ENODEV);
> +		} while (retval != -ENODEV);

Here you actually break the logic; after this change the driver will
always retry as the test for success is removed.

>  
> -		if (retval != feature_len) {
> +		if (retval) {
>  			dev_err(dev, "%s - failed sending serial line settings - %d\n",
>  				__func__, retval);
>  			cypress_set_dead(port);
> @@ -379,19 +380,20 @@ static int cypress_serial_control(struct tty_struct *tty,
>  		}
>  		dev_dbg(dev, "%s - retrieving serial line settings\n", __func__);
>  		do {
> -			retval = usb_control_msg(port->serial->dev,
> -					usb_rcvctrlpipe(port->serial->dev, 0),
> -					HID_REQ_GET_REPORT,
> -					USB_DIR_IN | USB_RECIP_INTERFACE | USB_TYPE_CLASS,
> -					0x0300, 0, feature_buffer,
> -					feature_len, 500);
> +			retval = usb_control_msg_recv(port->serial->dev, 0,
> +						      HID_REQ_GET_REPORT,
> +						      USB_DIR_IN |
> +						      USB_RECIP_INTERFACE |
> +						      USB_TYPE_CLASS, 0x0300,
> +						      0, feature_buffer,
> +						      feature_len, 500,
> +						      GFP_KERNEL);
>  
>  			if (tries++ >= 3)
>  				break;
> -		} while (retval != feature_len
> -						&& retval != -ENODEV);
> +		} while (retval != -ENODEV);

Same here.

>  
> -		if (retval != feature_len) {
> +		if (retval) {
>  			dev_err(dev, "%s - failed to retrieve serial line settings - %d\n",
>  				__func__, retval);
>  			cypress_set_dead(port);

As the driver is already using a DMA-able buffer and is reusing it for
every retry as well, this change is now introducing redundant memdup +
memcpy for each call.

I suggest just dropping this one.

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
