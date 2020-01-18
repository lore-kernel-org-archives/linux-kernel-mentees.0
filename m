Return-Path: <SRS0=GiD0=3H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB275C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jan 2020 16:56:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 920C121D7D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jan 2020 16:56:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cuzk/v2r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 920C121D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6107585AA2;
	Sat, 18 Jan 2020 16:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCF-i9Xzmy4d; Sat, 18 Jan 2020 16:56:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E5F66859AE;
	Sat, 18 Jan 2020 16:56:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5704C1D81;
	Sat, 18 Jan 2020 16:56:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D71C4C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 16:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C083385AA2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 16:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aiIoLhOGgB9n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 16:55:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 02598859AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 16:55:58 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i6so13536069pfc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 08:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pHjwyacvYMGoFpBb1ji3Ywgw20nYhNtNHuaRMfwxOs0=;
 b=Cuzk/v2rmZxlFbH1iwUh1jcfOyH4GZH0PoB4rDQhzMC2VZ2cGsxXT9sS8GasXDNIrs
 AlkuBGsxK98YSd2RFM9FbmvQRmcTlP7ka5xpTSFIeeSrSSB66mfDh23S31ELk/vz4em7
 Xihf1bM4Akxd0ppex6SP3ivSR/QIiC4evnsYdRjidZDmg3g13H2z9RfxAFCd3QM8WZIS
 Cq7lun7KzCXChlt7+hGEnCInXMEwtm4YUQ6DjASR/NR4W+yeyH/xYjuSlbzcM6aCIsHe
 XpqFLy0aLpOkeieWgjx5Pgg1S5JSnNp1SuLaCeskvY7Kiw2ZYUptTRgjfjWB331VY5Ki
 eluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pHjwyacvYMGoFpBb1ji3Ywgw20nYhNtNHuaRMfwxOs0=;
 b=Gq8f6mkXTH3DxX4dY/hstorvGZtuVLYyPr7bVNm5tC9IbIAzhgX7yp4LBhwMeK6DDf
 4Lx3rEBR4aBlz/oEWRBmYUneNoyxjibVsmOllZo02qsQapaMNFTxycfofeOYFM1e3ToK
 U0hoze8PkyiEUnkNgD7jZArg7o0sXr9JLW+yN7DF9n62kQd67zf/mk71Jw5xTDJNYC/A
 DhvC77k/wR8b3wG1zoaRDB+R2ijorvN3rc26f8xCN2ln1udCpBwqTrOArkLCvXp1aZCy
 x887PvlkSwMBYaL5ceT4aB3UrI6SRG2rpaAvdZkUlA6QZ6ae7DHVKke+qchp8MkcAklX
 7Ung==
X-Gm-Message-State: APjAAAWuR2vhzTiziEd080luNRlg7Y9kX3fAL6a4J57AB6lbeNtbdHXG
 hXipICKrF6w+iBeCcQN6ZWo=
X-Google-Smtp-Source: APXvYqzL3uU0K97mb0rwv+HwRhmmpc3cE2p0938r2jZsWjKwjG8pFWjesMBAZ1rEpZFisR48RYDyNA==
X-Received: by 2002:aa7:80c5:: with SMTP id a5mr8989492pfn.53.1579366558488;
 Sat, 18 Jan 2020 08:55:58 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.181])
 by smtp.googlemail.com with ESMTPSA id s7sm12389009pjk.22.2020.01.18.08.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2020 08:55:58 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>
Date: Sat, 18 Jan 2020 22:24:18 +0530
Message-Id: <20200118165417.12325-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: rcu@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] rculist: Add brackets around cond
	argument in __list_check_rcu macro
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

Passing a complex lockdep condition to __list_check_rcu results
in false positive lockdep splat due to incorrect expression
evaluation.

For example, a lockdep check condition `cond1 || cond2` is
evaluated as `!cond1 || cond2 && !rcu_read_lock_any_held()`
which, according to operator precedence, evaluates to
`!cond1 || (cond2 && !rcu_read_lock_any_held())`.
This would result in a lockdep splat when cond1 is false
and cond2 is true which is logically incorrect.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 include/linux/rculist.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/rculist.h b/include/linux/rculist.h
index 4158b7212936..dce491f0b354 100644
--- a/include/linux/rculist.h
+++ b/include/linux/rculist.h
@@ -50,9 +50,9 @@ static inline void INIT_LIST_HEAD_RCU(struct list_head *list)
 #define __list_check_rcu(dummy, cond, extra...)				\
 	({								\
 	check_arg_count_one(extra);					\
-	RCU_LOCKDEP_WARN(!cond && !rcu_read_lock_any_held(),		\
+	RCU_LOCKDEP_WARN(!(cond) && !rcu_read_lock_any_held(),		\
 			 "RCU-list traversed in non-reader section!");	\
-	 })
+	})
 #else
 #define __list_check_rcu(dummy, cond, extra...)				\
 	({ check_arg_count_one(extra); })
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
