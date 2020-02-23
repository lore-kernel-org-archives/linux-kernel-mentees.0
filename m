Return-Path: <SRS0=/lQp=4L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B63C35666
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 16:56:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE552206E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 16:56:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNxBBtQQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE552206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A5C5320385;
	Sun, 23 Feb 2020 16:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MO9pT-pAKmCb; Sun, 23 Feb 2020 16:56:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 000DD20368;
	Sun, 23 Feb 2020 16:56:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D82ADC1AE2;
	Sun, 23 Feb 2020 16:56:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5000AC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 16:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 39DF086091
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 16:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MPm2ykTFUY-e
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 16:56:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 80FB985BFA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 16:56:29 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id j9so4023976pfa.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 08:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XO/sXJfBbNEYg2i8BDzFxjIgOlJB//vgC4CZTQZkcBA=;
 b=rNxBBtQQ1h5eC9GnaO1XpnGSAjJa4rsyMbEEzEVTUc8l1CUM0ZZ3ngDfRF8PwBRzN2
 Yji+hNUzryaURte9YdjZk86z6uPbnY1szJ5McZdvntrRy8r+P0Yv/JPWNq8V0SvaSvU6
 vV6T1JAxzpg95RMTwg9bg3wyjvQLQpNNQdedXg6xEgpYy2zf9tvt2qUHhsDK0Vc9vkcu
 XtQiGCLdd6ucO56lFizA2Rlk9e+QkIK6hH1K3kGB6jemkc5I9nyn7vQjcLVS8ilTEjdo
 G+cuLea2aa1wuPomW/yi6JtUde3y2Bq8MDrA1rBqzpSk5V3MTQxx18F3ToUbeOz/V/Vs
 0eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XO/sXJfBbNEYg2i8BDzFxjIgOlJB//vgC4CZTQZkcBA=;
 b=lxZLZXPzNEmW63tfdkbowm5mKibnHhoV0PPfX28UrZj7oi1v5CJxM0DWzv6X9O+xSJ
 00MZA2r6vP4JIoeuLo2w9P3gOhn9ougKgaNT1tsP2M9rTdpQWizPO1P3LZ++R/4PzhvU
 BHzJV1u6xJJol9zE/JSFMv4yXB/siKT265Q6FFgpR5MkfqgSWZN2sYqlb7LtVXrOj/Ks
 OQfalX/CSFFopDSDfptcy0I2gaiTGv7MKgu3pPYPNfmbA78OFLkkJJa8dMAMOKtN+Uff
 CTIFJPMEhcCFDx/4Iz5FSfa7r3L1u+lm3ZIRd6WHGu17yCaDlmHCRX3Gsp4oOiwSAz1Z
 6rXw==
X-Gm-Message-State: APjAAAVYSW3Jy5F2r5s9E8GHXZzSq6uy7UeTmNthfLcxYiiDHhwmWiA7
 0tmRHgTxNkfjjQn5uv8AjP8=
X-Google-Smtp-Source: APXvYqyvnAQXYZAiSHcAnr/jKPHoPF8Iqskeukk8OF7zchfnsQWbllUez8qGeMaCz0/RIlFJvn6mXw==
X-Received: by 2002:a63:d10c:: with SMTP id k12mr3913240pgg.392.1582476988971; 
 Sun, 23 Feb 2020 08:56:28 -0800 (PST)
Received: from localhost.localdomain ([103.87.57.33])
 by smtp.googlemail.com with ESMTPSA id w8sm9482995pfn.186.2020.02.23.08.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 08:56:28 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Qian Cai <cai@lca.pw>, Deepa Dinamani <deepa.kernel@gmail.com>,
 Joerg Roedel <joro@8bytes.org>
Date: Sun, 23 Feb 2020 22:25:39 +0530
Message-Id: <20200223165538.29870-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RESEND] iommu: dmar: Fix RCU list
	debugging warnings
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
