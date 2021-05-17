Return-Path: <SRS0=5laK=KM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5526C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 May 2021 12:27:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0336100C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 May 2021 12:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0336100C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33403402E8;
	Mon, 17 May 2021 12:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IuKAZAm7W2IT; Mon, 17 May 2021 12:27:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E07F402D9;
	Mon, 17 May 2021 12:27:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70859C000D;
	Mon, 17 May 2021 12:27:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11F01C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 12:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF75B608D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 12:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3YdDIx22VGK0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 12:27:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43393608B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 12:27:43 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id c13so1770636qvx.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 05:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RrMgSrZtTqdB/wlv0id/9NlOUPd01Z7kAGWKqnT2c2M=;
 b=CctOlq+UkKn18QqKAOdc7VqJDwwJKN9HU/A5tTPZ0EUkYGQMbFanD0RNwVHW2f6R4E
 7fGATCP3I/aegDtzmOBa5y7HYnBAOTRIl+10jhJuS7FOhQbBKJ3dZOOA6X3ITygKqzls
 GYKmF56nNhO+08TdkpRANu9VXaTwgiFhOUXy8+b44TjtqJNCthTAiLbF/r709SBk+TTr
 JFfUCWgDEX967xOAuQfbJGZ4in3xZj/3kE8Mf/9i0HFQ65dEhwLg/3wrcJKdfUh8FmVT
 hxlDPhEvB3cXIZu0UWRwRNkFRYiWjfn70i3oucULeBS2i2/4Qn1sRdt3WfdmU+uTZ/f+
 PWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RrMgSrZtTqdB/wlv0id/9NlOUPd01Z7kAGWKqnT2c2M=;
 b=RvD5S39j53l6IhTX/6rvT4MjH2cgSQeASNUgVgx84ER9R/O+nxb82sW1YlQWu8HpLm
 EXJ7YEPXbOeXBAY4Q+//ons+5muOQKRD+IZ2NrPgV4LZGnnmY2O2N+GYHCiblqrEVhXu
 rJKfJUtdrv2RupN3oGmCqZN+o8RVLRRLreFOdyfoAmRdDRdgD71F8XqV4LNUGJG2K1o8
 3JA9xaTCeK4aQlOYTbMMMtDXFqK51oVYzv6QtZ/YpDDozfjFn2Tv78qNEWY5MHrPCPvc
 nzA/7TIxa2YXi0ZuP7jTKkCUMCW+7rEyxXqMAK910PrqHfUPLiWPjsA/aEzST1+zu4S6
 G5Tg==
X-Gm-Message-State: AOAM531EYFlcb+zP32a1nhuN4nKyBlm9vG2mRGrQXHfotiGd+sU8tTuZ
 zZRHGizNe2mz4w4p4a9IF6c=
X-Google-Smtp-Source: ABdhPJzM+6xSTMZ2jK4banMxGU90aLBTrZTJZYJp2Lr/pLBs4nDcAdGVJO5Aq8VNiSxT+2/N1fJnug==
X-Received: by 2002:a05:6214:87:: with SMTP id n7mr16082560qvr.1.1621254462149; 
 Mon, 17 May 2021 05:27:42 -0700 (PDT)
Received: from ?IPv6:2804:14c:125:811b::1003? ([2804:14c:125:811b::1003])
 by smtp.gmail.com with ESMTPSA id 10sm10377983qka.23.2021.05.17.05.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 05:27:41 -0700 (PDT)
Subject: Re: [PATCH] video: hgafb: correctly handle card detect failure during
 probe
To: Anirudh Rayabharam <mail@anirudhrb.com>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210516192714.25823-1-mail@anirudhrb.com>
From: Igor Torrente <igormtorrente@gmail.com>
Message-ID: <2b945eaa-4288-1601-3f1a-60f2ceaa1ea7@gmail.com>
Date: Mon, 17 May 2021 09:27:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210516192714.25823-1-mail@anirudhrb.com>
Content-Language: en-US
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <oliver.sang@intel.com>,
 stable <stable@vger.kernel.org>, linux-nvidia@lists.surfsouth.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Hi,

On 5/16/21 4:27 PM, Anirudh Rayabharam wrote:
> The return value of hga_card_detect() is not properly handled causing
> the probe to succeed even though hga_card_detect() failed. Since probe
> succeeds, hgafb_open() can be called which will end up operating on an
> unmapped hga_vram. This results in an out-of-bounds access as reported
> by kernel test robot [1].
> 
> To fix this, correctly detect failure of hga_card_detect() by checking
> for a non-zero error code.
> 
> [1]: https://lore.kernel.org/lkml/20210516150019.GB25903@xsang-OptiPlex-9020/
> 
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Fixes: dc13cac4862c ("video: hgafb: fix potential NULL pointer dereference")
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>   drivers/video/fbdev/hgafb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
> index cc8e62ae93f6..bd3d07aa4f0e 100644
> --- a/drivers/video/fbdev/hgafb.c
> +++ b/drivers/video/fbdev/hgafb.c
> @@ -558,7 +558,7 @@ static int hgafb_probe(struct platform_device *pdev)
>   	int ret;
>   
>   	ret = hga_card_detect();
> -	if (!ret)
> +	if (ret)
>   		return ret;
>   
>   	printk(KERN_INFO "hgafb: %s with %ldK of memory detected.\n",
> 

In fact, this return isn't being properly handled. Thanks for fix it!

Reviewed-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
