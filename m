Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978B5C4361A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:31:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11C6422A83
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11C6422A83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9ECB42E2E7;
	Fri,  4 Dec 2020 10:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id glKA9k-sGovn; Fri,  4 Dec 2020 10:31:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9D78A2E2E9;
	Fri,  4 Dec 2020 10:31:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9461CC0FA8;
	Fri,  4 Dec 2020 10:31:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23CACC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 13E9B2E2FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MIpL8gj87XiL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:31:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by silver.osuosl.org (Postfix) with ESMTPS id E68F82E2E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:31:05 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id v14so6983931lfo.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 02:31:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p7ZO64XFAqlynf54Tsh5NtxeNVFHw07zw3NM66Di12Y=;
 b=UQknj5l2kInHNc6Bh3jCK2vAHeExTbnKVJasvp/PHqyLwFt+O7gehO/zz2GT5wMT0K
 btnHE4SHb+28FSn5iUstbqmXyZG2SLtxGSi7sBetWENbxwvWyhpb8pJ4ZDfjK69B6Vcs
 e++fLxtYJRn2N2rt0GLn2pZt60LsvbIViBFEJJLNLngUx+EVrLD50aBVKLHUFkjEV6WQ
 E8u0EGEjK+qXAr8Lpwp2vpaavDo3eQo8DfwGeHnlFLAhVo+gqzTuP7aFLDWEwE0WOq5g
 iDUYUkQKJFYbj1/NtgDW0bzh+AVhDSo/ZiNXRyR3araHoPSHTgpY0Lzt+bnDVuiLuiCW
 2kCA==
X-Gm-Message-State: AOAM5307L4RlWkNWI5qX/nPoP8MCNZmiynxfGxK8FQpIOuPTYQraKeUn
 jtbLcm1oc3Rokj7qXMfjo8M=
X-Google-Smtp-Source: ABdhPJxZlkAasnp0Gofo2Z64k1d8USZDkxteQ7WmXWfbNOb35uAB6yTX2tqQGa2/HNy76uA6RGIZYw==
X-Received: by 2002:ac2:4da1:: with SMTP id h1mr2972715lfe.412.1607077864198; 
 Fri, 04 Dec 2020 02:31:04 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id h11sm1567111ljl.123.2020.12.04.02.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:31:03 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl8NF-0005X3-9A; Fri, 04 Dec 2020 11:31:37 +0100
Date: Fri, 4 Dec 2020 11:31:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8oQCfGmITiKVvfI@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <20201104064703.15123-15-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-15-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 14/15] usb: serial: keyspan_pda:
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

On Wed, Nov 04, 2020 at 12:17:02PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
> usb_control_msg() with proper error check. Hence use the wrappers
> instead of calling usb_control_msg() directly.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/usb/serial/keyspan_pda.c | 172 +++++++++++++------------------
>  1 file changed, 72 insertions(+), 100 deletions(-)
> 
> diff --git a/drivers/usb/serial/keyspan_pda.c b/drivers/usb/serial/keyspan_pda.c
> index c1333919716b..44e1c4490fa9 100644
> --- a/drivers/usb/serial/keyspan_pda.c
> +++ b/drivers/usb/serial/keyspan_pda.c

There were some changes done to this driver around the same time that
you submitted these so this one needs to be rebased.

> @@ -359,22 +361,11 @@ static int keyspan_pda_get_modem_info(struct usb_serial *serial,
>  				      unsigned char *value)
>  {
>  	int rc;
> -	u8 *data;
> -
> -	data = kmalloc(1, GFP_KERNEL);
> -	if (!data)
> -		return -ENOMEM;
> -
> -	rc = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
> -			     3, /* get pins */
> -			     USB_TYPE_VENDOR|USB_RECIP_INTERFACE|USB_DIR_IN,
> -			     0, 0, data, 1, 2000);
> -	if (rc == 1)
> -		*value = *data;
> -	else if (rc >= 0)
> -		rc = -EIO;
> -
> -	kfree(data);
> +	rc = usb_control_msg_recv(serial->dev, 0,
> +				  3, /* get pins */
> +				  USB_TYPE_VENDOR | USB_RECIP_INTERFACE |
> +				  USB_DIR_IN, 0, 0, value, 1, 2000,
> +				  GFP_KERNEL);
>  	return rc;
>  }

Please only change the requests with a data stage like this one, but
avoid breaking the request argument over multiple lines.

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
