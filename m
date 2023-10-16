Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED1DCDB482
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Oct 2023 15:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2BD560FE8;
	Mon, 16 Oct 2023 15:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2BD560FE8
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NLvz7RYa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFTTrugDBbd4; Mon, 16 Oct 2023 15:00:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C00CB60FE9;
	Mon, 16 Oct 2023 15:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C00CB60FE9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E2E6C0039;
	Mon, 16 Oct 2023 15:00:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D30DAC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 15:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE6F24085C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 15:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE6F24085C
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NLvz7RYa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x29Mf8rAN-4n
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 15:00:40 +0000 (UTC)
Received: from mail-oa1-x44.google.com (mail-oa1-x44.google.com
 [IPv6:2001:4860:4864:20::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83538404F8
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 15:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83538404F8
Received: by mail-oa1-x44.google.com with SMTP id
 586e51a60fabf-1dcfe9cd337so2075687fac.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697468439; x=1698073239;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fE5UoW9vdKH2feO+bDEwIT8Ft2NGameqkjIHnMibMyQ=;
 b=NLvz7RYaCCN/m3A4xp0PTS4S39FUnLuOKw6B8XC0RprFXHgsJQAZZhJ88H1aCMWtz2
 XimWHQtzEmtU8AHYShaccNCfZFd/SGGEXdDxmfpJq0zS1fZWNQOcRIug1aItmR6v+hll
 l5MiBysavgG2Mp5SwPFxPHKLP7IlP8lNHqteI7ijR7IDcQBGlmflJ1Py03S3wrUHh2lz
 P/7LElg9C4qH0T/UxCKr9KGcQ73gwraCIUI9k+qyDowV2ptowVVrRDEb6q85kQsLVWrQ
 5HjZ0pLZx5aVSvTpnRV1V1F4i/61BPeN846oBh/u5c2V4FWoyEPDlYwLxuRI2WwFBOn3
 gI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697468439; x=1698073239;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fE5UoW9vdKH2feO+bDEwIT8Ft2NGameqkjIHnMibMyQ=;
 b=Q9VtWp1JJ1bHBYNIpussO/srKrMhnYFulafsjou+KPe8BRIBawrc9iPXXqjE6AWClf
 I8Kf/0Bn9OfPV6y5qhVSrdYxQEaVNtMqkRf5d37IiqrCl6eQT/7CWCdQVU0iOU44mB9K
 kQOOz+90cyIiIbyR4g2Ra2EHc5MAmHR2/hef5KiUVdLkf+0lFhduntIYUjDWSUiFdkQI
 jDKdb6Z/3TlffUnsals2grw7lkB+v/d/I6c/8uOb8QDjnfBWZSepesxzZ8N9uKbJYYgX
 aM97YumjyMIiXhXWqb71FZq6yNR3CLtfjGOEExYGsHQzTIQXIk85YeJdsIxem92iZojd
 g8yA==
X-Gm-Message-State: AOJu0YxlYRyCx5zpyQTCMWu2nxoAU7TPRNPkGy7XKEZCXUP4r9YiiR4g
 AcOCfLg0bS7ZidESZfPaukM=
X-Google-Smtp-Source: AGHT+IG+nSpv7E/GZMd53ppQO+XRAkVwTQ5NdDnDdqv/DnwRvoEQjEn3reBSiU5yAuUwdF5DsqdadQ==
X-Received: by 2002:a05:6870:2c99:b0:1e9:a5f2:aab3 with SMTP id
 oh25-20020a0568702c9900b001e9a5f2aab3mr13474131oab.57.1697468439317; 
 Mon, 16 Oct 2023 08:00:39 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.178]) by smtp.gmail.com with ESMTPSA id
 k9-20020aa79729000000b006bd6a0a4678sm3037911pfg.80.2023.10.16.08.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Oct 2023 08:00:38 -0700 (PDT)
Message-ID: <50a32ba6-0051-6b70-aa8a-f565f8119a69@gmail.com>
Date: Mon, 16 Oct 2023 20:30:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] jfs: fix shift-out-of-bounds in dbJoin
To: dave.kleikamp@oracle.com, shaggy@kernel.org
References: <20231011143937.31996-1-ghandatmanas@gmail.com>
Content-Language: en-US
From: Manas Ghandat <ghandatmanas@gmail.com>
In-Reply-To: <20231011143937.31996-1-ghandatmanas@gmail.com>
Cc: jfs-discussion@lists.sourceforge.net,
 Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 syzbot+411debe54d318eaed386@syzkaller.appspotmail.com
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

On 11/10/23 20:09, Manas Ghandat wrote:
> Currently while joining the leaf in a buddy system there is shift out
> of bound error in calculation of BUDSIZE. Added the required check
> to the BUDSIZE and fixed the documentation as well.
>
> Reported-by: syzbot+411debe54d318eaed386@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=411debe54d318eaed386
> Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
> ---
>   fs/jfs/jfs_dmap.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
> index 6b838d3ae7c2..baa97bda1c7a 100644
> --- a/fs/jfs/jfs_dmap.c
> +++ b/fs/jfs/jfs_dmap.c
> @@ -2730,7 +2730,9 @@ static int dbBackSplit(dmtree_t * tp, int leafno)
>    *	leafno	- the number of the leaf to be updated.
>    *	newval	- the new value for the leaf.
>    *
> - * RETURN VALUES: none
> + * RETURN VALUES:
> + *  0		- success
> + *	-EIO	- i/o error
>    */
>   static int dbJoin(dmtree_t * tp, int leafno, int newval)
>   {
> @@ -2757,6 +2759,10 @@ static int dbJoin(dmtree_t * tp, int leafno, int newval)
>   		 * get the buddy size (number of words covered) of
>   		 * the new value.
>   		 */
> +
> +		if ((newval - tp->dmt_budmin) > BUDMIN)
> +			return -EIO;
> +
>   		budsz = BUDSIZE(newval, tp->dmt_budmin);
>   
>   		/* try to join.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
