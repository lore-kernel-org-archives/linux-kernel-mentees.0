Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AE3C6FA82
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Sep 2022 18:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F44340A88;
	Fri,  2 Sep 2022 18:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F44340A88
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C6krQAkm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rb5pDFUx39iw; Fri,  2 Sep 2022 18:12:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D65E1408A8;
	Fri,  2 Sep 2022 18:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D65E1408A8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA086C0032;
	Fri,  2 Sep 2022 18:12:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13629C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Sep 2022 18:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C551141A69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Sep 2022 18:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C551141A69
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=C6krQAkm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W9wTmKR-DYWx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Sep 2022 18:12:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99AF9410CB
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99AF9410CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Sep 2022 18:12:49 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 u9-20020a17090a1f0900b001fde6477464so6231744pja.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Sep 2022 11:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=qXSasRBrbour0DrsSR74a0zFIaNcb92JbMh4N3aL/kk=;
 b=C6krQAkmnZUXAZUOemiCFBIp9svy4FoRuDZAaY8WLKWUHUT4blV3Qvv/QPscBe0DfX
 EeLXAJY5vlW7UYtwsiCVK1ML+s/KgwQezy+eKOxOWJMUrllqxTNJv1lox5esLSjYiSv5
 HICoGgGhv2maNaoE9+ZQG0UhzQSq6HDzJ5vcuWBuUJEiSVA/qRUuPOeJFJQ2RbZJ9e58
 tMXZI+cE53KqxgoiywdaQ8eR7OOYnMi1j4TfyqWFaa77xPyfaaL8msmnfQqGGGk6DTWP
 MHl5i6HdkYQKruQHr3qTB85j4aqIXNsVXF+8T5ciRpdU38Z3/wlvDA/jLGoLVThK4xSp
 HdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=qXSasRBrbour0DrsSR74a0zFIaNcb92JbMh4N3aL/kk=;
 b=Iu/aVaaFwR4K5ZQ/eoJGbXa0aMR/znU6Cda97aOxo0XDp8h0GYpyvoLru+lssYC1vD
 P/fqMw8gwHoJw3kqhkiRXmbOud8p6YshHWiLraDki2V6dO8bfOUi5TvG6w1ftsCvLjk4
 M0s2MOU74K20zcbms7I+NlfieRKun3HjX2JwDRyFMan55JbNccEyu3VE4T0uqv4R/0UX
 Z8GNInTqWAvk57OFQor+PH31oXMjdPXPsy8Rgl5zBGkj5bAHVSBa5JuY2mikREJkIhox
 6RzIHA7scHtjJ8RWJNmbSpd3hwvH16TObmFkSg+WBHObxORCMl8ke3Dk4KgvvuszjUXr
 +ugw==
X-Gm-Message-State: ACgBeo1Ng1p6mQQBnGTedpM9QjjWnKcX/YLRIHgKUxIZEVScRTOVvfto
 UUcFrZg+4DCB0jyoWNVww+o=
X-Google-Smtp-Source: AA6agR7oSpGsec3utVnjIXVkhP+SLTmGHlFdC1QX6zt+RkmXC275Y+Q+LembaNt84cTdLMWkknEN2A==
X-Received: by 2002:a17:902:d4c4:b0:172:f328:e474 with SMTP id
 o4-20020a170902d4c400b00172f328e474mr36902644plg.144.1662142368939; 
 Fri, 02 Sep 2022 11:12:48 -0700 (PDT)
Received: from biggie ([103.230.148.184]) by smtp.gmail.com with ESMTPSA id
 z4-20020a626504000000b005375a574846sm2123232pfb.125.2022.09.02.11.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 11:12:48 -0700 (PDT)
Date: Fri, 2 Sep 2022 23:42:41 +0530
From: Gautam Menghani <gautammenghani201@gmail.com>
To: sean@mess.org, mchehab@kernel.org
Subject: Re: [PATCH] drivers/media/rc: Ensure usb_submit_urb() is not called
 if write is in progress
Message-ID: <YxJHmYDMtmzaHWQG@biggie>
References: <20220814142543.24910-1-gautammenghani201@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814142543.24910-1-gautammenghani201@gmail.com>
Cc: syzbot+0c3cb6dc05fbbdc3ad66@syzkaller.appspotmail.com, hdanton@sina.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
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

On Sun, Aug 14, 2022 at 07:55:42PM +0530, Gautam Menghani wrote:
> The warning "URB submitted while active" is reported if the function
> send_packet() in imon.c is called if a write is already is in progress.
> Add a check to return -EBUSY in case a write is already is in progress.
> Also, mark tx.busy as false after transmission is completed.
> 
> Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
> Cc: hdanton@sina.com
> Suggested-by: hdanton@sina.com
> Link: https://syzkaller.appspot.com/bug?id=e378e6a51fbe6c5cc43e34f131cc9a315ef0337e
> Reported-by: syzbot+0c3cb6dc05fbbdc3ad66@syzkaller.appspotmail.com
> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> ---
>  drivers/media/rc/imon.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> index 735b925da998..a5b997c2c7e2 100644
> --- a/drivers/media/rc/imon.c
> +++ b/drivers/media/rc/imon.c
> @@ -598,6 +598,8 @@ static int send_packet(struct imon_context *ictx)
>  	int retval = 0;
>  	struct usb_ctrlrequest *control_req = NULL;
>  
> +	if (ictx->tx.busy)
> +		return -EBUSY;
>  	/* Check if we need to use control or interrupt urb */
>  	if (!ictx->tx_control) {
>  		pipe = usb_sndintpipe(ictx->usbdev_intf0,
> @@ -654,6 +656,7 @@ static int send_packet(struct imon_context *ictx)
>  			pr_err_ratelimited("task interrupted\n");
>  		}
>  		mutex_lock(&ictx->lock);
> +		ictx->tx.busy = false;
>  
>  		retval = ictx->tx.status;
>  		if (retval)
> -- 
> 2.34.1
> 
Hi,

Please review the above fix and let me know if any changes are needed.

Thanks,
Gautam
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
