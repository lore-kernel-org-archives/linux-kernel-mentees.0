Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9C3ECAAD8
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Sep 2022 04:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6614382D49;
	Thu,  1 Sep 2022 04:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6614382D49
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d64/i3z1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwNU6-b4vq4g; Thu,  1 Sep 2022 04:03:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4EFF982EA1;
	Thu,  1 Sep 2022 04:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EFF982EA1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DB8DC0033;
	Thu,  1 Sep 2022 04:03:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E731C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 04:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30D2D82E1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 04:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30D2D82E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G4AJi-3cpePX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 04:03:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E790C82DDE
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E790C82DDE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 04:03:19 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id x80so11666635pgx.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 21:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=F9QtJAGWPoUgH7EvqJ23+lTBvakIaZr8r8lhECGqmaE=;
 b=d64/i3z1FUn8zNdfN8J8FhbvakCDJCdMPkNHvz0Bt1yYZv1GM8BkfI4dgZ3d7Pllik
 35KUqmi061lX1aX65uVNCgs4vVXWH0eM4Ib4NecIz3pFyL1dI00eW2nc/mGSnt/xpF7J
 9YIJepXyJ9TGSzDlzkh9oWxsb8Q9epItsfX1vXOLddLfbo+bEWJunkYOs8ma0N8nvySK
 NvmBpiA/9ZDr1qEXosJdw+fxb+TZCd0IQnQZJ8MKPQZC+KdOvK377587RyLzwvV+rMnk
 TJP/W6cao+iw26Xn8QrppTV7r5UmpwE0s17shi08OhsLFUpJ7DPTww3jfncA49IDEVm3
 q+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=F9QtJAGWPoUgH7EvqJ23+lTBvakIaZr8r8lhECGqmaE=;
 b=m1impTjMPP0KdKPi/LJtaDpbPtmLsmV5PbLbrYF2XH0psy1VRGE9hV/V7sL6hQHlw+
 c536lArhUOkZ/JZacF8WBFz1lJpcm7DGSI6WbI3ElhhtNR6mM5lzTZmphXSCErO051iG
 38vLioUSsGP3AkCbv3M25pfnkFGBE5MsthnNynIrCppkwKtEXgpNFYWsdP3jKJ3pBypA
 Y0ohqNadzgowToTqEi1onH/dxyHevGcNDFB05Ygd9fYIVV1f7F5j0tN5BJEQakaYs3AI
 pBprdFBm3Pq41C8JiuZ257qehcZimp1y9npyvucsp4rh31KrTOGg0gb9GBjlHFiFFWJE
 y3yA==
X-Gm-Message-State: ACgBeo0xnLf7lvPhz8KIIAP3oq6yXko6Gsh2yZXCnpdkkRYXFkfTxl//
 7EGcU0kKKJAONWIZeYG6jUs=
X-Google-Smtp-Source: AA6agR58KSuDpzMdMOpcxDCt3iSfeiaVaetz4buEsvO5bR9uEvOxLcA9OpDX0lWd7olfI0grktg1Lw==
X-Received: by 2002:a05:6a00:228a:b0:538:47a7:706 with SMTP id
 f10-20020a056a00228a00b0053847a70706mr16938794pfe.62.1662004999307; 
 Wed, 31 Aug 2022 21:03:19 -0700 (PDT)
Received: from fedora.. ([103.159.189.150]) by smtp.gmail.com with ESMTPSA id
 f9-20020aa79689000000b00528a097aeffsm12110215pfk.118.2022.08.31.21.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 21:03:18 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: [PATCH v3] xfrm: Update ipcomp_scratches with NULL if not allocated
Date: Thu,  1 Sep 2022 10:03:07 +0600
Message-Id: <20220901040307.4674-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <00000000000092839d0581fd74ad@google.com>
References: <00000000000092839d0581fd74ad@google.com>
MIME-Version: 1.0
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
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

Currently if ipcomp_alloc_scratches() fails to allocate memory
ipcomp_scratches holds obsolete address. So when we try to free the
percpu scratches using ipcomp_free_scratches() it tries to vfree non
existent vm area. Described below:

static void * __percpu *ipcomp_alloc_scratches(void)
{
        ...
        scratches = alloc_percpu(void *);
        if (!scratches)
                return NULL;
ipcomp_scratches does not know about this allocation failure.
Therefore holding the old obsolete address.
        ...
}

So when we free,

static void ipcomp_free_scratches(void)
{
        ...
        scratches = ipcomp_scratches;
Assigning obsolete addresses from ipcomp_scratches

        if (!scratches)
                return;

        for_each_possible_cpu(i)
               vfree(*per_cpu_ptr(scratches, i));
Trying to free non existent page, causing warning: trying to vfree
existent vm area.
        ...
}


Fix this breakage by: 
(1) Update ipcomp_scratches with NULL if the above mentioned 
allocation fails.
(2) Update ipcomp_scrtches with NULL when scratches is freed

Reported-by: syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
Tested-by: syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
Changes since v2:
- Set ipcomp_scratches to NULL when scratches is freed.
- Update commit message.
- v2 Link: https://lore.kernel.org/lkml/20220831142938.5882-1-khalid.masum.92@gmail.com/

Changes since v1:
- Instead of altering usercount, update ipcomp_scratches to NULL
- Update commit message.
- v1 Link: https://lore.kernel.org/lkml/20220831014126.6708-1-khalid.masum.92@gmail.com/

diff --git a/net/xfrm/xfrm_ipcomp.c b/net/xfrm/xfrm_ipcomp.c
index cb40ff0ff28d..3774d07c5819 100644
--- a/net/xfrm/xfrm_ipcomp.c
+++ b/net/xfrm/xfrm_ipcomp.c
@@ -203,6 +203,7 @@ static void ipcomp_free_scratches(void)
 		vfree(*per_cpu_ptr(scratches, i));
 
 	free_percpu(scratches);
+	ipcomp_scratches = NULL;
 }
 
 static void * __percpu *ipcomp_alloc_scratches(void)
@@ -215,7 +216,7 @@ static void * __percpu *ipcomp_alloc_scratches(void)
 
 	scratches = alloc_percpu(void *);
 	if (!scratches)
-		return NULL;
+		return ipcomp_scratches = NULL;
 
 	ipcomp_scratches = scratches;
 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
