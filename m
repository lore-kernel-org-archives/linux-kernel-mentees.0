Return-Path: <SRS0=knry=2Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64ABFC2D0C2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  4 Jan 2020 14:43:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CAB420672
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  4 Jan 2020 14:43:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uKme5RRt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CAB420672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F0DAD203BE;
	Sat,  4 Jan 2020 14:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7vpeDW+4PG7Z; Sat,  4 Jan 2020 14:42:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6673520034;
	Sat,  4 Jan 2020 14:42:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 520ACC18DD;
	Sat,  4 Jan 2020 14:42:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04456C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  4 Jan 2020 14:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E10BA20034
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  4 Jan 2020 14:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M2EnvnSt+VRU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  4 Jan 2020 14:42:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 4F2BD20033
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  4 Jan 2020 14:42:57 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id i23so19425390pfo.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 04 Jan 2020 06:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2M7YOorv6RwrWVHgY3ejHrhkHuQ38MnpPJ/NxaJYkHo=;
 b=uKme5RRtW2QUsgxM60TcBzlZn3rSeNUUMtdWjlLJS7l03mysWXT9kH5aZvpctX4p8v
 rI6qIfsl+QwV2AC1DvRKx8VQrWeYJUEBTdiU/cU9p96UWpShC0EVFsQL1EiAha1dTJ8k
 XzyMHa/VORUWnW2dMhR4UAYjQ3fx6tVPu+ALVf2SaBnKMksxZi34jrE5Z/PNhFrCD0X4
 gRC8YLFa7MpuPxXOU1elcdcdE0XWbQ1Rd1xWhKIrB5mKtdGW19eMYtwKiQsIynqWqC5A
 nqV1Wink3V2j2XbHRgqRZEHZdq8DGlMOqYsqwrmMyJZY9oc/OnH9cdyZC/z1pqeKyXot
 Zk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2M7YOorv6RwrWVHgY3ejHrhkHuQ38MnpPJ/NxaJYkHo=;
 b=dubER+8P3jwvK3n+sVCRlhWuqUvfuMSDFlb5XyNeEipWzjNpftPpZG4Pqw/RP0727A
 Y0p+1qv2+tcKZZiopBduDiKP7Pivia51+dz4Q9vMNojeNprzF1IrabnnHzqE48G1b1AN
 ehpobw/oLf6W3eVnDtqDwU22Xq0M/b8JeQ3j4futvA48VSMHAdTeNXmUCPXnWydMWbb1
 TUofkOM87FozhjwwwGryDMfzOER51jtbNCxXmT+8LDwi8Yu4o80eTTW6YwlJYSDai6In
 hBlk+znrhhUkrybXlJIAOhJK1A6usJKviTnX5ozmcKRqQ9HOjl5BpSHQZvxvuF6uOQWH
 fmog==
X-Gm-Message-State: APjAAAUrhkXRnyo3Rj4b5a7fXmnZdMvMU8RL9FLU12UKMCehrCTFCzoI
 J9+hoI0K0zSDk7sc+9H5fc0=
X-Google-Smtp-Source: APXvYqzu3vHs/8ZRUpe2NLQSR5KwKW0pTRj52d3eonQ5TWWthYdonYnF4WQCOhezs0e+4EXEt2tUcQ==
X-Received: by 2002:aa7:92c2:: with SMTP id k2mr76230776pfa.93.1578148976837; 
 Sat, 04 Jan 2020 06:42:56 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee1:e8a5:200b:101a:37e8:7497])
 by smtp.gmail.com with ESMTPSA id z30sm73490238pff.131.2020.01.04.06.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2020 06:42:56 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: stefanr@s5r6.in-berlin.de,
	paulmck@kernel.org,
	joel@joelfernandes.org
Date: Sat,  4 Jan 2020 20:12:15 +0530
Message-Id: <20200104144215.27590-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] drivers: firewire: core-transaction:
	Pass lockdep condition to address_handler_list iterator
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

The address_handler_list is traversed with list_for_each_entry_rcu
with address_handler_list_lock held.
list_for_each_entry_rcu has built-in RCU and lock checking.
Use it for address_handler_list traversal.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 drivers/firewire/core-transaction.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 404a035f104d..a15e70027932 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -61,6 +61,11 @@
 #define PHY_CONFIG_ROOT_ID(node_id)	((((node_id) & 0x3f) << 24) | (1 << 23))
 #define PHY_IDENTIFIER(id)		((id) << 30)
 
+static DEFINE_SPINLOCK(address_handler_list_lock);
+static LIST_HEAD(address_handler_list);
+
+#define address_handler_list_lock_held() lock_is_held(&(address_handler_list_lock).dep_map)
+
 /* returns 0 if the split timeout handler is already running */
 static int try_cancel_split_timeout(struct fw_transaction *t)
 {
@@ -485,7 +490,7 @@ static struct fw_address_handler *lookup_overlapping_address_handler(
 {
 	struct fw_address_handler *handler;
 
-	list_for_each_entry_rcu(handler, list, link) {
+	list_for_each_entry_rcu(handler, list, link, address_handler_list_lock_held()) {
 		if (handler->offset < offset + length &&
 		    offset < handler->offset + handler->length)
 			return handler;
@@ -514,8 +519,6 @@ static struct fw_address_handler *lookup_enclosing_address_handler(
 	return NULL;
 }
 
-static DEFINE_SPINLOCK(address_handler_list_lock);
-static LIST_HEAD(address_handler_list);
 
 const struct fw_address_region fw_high_memory_region =
 	{ .start = FW_MAX_PHYSICAL_RANGE, .end = 0xffffe0000000ULL, };
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
