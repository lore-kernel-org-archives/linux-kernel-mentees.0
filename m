Return-Path: <SRS0=YOSY=ZU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0B7C43215
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Nov 2019 15:32:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23245217AB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Nov 2019 15:32:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkjLgbwd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23245217AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E56568816B;
	Thu, 28 Nov 2019 15:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybhkS9SEj8db; Thu, 28 Nov 2019 15:32:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 674C0861D1;
	Thu, 28 Nov 2019 15:32:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 570D3C1DD5;
	Thu, 28 Nov 2019 15:32:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65DFCC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Nov 2019 15:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 61ABE861D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Nov 2019 15:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uxo1jTmFhf7A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Nov 2019 15:32:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6F2D388164
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Nov 2019 15:32:10 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k1so13042090pgg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Nov 2019 07:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=PpHb3fvmg1wnxHHN6wZlT7oMOhT2IAI1cwgs8iwmgww=;
 b=lkjLgbwdRqukZGNpN1LfTOVPQlzYOcqS8Sib6QnsDCumdKzmyZq+1cenQrSvRjVr1V
 VxtfbnYVrHOgHkyVNtUofoVgXRx4rDds0sMvHQCe3tjF5A0/XPUIOu80OqTq8K5+TX05
 Pm8Wve1ChsV5w9QT+PFGuQJmLmRLwaDfMcWdysS/ly0l4BcIXyNw5v9oPgT9zH7pRUOa
 VyfMeWcFn9PWcurMvKxvy8xCLkirlRg2enDdLF1aFXsSq+BYio+R0/27n9tOjoVA7XiG
 ueFKCL5VC4xQ7VgTVsiYdKrVSJZd/074jQjwi8AyYzPAzm+CtYPPlhPeJ65B+TAVnQ3H
 8GoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=PpHb3fvmg1wnxHHN6wZlT7oMOhT2IAI1cwgs8iwmgww=;
 b=fsg6BOoVF6xkXxp+yeYl7EDRfdOg92c8HYRUkeUYJjEUhXkmQhpL91NTYr17RSpZXr
 aRaC5cBVpVss5v5XXtmpw8BIQ0hbujQrGgMweDL0+xpiJFs9x1pxZkOxM9LP0deFGZmF
 OyVlOCDAAEr34dU0rNKcvqhxAUBFk+pSMLgZNq0dM7W1776UYFbGzWE+WgRzexjAW26X
 IgK4eJh5xaLfrvJRyQu+ZQX9xeIhWS2EDsxFMSeqI2ObCXTT9pXcsLE+uWfYO6mQKRVe
 onwSIZB/4hQ1kP9uL6W39phWCakPGZt4EmDnc1e+MOnJCdQi3hgN0HPWhQeb7CKv355V
 td4g==
X-Gm-Message-State: APjAAAXRUKB6davh4oba1wohObcfnnT7N8AkWK4zOguEBAyUc1GnX8lA
 stLSSp2Y30XDgsJh57RXtuY=
X-Google-Smtp-Source: APXvYqw0ZuqqCQ3bpYNoPpQ541irC88FBLvvfU7BPliB9p4YDB9wkq1pQ+suOYZqqdaXq2l1fot78A==
X-Received: by 2002:a63:d20f:: with SMTP id a15mr12262947pgg.268.1574955129913; 
 Thu, 28 Nov 2019 07:32:09 -0800 (PST)
Received: from workstation-kernel-dev ([139.5.253.4])
 by smtp.gmail.com with ESMTPSA id j7sm7624426pgn.0.2019.11.28.07.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 07:32:09 -0800 (PST)
Date: Thu, 28 Nov 2019 21:02:03 +0530
From: Amol Grover <frextrite@gmail.com>
To: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Message-ID: <20191128153203.GA23803@workstation-kernel-dev>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: Joel Fernandes <joel@joelfernandes.org>, linux-audit@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] kernel: audit.c: Add __rcu
	notation to RCU pointer
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
v2:
- fix erroneous RCU pointer initialization

 kernel/audit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index da8dc0db5bd3..ff7cfc61f53d 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -102,12 +102,13 @@ struct audit_net {
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
 static DEFINE_SPINLOCK(auditd_conn_lock);
 
 /* If audit_rate_limit is non-zero, limit the rate of sending audit records
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
