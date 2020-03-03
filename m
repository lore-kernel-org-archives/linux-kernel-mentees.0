Return-Path: <SRS0=4Pq9=4U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA09C3F2D8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Mar 2020 19:41:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2B8120870
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Mar 2020 19:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vZPrj14u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2B8120870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 87B60203D1;
	Tue,  3 Mar 2020 19:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yJAu5wY-huOO; Tue,  3 Mar 2020 19:41:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 601BD20436;
	Tue,  3 Mar 2020 19:41:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4938BC07FF;
	Tue,  3 Mar 2020 19:41:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19C2CC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 19:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 01D9685B4D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 19:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83copMI78uPm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 19:41:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 80570858A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 19:41:44 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id p7so1795176pli.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Mar 2020 11:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nELp/JsIU8Whx16SjmYjwVpYKQX+kqJ7/7LVzOVJkmo=;
 b=vZPrj14uv3brvCc5Zu4zoCn5pF7y85BGE0/vRBHEKsRUwrqxCy77nkHfvV66kJ4vpo
 yF7PHSNtCOlkU4XQcyRIgXI2BiZzQexki5PUHzjuXl9gF78LwYLC1AcNS0qaAffcLuMD
 lakqLTcF7mnyMDz8mEfRyeZ2/tZ8PICJlzM9oYSeYjJ0ZdtgZN+CbGgQxDtPm2I08V+3
 8XGPl7OkBY5u8QnnrHTXDwYMadY7nKaSLLhIE7zmrJH+j0+K5cl1rcLkP8iWz/oSmzQ9
 9CzwFdLxwC16gQKYIRyFPb90uC21gVPa1tsxnWdMav0cKE/MfXRSvZK4mZlgdULptVnA
 xCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nELp/JsIU8Whx16SjmYjwVpYKQX+kqJ7/7LVzOVJkmo=;
 b=BR8ev1i1r7rvaRqvAmIpxPVbioDYhGjC3ZAN0+cd15GpUn+BrdtaMyZnrn+9edyxnp
 E2T1tHGUiQYlwquiEph6iS6WQ6A6CcwRO0MsqRU0+XyaOzLkEYn+wqt1RicLdE45AiEa
 SWgj11qP2oofYOFghfi6P2FsIHE4RI9wqsH+9/2xxfsRXq2tzBv3tiSz8b+fvFg/6YjQ
 FKioGK58fP/i5ynILe49mcXnKJSqEp0m17x2F8LyWLqY2TyZLqo9BIu/nlbMvVVFu+vw
 cP++LDgIIfovkbZpC6ruw/qD9fD7Y8wDpB5BxOgD+x801eGZva8Tbc7OhOTBo+aycNWt
 bEIQ==
X-Gm-Message-State: ANhLgQ2L+sOqChkopTiOMXMsV2Zcnin+qIzZgvQhxmBlgddx0UKqwI4I
 XCiFC+9FH9vwjwV/qWWVsw==
X-Google-Smtp-Source: ADFU+vssPo5v9dRFhOkIA1Dbts1aFq2on91LBCVkSuAiPbQX5egOR8N8CD0FO2dxqsABmXgPcfi+2g==
X-Received: by 2002:a17:90a:eb0b:: with SMTP id
 j11mr127353pjz.145.1583264504055; 
 Tue, 03 Mar 2020 11:41:44 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee0:eafa:280b:b5cb:5e89:a52d])
 by smtp.gmail.com with ESMTPSA id w2sm25279628pfw.43.2020.03.03.11.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 11:41:42 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: rjw@rjwysocki.net, pavel@ucw.cz, len.brown@intel.com,
 gregkh@linuxfoundation.org
Date: Wed,  4 Mar 2020 01:11:30 +0530
Message-Id: <20200303194130.24617-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/2] drivers: base: power: main.c:
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

This patch passes the cond argument to list_for_each_entry_rcu()
to fix the following false-positive lockdep warnings:
(with CONFIG_PROVE_RCU_LIST = y)

[  330.302784] =============================
[  330.302789] WARNING: suspicious RCU usage
[  330.302796] 5.6.0-rc1+ #5 Not tainted
[  330.302801] -----------------------------
[  330.302808] drivers/base/power/main.c:326 RCU-list traversed in non-reader section!!

[  330.303303] =============================
[  330.303307] WARNING: suspicious RCU usage
[  330.303311] 5.6.0-rc1+ #5 Not tainted
[  330.303315] -----------------------------
[  330.303319] drivers/base/power/main.c:1698 RCU-list traversed in non-reader section!!

[  331.934969] =============================
[  331.934971] WARNING: suspicious RCU usage
[  331.934973] 5.6.0-rc1+ #5 Not tainted
[  331.934975] -----------------------------
[  331.934977] drivers/base/power/main.c:1238 RCU-list traversed in non-reader section!!

[  332.467772] WARNING: suspicious RCU usage
[  332.467775] 5.6.0-rc1+ #5 Not tainted
[  332.467775] -----------------------------
[  332.467778] drivers/base/power/main.c:269 RCU-list traversed in non-reader section!!

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 drivers/base/power/main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 0e99a760aebd..6d1dee7051eb 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -40,6 +40,10 @@
 
 typedef int (*pm_callback_t)(struct device *);
 
+#define list_for_each_entry_rcu_locked(pos, head, member) \
+	list_for_each_entry_rcu(pos, head, member, \
+			device_links_read_lock_held())
+
 /*
  * The entries in the dpm_list list are in a depth first order, simply
  * because children are guaranteed to be discovered after parents, and
@@ -266,7 +270,7 @@ static void dpm_wait_for_suppliers(struct device *dev, bool async)
 	 * callbacks freeing the link objects for the links in the list we're
 	 * walking.
 	 */
-	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node)
+	list_for_each_entry_rcu_locked(link, &dev->links.suppliers, c_node)
 		if (READ_ONCE(link->status) != DL_STATE_DORMANT)
 			dpm_wait(link->supplier, async);
 
@@ -323,7 +327,7 @@ static void dpm_wait_for_consumers(struct device *dev, bool async)
 	 * continue instead of trying to continue in parallel with its
 	 * unregistration).
 	 */
-	list_for_each_entry_rcu(link, &dev->links.consumers, s_node)
+	list_for_each_entry_rcu_locked(link, &dev->links.consumers, s_node)
 		if (READ_ONCE(link->status) != DL_STATE_DORMANT)
 			dpm_wait(link->consumer, async);
 
@@ -1235,7 +1239,7 @@ static void dpm_superior_set_must_resume(struct device *dev)
 
 	idx = device_links_read_lock();
 
-	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node)
+	list_for_each_entry_rcu_locked(link, &dev->links.suppliers, c_node)
 		link->supplier->power.must_resume = true;
 
 	device_links_read_unlock(idx);
@@ -1695,7 +1699,7 @@ static void dpm_clear_superiors_direct_complete(struct device *dev)
 
 	idx = device_links_read_lock();
 
-	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node) {
+	list_for_each_entry_rcu_locked(link, &dev->links.suppliers, c_node) {
 		spin_lock_irq(&link->supplier->power.lock);
 		link->supplier->power.direct_complete = false;
 		spin_unlock_irq(&link->supplier->power.lock);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
