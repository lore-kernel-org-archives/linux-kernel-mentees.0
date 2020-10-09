Return-Path: <SRS0=yWZE=DQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MALFORMED_FREEMAIL,MISSING_HEADERS,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E13C43457
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 16:24:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1AD122276
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 16:24:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnTl2YiX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1AD122276
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AD6F886C4B;
	Fri,  9 Oct 2020 16:24:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fDwEzspJ8C9i; Fri,  9 Oct 2020 16:24:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4294886C45;
	Fri,  9 Oct 2020 16:24:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 316B9C016F;
	Fri,  9 Oct 2020 16:24:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B581C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 16:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 396A8877A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 16:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8Ys2gg0vILI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 16:24:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 78A2B8779E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 16:24:53 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id a200so7276393pfa.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 09 Oct 2020 09:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:cc:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Jur5Bq54qriS0f641DZfn/1aFXoa3qoJ8oSWG2dKR9E=;
 b=KnTl2YiXqu6kxvV/SiXf71ElLRsPogVU0Nuxn4Iw9xjXknnLTXVMrXCiB4Icr4tKGS
 JxfB6gZAlefX7i66UCihpRBYz8xN0MjCD0AitIgSpibXrwzwVh1cqhRv3wIEdJ0mPMiC
 636xzIVwXFe/ViO0wd0KQayuzDGmYK9d6oSkva474NyQXRI1drMIMYGPc+IycmiNxKPN
 /d69sbKv/H6LJQH/igU/8ptOlIzHapHD3B3WtaVW31rKW/r2J8dXI91eM5UfSzc9+29S
 KSxPDaQ0YEc3t8Vlo5Gz8NFrF2aanuoOHwl/3Fu56nfcu6oL4iSifVIKJzhQknJj4K4G
 5rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Jur5Bq54qriS0f641DZfn/1aFXoa3qoJ8oSWG2dKR9E=;
 b=p9sU3AvLBCdyaTwAE2LIxaB+eMk41hkoW/cAUfXLYla3doqcoVWLn36+bEfVyhKg3n
 lahKvNT/8aQ6QRrnb7b6nSSotSBfVyy+ZcEyDzTsMNrRwv+dMfaKStM1ZkMn0P+3kVjB
 gkmMaf3ffYkucCGpJJ9e6ijpSNefg6xaq7+ab2RSJaaeu6Ln86jLbnw+xBJ/WoRG/8xW
 PWQyzHtV7+kHMOd6P0IjkphVzH15Gea5kgB65R4ZcLQoPil4poqzrtrCWpgTz/EjdWvF
 oABlwAhydOwQq8uRzWk9aPrHCqrtbwhCT+MTFFkM3iwUHpX9CDcjaRMVm1VqXtgnZmQ8
 6J7A==
X-Gm-Message-State: AOAM530mqU35ZWTyCQ2UztIsgq7wuS7RPsx6DpLk8c9coRhi3YSi5Waw
 eW7cEoXf/zg1lxHtnN4EMoc=
X-Google-Smtp-Source: ABdhPJwX59dsYqV7LKdMHJ+iopNl3ggAeS1pu/x2L71uhzAnMQYFAiF2RMg5h9sMWuU5mLbFJF4Pvg==
X-Received: by 2002:a17:90a:1861:: with SMTP id
 r88mr5359154pja.222.1602260692871; 
 Fri, 09 Oct 2020 09:24:52 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.205.113])
 by smtp.gmail.com with ESMTPSA id o134sm11231313pfg.134.2020.10.09.09.24.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 09:24:52 -0700 (PDT)
References: <20201009161646.286286-1-anant.thazhemadam@gmail.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <21e614cc-abf7-9332-81be-c969b0fd29b6@gmail.com>
Date: Fri, 9 Oct 2020 21:54:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009161646.286286-1-anant.thazhemadam@gmail.com>
Content-Language: en-US
Cc: devel@driverdev.osuosl.org,
 syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 Ian Abbott <abbotti@mev.co.uk>, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] staging: comedi: check validity
 of wMaxPacketSize of usb endpoints found
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


On 09/10/20 9:46 pm, Anant Thazhemadam wrote:
> While finding usb endpoints in vmk80xx_find_usb_endpoints(), check if 
> wMaxPacketSize = 0 for the endpoints found.
>
> Some devices have isochronous endpoints that have wMaxPacketSize = 0
> (as required by the USB-2 spec).
> However, since this doesn't apply here, wMaxPacketSize = 0 can be
> considered to be invalid.
>
> Reported-by: syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com
> Tested-by: syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
> The error (as detected by syzbot) is generated in 
> vmk80xx_write_packet() (which is called in vmk80xx_reset_device()) when
> it tries to assign devpriv->usb_tx_buf[0] = cmd.
>
> This NULL pointer dereference issue arises because
> size = usb_endpoint_maxp(devpriv->ep_tx) = 0.
>
> This can be traced back to vmk80xx_find_usb_endpoints(), where the usb 
> endpoints are found, and assigned accordingly.
> (For some more insight, in vmk80xx_find_usb_endpoints(), 
> if one of intf->cur_altsetting->iface_desc->endpoints' desc value = 0, 
> and consequently this endpoint is assigned to devpriv->ep_tx,
> this issue gets triggered.)
>
> Checking if the wMaxPacketSize of an endpoint is invalid and returning
> an error value accordingly, seems to fix the error.
>
> We could also alternatively perform this checking (if the size is 0 or not) 
> in vmk80xx_reset_device() itself, but it only seemed like covering up the issue
> at that place, rather than fixing it, so I wasn't sure that was any better.
>
> However, if I'm not wrong, this might end up causing the probe to fail, and I'm 
> not sure if that's the right thing to do in cases like this, and if it isn't I'd
> like some input on what exactly is the required course of action in cases like this.
>
>  drivers/staging/comedi/drivers/vmk80xx.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/staging/comedi/drivers/vmk80xx.c b/drivers/staging/comedi/drivers/vmk80xx.c
> index 65dc6c51037e..cb0a965d3c37 100644
> --- a/drivers/staging/comedi/drivers/vmk80xx.c
> +++ b/drivers/staging/comedi/drivers/vmk80xx.c
> @@ -667,6 +667,9 @@ static int vmk80xx_find_usb_endpoints(struct comedi_device *dev)
>  	if (!devpriv->ep_rx || !devpriv->ep_tx)
>  		return -ENODEV;
>  
> +	if(!usb_endpoint_maxp(devpriv->ep_rx) || !usb_endpoint_maxp(devpriv->ep_tx))
> +		return -EINVAL;
> +
>  	return 0;
>  }
>  

The patch in this mail has a coding style issue (that I thought I had fixed), and was sent out by
mistake.
Please ignore this mail. Apologies.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
