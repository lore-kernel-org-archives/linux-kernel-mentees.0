Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B517CE784AB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 04:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70357814BB;
	Mon,  2 Oct 2023 04:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70357814BB
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=chTB+9Ok
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AkPlnPyu5c2f; Mon,  2 Oct 2023 04:36:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 214C9815CF;
	Mon,  2 Oct 2023 04:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 214C9815CF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFC16C0039;
	Mon,  2 Oct 2023 04:36:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B767C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 04:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE3C160FF6
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 04:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE3C160FF6
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=chTB+9Ok
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZiJCKtB2f2M
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 04:36:19 +0000 (UTC)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C74C1607A1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 04:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C74C1607A1
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-1c63164a2b6so17835215ad.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Oct 2023 21:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696221379; x=1696826179;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+IHZ4PtEqrEU6U7oDYDeV4BnN3Q2RTj1pjtCAgfvs8s=;
 b=chTB+9OkjhYXBWJzUWTTYH52r80ctvq2mXTg5xcLX7Vd5tLvmfCiyW5i+rqdstceSv
 B9MkZ8u+LQk/TIML99ow/UNJ1c1+LW38FhvD0uqa5eXucSUlMBhgkVU2L8loqUaAjzY+
 ur0O51pBCjNIxwf9IBQSl/N4/FIclPMKUTr4jxmnZuno+Wx24w5eVfUxjPl6/IVjpSft
 U/zcrFJFiKmdjIq5pmyBVOTJ887XkIJnshqd0AxvRtK5+/2fzZqwQUzZlUuZcm3ILTo5
 EKcIdMAiDpNEjlAvp9tfrTG2hrLgxatkepZovQJYcEK/QTaTB91CNwveHPpALg/Krvb+
 iJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696221379; x=1696826179;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+IHZ4PtEqrEU6U7oDYDeV4BnN3Q2RTj1pjtCAgfvs8s=;
 b=AIbHMXrZAarfTyfqz1lA93uz7o0KvhTKhrazMYdZsViOJzGzSon47tVk1CaMU/7vPs
 slSr2xpzMr1eAENFci5Xe4U+v+v0akUjyeKGSmzU0fIihu+NfvA9Pu28Ii/vrEda7/KK
 A5S5dK7uGmA3Lcx/742gjLhICvoNPy6crd3l8DTzV6qz1zWBtHO/QX9cibgOtWde8fRh
 MJO4ZsqmN9dXncTA6xOcATSffbQ0gqlV0KYBD1doMuqVu9aWv1Nw4P2RyDCIOu4QXdCj
 Gor5qAJ7Z4pccFiow3KBJt4O8r4NncJ7av7XYphpvS4+eWFAci65B7aeD9bOKR72aBpi
 CrEA==
X-Gm-Message-State: AOJu0YwJvWujPaIEfgEpvIINqxHAVUMouN4M2bKHmxGTo4GG2WhcQrDU
 uOGZwCJzWLQ4uwD7bblm6hA=
X-Google-Smtp-Source: AGHT+IHFok1OE9tef/GciC4pOQQCJxcF6Yj34Zg1x8reHcJYXd10NdfQB1RG7Zgj4Wc1aWBHjbkjeg==
X-Received: by 2002:a17:90a:d254:b0:271:78a0:8ab2 with SMTP id
 o20-20020a17090ad25400b0027178a08ab2mr15024414pjw.24.1696221379098; 
 Sun, 01 Oct 2023 21:36:19 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.176]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a2ac600b0027360359b70sm5885636pjg.48.2023.10.01.21.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 21:36:18 -0700 (PDT)
Message-ID: <f03509ef-4501-e686-f484-416a6200fbeb@gmail.com>
Date: Mon, 2 Oct 2023 10:06:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] jfs : fs array-index-out-of-bounds in txCommit
Content-Language: en-US
To: shaggy@kernel.org
References: <20230919155542.4354-1-ghandatmanas@gmail.com>
From: Manas Ghandat <ghandatmanas@gmail.com>
In-Reply-To: <20230919155542.4354-1-ghandatmanas@gmail.com>
Cc: syzbot+0558d19c373e44da3c18@syzkaller.appspotmail.com,
 jfs-discussion@lists.sourceforge.net,
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

just a friendly ping

On 19/09/23 21:25, Manas Ghandat wrote:
> Currently there is no check for out of bound access for xad in the
> struct xtpage_t. Added the required check at various places for the same
>
> Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
> Reported-by: syzbot+0558d19c373e44da3c18@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=0558d19c373e44da3c18
> Fixes: df0cc57e057f
> ---
>   fs/jfs/jfs_txnmgr.c | 4 ++++
>   fs/jfs/jfs_xtree.c  | 6 ++++++
>   2 files changed, 10 insertions(+)
>
> diff --git a/fs/jfs/jfs_txnmgr.c b/fs/jfs/jfs_txnmgr.c
> index ce4b4760fcb1..6c6640942bed 100644
> --- a/fs/jfs/jfs_txnmgr.c
> +++ b/fs/jfs/jfs_txnmgr.c
> @@ -1722,6 +1722,10 @@ static void xtLog(struct jfs_log * log, struct tblock * tblk, struct lrd * lrd,
>   			jfs_err("xtLog: lwm > next");
>   			goto out;
>   		}
> +		if (lwm >= XTROOTMAXSLOT) {
> +			jfs_err("xtLog: lwm out of range");
> +			goto out;
> +		}
>   		tlck->flag |= tlckUPDATEMAP;
>   		xadlock->flag = mlckALLOCXADLIST;
>   		xadlock->count = next - lwm;
> diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
> index 2d304cee884c..57569c52663e 100644
> --- a/fs/jfs/jfs_xtree.c
> +++ b/fs/jfs/jfs_xtree.c
> @@ -357,6 +357,9 @@ static int xtSearch(struct inode *ip, s64 xoff,	s64 *nextp,
>   		for (base = XTENTRYSTART; lim; lim >>= 1) {
>   			index = base + (lim >> 1);
>   
> +			if (index >= XTROOTMAXSLOT)
> +				goto out;
> +
>   			XT_CMP(cmp, xoff, &p->xad[index], t64);
>   			if (cmp == 0) {
>   				/*
> @@ -618,6 +621,9 @@ int xtInsert(tid_t tid,		/* transaction id */
>   		memmove(&p->xad[index + 1], &p->xad[index],
>   			(nextindex - index) * sizeof(xad_t));
>   
> +	if (index >= XTROOTMAXSLOT)
> +		goto out;
> +
>   	/* insert the new entry: mark the entry NEW */
>   	xad = &p->xad[index];
>   	XT_PUTENTRY(xad, xflag, xoff, xlen, xaddr);
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
