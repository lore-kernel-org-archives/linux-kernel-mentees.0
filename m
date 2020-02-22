Return-Path: <SRS0=qNNM=4K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCEEC35672
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 17:03:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A7B120702
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 17:03:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJmGn2jA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A7B120702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3238C86246;
	Sat, 22 Feb 2020 17:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWcovgkoVYTL; Sat, 22 Feb 2020 17:03:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A2D528364D;
	Sat, 22 Feb 2020 17:03:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C7FDC1D81;
	Sat, 22 Feb 2020 17:03:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2FE6C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 17:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9C6818561E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 17:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mdVNgaW2Nxmx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 17:03:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1B7F28560E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 17:03:56 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id b9so2645092pgk.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 09:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XO/sXJfBbNEYg2i8BDzFxjIgOlJB//vgC4CZTQZkcBA=;
 b=PJmGn2jApbOjslqr8jSDJI6wgkUPvtJw+T1CKTeT7HgtsLJPEzjkhoAJt0d5kMaAg1
 1wUpg4ZzCivc9q/Ma0ZnjuzyhAiYmmC83H1XBgFzQ8IlM25FN0pqjduiRNAijPxfVBKO
 ZdwNLf++C3filmTuiH4b5cPn3Tb0PH7nKLMh8dqGwvrHpTY7tR3iUEOqZLIPJkhN5onm
 GPlV8ugIs/Hp3NfC0ZcUTkmNAedBOgXOg/+UD+7j/jYwEo6Dl0ZLTIFoxNGsgM1h0rI8
 OOdJBAYJaUYXVINQYY+xhJHOKvliSwRdQEshUKSZ2azB2KzwUNjPR3byMUa9afzAQztK
 0klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XO/sXJfBbNEYg2i8BDzFxjIgOlJB//vgC4CZTQZkcBA=;
 b=W/DOr/J8Ad4l7vNCHc1xXn0+zX8ZymuZHF2PKj9k2q4CP1GTLQdlGgrYfXvWnI8UHL
 sv/HBzjU/MS4c1cqYPAJXykljMjiO3NNZUHZvkyv/ZaVp6QPW2hB4xLNdyCoGtQR/0XB
 KhPD0hV8kPM5MzFJDOf2Pua0iXZXdc8G48TBE6NQpzmQ2KkGtsTV0PYng28PFTCI+DQP
 7EdsCCzdPN7dtdo8B04PdKCdfY9yowTdJE5vp8vjN3pzAeL4k7aknYukvhuIMs1VGxEE
 G3Adv+V+WLZAoDR7V0YXkArTHi7EuAQBZh6UHA7wSO9iMGszfQX10KpY5nwLqrzmaa4p
 5Bbw==
X-Gm-Message-State: APjAAAW3d+jmqzJlibdnKsmrImUrH6yT9iHVY8eOUJsPAnV1BnlcC2Sj
 FvBJ9qQWbCQS47tV5VfR32c=
X-Google-Smtp-Source: APXvYqxOsT7MWSDKmWYMFdKJpmiJl9IDPRCtUX0zHZya0dBoV+yHgENdK086iULD2/pZnYfgXJinww==
X-Received: by 2002:a63:5d47:: with SMTP id o7mr10454009pgm.327.1582391035691; 
 Sat, 22 Feb 2020 09:03:55 -0800 (PST)
Received: from localhost.localdomain ([103.87.57.201])
 by smtp.googlemail.com with ESMTPSA id z64sm7286220pfz.23.2020.02.22.09.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 09:03:55 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Qian Cai <cai@lca.pw>, Deepa Dinamani <deepa.kernel@gmail.com>
Date: Sat, 22 Feb 2020 22:33:33 +0530
Message-Id: <20200222170333.10570-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] iommu: dmar: Fix RCU list debugging
	warnings
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

dmar_drhd_units is traversed using list_for_each_entry_rcu()
outside of an RCU read side critical section but under the
protection of dmar_global_lock. Hence add corresponding lockdep
expression to silence the following false-positive warnings:

[    1.603975] =============================
[    1.603976] WARNING: suspicious RCU usage
[    1.603977] 5.5.4-stable #17 Not tainted
[    1.603978] -----------------------------
[    1.603980] drivers/iommu/intel-iommu.c:4769 RCU-list traversed in non-reader section!!

[    1.603869] =============================
[    1.603870] WARNING: suspicious RCU usage
[    1.603872] 5.5.4-stable #17 Not tainted
[    1.603874] -----------------------------
[    1.603875] drivers/iommu/dmar.c:293 RCU-list traversed in non-reader section!!

Tested-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 include/linux/dmar.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/dmar.h b/include/linux/dmar.h
index f64ca27dc210..712be8bc6a7c 100644
--- a/include/linux/dmar.h
+++ b/include/linux/dmar.h
@@ -69,8 +69,9 @@ struct dmar_pci_notify_info {
 extern struct rw_semaphore dmar_global_lock;
 extern struct list_head dmar_drhd_units;
 
-#define for_each_drhd_unit(drhd) \
-	list_for_each_entry_rcu(drhd, &dmar_drhd_units, list)
+#define for_each_drhd_unit(drhd)					\
+	list_for_each_entry_rcu(drhd, &dmar_drhd_units, list,		\
+				dmar_rcu_check())
 
 #define for_each_active_drhd_unit(drhd)					\
 	list_for_each_entry_rcu(drhd, &dmar_drhd_units, list)		\
@@ -81,7 +82,8 @@ extern struct list_head dmar_drhd_units;
 		if (i=drhd->iommu, drhd->ignored) {} else
 
 #define for_each_iommu(i, drhd)						\
-	list_for_each_entry_rcu(drhd, &dmar_drhd_units, list)		\
+	list_for_each_entry_rcu(drhd, &dmar_drhd_units, list,		\
+				dmar_rcu_check())			\
 		if (i=drhd->iommu, 0) {} else 
 
 static inline bool dmar_rcu_check(void)
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
