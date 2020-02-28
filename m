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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D58C3F2D0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Feb 2020 08:19:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20E9A246A3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Feb 2020 08:19:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF8EzwU6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20E9A246A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F207B20390;
	Fri, 28 Feb 2020 08:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s5qZErbQjbJw; Fri, 28 Feb 2020 08:19:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EB53B20421;
	Fri, 28 Feb 2020 08:19:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E19F4C1D80;
	Fri, 28 Feb 2020 08:19:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BBA2C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 08:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6909620421
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 08:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FDILn1uA9Ezj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 08:19:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 5B03820390
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 08:19:33 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 2so1321579pfg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 00:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=82hR3jxtPv4UggNL0wzEkgrjlskYE39vomAxuJiCLBc=;
 b=lF8EzwU6FiMyfYM17VgdfJRlWA1Cngg7w662b4E4QrKszsubmtKTlYbyi5xobHoLQK
 3i6p/VlC6tP3jrlL++O+5zrHqkw+7BzZY5YEg9hT+d9iCru4cq++vUG6ZFd9758OuQMD
 a9X+2PvDkLyvjcKf6zLj6h/twbH9Wb8B+vH9dmkGPEQXqA53hWhTsPv25xz9sAKkSCT7
 TVN/jNsx5Q5wQb7mfmdqMiEtEjR6aTmAQDcq+a9WUjLqOmflo7sJbVnbx0yXZ81447nk
 /j1mmawMVmBu37FXmc0oIfCUnrDW8BmszNpbWdPIyfrTrYtfN5Kh5PvNHWuLrCMY9m+K
 21SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=82hR3jxtPv4UggNL0wzEkgrjlskYE39vomAxuJiCLBc=;
 b=HtVknimndvqwRfis9nIZ0Rj7wpf5zDGwh3XjHbXy5BIAn5lN2jpJh15i63WesLGbu7
 hR4x73gskPfVN9k0NVOkSjVCRBxvqehw2DXvHc2O9t2rPLGC1KJ/UyaihiUptkA2n37M
 sb8ZwuLQs/QQ7fOOu4/BfiAY4vbzL+puFf3QBJfxWzgvnLchhZE2PvovkfouvyfjkVlF
 kvYBDR3pTcnruxUve75S239gdgI060j/fcNTLmYrBfsTxaO0w+GaKER9X6Q4iCjIT6GV
 PIl95cBHedh341iihl3KZMZPTDnljdskbrfXCX1FuA2u/8bLjjfHZYXnFPYebLwwyWGw
 ATuA==
X-Gm-Message-State: APjAAAXmTL22Gt3EK6zWo2NmOqksh27ob+y7QD32SrX654rrwHDBv7CM
 FcKX1SNItX6ElseJ0dUFHMY=
X-Google-Smtp-Source: APXvYqziHDDhfs5tzanK2PouHCdpnTx5zN5eNwSrR+ezntHCZVaBiSIlLux4fDYTeNcdcrX8aNgYkQ==
X-Received: by 2002:a62:e708:: with SMTP id s8mr3377192pfh.122.1582877972863; 
 Fri, 28 Feb 2020 00:19:32 -0800 (PST)
Received: from localhost.localdomain ([103.87.56.81])
 by smtp.gmail.com with ESMTPSA id w18sm10370516pfq.167.2020.02.28.00.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 00:19:31 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 28 Feb 2020 13:47:33 +0530
Message-Id: <20200228081731.18149-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: "Paul E . Mckenney" <paulmck@kernel.org>,
 John Garry <john.garry@huawei.com>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 openipmi-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] ipmi: Fix RCU list lockdep debugging
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

It is completely safe to traverse ipmi_interfaces and
intf->users under SRCU read lock using list_for_each_entry_rcu().
Tell lockdep about it as well else it will show false-positive
warnings as the one below.

Fixes the following false-positive warning and others that may follow.

[   29.772408] =============================
[   29.776863] WARNING: suspicious RCU usage
[   29.780915] 5.6.0-rc3-00001-g907305ae6618-dirty #1755 Not tainted
[   29.787046] -----------------------------
[   29.791100] drivers/char/ipmi/ipmi_msghandler.c:744 RCU-list traversed in
non-reader section!!

Reported-by: John Garry <john.garry@huawei.com>
Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index cad9563f8f48..d202022c69de 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -741,7 +741,8 @@ int ipmi_smi_watcher_register(struct ipmi_smi_watcher *watcher)
 	list_add(&watcher->link, &smi_watchers);
 
 	index = srcu_read_lock(&ipmi_interfaces_srcu);
-	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
+	list_for_each_entry_rcu(intf, &ipmi_interfaces, link,
+				srcu_read_lock_held(&ipmi_interfaces_srcu)) {
 		int intf_num = READ_ONCE(intf->intf_num);
 
 		if (intf_num == -1)
@@ -1188,7 +1189,8 @@ int ipmi_create_user(unsigned int          if_num,
 		return -ENOMEM;
 
 	index = srcu_read_lock(&ipmi_interfaces_srcu);
-	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
+	list_for_each_entry_rcu(intf, &ipmi_interfaces, link,
+				srcu_read_lock_held(&ipmi_interfaces_srcu)) {
 		if (intf->intf_num == if_num)
 			goto found;
 	}
@@ -1241,7 +1243,8 @@ int ipmi_get_smi_info(int if_num, struct ipmi_smi_info *data)
 	struct ipmi_smi *intf;
 
 	index = srcu_read_lock(&ipmi_interfaces_srcu);
-	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
+	list_for_each_entry_rcu(intf, &ipmi_interfaces, link,
+				srcu_read_lock_held(&ipmi_interfaces_srcu)) {
 		if (intf->intf_num == if_num)
 			goto found;
 	}
@@ -4098,7 +4101,8 @@ static int handle_read_event_rsp(struct ipmi_smi *intf,
 	 * getting events.
 	 */
 	index = srcu_read_lock(&intf->users_srcu);
-	list_for_each_entry_rcu(user, &intf->users, link) {
+	list_for_each_entry_rcu(user, &intf->users, link,
+				srcu_read_lock_held(&intf->users_srcu)) {
 		if (!user->gets_events)
 			continue;
 
@@ -4453,7 +4457,8 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
 		int index;
 
 		index = srcu_read_lock(&intf->users_srcu);
-		list_for_each_entry_rcu(user, &intf->users, link) {
+		list_for_each_entry_rcu(user, &intf->users, link,
+					srcu_read_lock_held(&intf->users_srcu)) {
 			if (user->handler->ipmi_watchdog_pretimeout)
 				user->handler->ipmi_watchdog_pretimeout(
 					user->handler_data);
@@ -4746,7 +4751,8 @@ static void ipmi_timeout(struct timer_list *unused)
 		return;
 
 	index = srcu_read_lock(&ipmi_interfaces_srcu);
-	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
+	list_for_each_entry_rcu(intf, &ipmi_interfaces, link,
+				srcu_read_lock_held(&ipmi_interfaces_srcu)) {
 		if (atomic_read(&intf->event_waiters)) {
 			intf->ticks_to_req_ev--;
 			if (intf->ticks_to_req_ev == 0) {
-- 
2.25.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
