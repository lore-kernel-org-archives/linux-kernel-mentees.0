Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6FDC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jul 2022 04:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E8EC844CE;
	Wed, 13 Jul 2022 04:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E8EC844CE
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h1H/+uf4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NEvRUlxcAdgA; Wed, 13 Jul 2022 04:47:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1292884387;
	Wed, 13 Jul 2022 04:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1292884387
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBDDEC0033;
	Wed, 13 Jul 2022 04:47:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 930C3C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 04:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CF98422E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 04:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CF98422E0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h1H/+uf4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PdAA_jjPorsX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 04:46:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FE7E422DE
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FE7E422DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 04:46:59 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 v4-20020a17090abb8400b001ef966652a3so1704013pjr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jul 2022 21:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gBaYkCq2UOecKkI/ZcXaXDVPy+SEFxbUDpVc4bdCZmM=;
 b=h1H/+uf4FxW4bgT2t3lI+XGqdPLgtl0u4V9II5sch1nlT+lMFHYXepqKt3obshgGQr
 3HvlRGfLhGGuN/cLDAW+qlK3KCK5YFGagFcXTsXxI41AZhR0UvNjIOlpluv73F4bxF/g
 pFWma2sdbuCLVJtI9XiLV2fs42bsQjkzpvmWkN4oCL2sNl7r9G1b+YQyRp08KueMfFes
 c4o+4R1l23aSWaIKGanMB/60uX0VmGGgtKiBWNxIHEkc06LPSYVDvoQbvR1B5UwEmIHV
 dw1B4Nb9a9I4T9YxMEAxznmpehRy31heyuhIqdWkyGOAybIB3VCVbIEOmwToNh5BrTu+
 lr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gBaYkCq2UOecKkI/ZcXaXDVPy+SEFxbUDpVc4bdCZmM=;
 b=6BXzg7JATEXJxU25i6e3l0hlLZE60YoFcHyl+VOyOpmgngmuGawmz/hBhz2mz3a1LL
 QmOAxYrt7t36gy3HuNScPhjhi9iULTblgRmjjt0lqOZhHbjPDPFgqlxoMuE4lC3VutCY
 SB/7Vk6ajpFthOoZmGBJx9XEukR6kRSPeBZU/oE8m8uKLNt7U33qWn3kcqem5bxO4i01
 RvP11Bk8KH9uTffX1hcaZjkujJj87onAaE3V16U4EBBTPPdvSVrQvi4cjp5U6u8AbUsR
 OATJKQliMGl/3/IJI0HeoU7XUo3+QRd71OWCexdZ+es21vwFqqMxHSOCsQzUFnQh6Y0y
 s8Gw==
X-Gm-Message-State: AJIora+tAA9ZP11YDv8MzpFVz7bjLntV88TmlIF0OeWsI81W85S5VEqw
 s1NLXpl/qJR1Xv8CUseg2Tg=
X-Google-Smtp-Source: AGRyM1t4Kvp3+MPAFYCpd5hlmg5MlCU8bpPTtIXAtIiqdQtJ+Yzx2cYW2gylT+SNs6NaoePwv/3tlQ==
X-Received: by 2002:a17:90b:1d02:b0:1f0:1c2c:cc64 with SMTP id
 on2-20020a17090b1d0200b001f01c2ccc64mr1836081pjb.52.1657687618757; 
 Tue, 12 Jul 2022 21:46:58 -0700 (PDT)
Received: from localhost.localdomain (pcd364232.netvigator.com.
 [203.218.154.232]) by smtp.gmail.com with ESMTPSA id
 fr14-20020a17090ae2ce00b001f0097c2fb2sm469316pjb.28.2022.07.12.21.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 21:46:58 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: hare@suse.de
Subject: [PATCH RFC 1/5] net: Add distinct sk_psock field
Date: Wed, 13 Jul 2022 12:46:37 +0800
Message-Id: <20220713044637.106017-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <325938d3-bb82-730b-046c-451dde8cc14c@suse.de>
References: <325938d3-bb82-730b-046c-451dde8cc14c@suse.de>
MIME-Version: 1.0
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, borisp@nvidia.com,
 netdev@vger.kernel.org, linux-nvme@lists.infradead.org, chuck.lever@oracle.com,
 simo@redhat.com, paskripkin@gmail.com, linux-fsdevel@vger.kernel.org,
 kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 ak@tempesta-tech.com
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

>On 4/18/22 18:49, Chuck Lever wrote:
>> The sk_psock facility populates the sk_user_data field with the
>> address of an extra bit of metadata. User space sockets never
>> populate the sk_user_data field, so this has worked out fine.
>> 
>> However, kernel consumers such as the RPC client and server do
>> populate the sk_user_data field. The sk_psock() function cannot tell
>> that the content of sk_user_data does not point to psock metadata,
>> so it will happily return a pointer to something else, cast to a
>> struct sk_psock.
>> 
>> Thus kernel consumers and psock currently cannot co-exist.
>> 
>> We could educate sk_psock() to return NULL if sk_user_data does
>> not point to a struct sk_psock. However, a more general solution
>> that enables full co-existence psock and other uses of sk_user_data
>> might be more interesting.
>> 
>> Move the struct sk_psock address to its own pointer field so that
>> the contents of the sk_user_data field is preserved.
>> 
>> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
>> ---
>>   include/linux/skmsg.h |    2 +-
>>   include/net/sock.h    |    4 +++-
>>   net/core/skmsg.c      |    6 +++---
>>   3 files changed, 7 insertions(+), 5 deletions(-)
>> 
>Reviewed-by: Hannes Reinecke <hare@suse.de>
>
>Cheers,
>
>Hannes

In Patchwork website, this patch fails the checks on
netdev/cc_maintainers.

So maybe you need CC folks pointed out by
scripts/get_maintainer.pl script, which is suggested
by Jakub Kicinski <kuba@kernel.org>.

What's more, Syskaller reports
refcount bug in sk_psock_get (2).

In this bug, the problem is that smc and psock, 
both use sk_user_data field to save their 
private data. So they will treat field in their own way.

> in smc_switch_to_fallback(), and set smc->clcsock->sk_user_data
> to origin smc in smc_fback_replace_callbacks().
> 
> Later, sk_psock_get() will treat the smc->clcsock->sk_user_data
> as sk_psock type, which triggers the refcnt warning.

I have tested this patch and the reproducer did not trigger any issue.
For more details, you can check the email
[PATCH] smc: fix refcount bug in sk_psock_get (2)
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
