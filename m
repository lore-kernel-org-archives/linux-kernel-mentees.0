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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BA6C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 17:20:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 409C821739
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 17:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPLLbufU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 409C821739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F083283DA4;
	Tue, 28 Jan 2020 17:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W0NC2XF3K01D; Tue, 28 Jan 2020 17:20:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 67A4D83C6B;
	Tue, 28 Jan 2020 17:20:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 559E6C0178;
	Tue, 28 Jan 2020 17:20:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD706C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 17:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A8B2E87E68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 17:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s+iE6-2AkB39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 17:20:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0A4AB87E13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 17:20:18 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id b9so7301083pgk.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 09:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=jf3QvTBtLBXkEUTUJ6dEyaixgm7RPtLRLhyBEDMajRM=;
 b=CPLLbufURDm6a2I+e5yqSQa31hPHb6Z6iVXHANzSfE6mwte4IcdDCHSoosA5y38tdR
 v6SDkrLCTZYuTLqBEIIjkkn0C0ceHnHn3y4ka6znW+EKcqQXl5n5UpHwUzbTilqxmcAz
 Kn2oh6Q6nbOIAfsu4r6VBt0Dh0nKM7AU7O8ztAHxWZEWSXhoMW+UPnybyI+FMY4pam+Z
 2yho40MOQJTkU6xmY+Xk/SezwWKZ8yubPpYr/WoDjeudSjqhPAXli6Tsxx1F0kuN5JOf
 1EyHzLtRepzLVujQUWopEYqCDY6Eu6hKM+c4Fe6ZH47XDTFESizWTmG/BFGjTRumYhG5
 Kqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jf3QvTBtLBXkEUTUJ6dEyaixgm7RPtLRLhyBEDMajRM=;
 b=Rztgk/WBmWy57sLSKybyw/b+y/o5PF2nUQ8zlDovkPpjbwoK+0D7j5ROtVFeTyCIf0
 Tm+wbN/6RsXdI4k0ch4OOcNH9Un2UC5Acwx3Bqrw6HLN2sgt+qonTsUhuB2vKRWoaytw
 x5BgXV3A9BjUDcDV4q72JqS88C0MmlaPicO23yiDIxtGmnfUgHDx8xFpMD0pxSI6bOsD
 mFqzgGg29R4uHyKeFZRcdSLTsanOwplXuDd4lpoR8mqQrRMFesxIYRam94X9iKU+eKeV
 xcDw/hKbNJb+xBaZsbEdZ9OY0GMe7lgseBZpfb8ImVdGPCDuUrdsztacCqocjwNu/RuS
 JIfg==
X-Gm-Message-State: APjAAAXAKo0q2XRqQms4WvAiM75OrIinzgYtO3wPpVJY9CUHYj/19+4K
 PSMKfWSuAPmGSV/o/ojz9A==
X-Google-Smtp-Source: APXvYqze9wR3ZSNvjNvbxyEc55dGBVFLhZEOOt3MVtGqsOWYO0pXeFv5/z2zgpaWXrdU3bkJWUqghw==
X-Received: by 2002:a65:4b85:: with SMTP id t5mr20864227pgq.404.1580232017665; 
 Tue, 28 Jan 2020 09:20:17 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee4:f372:cc5e:c7d9:2a24:390])
 by smtp.gmail.com with ESMTPSA id w26sm12959417pfj.119.2020.01.28.09.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 09:20:17 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: peterz@infradead.org, mingo@kernel.org, oleg@redhat.com,
 christian.brauner@ubuntu.com, paulmck@kernel.org
Date: Tue, 28 Jan 2020 22:50:08 +0530
Message-Id: <20200128172008.22665-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: joel@joelfernandes.org, rcu@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] exit.c: Fix Sparse errors and
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

This patch fixes the following sparse error:
kernel/exit.c:627:25: error: incompatible types in comparison expression
caused due to accessing rcu protected pointer without using rcu primitives.

And the following warning:

kernel/exit.c:626:40: warning: incorrect type in assignment

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 kernel/exit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index bcbd59888e67..c5a9d6360440 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -623,8 +623,8 @@ static void forget_original_parent(struct task_struct *father,
 	reaper = find_new_reaper(father, reaper);
 	list_for_each_entry(p, &father->children, sibling) {
 		for_each_thread(p, t) {
-			t->real_parent = reaper;
-			BUG_ON((!t->ptrace) != (t->parent == father));
+			rcu_assign_pointer(t->real_parent, reaper);
+			BUG_ON((!t->ptrace) != (rcu_access_pointer(t->parent) == father));
 			if (likely(!t->ptrace))
 				t->parent = t->real_parent;
 			if (t->pdeath_signal)
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
