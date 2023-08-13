Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AC5C04A6A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Aug 2023 09:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ED4B40985;
	Sun, 13 Aug 2023 09:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ED4B40985
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Tcdw5N24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQ_hN3__BdRr; Sun, 13 Aug 2023 09:07:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2B4A840976;
	Sun, 13 Aug 2023 09:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B4A840976
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEAB9C0071;
	Sun, 13 Aug 2023 09:07:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92557C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 09:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5865481A15
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 09:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5865481A15
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Tcdw5N24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mokN-w-0ttCn
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 09:07:49 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BB4981A12
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 09:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BB4981A12
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-686c06b806cso2254068b3a.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 02:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691917668; x=1692522468;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d65Zp1fO+sS6zDFevVKDTGRQcdP0qjzf6vC/p9wFTJ0=;
 b=Tcdw5N24g1tDgXxkcTSs+LuUVcsDw3C3LQ42Yk2p3GgvThHRRMo5cCP8R8zdjIYutI
 9KtTETA7cd4GLu9/uNTdNesxbMW5xr4y6pzA0NEtygFu2y3PosFsX5iDienOUKNK5qwA
 /Is1FdGyCDN0Qe9PMo7LThVNrGpTQ448mle1PcHSvCS9SL6IzIYT9p8MbXW2m0F5IYmc
 1iz9SAmjDF61R1UIVIGmNSvAKTT9WoN0gJqJS2IgmsUphR7wKTPDBETtfJBalqMWtxHQ
 sxQ4cAdGa/DlnBtcKDm2n7nAsjmT4B8wdGC3/+1NInxpGL1BLznIYddAmZYO+/rLioig
 Q5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691917668; x=1692522468;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d65Zp1fO+sS6zDFevVKDTGRQcdP0qjzf6vC/p9wFTJ0=;
 b=lSXJ7S4xEvLPSxjuqAMozTJucMDpsMzFbn60dMXDv0BAr95GcjBS8iQcp++StXyLJx
 hJNRO/Vw/kE3rq/2VF0oskxdcN7JCSuVmN1g/TB8yX3fYPyOe+QWznAy5J9/0CPlMCpa
 m/jBJfkDnpvjzFpwgoL99pouQ1QODocIwDxyIS0NIeZt8uZG0GrSb+KNx+5ZK+prd+Pb
 NK9gRWVMnOrvlVxw8BvRSoHC3cUJOnQWuwd2bC/LpdfMCtr1PAsILjfY9AxMh5RX/6FW
 5qawZTlbKX7DaBM2cDKfEy7OcsxTwsOVMCis5oh1Lo4cpCrlJlGLnmYyNfyAT/xvZxCO
 OJAg==
X-Gm-Message-State: AOJu0YzbPBc++D5Xy3HdqroTbgCTXkkCXBRHQe2Z00dJWqxPO5jUq/Hw
 lpq7acKTSUkZkIk9D7sWVSk=
X-Google-Smtp-Source: AGHT+IEdoPp4YeKukTzQaCY70yQb4+FyIgZPF/rmxhek0pwTMyjg/kP4WQ4vTc5Y8LqpY6lS/UKlLA==
X-Received: by 2002:a05:6a20:3d29:b0:140:6979:2952 with SMTP id
 y41-20020a056a203d2900b0014069792952mr6997664pzi.47.1691917668338; 
 Sun, 13 Aug 2023 02:07:48 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.173]) by smtp.gmail.com with ESMTPSA id
 n12-20020aa7904c000000b00688214cff65sm2390014pfo.44.2023.08.13.02.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Aug 2023 02:07:47 -0700 (PDT)
Message-ID: <88c258bd-3d0c-de79-b411-6552841eb8d0@gmail.com>
Date: Sun, 13 Aug 2023 14:37:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND] fs/befs: fix shift-out-of-bounds in befs_check_sb
To: salah.triki@gmail.com, luisbg@kernel.org
References: <20230801155823.206985-1-ghandatmanas@gmail.com>
Content-Language: en-US
From: Manas Ghandat <ghandatmanas@gmail.com>
In-Reply-To: <20230801155823.206985-1-ghandatmanas@gmail.com>
Cc: syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com,
 Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

Just a friendly ping :)

On 01/08/23 21:28, Manas Ghandat wrote:
> The consistency check for the block_size by using the block_shift caused
> integer overflow. Thus a max limit to the block_shift was defined named
> BEFS_MAX_BLOCK_SHIFT in befs.h. Also check for the block_shift was added
> so that overflow does not occur.
>
> Reported-by: syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com
>
> Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
> ---
>   fs/befs/befs.h  |  2 +-
>   fs/befs/super.c | 11 +++++++++++
>   2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/fs/befs/befs.h b/fs/befs/befs.h
> index 7cd47245694d..5490024adb33 100644
> --- a/fs/befs/befs.h
> +++ b/fs/befs/befs.h
> @@ -13,7 +13,7 @@
>   
>   /* used in debug.c */
>   #define BEFS_VERSION "0.9.3"
> -
> +#define BEFS_MAX_BLOCK_SHIFT 31
>   
>   typedef u64 befs_blocknr_t;
>   /*
> diff --git a/fs/befs/super.c b/fs/befs/super.c
> index 7c50025c99d8..f2aeb2ed6e77 100644
> --- a/fs/befs/super.c
> +++ b/fs/befs/super.c
> @@ -88,6 +88,17 @@ befs_check_sb(struct super_block *sb)
>   		return BEFS_ERR;
>   	}
>   
> +	/*
> +	 * block_shift check added so that overflow does not
> +	 * occur during the block_size check
> +	 */
> +
> +	if (befs_sb->block_shift > BEFS_MAX_BLOCK_SHIFT) {
> +		befs_error(sb, "block_size too large. "
> +			   "Corruption likely.");
> +		return BEFS_ERR;
> +	}
> +
>   	/*
>   	 * block_shift and block_size encode the same information
>   	 * in different ways as a consistency check.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
