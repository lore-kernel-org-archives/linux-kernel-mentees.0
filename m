Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFB6C3F68F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:06:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 221542084D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhVSeVrU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 221542084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DECFB87697;
	Fri, 10 Jan 2020 17:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gN7E-1twGlGa; Fri, 10 Jan 2020 17:06:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D043E86B43;
	Fri, 10 Jan 2020 17:06:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9278C1D7D;
	Fri, 10 Jan 2020 17:06:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04E92C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E83DD87020
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5mjvKYCV1fEK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:06:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6487D86F3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:06:53 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n9so1405987pff.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 09:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RLhr45RoJXGQnRV7JLJiMgVzO70txR/YEjrlTrJZ7UY=;
 b=PhVSeVrUyIEGCIorTk8g5xUdqi3u78wH6knFhMtFpTNOa+M4lr0CexHagEdTL5gqf3
 0DSO32la9P0eBJg1TXyyVISeZC05NauRTHdkIlPlDaymiS1VIz9VZ7sSbltdjLcuTpUf
 c30cU8CFWJutf2Kx2Xr93irsNQX6ob8dZ/Y6nrmY8v7so71X2wluwCduV+Cter7skqas
 kH4o3SCNxBX9ENxLpjpSRhI23oagm5BETD95hYV9q+CjVoDwzjtcw2KataUsE2gW1myk
 h3L0GOAooqvtsqowNn+hoJhYA2DkFJvf8YHz3rJbZFH9Wd/W2vMw5eKMw7r1s6auOW1U
 /uWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RLhr45RoJXGQnRV7JLJiMgVzO70txR/YEjrlTrJZ7UY=;
 b=NLUkdChvYvxMB7dP4ggPCacF9zSADfqYEmpzLALFZjyQmSK1uejKjNiDaRS7KfaW6a
 kCC1OAEs9kODkS5popd0HLoE9eIKw7EJxV3syCgcacDsa2tZ0c9mCrWZcLlr3dOFXVe1
 xHvjX3wFeQg1qYouB7H82BoVNkWZ//rvesPaFIcx9XdG5agbSqHNI8kAzOGoIRvjZcvb
 DE3lNtPyvmsugEpCQ2Iy1ytzRE1bTKEuXGjrBC6hh8llpQMFHWFuJ12K0CUYdlR+BcuC
 GNYsmfRYKd+KhqFBl1jEK0AtAfblAmePaJ1qk35s9urDDw2OSjynpH8YI43ohWYMojDV
 +8VA==
X-Gm-Message-State: APjAAAV8L2NTKbTN0JeP0DMBTFtrWb/M6KwrpesF0E8p6wR69sN2vxza
 3aFvpdPtw/5mAEGJWF/A8lA=
X-Google-Smtp-Source: APXvYqxuHWRKp9D0rnGlVT2CZw2phPRFzBx8WfA6+qaKzw02yVbJKcn0hKB09/wXvEzK3YOcEn8u9g==
X-Received: by 2002:a63:214e:: with SMTP id s14mr5503825pgm.428.1578676012989; 
 Fri, 10 Jan 2020 09:06:52 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.220])
 by smtp.googlemail.com with ESMTPSA id x4sm3613268pff.143.2020.01.10.09.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 09:06:52 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 10 Jan 2020 22:35:58 +0530
Message-Id: <20200110170558.23466-2-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200110170558.23466-1-frextrite@gmail.com>
References: <20200110170558.23466-1-frextrite@gmail.com>
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, target-devel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 2/3] drivers: target:
	target_core_tpg: Pass lockdep expression to RCU lists
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

tpg->tpg_lun_hlist is traversed with hlist_for_each_entry_rcu
outside an RCU read-side critical section but under the
protection of tpg->tpg_lun_mutex.

Hence, add the corresponding lockdep expression to the list traversal
primitive to silence false-positive lockdep warnings, and
harden RCU lists.

Add macro for the corresponding lockdep expression to make the code
clean and concise.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 drivers/target/target_core_tpg.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/target/target_core_tpg.c b/drivers/target/target_core_tpg.c
index d24e0a3ba3ff..0d89b738ca6e 100644
--- a/drivers/target/target_core_tpg.c
+++ b/drivers/target/target_core_tpg.c
@@ -30,6 +30,9 @@
 #include "target_core_pr.h"
 #include "target_core_ua.h"
 
+#define tpg_lun_mutex_held() \
+	lockdep_is_held(&tpg->tpg_lun_mutex)
+
 extern struct se_device *g_lun0_dev;
 
 /*	__core_tpg_get_initiator_node_acl():
@@ -110,12 +113,12 @@ void core_tpg_add_node_to_devs(
 	struct se_device *dev;
 
 	mutex_lock(&tpg->tpg_lun_mutex);
-	hlist_for_each_entry_rcu(lun, &tpg->tpg_lun_hlist, link) {
+	hlist_for_each_entry_rcu(lun, &tpg->tpg_lun_hlist, link,
+				 tpg_lun_mutex_held()) {
 		if (lun_orig && lun != lun_orig)
 			continue;
 
-		dev = rcu_dereference_check(lun->lun_se_dev,
-					    lockdep_is_held(&tpg->tpg_lun_mutex));
+		dev = rcu_dereference_check(lun->lun_se_dev, tpg_lun_mutex_held());
 		/*
 		 * By default in LIO-Target $FABRIC_MOD,
 		 * demo_mode_write_protect is ON, or READ_ONLY;
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
