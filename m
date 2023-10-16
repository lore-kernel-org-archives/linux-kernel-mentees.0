Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDA9CDB465
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Oct 2023 15:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FB2660FE9;
	Mon, 16 Oct 2023 15:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FB2660FE9
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b5OvRD5g
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQTNOgI8Wvqw; Mon, 16 Oct 2023 15:01:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0A76A60FE8;
	Mon, 16 Oct 2023 15:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A76A60FE8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE75DC0039;
	Mon, 16 Oct 2023 15:01:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE96DC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 15:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 971214013B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 15:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 971214013B
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=b5OvRD5g
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GeeIb6YT84Tw
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 15:01:55 +0000 (UTC)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F0D240108
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 15:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F0D240108
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-1c9fa869a63so15483855ad.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697468515; x=1698073315;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JnnS58IgMMW37G00hlv3uANnt69yT13t13Z0Wl0btSI=;
 b=b5OvRD5gFBRA7tpAykJ0AGvg4jws3lsJ8PQqfcgAJZpv5JQs9cb0ydzv7t3y5/1vZV
 120Ybbf/PV4WqR2WyhP6s1FcPYpvjqAJ8iTkI3DftueHH6Aj5b79F7Iw4xZDSORz/SEV
 Buby2dpwaxqc5unR9FjJhFCnkb/8k+HyUZ40VUdOJbmPxzBRDGdqpRdwCCZ4bIyg1WSl
 RIWBuIVgmzjo/3aVYOMjJ7rb8JOtIeaXsEl4XaNyK7odtKWmnFhceroLZanMQMze/qo+
 6L6w3SClKeH2l5ZCo7yiD21SefDLN0nmhpnRlpAwFs0LcAmrdV32vRjmWPkYTnsTYvVh
 XtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697468515; x=1698073315;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JnnS58IgMMW37G00hlv3uANnt69yT13t13Z0Wl0btSI=;
 b=s44TwKUapr2+ZfdGYx4KMdCCANXTGUIA1Q5pqpX6ZRrf2gq73E3F4weSwNJdOoiDZ3
 mb/AtAu1w5uylsWjdu0Hmup4efqnw1Dw0r4/0jSgqeQqHAnPYfZZPOZaWW0Ipn3v9nDh
 wOHGjrKqjqEY6BpoHcATOLvEuvdrhM3wh5ejtJu4E+krZLxaFVwS0CixNkC4vs12nSaE
 /9T2PXYb+dqKOODzjQ+RLtUUuHR3LJacJPqt3R+mtVaYg65su1YRTQS91c5I5npx89X4
 n8pWm09jqG24v7ukfqWdJJJQF1F9oHTHl5lWqyxwAyuzqACuhIzCxMR+PWstj6uchNcj
 CMTg==
X-Gm-Message-State: AOJu0YxXfotRUc5+cU4cRlBUl3+AEEFhrM8R6LJOfdiMv8tRBZzvRm6N
 zZGyplzAYeGRgnEhXZqen2M=
X-Google-Smtp-Source: AGHT+IFT6Dq4J/EVcOv+em6QWTH7/Ht//OA+UE5IFyVPLa0/LDab/gjnaYbmFu2DaSdjzjdENCEB5A==
X-Received: by 2002:a17:902:988d:b0:1c9:b207:d412 with SMTP id
 s13-20020a170902988d00b001c9b207d412mr15460340plp.37.1697468514526; 
 Mon, 16 Oct 2023 08:01:54 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.178]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170902eb0d00b001b890009634sm8574379plb.139.2023.10.16.08.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Oct 2023 08:01:54 -0700 (PDT)
Message-ID: <c4af0ef6-56e2-089e-e1b3-55574f6964c6@gmail.com>
Date: Mon, 16 Oct 2023 20:31:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] jfs : fix array-index-out-of-bounds in diWrite
Content-Language: en-US
To: dave.kleikamp@oracle.com, shaggy@kernel.org
References: <20231008174745.27342-1-ghandatmanas@gmail.com>
From: Manas Ghandat <ghandatmanas@gmail.com>
In-Reply-To: <20231008174745.27342-1-ghandatmanas@gmail.com>
Cc: jfs-discussion@lists.sourceforge.net,
 syzbot+c1056fdfe414463fdb33@syzkaller.appspotmail.com,
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

On 08/10/23 23:17, Manas Ghandat wrote:
> Currently while copying dtree root from inode to dnode in the xp slot
> there is a out of bound memcpy. Added a bound check to the memcpy.
>
> Reported-by: syzbot+c1056fdfe414463fdb33@syzkaller.appspotmail.com
> Fixes: https://syzkaller.appspot.com/bug?extid=c1056fdfe414463fdb33
> Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
> ---
>   fs/jfs/jfs_imap.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
> index 799d3837e7c2..d1f897848be0 100644
> --- a/fs/jfs/jfs_imap.c
> +++ b/fs/jfs/jfs_imap.c
> @@ -746,7 +746,8 @@ int diWrite(tid_t tid, struct inode *ip)
>   		xp = (dtpage_t *) & dp->di_dtroot;
>   		lv = ilinelock->lv;
>   		for (n = 0; n < ilinelock->index; n++, lv++) {
> -			memcpy(&xp->slot[lv->offset], &p->slot[lv->offset],
> +			if (lv->offset < 128)
> +				memcpy(&xp->slot[lv->offset], &p->slot[lv->offset],
>   			       lv->length << L2DTSLOTSIZE);
>   		}
>   	} else {
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
