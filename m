Return-Path: <SRS0=PNQn=ZS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC8DC43215
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Nov 2019 17:27:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC372071E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Nov 2019 17:27:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6ZsU9CA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCC372071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D687B810C0;
	Tue, 26 Nov 2019 17:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j8MX0UUymzCh; Tue, 26 Nov 2019 17:27:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EBD0486DF3;
	Tue, 26 Nov 2019 17:27:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3096C0881;
	Tue, 26 Nov 2019 17:27:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A085C0878
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 17:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4F2CD8614A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 17:27:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NxAPAyNCShbj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 17:27:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D3AFD86109
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 17:27:29 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id k20so3978865pll.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 09:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=tOXJgjcejk9fVTesqHUY5e9L13PR1v6iQKZu4fMIxHA=;
 b=Z6ZsU9CAY0l1UnoY/wS5uOsMrRqycDJHL10BBxhJe0MxfZ+Q1ZM3sUh5AhxzH6OMBE
 mz/wxuZQfMjv90AZlATeM6UbL2y1E5CuEwxG4cPt06OZYpJXBpwJR3uJxmJILq+1tARj
 igaUHxBiGliS6uodnwmkJRIO60TeJdabpisA6kS6DD8UXN3qYHPRWUIiZDEUrY/QeFC0
 lBUicyL1PRVsGl22rewWL1NKqRZAcgp7u2mYqZOehhMNm12x9RK6O7r9mxNFftjHJgsF
 CdT+hKUq/IzBlE6fHIT+p9o/HZwEgR813e5eGR5D25xZlvQCyAYQjW3l556aOEC713wD
 lQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=tOXJgjcejk9fVTesqHUY5e9L13PR1v6iQKZu4fMIxHA=;
 b=CmSPEsJ/qGEq2tOLKqm24QNk+gHVWGehFO8eeBZMQOPukZpMWAM7Xhs47FMIFOIQ3L
 NAxSa04gErCAfu7S2oboqp4+1qItsmpj1c/RD1qA80pFy9tESkmXlHw0QH4z3ztDZ94H
 81/K8r6h5d5UG3OndzfGUzw3e+JZ/gZLQs5ZkSdSHfN1d7FDg07un1AN93b0gIOibg9p
 XVivnJaaav+JdbNk0v3/bbVUQJByT4xESblovnz2wOJOrwWQADi7LIWH6LZ+nBwZJhVH
 bkPTJFCtOig9zAdEyLXCwIbZRSjVEINrw4z9b4OPKujIvHqbUJQq9Oiof38CTZNBytop
 ftbw==
X-Gm-Message-State: APjAAAXpTmvO4MIm5QvXwCqAADnZHLgHzCPDtXbSY84ZT5JmTnN21v/O
 uM4pbWvvaiRvTekB3gsDhXE=
X-Google-Smtp-Source: APXvYqy294hAiGU/NMZ0qdJaYL71YbrTPvTU3AZuPnoS++e3Vo0p8JS0WkyAlMUcZqOfV0dV1+asZw==
X-Received: by 2002:a17:902:a60f:: with SMTP id
 u15mr36003211plq.64.1574789249342; 
 Tue, 26 Nov 2019 09:27:29 -0800 (PST)
Received: from workstation-kernel-dev ([139.5.252.125])
 by smtp.gmail.com with ESMTPSA id 16sm13356097pfc.21.2019.11.26.09.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 09:27:28 -0800 (PST)
Date: Tue, 26 Nov 2019 22:57:23 +0530
From: Amol Grover <frextrite@gmail.com>
To: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Message-ID: <20191126172723.GA12759@workstation-kernel-dev>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: Joel Fernandes <joel@joelfernandes.org>, linux-audit@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] kernel: audit.c: Add __rcu notation
	to RCU pointer
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

add __rcu notation to RCU protected global pointer auditd_conn

Fixes multiple instances of sparse error:
error: incompatible types in comparison expression
(different address spaces)

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 kernel/audit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index da8dc0db5bd3..30e7fc9b8da2 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -102,12 +102,14 @@ struct audit_net {
  * This struct is RCU protected; you must either hold the RCU lock for reading
  * or the associated spinlock for writing.
  */
-static struct auditd_connection {
+struct auditd_connection {
 	struct pid *pid;
 	u32 portid;
 	struct net *net;
 	struct rcu_head rcu;
-} *auditd_conn = NULL;
+};
+static struct auditd_connection __rcu *auditd_conn;
+RCU_INIT_POINTER(auditd_conn);
 static DEFINE_SPINLOCK(auditd_conn_lock);
 
 /* If audit_rate_limit is non-zero, limit the rate of sending audit records
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
