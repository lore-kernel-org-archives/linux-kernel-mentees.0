Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FEFC4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Oct 2023 18:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4A9B4342D;
	Sun, 29 Oct 2023 18:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4A9B4342D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=philpotter-co-uk.20230601.gappssmtp.com header.i=@philpotter-co-uk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=zvkPdaGV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQ_G43oqTupt; Sun, 29 Oct 2023 18:56:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5507F43057;
	Sun, 29 Oct 2023 18:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5507F43057
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2AFD7C0071;
	Sun, 29 Oct 2023 18:56:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7843BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 18:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51B4E4340C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 18:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51B4E4340C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0RbUm4iDWnKM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 18:56:24 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4EFA43057
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 18:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4EFA43057
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40837ebba42so25400705e9.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 11:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philpotter-co-uk.20230601.gappssmtp.com; s=20230601; t=1698605782;
 x=1699210582; darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J67VL168EXCg6ojlawoeEdohbeM+0KOOSBveNBY5m+E=;
 b=zvkPdaGVZ2dJL7uZ7YLWnPw4A484SA8YpzpvF1CA6w6ooeBO23plgyOEmW62clVdlZ
 EY87kAMnpV+5YyFbzH2c5Hz6eUOQYC15gzE64isi1g07Sn2H3utz4FVDyR9MPdeLIvYX
 /jHcsor92nMvrZWiiZ2qjY5Zbzglx8Hy0DIhAUcZs/5Ta3183EuifvocwTRQ5wXJTybG
 OkVNhidhKncRwyD4Fcc9OCoh2otfQxrqw5ZSrybohZHEoVMSSHBZ1Gs+tSuSBhfBjlUb
 SwuGAn4OWOunKEzSzKAH5rw3dIUXeqF4XyecM+ntGF/8eqgP5AMFQIFkDOww/gS+Gycr
 jrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698605782; x=1699210582;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J67VL168EXCg6ojlawoeEdohbeM+0KOOSBveNBY5m+E=;
 b=c2j85ZDsxvoHWSvVV2XwumjOt+9Ow8+mPDqUAAVDa33iXXVMHufUzt6iwzWDomExqb
 nOSMZBrbDlKwIML2G/BBF1RFU31mFPJHLHrpHjHXW67Uc3JN4L5xFNqQHJ5hUbekT342
 uuA+2PmZOy192pOz8YsOxrPQS77jALG/EQdnn8bnT6EMDdht8Dzin/rB/SEkR7zNvKoA
 aySi0vDrNZ4KJ4SzlPwDp1Rw8ubq0wbZo6ToWpTmR+kvfmKXcPz9OCslJUGRh5Qq4T2d
 CdULTYTZQW5NPeTnzwzqAtOIGKl34PQEFe3/FqTMw7ruTFPsv6Rg0VhCAuN3A6Us+rTL
 Ox/g==
X-Gm-Message-State: AOJu0Yz+0QB3uxHNMMJf6VMklc8tMI+BEKx/z//ZdhzbAMt8ygPTnTH/
 /7kTtum3xp4B65ofEDUzgBkfoA==
X-Google-Smtp-Source: AGHT+IEx7mOV5mtjPDIUnMqi5wFMtmVOBit1RmyI2VibBuYXKM6oc4W/CvwPUo2+uRuoyRXpwedhLA==
X-Received: by 2002:a05:600c:1d08:b0:408:4d0e:68ac with SMTP id
 l8-20020a05600c1d0800b004084d0e68acmr6486650wms.32.1698605781525; 
 Sun, 29 Oct 2023 11:56:21 -0700 (PDT)
Received: from equinox
 (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:dfde:e1a0::2]) by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c19d200b00401b242e2e6sm10725528wmq.47.2023.10.29.11.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 11:56:20 -0700 (PDT)
Date: Sun, 29 Oct 2023 18:56:19 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Subject: Re: [PATCH] media: stk1160: Fixed high volume of stk1160_dbg messages
Message-ID: <ZT6q0xhAsHmX9GZQ@equinox>
References: <20231029143604.120329-1-ghanshyam1898@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231029143604.120329-1-ghanshyam1898@gmail.com>
Cc: mchehab@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Sun, Oct 29, 2023 at 08:06:04PM +0530, Ghanshyam Agrawal wrote:
> The function stk1160_dbg gets called too many times, which causes
> the output to get flooded with messages. Since stk1160_dbg uses
> printk, it is now replaced with printk_ratelimited directly.
> 
> Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> ---
>  drivers/media/usb/stk1160/stk1160-video.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> index 4e966f6bf608..f5b75f380c19 100644
> --- a/drivers/media/usb/stk1160/stk1160-video.c
> +++ b/drivers/media/usb/stk1160/stk1160-video.c
> @@ -105,17 +105,6 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
>  	u8 *dst = buf->mem;
>  	int remain;
>  
> -	/*
> -	 * TODO: These stk1160_dbg are very spammy!
> -	 * We should 1) check why we are getting them
> -	 * and 2) add ratelimit.
> -	 *
> -	 * UPDATE: One of the reasons (the only one?) for getting these
> -	 * is incorrect standard (mismatch between expected and configured).
> -	 * So perhaps, we could add a counter for errors. When the counter
> -	 * reaches some value, we simply stop streaming.
> -	 */
> -
>  	len -= 4;
>  	src += 4;
>  
> @@ -151,7 +140,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
>  
>  	/* Let the bug hunt begin! sanity checks! */
>  	if (lencopy < 0) {
> -		stk1160_dbg("copy skipped: negative lencopy\n");
> +		printk_ratelimited("copy skipped: negative lencopy\n");
>  		return;
>  	}
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Hi Ghanshyam,

As we've conversed about this via other comms channels, thought I'd
offer my comments here for what they are worth. Thanks for the patch
firstly.

Few things I would change though:
(1) Keep the comment around perhaps, but modify/move it, to specify the
    reason for the ratelimiting is caused by standard mismatches.
    Perhaps also leave a note about the possibility of it being due to
    other problems also, given the comment says "the only one?" posed as
    a question.
(2) For consistency, probably worth making use of KERN_WARNING in your
    new printk_ratelimited call.

All the best.

Regards,
Phil
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
