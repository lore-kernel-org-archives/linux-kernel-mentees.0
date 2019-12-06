Return-Path: <SRS0=164v=Z4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32B2C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 15:06:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94DEE24670
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 15:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHT26K87"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94DEE24670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5D6C2260AD;
	Fri,  6 Dec 2019 15:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OziNcFZ1oHPo; Fri,  6 Dec 2019 15:06:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4994C20023;
	Fri,  6 Dec 2019 15:06:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EA80C1D7D;
	Fri,  6 Dec 2019 15:06:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DCD7C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 15:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 41073260AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 15:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BxbGdEGCQBzP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 15:06:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 98D6020023
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 15:06:13 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id b137so3443080pga.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Dec 2019 07:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=NOYIo2oX0lmkpQ6gBhcLLsx1plLM1LrdnXjWaPnIOcs=;
 b=MHT26K87lCwEl81XNb2/7lgyyJ+HGDXqay2wHsbsZ8dRm00ATs1ZlFFyv15xZPFJk9
 nTFDr6hon+qm1IWzBdl2dwnu5BNv7BFEjw0SncsazwZgtHzfQfAFZ3GJgpPUu03DNPho
 qdLUwi860CeukpEZCkpGJeE9Feim2dUf5l8uHmHwIDqJlB5Fr9NH/yBlaP6XE1BYVG6x
 ACcn+2FDx82wMKJ4ZYOxKCxGHpg/Yt5CAOZSriNe6Eplo/gGLLAHWfyP1zfYcM7/q+y2
 h5w4febplE5KwP7zNw9449T5Z6facbpeD8dG5QTIRaC2bYtPP5GyHzgSMB8Xoq/DEVnU
 53aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NOYIo2oX0lmkpQ6gBhcLLsx1plLM1LrdnXjWaPnIOcs=;
 b=d2dbpdMUk6q7etLeAkOpy3RElMypt3VrvreYEZg2nPbgC9Nnp37DZ9tYSLfzk/Cg4m
 mdX4qOx+Mp+/XcaE6Se0uocKQA6JmOn54JQOvHn9qnX1Ca3rqTMNfuhZcSpEbI9UiA9P
 c2PKXSV36Rti1Qo66xPi5nZtKdDc9sQg+hoIqqIVLaZfny99LLoiT3QqrqqCU/ZSWH0m
 OZEj4Gs3tDzoY4OfdXFDhznvd6iFKKDqAOkW7nPXggmQExlBUz12s4uYuw1JSifku8kN
 Pp1y9EiQYwewWVY6XNHYZphJ4nP5VkXxUxHnOp5hklGac52oq9GMdiLlqKU7UV+YQyrs
 OHiA==
X-Gm-Message-State: APjAAAXhYF78SgwXMcf5KnTLN2j1t/QWEbikVy1OGTEQUoKZ117hzvjY
 WP6K/vINbUqH7pQNIv6kHZkgVTggGZc=
X-Google-Smtp-Source: APXvYqy8tpPjWstvqzrovfQv2CmvACSWRIy2k1sQcTmQAbqG08s4QK1DYir2i89I4Ra0SG3Z6TPQYg==
X-Received: by 2002:a63:d54f:: with SMTP id v15mr4100489pgi.64.1575644772732; 
 Fri, 06 Dec 2019 07:06:12 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:13a2:f129:b905:c312:4008:2416])
 by smtp.gmail.com with ESMTPSA id j28sm15861041pgb.36.2019.12.06.07.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 07:06:12 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: paulmck@kernel.org,
	rostedt@goodmis.org,
	joel@joelfernandes.org
Date: Fri,  6 Dec 2019 20:35:54 +0530
Message-Id: <20191206150554.10479-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: rcu@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] rculist: Add macro list_prev_rcu
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

From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

There are instances in the linux kernel where the prev pointer
of a list is accessed.
Unlike list_next_rcu, a similar macro for accessing the prev
pointer was not present.
Therefore, directly accessing the prev pointer was causing
sparse errors.
One such example is the sparse error in fs/nfs/dir.c

error:
fs/nfs/dir.c:2353:14: error: incompatible types in comparison expression (different address spaces):
fs/nfs/dir.c:2353:14:    struct list_head [noderef] <asn:4> *
fs/nfs/dir.c:2353:14:    struct list_head *

The error is caused due to the following line:

lh = rcu_dereference(nfsi->access_cache_entry_lru.prev);

After adding the macro, this error can be fixed as follows:

lh = rcu_dereference(list_prev_rcu(&nfsi->access_cache_entry_lru));

Therefore, we think there is a need to add this macro to rculist.h.

Suggested-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 include/linux/rculist.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/rculist.h b/include/linux/rculist.h
index 4b7ae1bf50b3..49eef8437753 100644
--- a/include/linux/rculist.h
+++ b/include/linux/rculist.h
@@ -40,6 +40,12 @@ static inline void INIT_LIST_HEAD_RCU(struct list_head *list)
  */
 #define list_next_rcu(list)	(*((struct list_head __rcu **)(&(list)->next)))
 
+/*
+ * return the prev pointer of a list_head in an rcu safe
+ * way, we must not access it directly
+ */
+#define list_prev_rcu(list)	(*((struct list_head __rcu **)(&(list)->prev)))
+
 /*
  * Check during list traversal that we are within an RCU reader
  */
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
