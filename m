Return-Path: <SRS0=f8HV=MS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6604C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 16:57:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80E1060F55
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 16:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80E1060F55
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AD958290B;
	Mon, 26 Jul 2021 16:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ILIXeV6uQb8n; Mon, 26 Jul 2021 16:56:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4AA6182890;
	Mon, 26 Jul 2021 16:56:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2948FC0010;
	Mon, 26 Jul 2021 16:56:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1F3EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 16:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6F7740197
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 16:56:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0R8cEF6AVGM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 16:56:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AEB2400CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 16:56:56 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id x15so11630124oic.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 09:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ug9Slp+aolg7bj7KGTexduQ8AvEecT+aSkkQAF+jKqE=;
 b=gbdhJhRaCXa0Lic9E5X3tAblAG9tIGlEP8VOLug+LYsyOZ9R/2pCDzEDel8sCwicjZ
 YocxR3Y69pWXQaFgTxoYez9P1bAlUrl2V3Hj/vJPUF4rBg/3vjaI6d1fZ8XzxXl4GvD+
 pGv0dNhrpePgC8OVleXgNuiRdzIGW3AFXbBao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ug9Slp+aolg7bj7KGTexduQ8AvEecT+aSkkQAF+jKqE=;
 b=ngxoM/eahQQ1AX1yMBqck8CqhzLm7/SH4ARjYz6JO6VM88vjmM+HjMGKeij1WwxTQz
 1j62LWM1KiqGiwUbib5cEwjGF0Lrrx9J4KGWjTvGIvK8AanyjTi1NMambC6BlGA+Ug/5
 Pt+PKbUeHMRM6WVdic9euNs4k2Yz8fEvfVUlUu4nnrX6vwwFSLP89LHW9wIRQE6yToxE
 +1b+c2dlA3BbftiCRVRAaabs/zZXzl2rtyvrsFrAj5bqpSXD7LPVOhSDNSCrT7FrQ1LQ
 TeYApRBJyfEWEh2oEpiifR5Qe65nVr6zVm23SHpvmzObusMwaca9pxAXHDhx4vVf544t
 iKQw==
X-Gm-Message-State: AOAM532Yn/SIttykSZ69qMUK7QZKRrvKsDFPZ3K/d4L4VkKH8s9nWf/9
 z02AHPZCtwr9czoN0YywSnW7+rcB
X-Google-Smtp-Source: ABdhPJzCRRlIfJ6V/rG85JvFFYFRB0C6qZQ4VwVMB4X0WLPrxFy6OvIcOiP9Pmmvecga7/8gNwpNCA==
X-Received: by 2002:aca:1719:: with SMTP id j25mr17529366oii.36.1627318615164; 
 Mon, 26 Jul 2021 09:56:55 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id c64sm81996oif.30.2021.07.26.09.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 09:56:54 -0700 (PDT)
Subject: Re: [PATCH v7 1/2] firmware_loader: use -ETIMEDOUT instead of -EAGAIN
 in fw_load_sysfs_fallback
To: Anirudh Rayabharam <mail@anirudhrb.com>, mcgrof@kernel.org,
 gregkh@linuxfoundation.org, rafael@kernel.org
References: <20210724121134.6364-1-mail@anirudhrb.com>
 <20210724121134.6364-2-mail@anirudhrb.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <7f325bb2-c18c-38e1-e6e3-8f6a89ea17dc@linuxfoundation.org>
Date: Mon, 26 Jul 2021 10:56:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210724121134.6364-2-mail@anirudhrb.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 7/24/21 6:11 AM, Anirudh Rayabharam wrote:
> The only motivation for using -EAGAIN in commit 0542ad88fbdd81bb
> ("firmware loader: Fix _request_firmware_load() return val for fw load
> abort") was to distinguish the error from -ENOMEM, and so there is no
> real reason in keeping it. -EAGAIN is typically used to tell the
> userspace to try something again and in this case re-using the sysfs
> loading interface cannot be retried when a timeout happens, so the
> return value is also bogus.
> 
> -ETIMEDOUT is received when the wait times out and returning that
> is much more telling of what the reason for the failure was. So, just
> propagate that instead of returning -EAGAIN.
> 
> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>   drivers/base/firmware_loader/fallback.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
> index 91899d185e31..1a48be0a030e 100644
> --- a/drivers/base/firmware_loader/fallback.c
> +++ b/drivers/base/firmware_loader/fallback.c
> @@ -535,8 +535,6 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
>   	if (fw_state_is_aborted(fw_priv)) {
>   		if (retval == -ERESTARTSYS)
>   			retval = -EINTR;
> -		else
> -			retval = -EAGAIN;
>   	} else if (fw_priv->is_paged_buf && !fw_priv->data)
>   		retval = -ENOMEM;
>   
> 

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
