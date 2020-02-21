Return-Path: <SRS0=GVOk=4J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704A3C35657
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 16:53:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37E75222C4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 16:53:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQEmUwEr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37E75222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1231F87620;
	Fri, 21 Feb 2020 16:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZvUNCnpnwaaB; Fri, 21 Feb 2020 16:53:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AC0168761D;
	Fri, 21 Feb 2020 16:53:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97E30C07FE;
	Fri, 21 Feb 2020 16:53:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FCB2C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 16:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B80688796C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 16:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UcYBFjmIm9q0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 16:53:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5C323877D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 16:53:09 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 84so1520246pfy.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 08:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2hY9rIiih8tmdugozlZsp7q9G6E5pP7+c2/8u13UX8A=;
 b=LQEmUwErip2nQCUkW0HJOVtYZuDA/PNx8tbnf+qcUjlmDRz4It46DzTFWcf2S4EGIE
 /s6JUGUihBgs1Lma2v/xZ6eeVNL1+cSzGsqtNINMYWc7Mxj21e9B4kcZA+hwCl6J5CEk
 MKsmP1qR4BVUS5kAA+5YlTbIQsWLGzwH6rLx6DvfNAhiR+v16g3Fp/e6Cfi2LI03fy0/
 OoqPMUwUwKPwlG/qU4zq64qbPkydQ0vzuXEPuQTr1d8B8m66k+GGZaY+0rbMo2Q0iRD7
 mJ0C4lIScO2lcxg9gC7Q3kx6CN9qfie17KdVk4QpsOTKxqyCPBr4YaLWAqXEsy6SXCnA
 sjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2hY9rIiih8tmdugozlZsp7q9G6E5pP7+c2/8u13UX8A=;
 b=Xwi50yv1vEf9JeCSp5Yg87VXGpkvfikMHChMFHYSiViJmXCjEw79Kfu2IdmXeUOruf
 A4/i5mK5wq4rFmGDxyjTyT2iv8NPD4Q8ChHjNYCTCHciILck18pi/Gax2jJRFCMaviQN
 QGCEq70aruQj7Qra50vUts13VjVF8GQBF0j5IYtBmyRxNwe3PzR8eW+59A3Ez/hafhnn
 5N+xeJJsKxpXmNAEfRIoQXlHhV1BrRZcZ1QsFGGdDfih21NcADK4AmRGQa17/l2kZmHG
 77HPcXo2VxacFAr7G9fJVWYXP1SRThFkDOhNNuvyLD9BlSYMQrwFg0XkFGmc4PllX8mm
 Wl8Q==
X-Gm-Message-State: APjAAAVN5c9Y53LAVGhl40JjV8vZVOm4BWsf/Gx9mfF2d9Jhm40hqo32
 fPYab8HcavGeh4U4OaGlFg==
X-Google-Smtp-Source: APXvYqzzkLEq3JUDwv5Bq1ToF86o+d9OVUW1fYL6S8Dqm2aM5Sb5Qk2tn+/yVtkRiCdg/G1uA2ggGA==
X-Received: by 2002:aa7:8bda:: with SMTP id s26mr39031993pfd.194.1582303989009; 
 Fri, 21 Feb 2020 08:53:09 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee0:fe5e:d03d:769b:c838:c146])
 by smtp.gmail.com with ESMTPSA id l13sm3150484pjq.23.2020.02.21.08.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 08:53:08 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: jiri@mellanox.com,
	davem@davemloft.net
Date: Fri, 21 Feb 2020 22:21:41 +0530
Message-Id: <20200221165141.24630-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: core: devlink.c: Use built-in
	RCU list checking
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

list_for_each_entry_rcu() has built-in RCU and lock checking.

Pass cond argument to list_for_each_entry_rcu() to silence
false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
by default.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/core/devlink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index 4c63c9a4c09e..3e8c94155d93 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -2107,7 +2107,8 @@ devlink_dpipe_table_find(struct list_head *dpipe_tables,
 {
 	struct devlink_dpipe_table *table;
 
-	list_for_each_entry_rcu(table, dpipe_tables, list) {
+	list_for_each_entry_rcu(table, dpipe_tables, list,
+				lockdep_is_held(&devlink->lock)) {
 		if (!strcmp(table->name, table_name))
 			return table;
 	}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
