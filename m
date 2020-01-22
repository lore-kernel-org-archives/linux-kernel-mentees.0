Return-Path: <SRS0=N8o/=3L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204E4C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jan 2020 18:12:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E312465B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jan 2020 18:12:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bda7f3bY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4E312465B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B8B086BAD;
	Wed, 22 Jan 2020 18:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HQp+MD2LEok2; Wed, 22 Jan 2020 18:12:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4772786C02;
	Wed, 22 Jan 2020 18:12:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36CC1C0176;
	Wed, 22 Jan 2020 18:12:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FA0EC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 18:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3F3D284EDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 18:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id scCIsG4qRzXy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 18:12:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D50738444F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 18:12:24 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id b9so3902732pgk.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 10:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=B+Ke+CwXs3xGZ3tbHutNH7xTsHS0Vqf+fEezUoTK8sI=;
 b=bda7f3bYbWYwtQeloFHRnTLyX8sWbVzc0HsDmPCfdsuO6Mf0xeo4BFdz2sBjCbjEuN
 EguKTtqCDNevzmVON+sBVBf12Jx2qNh5b8Z2wS+tpf7WkALZNGM0UMJAxr0sfNRfd+Qm
 pLdspVaoxFjnRIbWimsGCNPHbYz02TXLokZEhlUFfllw8Ybt1F/uFlLxjc/E20Ho2WYy
 k0detZwWRPpM6jedtLBm/FbrZkYQ/xsUqsi0BbMPAXqDn0TYqUvHVV+Z5PJUmLslZSqo
 RRFJRsCBnETN1spx0U+hqaG/upS/uCVQu0k66SUGr3MOc28mEWidc4lDucHBWhyVjYzr
 vksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=B+Ke+CwXs3xGZ3tbHutNH7xTsHS0Vqf+fEezUoTK8sI=;
 b=FQ+azNgnSEbgXF12nyzNmVftZxTadlZ5wNEU/ihOzxagpzrN4tX9vzAWFkxjmwTI+r
 xF07KNKVAHtVvDsqMLkaGa1LV1vLpSHpi5q54yLyjNqDd7xQ5iH8hMIgAa/nv1p/x2WE
 hQLMkBNGWGFmYqT4Mwe2rx2F9G1Pwk1d8Y6XVgrgHGfd7DGImdMcOeJiL9CSed3HAhU+
 ZkATMtl5uJ3H25CFh3cXVYRR2UjdfZ99+m5TIc/m3KA83guel+Wj1uBUlqHLXEDyFtYT
 mQGaiLPZQbbnkXmhie9sDhmhAC+MGdW+cconPHOtCw/RO4/TbbGP4OHsiKh5xScb9bE0
 CefQ==
X-Gm-Message-State: APjAAAXxvBLkMzjG3h2v0GgI+Pi03HQrpH1Zn2eFqNB6Jcg/hrNXalnp
 YbtCdb/0RX4FlJY3c64sRA==
X-Google-Smtp-Source: APXvYqxEMMqFZ6pi6+0X1WZIqS3erRAUcOz3R2ZqRGGwv2CMP7f+uwwCFdtTKvcplNBpEwBBCngHsg==
X-Received: by 2002:a62:1d52:: with SMTP id d79mr3688669pfd.144.1579716744488; 
 Wed, 22 Jan 2020 10:12:24 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1eee:fc60:1df1:6c1a:3227:9ec0])
 by smtp.gmail.com with ESMTPSA id k10sm4167646pjq.14.2020.01.22.10.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 10:12:23 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: mingo@redhat.com,
	peterz@infradead.org
Date: Wed, 22 Jan 2020 23:41:56 +0530
Message-Id: <20200122181156.27244-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] sched.h: Annotate sighand_struct
	with __rcu
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

This patch fixes the following sparse errors:

kernel/fork.c:1511:9: error: incompatible types in comparison expression
kernel/exit.c:100:19: error: incompatible types in comparison expression
kernel/signal.c:1370:27: error: incompatible types in comparison expression

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 include/linux/sched.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index b511e178a89f..7a351360ad54 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -918,7 +918,7 @@ struct task_struct {
 
 	/* Signal handlers: */
 	struct signal_struct		*signal;
-	struct sighand_struct		*sighand;
+	struct sighand_struct __rcu		*sighand;
 	sigset_t			blocked;
 	sigset_t			real_blocked;
 	/* Restored if set_restore_sigmask() was used: */
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
