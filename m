Return-Path: <SRS0=yDVd=ZX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D0CC43215
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 18:35:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C03120833
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 18:35:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKkA0pkG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C03120833
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CAC0386FCD;
	Sun,  1 Dec 2019 18:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A693tQ4yNO5W; Sun,  1 Dec 2019 18:35:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4F97786FAF;
	Sun,  1 Dec 2019 18:35:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E46EC1DDC;
	Sun,  1 Dec 2019 18:35:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3B7BC087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 18:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8188886CA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 18:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MrPpuxXHp_gf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 18:35:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 50ACE86C9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 18:35:45 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b19so17341088pfd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Dec 2019 10:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z3TzwSYn5g3MrmieUv6eN394fAt/3mpfuC3Uls+rr6g=;
 b=mKkA0pkGmxqIHJ+qCSrIllvlqSR4felhHMYUGM4ymrdXNEDhgAyVWK1U+EGU3Ck+ZC
 tctswF4V8L51AnZxXFHjaxhCCSJz7IuTZrnoIAxH/ZLRSxvm6qa+vvp2aQ9nyBs4qYmF
 T5QGEPaa9Cas4JUaJyL97bHVD9azTp14OdwikDC6Bq6hszF/OJGu4XaAlQbQoJp6EZPB
 P2XUFBtZU8Pkxr8T8KL8pfxl8pOre3rab0QHDFOUVn/HjvV5P1FHHylG7KtH0hVbyEXx
 p/TqnOs4xAOqhK+w0563YzN2fn57DxZB3oM50RvZd96z09P3cDgjgRn/tftf+zr5w10o
 g1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z3TzwSYn5g3MrmieUv6eN394fAt/3mpfuC3Uls+rr6g=;
 b=VU2XL3MEUSWVfWLoTb6tthxJvvzFjDEQIGUGTuUu3b97lFawmQohIH4GYp5/qJaxDT
 6QroKyURPYCeik+AGaUUo+Hyyjb8gNj1TchaZBIDhl0ObZeAcj64B8GTX1xj5kddPWc3
 Gec67XKEgNPbUhfGDAMhYurEtZ8CdhXkREe9jz76dp/EwYBd3g+PQ3kOJUQWAXpkPIRs
 Vfj7wh5G8hPvNGr+LRBEldFAwgttYbFWfjdhTpGK7wcmYmdWwFHDkC6u4GFYo0LoaUyK
 91VYNz05BfNvS/B5pprCOWn1jVexGBqFcempH5eFAe77y7M6fmPX9UuUO5CdsJpwRGKS
 ocig==
X-Gm-Message-State: APjAAAUSc3/5jUKxDLW2Cj7mnQfSU8o4QC2tZzxWiymWqhWpPeq++wT3
 PquuRmwLivQRtPGFdktO1Qg=
X-Google-Smtp-Source: APXvYqxg/NKmExH60ea61UZusx0DpypzbkLGYSHNbTZo/5IvSi29I/71C0L9mCytHATmuEAjrSguQw==
X-Received: by 2002:a63:e647:: with SMTP id p7mr28156201pgj.47.1575225344893; 
 Sun, 01 Dec 2019 10:35:44 -0800 (PST)
Received: from localhost.localdomain ([139.5.253.99])
 by smtp.googlemail.com with ESMTPSA id y128sm5432492pfg.17.2019.12.01.10.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2019 10:35:44 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Paul Moore <paul@paul-moore.com>,
	Eric Paris <eparis@redhat.com>
Date: Mon,  2 Dec 2019 00:03:48 +0530
Message-Id: <20191201183347.18122-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-audit@redhat.com,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3] kernel: audit.c: Add __rcu
	annotation to RCU pointer
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

Add __rcu annotation to RCU-protected global pointer auditd_conn.

auditd_conn is an RCU-protected global pointer,i.e., accessed
via RCU methods rcu_dereference() and rcu_assign_pointer(),
hence it must be annotated with __rcu for sparse to report
warnings/errors correctly.

Fix multiple instances of the sparse error:
error: incompatible types in comparison expression
(different address spaces)

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Amol Grover <frextrite@gmail.com>
---
v3:
- update changelog to be more descriptive

v2:
- fix erroneous RCU pointer initialization
 
 kernel/audit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index da8dc0db5bd3..ff7cfc61f53d 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -102,12 +102,13 @@ struct audit_net {
  * This struct is RCU protected; you must either hold the RCU lock for reading
  * or the associated spinlock for writing.
  */
-static struct auditd_connection {
+struct auditd_connection {
 	struct pid *pid;
 	u32 portid;
 	struct net *net;
 	struct rcu_head rcu;
-} *auditd_conn = NULL;
+};
+static struct auditd_connection __rcu *auditd_conn;
 static DEFINE_SPINLOCK(auditd_conn_lock);
 
 /* If audit_rate_limit is non-zero, limit the rate of sending audit records
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
