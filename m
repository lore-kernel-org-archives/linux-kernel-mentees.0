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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D5FC3F2D2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Feb 2020 17:47:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1448246A3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Feb 2020 17:47:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJm/yUMM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1448246A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A2E0E88275;
	Fri, 28 Feb 2020 17:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ndM-ywjrPmuz; Fri, 28 Feb 2020 17:47:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1FC55859E3;
	Fri, 28 Feb 2020 17:47:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13EC2C1D84;
	Fri, 28 Feb 2020 17:47:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C051CC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 17:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AED60881E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 17:47:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9a5bZGBvi1SI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 17:47:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2993A859E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 17:47:22 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id a16so1255678pju.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 09:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/ePEVzu9e29X32t3wuKx/BpiwqdFAtZzo2j4Ye/PyAI=;
 b=LJm/yUMM8qY9Sd7VgQAu2efugQyMRzQkJf2M7pKJfKSeC7+Y3MqFWqPOePjptFMcX4
 0BjwICO4gfEeGTmNXsuBua+5tT9yIn8mLlbKmw9lv+vfxShZRV3rYB3PZ4I+bNXGLFUd
 mI/gsu14IHvA3EP8rggSh67w//AI91K/Y7ygE7i1upuVdQztAVcL5s5kJE41nPWpn8wI
 MroZov9GYjLvOlW1i3mFuFQn8/IFT8Y/S1wlaDgl4etydLwrrDu448tCcvlAWUpiloKf
 79UQzRAQ2ZaFQxJY2W3r1fLlF/fii7qXwpJ6NcmHbNeGLGGpCajUuzSMu9NduI8gtw1W
 BHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/ePEVzu9e29X32t3wuKx/BpiwqdFAtZzo2j4Ye/PyAI=;
 b=tSh1Gqp4tnbA3VChnyC4GXsV7MD3c2U5eWId//sqzR2TelPy3RHD1xxoo/ew04FOPz
 ljKoXuk+peURrcuHNghOGbJDuOIXc9GQbS9r+7v2YfWG+c6pULQeZzRyOU0chsc+xYfC
 u1liIuVtVT55S8QgUibAtIuYqS7Zj8etkqS/zNX7pC5jyee0ROVLhoe2Fwt12Xkr4VX9
 oVX5ClyueIooj7ZrCtzf7gZhNBubH8a/Hq/RQE2QWTRfemMP9/ijRbT0ntclC+JNyqb4
 yyUbrq8Ad0wIYl26A3rQhWdRUIVj4JplfEBUobhmkXXNFHFe4w9YazqRXE6tINz/c9Nk
 Mr5A==
X-Gm-Message-State: APjAAAXnhuLRi+gWJDrHICucigwWivnuegOL1TUgEbmjzitDSQ2JNCft
 wHHdf9voY9XxY4lAiGDYCw==
X-Google-Smtp-Source: APXvYqx7VY1S5VZYqBM44Swe2WbZnQNZrK1WgQqQMKKWRP0e7OmJ4tiGUUnHgIfsmoPTjpkOwsYoWA==
X-Received: by 2002:a17:90a:cf11:: with SMTP id
 h17mr5967943pju.103.1582912041716; 
 Fri, 28 Feb 2020 09:47:21 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:55e:f10b:ac46:7428:aa52:2d70])
 by smtp.gmail.com with ESMTPSA id y15sm10679874pgj.78.2020.02.28.09.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 09:47:21 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: rjw@rjwysocki.net, pavel@ucw.cz, len.brown@intel.com,
 gregkh@linuxfoundation.org
Date: Fri, 28 Feb 2020 23:16:30 +0530
Message-Id: <20200228174630.8989-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/2] drivers: base: power: main: Use
	built-in RCU list checking
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
index 0e99a760aebd..742c05f3c1e7 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -266,7 +266,8 @@ static void dpm_wait_for_suppliers(struct device *dev, bool async)
 	 * callbacks freeing the link objects for the links in the list we're
 	 * walking.
 	 */
-	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node)
+	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
+				device_links_read_lock_held())
 		if (READ_ONCE(link->status) != DL_STATE_DORMANT)
 			dpm_wait(link->supplier, async);
 
@@ -323,7 +324,8 @@ static void dpm_wait_for_consumers(struct device *dev, bool async)
 	 * continue instead of trying to continue in parallel with its
 	 * unregistration).
 	 */
-	list_for_each_entry_rcu(link, &dev->links.consumers, s_node)
+	list_for_each_entry_rcu(link, &dev->links.consumers, s_node,
+				 device_links_read_lock_held())
 		if (READ_ONCE(link->status) != DL_STATE_DORMANT)
 			dpm_wait(link->consumer, async);
 
@@ -1235,7 +1237,8 @@ static void dpm_superior_set_must_resume(struct device *dev)
 
 	idx = device_links_read_lock();
 
-	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node)
+	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
+				 device_links_read_lock_held())
 		link->supplier->power.must_resume = true;
 
 	device_links_read_unlock(idx);
@@ -1695,7 +1698,8 @@ static void dpm_clear_superiors_direct_complete(struct device *dev)
 
 	idx = device_links_read_lock();
 
-	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node) {
+	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
+				 device_links_read_lock_held()) {
 		spin_lock_irq(&link->supplier->power.lock);
 		link->supplier->power.direct_complete = false;
 		spin_unlock_irq(&link->supplier->power.lock);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
