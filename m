Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B7FC25B08
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Aug 2022 17:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B35B961104;
	Wed, 17 Aug 2022 17:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B35B961104
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bYb4QUNP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dI0UnsGRZNRs; Wed, 17 Aug 2022 17:34:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D1A1461060;
	Wed, 17 Aug 2022 17:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1A1461060
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A72E7C0033;
	Wed, 17 Aug 2022 17:34:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23891C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 17:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1B0C40111
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 17:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1B0C40111
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bYb4QUNP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y03169rXqCIe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 17:34:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE3DD4008B
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE3DD4008B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 17:34:46 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so2597001pjf.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 10:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=284A91xJpS6nwRvx67VF7YSoP83e6JuEnTUJYB3raPg=;
 b=bYb4QUNP3jcTW6w5gDojVQgeXieFUswJifAM9vhjd5FVyK6aT/pZ1TVAJ5dVh0bdGC
 aXbTIhrFz+1A2lDCIfmBaGWPy8SxJvhCvjNoezyYG4Mxudr+RR03FBD6SfcLo2zT+jxd
 bOzysazjUG8D7hoyV8Wfb3h+0ZUi+pi/+pb3NqUns1qH2tYAbaoUi/xMg2KnOaV6HIwl
 wF7ggN2pke5cdFaWc1/ty05TbtcDMG4kSYFLdAWr9uCNaZNKf3y65ww6hZPkZvMVi5Rx
 2cuBoB1OrziAclyREuyqHWWBhEsrhutWB0p7R6xLN54BMQf6fnHp5yV3xuzvmyCEhqwh
 0GRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=284A91xJpS6nwRvx67VF7YSoP83e6JuEnTUJYB3raPg=;
 b=nu6Chwz5lv4ZksJNmsJwzL5I7fNxJUAyMJYW0uDJ9kzfYjejDeBcK3N7NoCq0LMvdj
 16NBz+dDcmisAsTDwrjvanpka6O8kHiKA6Yof+LKTHUTEIyxHKPLBtd4WKDLk0EPHFnM
 QkuSG+dwBj2gn4O03GTSBH8WeD2Kk42dgkE83STwyZdD/ouFbONJvHD12+6R8J6c32ly
 2MO5FI+3V+5lemWzK9+yJVEfC5iXKV0xvkaeCphFmn3HUEMf5aCJgYMZmDW3YXSoJE5U
 Z5/f5mFvfm9KyCIeBKor8a93cPhH/FFuq8610S2KFdAZRPBFMT9XzNdibw7wq2CSr0hp
 HdxQ==
X-Gm-Message-State: ACgBeo1eDToAMLfLoSzGRcvqh1x90dXl1pEXGmVVm1GE2qh8TmoyfTM2
 bwWblMHlNX79oXHoY7wa0LY=
X-Google-Smtp-Source: AA6agR77E6Bi90PS6CwHLsHj14t+4aZgUalGnRDUpaOb2EZ4IhtQuUC4Pu11YPiVtnY2Q5XTCJifMg==
X-Received: by 2002:a17:90a:5517:b0:1f8:a7ce:ac33 with SMTP id
 b23-20020a17090a551700b001f8a7ceac33mr4870074pji.83.1660757686216; 
 Wed, 17 Aug 2022 10:34:46 -0700 (PDT)
Received: from biggie ([103.230.148.189]) by smtp.gmail.com with ESMTPSA id
 i190-20020a6254c7000000b0052d4f2e2f6asm10696208pfb.119.2022.08.17.10.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 10:34:45 -0700 (PDT)
Date: Wed, 17 Aug 2022 23:04:39 +0530
From: Gautam Menghani <gautammenghani201@gmail.com>
To: chenxiang66@hisilicon.com, shuah@kernel.org, liaoyu15@huawei.com
Subject: Re: [PATCH] selftests/dma: Add a .gitignore file containing name of
 executable
Message-ID: <Yv0mr+vGANGYcxio@biggie>
References: <20220724145931.32556-1-gautammenghani201@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220724145931.32556-1-gautammenghani201@gmail.com>
Cc: song.bao.hua@hisilicon.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-kselftest@vger.kernel.org, tiantao6@hisilicon.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, Jul 24, 2022 at 08:29:31PM +0530, Gautam Menghani wrote:
> The dma tests in kselftests are missing a .gitignore file, which leads
> to the dma_map_benchmark executable file showing up in "git status".
> This patch adds a .gitignore file containing the executable name.
> 
> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> ---
>  tools/testing/selftests/dma/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 tools/testing/selftests/dma/.gitignore
> 
> diff --git a/tools/testing/selftests/dma/.gitignore b/tools/testing/selftests/dma/.gitignore
> new file mode 100644
> index 000000000000..668e2f8be2f7
> --- /dev/null
> +++ b/tools/testing/selftests/dma/.gitignore
> @@ -0,0 +1 @@
> +dma_map_benchmark
> -- 
> 2.34.1
> 
Hi,

Please review the above patch and let me know if any changes are required.

Thanks,
Gautam
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
