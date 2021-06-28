Return-Path: <SRS0=s8/Q=LW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E4EC49EAB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 02:46:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B88BE61C2E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 02:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B88BE61C2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D9E14030B;
	Mon, 28 Jun 2021 02:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S02eX6M8BgQE; Mon, 28 Jun 2021 02:45:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 53EC4402F2;
	Mon, 28 Jun 2021 02:45:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D9BCC0010;
	Mon, 28 Jun 2021 02:45:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC401C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 02:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3B8982F32
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 02:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAiW9N8iou_s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 02:45:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 155B082F14
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 02:45:55 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id e33so14150887pgm.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Jun 2021 19:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/ZglMk5xEV7kqPnzl923s5w51WPieL3sLq9YmzBcALE=;
 b=nUlOpiZdsURZNX3nXwrPK+lpBucURq3MdKAQtTyUnwKnkg7GvNT0HpVWB7Npvqk0lc
 J2yelxl+xiSaTC4As+derq954XeTRGPPldSVUofYHA3gs4bIdr3vQy+EomVFHj2kDaIh
 i01MYeGTLmrGifrVCvEetNzpWtfrEjRTYByTWGhhw9BA5LU3f6BagH91yjHD8+lV35in
 7Q2krdV5Dre6o1fpocAdU1Az4ghMdA3aghNV9uau6s2kR8QO2gaZX+q7px9+SNDp46uJ
 tBGXas+0+fckhDeVeWzEgRzwuDu3msk/F6LzKeSp+1Ct825R41NfphxwazxJCYTSpnHg
 3TmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/ZglMk5xEV7kqPnzl923s5w51WPieL3sLq9YmzBcALE=;
 b=WGG9wUTah4TBq8kt41+6naUo/objsLDPxcBhkq9bduFb0RogLYlY3QRwKP7LxyLmGg
 Kf8LE8rnWrR6GyAxRJfdJey/6LR7N6HTvw1TyOL8cBKTb29rYGor1jhjnA+OQvMr8sjP
 mDJSg9ZWtAG87QP8xKaBnnjjaXcT8IbG+yHHYQzlIq1re9AEnpJq2M9vew3CWBX8Fmys
 mlhEMg3J21OAAtlrgsZNyOb61049fUIdCSs+vwc9NLBzEuBY1tD+x0jkER4WOyIO9Rry
 Xs4x9lgJHy7vLJDKd3ubp9Jsb1O0buW9aEqcDGFrw7HSdmHT0ru1/6vO0FWKtSPW2aVS
 6S3g==
X-Gm-Message-State: AOAM532aU7wLv8Vz5xcVXB2PkKdIP9mM/4oYfTA9+KdPsPXNIBbtFBk5
 2ZVd4wkMnCpxis2BGbZQlMA=
X-Google-Smtp-Source: ABdhPJyox2quKoYGLxF1JyW4tUbI8GVPUip1KPU4wHP8CJqx1CNd54QO7ZciKVkiyP1c17eJJ7/BWQ==
X-Received: by 2002:a63:1841:: with SMTP id 1mr11515809pgy.377.1624848355530; 
 Sun, 27 Jun 2021 19:45:55 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id n127sm1472443pga.58.2021.06.27.19.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 19:45:54 -0700 (PDT)
Subject: Re: [PATCH] ntfs: Fix validity check for file name attribute
To: anton@tuxera.com
References: <20210614050540.289494-1-desmondcheongzx@gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <ea63e5af-6ac4-08fe-4261-904d55392b10@gmail.com>
Date: Mon, 28 Jun 2021 10:45:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210614050540.289494-1-desmondcheongzx@gmail.com>
Content-Language: en-US
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzbot+213ac8bb98f7f4420840@syzkaller.appspotmail.com,
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

On 14/6/21 1:05 pm, Desmond Cheong Zhi Xi wrote:
> When checking the file name attribute, we want to ensure that it fits
> within the bounds of ATTR_RECORD. To do this, we should check
> that (attr record + file name offset + file name length) < (attr
> record + attr record length).
> 
> However, the original check did not include the file name offset in
> the calculation. This means that corrupted on-disk metadata might not
> caught by the incorrect file name check, and lead to an invalid memory
> access.
> 
> An example can be seen in the crash report of a memory corruption
> error found by Syzbot:
> https://syzkaller.appspot.com/bug?id=a1a1e379b225812688566745c3e2f7242bffc246
> 
> Adding the file name offset to the validity check fixes this error and
> passes the Syzbot reproducer test.
> 
> Reported-by: syzbot+213ac8bb98f7f4420840@syzkaller.appspotmail.com
> Tested-by: syzbot+213ac8bb98f7f4420840@syzkaller.appspotmail.com
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>   fs/ntfs/inode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index f5c058b3192c..4474adb393ca 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -477,7 +477,7 @@ static int ntfs_is_extended_system_file(ntfs_attr_search_ctx *ctx)
>   		}
>   		file_name_attr = (FILE_NAME_ATTR*)((u8*)attr +
>   				le16_to_cpu(attr->data.resident.value_offset));
> -		p2 = (u8*)attr + le32_to_cpu(attr->data.resident.value_length);
> +		p2 = (u8 *)file_name_attr + le32_to_cpu(attr->data.resident.value_length);
>   		if (p2 < (u8*)attr || p2 > p)
>   			goto err_corrupt_attr;
>   		/* This attribute is ok, but is it in the $Extend directory? */
> 

Hi Anton,

Any chance to review this patch?

Best wishes,
Desmond
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
