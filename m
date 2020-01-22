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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D215C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jan 2020 17:05:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F82121569
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jan 2020 17:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiEOeaY9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F82121569
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 48C2220512;
	Wed, 22 Jan 2020 17:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2T58YOPDTRe0; Wed, 22 Jan 2020 17:05:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A7CEC2107D;
	Wed, 22 Jan 2020 17:05:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 955FCC1796;
	Wed, 22 Jan 2020 17:05:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A10D4C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 17:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8FC502107D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 17:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FFTbNTHmKVkB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 17:05:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 1894A2036D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 17:05:00 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id b9so3812986pgk.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 09:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8QgKyiW0upu1Q+szE5cYtvDG9vOJuAl1OpeZnvTZVEo=;
 b=MiEOeaY9kdqB8tM2DEWTmU6WQEOBSN25csdV/dunSwN65KQayZ2vpbrRRSl12K9Jgu
 HXf86q8yhkgvpyxzQ5wvyyn6bbcqkAulGpMpU/x0X9OEwvxQRnihQCZOWHI3CoQhC/ab
 Qf5TsiHtNaSsqETuS5UXb+TdCqQgkf503b7rxEQhdKHvgCOcLym5G6AHto0rAdM74tw5
 QY1Uhxu9oMMLGRK9JBBN0WZIb2ls96L3wyHnj8n2t3JXNHSA8inI7gO6utTzlMBtm4l7
 H6YkYUWIHGzE2v9EyeUqismEmgPBQgYIWLMGp/VPvN8ivEl7lsopgw6o90oAxdUYzHzN
 3/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8QgKyiW0upu1Q+szE5cYtvDG9vOJuAl1OpeZnvTZVEo=;
 b=Bofgfq/+BMFlffEi0t5Ucd4evTYH/pZwSu03wzEi6zkKRiMLjHdgEeggtbz4rQdFCJ
 Kwx0TpNnvpl9RXuLX7hRtXIZe9uzcvPeMnOKYEaaLG+wBz8E2rlAC3BqcdtCW1GbaXR0
 Yb/Udlt7y1Yz+0XGpANuEsqho+lpUT0kZs1QmgoMsddYGc06a3To+5rWNuOwxwlaYNqI
 Bf/FKDtq9z+wgbl6Ns4V4y9OccCXvuLN3YNUm0v09+YIO2b95oARpgV/Ot8N6vKyc4nW
 RD+TQzJzzxg8bclzhlGLXD3bCHD48dD0gmhnt29Y4j3v/zatV5lmZJmQYrFalFrrNvLe
 1hLw==
X-Gm-Message-State: APjAAAVURDFTtiVq/2eF8dVhxsxQLb2oL8Ia4GlV0+MPHkPzPRlLX4dr
 sjrV0SYpdTNgH7+2iJnxsg==
X-Google-Smtp-Source: APXvYqyX/P9oePdmnshAVZLFNwM9QuwuiD9JHWbvwEAoCgBTDQkKNh07krpp1ELPjLALfeQDppTOig==
X-Received: by 2002:aa7:96f9:: with SMTP id i25mr3471919pfq.161.1579712699709; 
 Wed, 22 Jan 2020 09:04:59 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1eee:fc60:1df1:6c1a:3227:9ec0])
 by smtp.gmail.com with ESMTPSA id b42sm4001350pjc.27.2020.01.22.09.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 09:04:59 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: jeyu@kernel.org
Date: Wed, 22 Jan 2020 22:34:47 +0530
Message-Id: <20200122170447.20539-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] module.h: Annotate mod_kallsyms with
	__rcu
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

kernel/module.c:3623:9: error: incompatible types in comparison expression
kernel/module.c:4060:41: error: incompatible types in comparison expression
kernel/module.c:4203:28: error: incompatible types in comparison expression
kernel/module.c:4225:41: error: incompatible types in comparison expression

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 include/linux/module.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index bd165ba68617..dfdc8863e26a 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -429,7 +429,7 @@ struct module {
 
 #ifdef CONFIG_KALLSYMS
 	/* Protected by RCU and/or module_mutex: use rcu_dereference() */
-	struct mod_kallsyms *kallsyms;
+	struct mod_kallsyms __rcu *kallsyms;
 	struct mod_kallsyms core_kallsyms;
 
 	/* Section attributes */
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
