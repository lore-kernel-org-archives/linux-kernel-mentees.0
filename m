Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87CBC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  9 Jul 2022 00:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54E91848DE;
	Sat,  9 Jul 2022 00:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54E91848DE
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RFZ/9uNl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjWZ-b1aUC4l; Sat,  9 Jul 2022 00:55:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 57657848DD;
	Sat,  9 Jul 2022 00:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57657848DD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25B15C0033;
	Sat,  9 Jul 2022 00:55:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DC53C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 00:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AE3A60D4C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 00:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AE3A60D4C
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RFZ/9uNl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5kUmlw9Bs4c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 00:55:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E51260C28
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E51260C28
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 00:55:29 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id m14so150609plg.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 08 Jul 2022 17:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5tfoXTTrku/dQJy1oFSssPrlHXbJM14k7EhQ5B1YVWk=;
 b=RFZ/9uNlT+kbKB+KcbIS08mBkVVSXOnVZkTk2JLCBDJCF8QLX+EnxUJ7RtKaN1um+n
 TedWU8xcqGINBOAJd4IaUMQ4ft7TgD+ZRRX7TKyxcvWImnmXvNrpoYMcT+0uFlkmMvFm
 v4X2hB2ZP75HgYmHGThxq1r0MMQgTtACrxDW1arL8xmOVJYvAyzz9Hlm5vil7sq59ih9
 It7zX4nW/Exd9JhuFX8+NQxuFrtADvy255NN2Opg/T/7H9Tdf0Jj1W530sU55R9JhIfZ
 vGsDU7lVfwM8byerNxhh5njyVOCwR8TKQmpkgrsB8GiQzDKp18KAmVHCCopqnNTRn0A7
 8zzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5tfoXTTrku/dQJy1oFSssPrlHXbJM14k7EhQ5B1YVWk=;
 b=T8sBA3NMLk6rv/nH0Ay3XXepsSLdmaMwGgR6JTqV5+m6bCd7QMKNNe9rsVj5I+IAqs
 6x4TXjFI230LMaUMspXjVbe1OoQ8zqTCLfS6tfNj3b9cm7KDzkkzkDIlMNOjOedyWVpt
 FPBkEkYRRmM2od11WDO17GRjRGQAuK72MXuJ8xQqgvFVq18smG2WddkkT5jsVUoWyU6X
 xefI19BYAV+0EzCnpQCPxp5prdGlFbkeUD4bUAZ40567PtdMgxsL6CCACuvuLIiSGn4z
 SbSsURCBslxtlX7bjl0500KTvszeNXzoATXKaf0eeLsTWMz3HQj5bRtRFtjg0TNtIS2y
 9Q8A==
X-Gm-Message-State: AJIora9BQwNkwgXiLYNmKJyMoe7PziJjHcjhYGuZaP9BgdqDb8lPlJs8
 8hIxc+oQXG5H+D2fOUv1R1w=
X-Google-Smtp-Source: AGRyM1uEGMgEeHvZ7/1r1lHZfwXyQnGYSx1n4aEw+xWLRHCwPwOJvo7eLXnlY8Hkr62r/X/jaeMZOg==
X-Received: by 2002:a17:902:e542:b0:16b:fcbe:7b90 with SMTP id
 n2-20020a170902e54200b0016bfcbe7b90mr6384914plf.90.1657328128595; 
 Fri, 08 Jul 2022 17:55:28 -0700 (PDT)
Received: from ubuntu.lan (pcd568068.netvigator.com. [218.102.100.68])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902c2c500b0016beea47800sm152394pla.41.2022.07.08.17.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 17:55:28 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: chenxiaosong2@huawei.com
Subject: Re: [PATCH v2] ntfs: fix use-after-free in ntfs_ucsncmp()
Date: Sat,  9 Jul 2022 08:54:51 +0800
Message-Id: <20220709005450.2220-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707105329.4020708-1-chenxiaosong2@huawei.com>
References: <20220707105329.4020708-1-chenxiaosong2@huawei.com>
MIME-Version: 1.0
Cc: yi.zhang@huawei.com, linux-ntfs-dev@lists.sourceforge.net,
 paskripkin@gmail.com, liuyongqiang13@huawei.com, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, zhangxiaoxu5@huawei.com, anton@tuxera.com,
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

> Fix this by adding sanity check on end address of attibute name string.

> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 4de597a83b88..9ab8766872d2 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -592,8 +592,12 @@ static int ntfs_attr_find(const ATTR_TYPE type, const ntfschar *name,
>  		a = (ATTR_RECORD*)((u8*)ctx->attr +
>  				le32_to_cpu(ctx->attr->length));
>  	for (;;	a = (ATTR_RECORD*)((u8*)a + le32_to_cpu(a->length))) {
> -		if ((u8*)a < (u8*)ctx->mrec || (u8*)a > (u8*)ctx->mrec +
> -				le32_to_cpu(ctx->mrec->bytes_allocated))
> +		u8 *mrec_end = (u8 *)ctx->mrec +
> +		               le32_to_cpu(ctx->mrec->bytes_allocated);
> +		u8 *name_end = (u8 *)a + le16_to_cpu(a->name_offset) +
> +		               a->name_length;

In my opinion, name_length field just means the number of characters,
yet each character is a ntfschar type. So name should be
name_length * sizeof(ntfschar) bytes. The example is at
https://elixir.bootlin.com/linux/v5.19-rc5/source/fs/ntfs/attrib.c#L1667

> +		if ((u8*)a < (u8*)ctx->mrec || (u8*)a > mrec_end ||
> +		    name_end > mrec_end)
>  			break;
>  		ctx->attr = a;
>  		if (unlikely(le32_to_cpu(a->type) > le32_to_cpu(type) ||
> -- 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
