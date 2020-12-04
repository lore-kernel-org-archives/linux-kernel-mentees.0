Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECE8C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:33:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEC82225AB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEC82225AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 55D67204B4;
	Fri,  4 Dec 2020 09:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LCVxbvukkTEg; Fri,  4 Dec 2020 09:33:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4AA96203BD;
	Fri,  4 Dec 2020 09:33:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14DBAC0FA7;
	Fri,  4 Dec 2020 09:33:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8392C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2F5F084C53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 897eOvYG-Mel
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:33:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D03ED8825F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:33:35 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id o24so5841087ljj.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 01:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SAJ9D9uj5Zq76FuUuV8xz2nCj2G+XGK+GvqkMWkny8s=;
 b=CK0WTfZCMKceDr4IGgM09Y1wprTj2Kom4A+s10HbG14jGzHgtgaGHjuoG9oPKcKSBO
 wUjUA/SzMt1/F0CdOdjZ+joVbko3YFJFnabOlfmC66MxxLX07EEogHuuZiDmmXAQPB2H
 7RcyhD3ur3TfzTURs08PlbN1HJH+8G+/+OTtbFnBUglJN11IfHsq7qTlsgC8ZOkNVVA9
 2YzXQG/68gC48nU2lntwzEcoN0WNgr5mYPhtzbUOrLA7Ayeme9sG+ecuEDl4qnFy6DaH
 pkKsBm7xM9GGKSakMftvztVZJAffp02DV+GocAk5Ne2rhUNvoP8yQ06CkHJ5mXjTfS2H
 IRsQ==
X-Gm-Message-State: AOAM531AHulmneVImq/s/XcoW6OtbpiRmdZi2u4xJeqgRDsdScPdlqAV
 1159KEFp/krIUpMS3SvqLb0=
X-Google-Smtp-Source: ABdhPJxSZ2ozkEJDjJJ/GIC4/dLfUlCpm5phPYEi7LxsaHDGv1ydP+J0ohhUW6ao5MAeYHGvqbOb7w==
X-Received: by 2002:a2e:8041:: with SMTP id p1mr3110571ljg.291.1607074414057; 
 Fri, 04 Dec 2020 01:33:34 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id v7sm1501987lfd.235.2020.12.04.01.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:33:33 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl7Ta-0005N3-Bi; Fri, 04 Dec 2020 10:34:07 +0100
Date: Fri, 4 Dec 2020 10:34:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8oCjmT1czYZfL3k@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <20201104064703.15123-5-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-5-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 04/15] usb: serial: cp210x: use
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

On Wed, Nov 04, 2020 at 12:16:52PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
> usb_control_msg() with proper error check. Hence use the wrappers
> instead of calling usb_control_msg() directly.

This too is a good example of when the new helpers can be used, but
please mention the transfer buffers here are that is the primary reason.

> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/usb/serial/cp210x.c | 148 ++++++++++--------------------------
>  1 file changed, 42 insertions(+), 106 deletions(-)
> 
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index d0c05aa8a0d6..29436ab392e8 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -555,31 +555,15 @@ static int cp210x_read_reg_block(struct usb_serial_port *port, u8 req,
>  {
>  	struct usb_serial *serial = port->serial;
>  	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
> -	void *dmabuf;
>  	int result;
>  
> -	dmabuf = kmalloc(bufsize, GFP_KERNEL);
> -	if (!dmabuf) {
> -		/*
> -		 * FIXME Some callers don't bother to check for error,
> -		 * at least give them consistent junk until they are fixed
> -		 */
> -		memset(buf, 0, bufsize);
> -		return -ENOMEM;
> -	}
> -
> -	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
> -			req, REQTYPE_INTERFACE_TO_HOST, 0,
> -			port_priv->bInterfaceNumber, dmabuf, bufsize,
> -			USB_CTRL_SET_TIMEOUT);
> -	if (result == bufsize) {
> -		memcpy(buf, dmabuf, bufsize);
> -		result = 0;
> -	} else {
> +	result = usb_control_msg_recv(serial->dev, 0, req,
> +				      REQTYPE_INTERFACE_TO_HOST, 0,
> +				      port_priv->bInterfaceNumber, buf, bufsize,
> +				      USB_CTRL_SET_TIMEOUT, GFP_KERNEL);

Please keep the existing indentation style. That way you don't need to
change the middle-two argument lines just to align the arguments.

> +	if (result) {
>  		dev_err(&port->dev, "failed get req 0x%x size %d status: %d\n",
> -				req, bufsize, result);
> -		if (result >= 0)
> -			result = -EIO;
> +			req, bufsize, result);

Nit: This is an unrelated indentation change.

>  
>  		/*
>  		 * FIXME Some callers don't bother to check for error,
> @@ -588,8 +572,6 @@ static int cp210x_read_reg_block(struct usb_serial_port *port, u8 req,
>  		memset(buf, 0, bufsize);
>  	}
>  
> -	kfree(dmabuf);
> -
>  	return result;
>  }
>  
> @@ -648,29 +630,16 @@ static int cp210x_read_u8_reg(struct usb_serial_port *port, u8 req, u8 *val)
>  static int cp210x_read_vendor_block(struct usb_serial *serial, u8 type, u16 val,
>  				    void *buf, int bufsize)
>  {
> -	void *dmabuf;
>  	int result;
>  
> -	dmabuf = kmalloc(bufsize, GFP_KERNEL);
> -	if (!dmabuf)
> -		return -ENOMEM;
> -
> -	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
> -				 CP210X_VENDOR_SPECIFIC, type, val,
> -				 cp210x_interface_num(serial), dmabuf, bufsize,
> -				 USB_CTRL_GET_TIMEOUT);
> -	if (result == bufsize) {
> -		memcpy(buf, dmabuf, bufsize);
> -		result = 0;
> -	} else {
> +	result = usb_control_msg_recv(serial->dev, 0, CP210X_VENDOR_SPECIFIC,
> +				      type, val, cp210x_interface_num(serial),
> +				      buf, bufsize, USB_CTRL_GET_TIMEOUT,
> +				      GFP_KERNEL);
> +	if (result)
>  		dev_err(&serial->interface->dev,
>  			"failed to get vendor val 0x%04x size %d: %d\n", val,
>  			bufsize, result);
> -		if (result >= 0)
> -			result = -EIO;
> -	}

Nit: Please keep the brackets around multiline single statements since
it improves readability.

Similar comments apply to the rest of the patch.

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
