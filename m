Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030A9C4361A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:15:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62272225AB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62272225AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D027387C3A;
	Fri,  4 Dec 2020 09:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNkg+FrORvGw; Fri,  4 Dec 2020 09:15:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E5D6187BF7;
	Fri,  4 Dec 2020 09:15:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9FF5C0FA8;
	Fri,  4 Dec 2020 09:15:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4A90C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D23282E1DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fZ+xDHmJv406
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:15:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 9968420773
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:15:36 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id s27so6717391lfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 01:15:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2w+hvHmoycBrYqhlFBPhlUg+uer0Xd0qnW1dlujjKZg=;
 b=njIQ3iWej9l1vSif/qwiHMT6O2R6yPgWvjKjcQpNT2yKmbKjRfOvgD9UpZpwyLht6O
 XHaB4C3mhpyEBBmI6xpfUbDDhoJ6ceVPCtQid8KsrSG2hTfSf6tlhfd3nAxkex2T01uq
 9L0xQ4RcgUBlLnuBzLbtwufl48mEAPMSkkUhnffmsC1iV8xkZnJmIoX0w7jf7/45bUy5
 i//WydoGIIMpSsziETn8I569DRCPgD0JGXXZAmjjcL7knAucXk7wdiyry/1HdVe9qN2C
 tXL2ijdUD9gGYBAxl1i4T6ytin8XrvtXD5+p4UW02r06vpE1jJLONJNOP2EJfANhs+sQ
 LAnw==
X-Gm-Message-State: AOAM531AlmI+D8D/4voy6H+40Mzg8YTn1ZSTe1qUeVXepTfbzlkMWwru
 O/ohUP0A8AmmjCD4XNLL9Ps=
X-Google-Smtp-Source: ABdhPJxWJyXBi10AP5Y1K8KMe0RN7psz/1ldOU0zysNkCpLIsFp8UZqti4yVZ3ezL9i2vyOegmeJYA==
X-Received: by 2002:a19:ec09:: with SMTP id b9mr3098138lfa.178.1607073334899; 
 Fri, 04 Dec 2020 01:15:34 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id f18sm1474034lfc.198.2020.12.04.01.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:15:34 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl7CB-0005KA-Or; Fri, 04 Dec 2020 10:16:07 +0100
Date: Fri, 4 Dec 2020 10:16:07 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8n+V22wFnUEy69N@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <20201104064703.15123-2-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-2-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 01/15] usb: serial: ark3116: use
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

On Wed, Nov 04, 2020 at 12:16:49PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
> usb_control_msg() with proper error check. Hence use the wrappers
> instead of calling usb_control_msg() directly.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/usb/serial/ark3116.c | 29 ++++-------------------------
>  1 file changed, 4 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/usb/serial/ark3116.c b/drivers/usb/serial/ark3116.c
> index 71a9206ea1e2..51302892c779 100644
> --- a/drivers/usb/serial/ark3116.c
> +++ b/drivers/usb/serial/ark3116.c
> @@ -77,38 +77,17 @@ struct ark3116_private {
>  static int ark3116_write_reg(struct usb_serial *serial,
>  			     unsigned reg, __u8 val)
>  {
> -	int result;
>  	 /* 0xfe 0x40 are magic values taken from original driver */
> -	result = usb_control_msg(serial->dev,
> -				 usb_sndctrlpipe(serial->dev, 0),
> -				 0xfe, 0x40, val, reg,
> -				 NULL, 0, ARK_TIMEOUT);
> -	if (result)
> -		return result;
> -
> -	return 0;
> +	return usb_control_msg_send(serial->dev, 0, 0xfe, 0x40, val, reg, NULL, 0,
> +				    ARK_TIMEOUT, GFP_KERNEL);

For control transfers without a data stage there's no point in using
usb_control_msg_send() as it already returns a negative errno on error
or 0 on success.

>  }
>  
>  static int ark3116_read_reg(struct usb_serial *serial,
>  			    unsigned reg, unsigned char *buf)
>  {
> -	int result;
>  	/* 0xfe 0xc0 are magic values taken from original driver */
> -	result = usb_control_msg(serial->dev,
> -				 usb_rcvctrlpipe(serial->dev, 0),
> -				 0xfe, 0xc0, 0, reg,
> -				 buf, 1, ARK_TIMEOUT);
> -	if (result < 1) {
> -		dev_err(&serial->interface->dev,
> -				"failed to read register %u: %d\n",
> -				reg, result);
> -		if (result >= 0)
> -			result = -EIO;
> -
> -		return result;
> -	}
> -
> -	return 0;
> +	return usb_control_msg_recv(serial->dev, 0, 0xfe, 0xc0, 0, reg, buf, 1,
> +				    ARK_TIMEOUT, GFP_KERNEL);

This driver already use a DMA-able transfer buffer which is allocated
once and then passed to this helper repeatedly. This change would
introduce additional redandant memdup + memcpy for every call and for no
real gain.

You also have an unrelated change here as you simply remove an existing
error message.

Please drop this patch.

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
