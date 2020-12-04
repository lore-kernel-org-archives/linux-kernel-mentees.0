Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A7AC4361A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:11:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 801CF22518
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 801CF22518
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EA73D88270;
	Fri,  4 Dec 2020 10:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWO3okhYN4l5; Fri,  4 Dec 2020 10:11:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 55D1088267;
	Fri,  4 Dec 2020 10:11:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C60AC0FA8;
	Fri,  4 Dec 2020 10:11:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D2CEC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 686EC88270
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJTDRx6EbKro
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:11:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5DC4088267
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:11:44 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id f18so5933046ljg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 02:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jNdpZlqvqX5QAC5zu+Jn8FchOaK5H7Mm4a1A+uo1p1k=;
 b=IlxaAiEBSFCUu06cr5kpB0T5RD8wG5mFdnmxTQ88blLASJPfGkMWTKrg/G5OrrjBDY
 ClYT9hZ1pH51T4XAgRLVJzCHTtSxuJpjNGwW38HuRPgRgkwBHkyLyQNDlZPyiBuPGh6t
 Z5lnLwLa2mnmU0QCHIyFb7CKXXfcHL8busRjuZfN5qX7u0Via6DNfhzdWgluvArX+oGm
 gCMbdVAJK/6L08AQB/8dpqjWoFEEwq6S2YQh8/67SOK2XAlTeZAGcqUFLWG7NX+5plid
 ZqPsleyPRpYLxOo5cW1nOYNGcAF48qNdbHhyBpeE8FGJWzpCXFMpbF2c4XNIGGyIsBmd
 DYCA==
X-Gm-Message-State: AOAM530ZV6/TQ6G2sWl91GUWas80k5iFmfiD/PaIzXJzoVM7eQYIkHC6
 xw2AB3LWMSaHcZvtfHLWRTE=
X-Google-Smtp-Source: ABdhPJzblxcq4NrwwVYrRtiu2nGfAmr8E7baDGxCAo7kG6rtaIRgH4XttaI1NcptI7i14Z1HXG92Gg==
X-Received: by 2002:a05:651c:503:: with SMTP id
 o3mr2957726ljp.253.1607076702695; 
 Fri, 04 Dec 2020 02:11:42 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id o72sm1514042lfa.278.2020.12.04.02.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:11:41 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl84V-0005TH-SF; Fri, 04 Dec 2020 11:12:15 +0100
Date: Fri, 4 Dec 2020 11:12:15 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8oLf3cLChRjWqPp@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <20201104064703.15123-11-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-11-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 10/15] usb: serial: io_ti: use
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

On Wed, Nov 04, 2020 at 12:16:58PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
> usb_control_msg() with proper error check. Hence use the wrappers
> instead of calling usb_control_msg() directly
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/usb/serial/io_ti.c | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
> index c327d4cf7928..ab2370b80b3c 100644
> --- a/drivers/usb/serial/io_ti.c
> +++ b/drivers/usb/serial/io_ti.c
> @@ -260,16 +260,12 @@ static int ti_vread_sync(struct usb_device *dev, __u8 request,
>  {
>  	int status;
>  
> -	status = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), request,
> -			(USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN),
> -			value, index, data, size, 1000);
> -	if (status < 0)
> +	status = usb_control_msg_recv(dev, 0, request, USB_TYPE_VENDOR |
> +				      USB_RECIP_DEVICE | USB_DIR_IN, value,
> +				      index, data, size, 1000, GFP_KERNEL);
> +	if (status)
>  		return status;
> -	if (status != size) {
> -		dev_dbg(&dev->dev, "%s - wanted to write %d, but only wrote %d\n",
> -			__func__, size, status);
> -		return -ECOMM;
> -	}
> +
>  	return 0;
>  }
>  
> @@ -278,16 +274,12 @@ static int ti_vsend_sync(struct usb_device *dev, u8 request, u16 value,
>  {
>  	int status;
>  
> -	status = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), request,
> -			(USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT),
> -			value, index, data, size, timeout);
> -	if (status < 0)
> +	status = usb_control_msg_send(dev, 0, request, USB_TYPE_VENDOR |
> +				      USB_RECIP_DEVICE | USB_DIR_OUT, value,
> +				      index, data, size, timeout, GFP_KERNEL);
> +	if (status)
>  		return status;
> -	if (status != size) {
> -		dev_dbg(&dev->dev, "%s - wanted to write %d, but only wrote %d\n",
> -			__func__, size, status);
> -		return -ECOMM;
> -	}
> +
>  	return 0;
>  }

These helper are only used with DMA-able buffers so this change
introduces an additional redundant allocation and memcpy for every call
for no real gain.

Please drop this one as well.

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
