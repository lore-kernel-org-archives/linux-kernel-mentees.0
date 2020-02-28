Return-Path: <SRS0=XrqI=4Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AA3C3F2D2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Feb 2020 17:47:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 109FA246A3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Feb 2020 17:47:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0LxLDIT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 109FA246A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 01DA386EEE;
	Fri, 28 Feb 2020 17:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L3XPTVYCpKTS; Fri, 28 Feb 2020 17:47:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 94C0086EDB;
	Fri, 28 Feb 2020 17:47:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8400BC1D84;
	Fri, 28 Feb 2020 17:47:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2300DC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 17:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 11D2E86EDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 17:47:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjh68XfMcBXo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 17:47:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2B00C86ED0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 17:47:55 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z12so1883270pgl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 09:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mbF4XFiS6x/5BZS7mexCEPridbNKUPiWYRQsLCRNJCo=;
 b=f0LxLDIT9xWUUwmWVjj7NAoPKpnD7jNta4pnOvb8zuLmJ7ug/BN1fsEt4Tb1W1QcIx
 2LXz+ekxLiyFG/NuSHPHBd0ypxFgI0FPbBYMesDgvODDWQNhsakGmAmhc9gjOmNVL4R9
 xwnf0IBRo0R+2gZe/p0AQIdUzFsE9sTGp0j0StwPhrwh4bnYdexajmr2m4gIXz1U3t7X
 lnEJJzMjXkNBt65X9dV5kjk6ViNBvd8E9FMDHAT5SVWfqKt5cuCItAES9mcLHCMShxRU
 JRdcr/LAfjoa64JeA9GChMEBHGzeYTA14H2hURszIqDrBhO2Vvfn1NlA3pSO6FaiTXgt
 iuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mbF4XFiS6x/5BZS7mexCEPridbNKUPiWYRQsLCRNJCo=;
 b=alEe3q+Av54OOlsQnDMqclwxEIe8QYpm62jaoXCnsvOhgI063NnOKaie+dpFh7W+g2
 sm5f6xIyPZi0soEfcXvsHhk7hRR0pPPAqrABUf+blZf8I7gD+/3xBtXDUQW02oRWfxR0
 2dL4lQvaJZjmBE/sQY4l+ZNgEvt4WA/XE+XphUPJqW5Q5y0G9CGC71ZzjPkBUnZ0MWRu
 X+HZVa8zmAINbavMmQEnveK8DtbW5dL3qzwmmwHFNkp0ggpgIVLqCQ4JdHWOsT3jeC4q
 aMZTEI6cPgY9tg4/tUV/jz4laSx18VL+u21gLPrEqAYRYkMZXn+BduLMqvSrqrq/NPH8
 vstQ==
X-Gm-Message-State: APjAAAUjN5fA/n5MPCRnhUh6c1DSqkBDMAsc3YMyEBp8SUQiPmtESIqd
 RNA0j970K8ub1iB464qswQ==
X-Google-Smtp-Source: APXvYqzpLT3JS4qNYEKWFKVXnrzTHsEGd1zfzZoEsVvoqi+FrVXXK08r8LC4AINXmrpIKnPh/nX2Yg==
X-Received: by 2002:aa7:8ad9:: with SMTP id b25mr5505864pfd.70.1582912074291; 
 Fri, 28 Feb 2020 09:47:54 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:55e:f10b:ac46:7428:aa52:2d70])
 by smtp.gmail.com with ESMTPSA id 10sm11599587pfu.132.2020.02.28.09.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 09:47:53 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: rjw@rjwysocki.net, pavel@ucw.cz, len.brown@intel.com,
 gregkh@linuxfoundation.org
Date: Fri, 28 Feb 2020 23:17:45 +0530
Message-Id: <20200228174745.9308-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] drivers: base: power: wakeup.c:
	Use built-in RCU list checking
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

Pass cond argument to list_for_each_entry_rcu() to fix the
following false positive lockdep warning and other uses of
list_for_each_entry_rcu() in wakeup.c.

[  331.934648] =============================
[  331.934650] WARNING: suspicious RCU usage
[  331.934653] 5.6.0-rc1+ #5 Not tainted
[  331.934655] -----------------------------
[  331.934657] drivers/base/power/wakeup.c:408 RCU-list traversed in non-reader section!!

[  333.025156] =============================
[  333.025161] WARNING: suspicious RCU usage
[  333.025168] 5.6.0-rc1+ #5 Not tainted
[  333.025173] -----------------------------
[  333.025180] drivers/base/power/wakeup.c:424 RCU-list traversed in non-reader section!!

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 drivers/base/power/wakeup.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
index 27f3e60608e5..d9fefc65ac34 100644
--- a/drivers/base/power/wakeup.c
+++ b/drivers/base/power/wakeup.c
@@ -405,7 +405,8 @@ void device_wakeup_arm_wake_irqs(void)
 	int srcuidx;
 
 	srcuidx = srcu_read_lock(&wakeup_srcu);
-	list_for_each_entry_rcu(ws, &wakeup_sources, entry)
+	list_for_each_entry_rcu(ws, &wakeup_sources, entry,
+				srcu_read_lock_held(&wakeup_srcu))
 		dev_pm_arm_wake_irq(ws->wakeirq);
 	srcu_read_unlock(&wakeup_srcu, srcuidx);
 }
@@ -421,7 +422,8 @@ void device_wakeup_disarm_wake_irqs(void)
 	int srcuidx;
 
 	srcuidx = srcu_read_lock(&wakeup_srcu);
-	list_for_each_entry_rcu(ws, &wakeup_sources, entry)
+	list_for_each_entry_rcu(ws, &wakeup_sources, entry,
+				srcu_read_lock_held(&wakeup_srcu))
 		dev_pm_disarm_wake_irq(ws->wakeirq);
 	srcu_read_unlock(&wakeup_srcu, srcuidx);
 }
@@ -874,7 +876,8 @@ void pm_print_active_wakeup_sources(void)
 	struct wakeup_source *last_activity_ws = NULL;
 
 	srcuidx = srcu_read_lock(&wakeup_srcu);
-	list_for_each_entry_rcu(ws, &wakeup_sources, entry) {
+	list_for_each_entry_rcu(ws, &wakeup_sources, entry,
+				srcu_read_lock_held(&wakeup_srcu)) {
 		if (ws->active) {
 			pm_pr_dbg("active wakeup source: %s\n", ws->name);
 			active = 1;
@@ -1025,7 +1028,8 @@ void pm_wakep_autosleep_enabled(bool set)
 	int srcuidx;
 
 	srcuidx = srcu_read_lock(&wakeup_srcu);
-	list_for_each_entry_rcu(ws, &wakeup_sources, entry) {
+	list_for_each_entry_rcu(ws, &wakeup_sources, entry,
+				srcu_read_lock_held(&wakeup_srcu)) {
 		spin_lock_irq(&ws->lock);
 		if (ws->autosleep_enabled != set) {
 			ws->autosleep_enabled = set;
@@ -1104,7 +1108,8 @@ static void *wakeup_sources_stats_seq_start(struct seq_file *m,
 	}
 
 	*srcuidx = srcu_read_lock(&wakeup_srcu);
-	list_for_each_entry_rcu(ws, &wakeup_sources, entry) {
+	list_for_each_entry_rcu(ws, &wakeup_sources, entry,
+				srcu_read_lock_held(&wakeup_srcu)) {
 		if (n-- <= 0)
 			return ws;
 	}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
