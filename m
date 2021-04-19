Return-Path: <SRS0=tx6I=JQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A77AC43460
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Apr 2021 16:37:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9388861026
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Apr 2021 16:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9388861026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5908160782;
	Mon, 19 Apr 2021 16:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KzJb-rBAvkuQ; Mon, 19 Apr 2021 16:37:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95365606A9;
	Mon, 19 Apr 2021 16:37:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 784EAC000E;
	Mon, 19 Apr 2021 16:37:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E75BC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Apr 2021 16:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5033D8340C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Apr 2021 16:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x97Oxxu3eH_H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Apr 2021 16:37:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C09E83279
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Apr 2021 16:37:07 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id i3so15833968edt.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Apr 2021 09:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RKVgXAX0mREX8Z0MCpmywkdwIZCixUAvYUJ20KmIUmM=;
 b=HQe4hHu3jDM3VMM9bgAAJO7LJ1nuzE2Zlm+7CJbv/ZQT+d3t5c8GKY1wiK0P/d8sER
 a3YCO30m7N+/NsNvJzeRpjp0sdsPecqrjP0KqkOsxjX2tdc+g14KTOmn5H7oI6l8TWyv
 dby33R1hSpDmVfW2JNU/Im6NwYKXLANxpwarInv//7qs4r5cSz69DvJ3SF2grgW0RE5r
 LXSAhroeOwlMllkLcfxytfjHUV38DdEsd6EJo7nb/rnkjgE7MEwm6oZkgX/dtAtnabf5
 KaH8SR5JV2vOehwvD8JS9jtDjCMtaciFE+cMZqFSSRbiqoWoQQQkkkCP9cmggTld2IqI
 oibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RKVgXAX0mREX8Z0MCpmywkdwIZCixUAvYUJ20KmIUmM=;
 b=qD4RWiWnr6wD5mD3OWjtWqCorN5dXrCIVgdCL6mfJSWpi1gojv+MR/eBXSfC95c9ya
 aKvourlLm3rleN0hr61PFFm2Cozd+HqXah2GAI1+LLwD1hAsmBuI8UPKHI5fWp+bkOOW
 561tmG9Y8B65cF30r4TU388WDO2J7JAn6dgIEbKuQY7cDcBXkoWeejp5hiDbQdmSSJlN
 9VhDUhQpY6X+8FTjAi0V5SaeXPCPtN4dPBTbGrRrnB37tuxgj6c1gcf1HV3ZZdJntk5/
 aZinKpURE+duSaWj3mPBnYbYE/HL/ZNinWQPmY/HeugE8CMbilK+MVgwMOPYIeWgJMU0
 5Bqw==
X-Gm-Message-State: AOAM533XdyqHz0+xQ/SIxdCKO3WDdUOF4DnbF6ENcru90ANXd6IFk4JW
 Ptl93beNpKUcwWiEl+A6XsM=
X-Google-Smtp-Source: ABdhPJxlHE+uN0letZMKdjr+iTxf5YPKEy4uushblsmHr3m3aO5AO/Mjig0xXV/5WRJKl1OWM2qRQQ==
X-Received: by 2002:a05:6402:cbb:: with SMTP id
 cn27mr12958654edb.222.1618850225382; 
 Mon, 19 Apr 2021 09:37:05 -0700 (PDT)
Received: from localhost.localdomain ([185.58.55.85])
 by smtp.gmail.com with ESMTPSA id c19sm13196792edu.20.2021.04.19.09.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 09:37:04 -0700 (PDT)
From: Kurt Manucredo <fuzzybritches0@gmail.com>
To: trond.myklebust@hammerspace.com, anna.schumaker@netapp.com,
 bfields@fieldses.org, chuck.lever@oracle.com, davem@davemloft.net,
 kuba@kernel.org, skhan@linuxfoundation.org
Subject: [PATCH] net: sunrpc: xprt.c: fix shift-out-of-bounds in
 xprt_calc_majortimeo
Date: Mon, 19 Apr 2021 16:36:03 +0000
Message-Id: <20210419163603.7-1-fuzzybritches0@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+ba2e91df8f74809417fa@syzkaller.appspotmail.com,
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

Fix shift-out-of-bounds in xprt_calc_majortimeo().

UBSAN: shift-out-of-bounds in net/sunrpc/xprt.c:658:14
shift exponent 536871232 is too large for 64-bit type 'long u

Reported-by: syzbot+ba2e91df8f74809417fa@syzkaller.appspotmail.com
Signed-off-by: Kurt Manucredo <fuzzybritches0@gmail.com>
---
 net/sunrpc/xprt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/sunrpc/xprt.c b/net/sunrpc/xprt.c
index 691ccf8049a4..07128ac3d51d 100644
--- a/net/sunrpc/xprt.c
+++ b/net/sunrpc/xprt.c
@@ -655,7 +655,10 @@ static unsigned long xprt_calc_majortimeo(struct rpc_rqst *req)
 	unsigned long majortimeo = req->rq_timeout;
 
 	if (to->to_exponential)
-		majortimeo <<= to->to_retries;
+		if (to->to_retries >= sizeof(majortimeo) * 8)
+			majortimeo = to->to_maxval;
+		else
+			majortimeo <<= to->to_retries;
 	else
 		majortimeo += to->to_increment * to->to_retries;
 	if (majortimeo > to->to_maxval || majortimeo == 0)
-- 
2.30.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
