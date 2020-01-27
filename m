Return-Path: <SRS0=mlYZ=3Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7A3C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 17:58:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC21820CC7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 17:58:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nq9XQhmU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC21820CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A089A20369;
	Mon, 27 Jan 2020 17:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKFe0SlaoJRX; Mon, 27 Jan 2020 17:58:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2F8FE2034B;
	Mon, 27 Jan 2020 17:58:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14118C0175;
	Mon, 27 Jan 2020 17:58:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23E78C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 17:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1EB9787A77
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 17:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6EUtOhwZxKcF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 17:58:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AD6EA87A72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 17:58:33 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p9so4013013plk.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 09:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Qg7kiRaR41z6aa68lIG2PQR4oukAllwNZH6einOS8mI=;
 b=Nq9XQhmUJms+NO7UG2IViWd5kF7jDA+JS49Yr/3QjX8BWU4h2w4ZW2jF+Yc9amkOxX
 udNY1Q3IIgy23BA6cG1up1SZcCXryo5xHMROf7o/W3534hsBYQLrGVCrh2Q4JYDsXIut
 MbPWA0RVUFL7K7h3yu198EGM4yE8tPX02HLL9tSQOsE4hBSNoqr3xvzHdZhgz7tbWeuE
 s2cP+ue78lRB4FHk9rDAb+DqVg0fak80fK0KSeA11364Gteb1np3YXXNwQagB0YRho8H
 3ATqOu3VR0W7B6z4h1V4JcXuhpKic1ra/ALBC56LZTTAOaRmE8GfiV1+120Ww8cG6cui
 4RvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Qg7kiRaR41z6aa68lIG2PQR4oukAllwNZH6einOS8mI=;
 b=Widk3R5Il1u5q4doKkX2qOwAfwu0fPwELqRpChAdmnNySNQdxua5AGHtLnxO1pvj/r
 o4XVuP2FU27gyPkxp0ILcEL2KrX0kIOydMT0GHnDXkB4IROq0xsukmv2ZGqWG7SwWrWk
 Zx6RX9ZBNC2FNak2UWmlaIq18Fk3egdWkgKrrJH3JjXC5UndSGml0rMJsYWoc+x29mT+
 nLT4S0ukzJP/sWvQNcv0ItSQkebWshrMoPoj/RdkLFhrB614KLMrlWiui3YprwK+AEc3
 wpq2OSrxT6mHTxYKtO+6OW9CSDJOrjCZWjJT4PFmF9aPDLo4DA+/USY/d0ZKw96CnRcL
 B41w==
X-Gm-Message-State: APjAAAUqFT4yXh8xcCh8h1Tl8KaVN3w8w1xA5Bxhud9LUKZFcsBAQ8eH
 sMJRZwHdC2gj3HTsMeli8g==
X-Google-Smtp-Source: APXvYqwRk+gJc6ZgAm0UuUsbki66uSc9J7Ha+2lH2Q77Sj0VanqIaf3H/pXZ1Rr49zf2F2rs3M0hMg==
X-Received: by 2002:a17:90a:c389:: with SMTP id
 h9mr253929pjt.128.1580147913366; 
 Mon, 27 Jan 2020 09:58:33 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:1ee2:faa0:c576:b7c8:dab8:85b])
 by smtp.gmail.com with ESMTPSA id q25sm16482430pfg.41.2020.01.27.09.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 09:58:32 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: oleg@redhat.com,
	christian.brauner@ubuntu.com,
	mingo@kernel.org
Date: Mon, 27 Jan 2020 23:28:21 +0530
Message-Id: <20200127175821.10833-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] fork.c: Use RCU_INIT_POINTER()
	instead of rcu_access_pointer()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

Use RCU_INIT_POINTER() instead of rcu_access_pointer() in
copy_sighand().

Suggested-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 kernel/fork.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 2508a4f238a3..42b71d4a50cb 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1508,7 +1508,7 @@ static int copy_sighand(unsigned long clone_flags, struct task_struct *tsk)
 		return 0;
 	}
 	sig = kmem_cache_alloc(sighand_cachep, GFP_KERNEL);
-	rcu_assign_pointer(tsk->sighand, sig);
+	RCU_INIT_POINTER(tsk->sighand, sig);
 	if (!sig)
 		return -ENOMEM;
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
