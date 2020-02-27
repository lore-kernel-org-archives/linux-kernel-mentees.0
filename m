Return-Path: <SRS0=V8/f=4P=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D626C35677
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Feb 2020 17:27:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AF79246A1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Feb 2020 17:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqlqA9ZQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AF79246A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D92538781D;
	Thu, 27 Feb 2020 17:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XbUkoGtVNDRr; Thu, 27 Feb 2020 17:27:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 71A388748A;
	Thu, 27 Feb 2020 17:27:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5935EC1D80;
	Thu, 27 Feb 2020 17:27:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 665A4C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 17:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 553A086D48
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 17:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvYxtdh244a8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 17:27:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D88BF86D41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 17:27:24 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 2so142141pfg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 09:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nu4qWyGXEitkgI8n8p9Q8iibxQxSQ0j2p8JZ5tAMehw=;
 b=NqlqA9ZQ0XHJZn2GauKocLVfMdbLajOtWemmVYWblroy1YxjX8ukY/Z7VTn9mAe6/Q
 tBUtT6JLtx7HsSQWrcR39pygIY2q4UPXtGEEqq6PDepFp0cBfvD9zDhEmPDO7Z7tBv2N
 8pu7RtEg3tGvAjArQ9XBIyQaEDCJQvfkogWd2KhOLgvFmRmYzehPJjb/v6z8lYAZWJCZ
 7SNlix8NtONm5bIR2avyWGP7ofcA4sffVMQYNvPIhPX1pxQLoCkYOLM4KZYdYnqjwnBX
 3cD0F2Na1MAwgETQw8aS/3COzev4Bhtaa0IM700eIul4/h+mCt+MjUnjWvPc29ohXdVB
 naug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nu4qWyGXEitkgI8n8p9Q8iibxQxSQ0j2p8JZ5tAMehw=;
 b=F8nPXP0IBMMqOOOaofBSzoMing433b+20Ou0gXZ3N4GmZbu2JnYZowLuTztXafFa2e
 bhsWWXqeQfBMYi1eVA6mPI0JvGq890aFB+78QAPKNv080kFJmILCtSSZjfJKYmQrt/QR
 OjjupjbT83XoT9p+asPhTt6d4EuoytoF656TfQsAfylod2jSms2/PFw4t9V63EOnAAsf
 zsTTzGWb+MvLPfrlQ4w/7UeQNQJf7RHCPYLxTtCpefmcrLcF/UqWEGAf7cdEgr/YWuEn
 cZ8AUamKpTNG4lKxg5Ny29rhrR95K7bLREJG1/O8jga0UAWUJIeLXnM0dU4Xs5RLlbab
 4c7g==
X-Gm-Message-State: APjAAAUFqQu+YaNrIi+0Tryu8fQesv+VX15+35aBIo+ZFr7AvTUPH59b
 sObHA5MvhuNM/ZWDBb8DbmyUOO+X4UlAnuYW
X-Google-Smtp-Source: APXvYqxTraK0soDcR29iTCztQotzJJ+fayOOisQNUhuUn/qARzTiXgh7Zsw5Sn0p9ALeLFGO2lcJdA==
X-Received: by 2002:a62:5547:: with SMTP id j68mr83320pfb.6.1582824443753;
 Thu, 27 Feb 2020 09:27:23 -0800 (PST)
Received: from localhost.localdomain ([103.46.201.150])
 by smtp.gmail.com with ESMTPSA id b15sm7865783pft.58.2020.02.27.09.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 09:27:22 -0800 (PST)
From: amanharitsh123 <amanharitsh123@gmail.com>
To: 
Date: Thu, 27 Feb 2020 22:56:24 +0530
Message-Id: <20200227172625.4976-1-amanharitsh123@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Lai Jiangshan <jiangshanlai@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Josh Triplett <josh@joshtriplett.org>, rcu@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] doc: Convert to checklist.txt to
	checklist.rst
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

This patch converts checklist.txt to checklist.rst and
adds it to index.rst

Signed-off-by: Aman Sharma <amanharitsh123@gmail.com>
Signed-off-by: amanharitsh123 <amanharitsh123@gmail.com>
---
 Documentation/RCU/{checklist.txt => checklist.rst} | 8 +++++---
 Documentation/RCU/index.rst                        | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)
 rename Documentation/RCU/{checklist.txt => checklist.rst} (99%)

diff --git a/Documentation/RCU/checklist.txt b/Documentation/RCU/checklist.rst
similarity index 99%
rename from Documentation/RCU/checklist.txt
rename to Documentation/RCU/checklist.rst
index e98ff261a438..50fd557b9acd 100644
--- a/Documentation/RCU/checklist.txt
+++ b/Documentation/RCU/checklist.rst
@@ -1,5 +1,7 @@
-Review Checklist for RCU Patches
+.. _checklist_doc: 
 
+Review Checklist for RCU Patches
+================================
 
 This document contains a checklist for producing and reviewing patches
 that make use of RCU.  Violating any of the rules listed below will
@@ -442,8 +444,8 @@ over a rather long period of time, but improvements are always welcome!
 
 	You instead need to use one of the barrier functions:
 
-	o	call_rcu() -> rcu_barrier()
-	o	call_srcu() -> srcu_barrier()
+	-	call_rcu() -> rcu_barrier()
+	-	call_srcu() -> srcu_barrier()
 
 	However, these barrier functions are absolutely -not- guaranteed
 	to wait for a grace period.  In fact, if there are no call_rcu()
diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index 81a0a1e5f767..d60eb4ba2cd0 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -10,6 +10,7 @@ RCU concepts
    arrayRCU
    rcubarrier
    rcu_dereference
+   checklist
    whatisRCU
    rcu
    listRCU
-- 
2.20.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
