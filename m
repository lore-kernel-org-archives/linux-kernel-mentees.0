Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A14ECAAD2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Sep 2022 07:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6446F41A1A;
	Thu,  1 Sep 2022 07:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6446F41A1A
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hf0pPpYj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fGJMPtlU9JqB; Thu,  1 Sep 2022 07:12:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EB8AE418EC;
	Thu,  1 Sep 2022 07:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB8AE418EC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9DE4C0032;
	Thu,  1 Sep 2022 07:12:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FE9BC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 07:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9D0041A2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 07:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9D0041A2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPFDJQJ_q3KH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 07:12:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B70AF4184B
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B70AF4184B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 07:12:24 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id y29so12611539pfq.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Sep 2022 00:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ZnVHYIoePyzft+SR64LAbQjIYKuIRSY5pvCaoRn0uR4=;
 b=hf0pPpYjDcjPGucGsP6ylkEDuZmBFG9lkrq81PSSVgzqZ+yKJ+duU5RLlxpp0p6zo2
 Uvo/FIPtgVodEDAvfADDz/Bm72MOBn57TfDwKm0gqqXNIAb0IdvCWYPODaBNAvhQvg09
 8YPZoZeu8/zE/EscbKW9ptybnGBZ1nrBZtoOfhP97mGUgtCjvTv53bTNcFNBWRQGdJDL
 Oc4Z4ej3C6cIa5eLoHeM9ze32PFg+gVAn5gHyTKLMc9vettP8fpaYfr1dQQ1tmg/hDrc
 JxcrvYAVBB+i8N265izt/7+Aaalrmr8wBRJ8IUrsS+1gEcjXqipg8gXPi8Dp5TfQd6GF
 Qovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ZnVHYIoePyzft+SR64LAbQjIYKuIRSY5pvCaoRn0uR4=;
 b=trfCAPIpkrSWElTQJNOHMjmpyC/kXrKI2LFutDV50DonttmWGTeT7IH5bXknl9rUHC
 +PaslCSqqH2Q5ti9g7atPvNevXvwtySM6iL+U/ROB0M3LCNRZjIAyFtBLi8OwpGlryMc
 Q8uebKv/rNHLzptwJUPVFJ2714h/P6SscO7sRjSRDF93JD3mUrrbNja+D2Gg6h42ap+L
 hIMmY7TPaSKZxPZT5LTdhlNW8ptA1FA+3+S4NZ1jQLz+Uc1Sa3P0pJf03u9TlZwMyCxK
 QuY5f9hj0fQCmPjHdBtVOSi/AVGRd2V2z3+xjUEw8ATeQwjWajDu4mXiYYxFZs3OHNSt
 iXmQ==
X-Gm-Message-State: ACgBeo2gQMRJ5hwTfcpyYZkz4FABOIVsmruz/itoy2D/LOl/B1h65PQb
 Ncd3SUISjJo+Y7L+ewkdZIo=
X-Google-Smtp-Source: AA6agR4WZoetDvivmlqq9ieW+hP6W9zwvwCVfBpNaU2sUWgZikyExz43/hy+jnpoe89kmajDObQgwg==
X-Received: by 2002:a63:89c6:0:b0:42b:8246:265 with SMTP id
 v189-20020a6389c6000000b0042b82460265mr23356525pgd.256.1662016344064; 
 Thu, 01 Sep 2022 00:12:24 -0700 (PDT)
Received: from fedora.. ([103.230.104.22]) by smtp.gmail.com with ESMTPSA id
 b1-20020a17090a990100b001fdcfe9a731sm2513918pjp.50.2022.09.01.00.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:12:23 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: [PATCH v4] xfrm: Update ipcomp_scratches with NULL when freed
Date: Thu,  1 Sep 2022 13:12:10 +0600
Message-Id: <20220901071210.8402-1-khalid.masum.92@gmail.com>
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
Assigning obsolete address from ipcomp_scratches

        if (!scratches)
                return;

        for_each_possible_cpu(i)
               vfree(*per_cpu_ptr(scratches, i));
Trying to free non existent page, causing warning: trying to vfree
existent vm area.
        ...
}

Fix this breakage by updating ipcomp_scrtches with NULL when scratches
is freed

Suggested-by: Herbert Xu <herbert@gondor.apana.org.au>
Reported-by: syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
Tested-by: syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
Changes since v3:
- Update ipcomp_scratches to NULL when freed only
- Link: https://lore.kernel.org/lkml/20220901040307.4674-1-khalid.masum.92@gmail.com/

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
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
