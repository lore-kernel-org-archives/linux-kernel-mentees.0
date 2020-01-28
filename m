Return-Path: <SRS0=C1jw=3R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFFDC33CB3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 07:28:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C964022522
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 07:28:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErOK+PKg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C964022522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A05B386E1D;
	Tue, 28 Jan 2020 07:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EY27GYY5EHC6; Tue, 28 Jan 2020 07:28:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 98B94865D5;
	Tue, 28 Jan 2020 07:28:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85329C0175;
	Tue, 28 Jan 2020 07:28:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D049C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 07:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EE10A2040D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 07:28:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rW6CP2sH5m2x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 07:28:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id C41A120025
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 07:28:54 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id e9so619031pjr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 23:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TawkIIO8Cb/tgElG2C0aCqCdkT8w60kpDmt3fNug/+o=;
 b=ErOK+PKgLRTXy1g+eXt3RPbgNMGJ+fJJgirflfywne1W8bVviXLif+rxPq2ttpBrxU
 NWSZnmUgNnk97CfVlkQotJmDRhtSYT57PDJmwE22yqZdLt54ZXWU9xgnuCEn9ZVQPvBv
 KeLS0CyffyxruVl1X6nKiDu/m6YIbFpUh83GuxAUz3c9WmkvlMEDPDsL5yEjlPHzIFLB
 MaydMBc7Wu4ax3jrHNGVCcVN/DjSS1SfC+rx4StGYW6t6CL1L2mTpUQIezntT7Kd7r2q
 IK9h3+/cwtwg0LFlZNuFmFQHfWNKh+zDY7O3neLu9wQ/j3zKpVjO8aKto6sByZejXsjA
 +OkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TawkIIO8Cb/tgElG2C0aCqCdkT8w60kpDmt3fNug/+o=;
 b=fmTGaeR7c/eOOp8eyA/MHWcIcQSKWLSZWixSYlWD7jMQvvBkyZf++jrR788QbI3v1g
 J6uKF+dzSEItMwJogjvUFdn3XdAUGADF6HttadhDb8/nU9WPqNWgOw0l5xXT7RJ3QkmY
 saRmKrRuke/bTBnj6pfsO/qGVIQ9sDstVwvop6YEMIDK1Em1wXZaNOY4/aEsXEGu45qo
 UksY6eQMycaJJOWdBBx+yWseJ1ELZtksYN9nWSkYsUqtdwyvVnXb0d727wzIMFBTBVlS
 CHee0yudsQB/JsTMmtUH3mWqlU6renPJ7q2rT2X9OMa6k+fD1MACCFrd8kbulmiab642
 Paog==
X-Gm-Message-State: APjAAAV/makccY/IPX2T9oE1SQRut+LI3ARiF6jg0e5R/OCAeSIy++ce
 EhN3oy2TuVDaLtzM45o+1fg=
X-Google-Smtp-Source: APXvYqy0iufQreHHLowZtxXJRW3T0q5xrqdUwdfyK1KW2xyLCd9zueHsqYHKYZsqGj+Pc/kp2WU0ZQ==
X-Received: by 2002:a17:90a:8a98:: with SMTP id
 x24mr3295738pjn.113.1580196534294; 
 Mon, 27 Jan 2020 23:28:54 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.252])
 by smtp.googlemail.com with ESMTPSA id j17sm18566735pfa.28.2020.01.27.23.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 23:28:53 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: David Howells <dhowells@redhat.com>, Shakeel Butt <shakeelb@google.com>,
 James Morris <jamorris@linux.microsoft.com>,
 Oleg Nesterov <oleg@redhat.com>, Kees Cook <keescook@chromium.org>,
 Amol Grover <frextrite@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Jann Horn <jannh@google.com>
Date: Tue, 28 Jan 2020 12:57:41 +0530
Message-Id: <20200128072740.21272-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: Joel Fernandes <joel@joelfernandes.org>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] cred: Use RCU primitives to access
	RCU pointers
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

task_struct.cred and task_struct.real_cred are annotated by __rcu,
hence use rcu_access_pointer to access them.

Fixes the following sparse errors:
kernel/cred.c:144:9: error: incompatible types in comparison expression
(different address spaces):
kernel/cred.c:144:9:    struct cred *
kernel/cred.c:144:9:    struct cred const [noderef] <asn:4> *
kernel/cred.c:145:9: error: incompatible types in comparison expression
(different address spaces):
kernel/cred.c:145:9:    struct cred *
kernel/cred.c:145:9:    struct cred const [noderef] <asn:4> *

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 kernel/cred.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cred.c b/kernel/cred.c
index 809a985b1793..3043c8e1544d 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -141,8 +141,8 @@ void __put_cred(struct cred *cred)
 	cred->magic = CRED_MAGIC_DEAD;
 	cred->put_addr = __builtin_return_address(0);
 #endif
-	BUG_ON(cred == current->cred);
-	BUG_ON(cred == current->real_cred);
+	BUG_ON(cred == rcu_access_pointer(current->cred));
+	BUG_ON(cred == rcu_access_pointer(current->real_cred));
 
 	if (cred->non_rcu)
 		put_cred_rcu(&cred->rcu);
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
