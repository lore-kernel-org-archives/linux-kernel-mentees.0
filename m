Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B024ECAAD4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 31 Aug 2022 14:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED5EC82D04;
	Wed, 31 Aug 2022 14:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED5EC82D04
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pZ4xxdD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCrMWEjmV6VG; Wed, 31 Aug 2022 14:30:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CCD0B82CE5;
	Wed, 31 Aug 2022 14:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCD0B82CE5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90AD8C0032;
	Wed, 31 Aug 2022 14:30:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A6ADC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 14:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0758282CE5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 14:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0758282CE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHzOnNqok6SV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 14:29:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB1082CC7
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEB1082CC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 14:29:59 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id a15so10918306qko.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 07:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MnDD7K45URldganONgu4aspExP7uN+YZ9AWpkwZwj/I=;
 b=pZ4xxdD16ga83C5iRMKA6VvNnSR/dQF2+wYm7Et+bL2Fm4FF0B2D0Nyi+QhaSIqYz4
 cp+IvxHenwBvJ3NhO7k2j70O4b8iXorB6pFXF5Z/LzqTWbpyvOT4v2t2ptutKdx6KnPr
 IzD5B4DruSxvLG3/9vXaY9qW5YxvKuvxyJWW43OXWwqln6E0dwUTcovM48N0M65Lzne5
 CgHdzO/tQpW9JYe5Icvr47mfVEe+J0OLFa4HN/kOieRphqaanRzj2spMEyqehu+0u01a
 OGcZPwCxT64WpSb8ki2NycIKJkMUgbqPsdKEfVvMk4hxm67YIlx8Pt+DEV68jiGZzzwO
 zxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MnDD7K45URldganONgu4aspExP7uN+YZ9AWpkwZwj/I=;
 b=NspOJKvkP2TSULr9m+aiKYdFgM0wbuJiHlZ8xqvuQl0wlEj1MdXhuE9aQs7yhqYRs3
 EpSGfHzIZxFxpOYLK4u2JHRc4P0+emhRS+1fVDk6mYIa0MlXZw+hPy1Sy2nM0Zstkb6K
 5BkCG7xNzie2DXmr3HuztnDvcqrRF/RLEXeZ1RNQn4C2hOl8qoMBFVvli3xA62xnQdCo
 Brb+58UVVPgTzT6mtNz6dIWcAE6CSm7k4a2xjj+yhC4mIdNfyBPVBCfwPUeogx/1CQqY
 exoOlI4S3Q9+7rrLNUyRKjOo5mp6Z4mm332pY8o8CyM2LVfToPPiFIAwKAxdMiOydz7p
 ZQpQ==
X-Gm-Message-State: ACgBeo25UAEJI7oc8dby/WceehccgEAuUfetBaBz3MoQCkv89MukX0GW
 BvUhKcjhbIu0oDJWE2Zi4fo=
X-Google-Smtp-Source: AA6agR73ZH3tQvTkzFnfj3lP/LBtdrLHTW2EleHm7Mg9cbXsYhIMUxzuXbzhzPe5fWtXGfX/XF1mNg==
X-Received: by 2002:a05:620a:288b:b0:6b6:4f9b:85c6 with SMTP id
 j11-20020a05620a288b00b006b64f9b85c6mr15815569qkp.614.1661956198499; 
 Wed, 31 Aug 2022 07:29:58 -0700 (PDT)
Received: from fedora.. ([103.230.107.19]) by smtp.gmail.com with ESMTPSA id
 bm19-20020a05620a199300b006bac157ec19sm9947266qkb.123.2022.08.31.07.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 07:29:57 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: [PATCH v2] xfrm: ipcomp: Update ipcomp_scratches with NULL if alloc
 fails
Date: Wed, 31 Aug 2022 20:29:38 +0600
Message-Id: <20220831142938.5882-1-khalid.masum.92@gmail.com>
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
Receiving obsolete addresses from ipcomp_scratches
        
	if (!scratches)
                return;

        for_each_possible_cpu(i)
               vfree(*per_cpu_ptr(scratches, i));
Trying to free non existent page, causing warning.

        ...
}

Fix this breakage by updating ipcomp_scratches with NULL if
the above mentioned allocation fails.

Reported-and-tested-by: syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>

---
diff --git a/net/xfrm/xfrm_ipcomp.c b/net/xfrm/xfrm_ipcomp.c
index cb40ff0ff28d..17815cde8a7f 100644
--- a/net/xfrm/xfrm_ipcomp.c
+++ b/net/xfrm/xfrm_ipcomp.c
@@ -215,7 +215,7 @@ static void * __percpu *ipcomp_alloc_scratches(void)
 
 	scratches = alloc_percpu(void *);
 	if (!scratches)
-		return NULL;
+		return ipcomp_scratches = NULL;
 
 	ipcomp_scratches = scratches;
 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
