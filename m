Return-Path: <SRS0=hY7L=4Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316AFC10F28
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03FF1206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLYHosbb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03FF1206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB53086C8C;
	Sun,  8 Mar 2020 08:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IyV3R_H0Bgrh; Sun,  8 Mar 2020 08:44:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 963EE86C6A;
	Sun,  8 Mar 2020 08:44:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8554CC1D7E;
	Sun,  8 Mar 2020 08:44:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FE9CC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5E8E9204BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-CanihIWpMs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by silver.osuosl.org (Postfix) with ESMTPS id 676DE2000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:53 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id g12so2765036plo.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Mar 2020 00:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OAgaf6f/g8C77m/ZDRBPmrtY2bP/QHsonyCPsjIZw/U=;
 b=nLYHosbblarsu+jNX0qmOgQv0OXnyZyzPSP+u9P7VGUkZriHsQQXSD4CODIg4lMm60
 RR38WjbvCM5dpFvetEA5ttRfOnmFQbuJUGWNDObwv6/WAYuvA9gNbREdM1AHHTMGjR5t
 lQuu/4YkAy4azj2mNeXmEiSo1s18ZsWVmEP0hUvudU5XGJyPmp3ZZl7aqx3r+AL1UH6r
 DEIZihnbfCm+vhAIS6PvFVDcu1KDXrDUNtPd+L7pRbWizGJI7xP4GnjJKAPRqUoC/ETd
 tT3pzbkEizLqJbyy4hIeh6pKOrZxF+xERd4WNK8LcwHxViE6RbBzmnCNTivewASVr6PN
 UdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OAgaf6f/g8C77m/ZDRBPmrtY2bP/QHsonyCPsjIZw/U=;
 b=eFEhyIvRjnOLY9bWjHthJuq8lODgxRrRwnXJ8nsRuxkewdTKNu0Pk0tn7B0oj7EBfl
 i8ARzssEMCuadqnsuDZlzqzVkyZEcicQTm9WGxPUII/iG1goYebBm4xjVEtohNvNg8Wi
 ldfZlCS0m6rXozTuWTEcLks6NeVqrB2BJarXUSbkd3fR/DE/uCIanopzsUPMM9ty3R0/
 3UkTUEYyncEc6X1Fnqw5qWi/pdyh51EvFgYASPoloJ6hzgRfiUJePgGzTRvvAax8PsqD
 HDwl6qd9nRPtqN8YiaFvAo03kDPrjXmPoOM+27KvkPh7DTgm72sBnvjDBHOZlR4tKlPe
 +mWQ==
X-Gm-Message-State: ANhLgQ1NJqt6VOaY1o8U9LGQSvUTv4ntL7Mu1tu9UMM/ykYVcLxuucfV
 j1/BAEwdv99kM98GCAx77jA=
X-Google-Smtp-Source: ADFU+vuV3eswFrpa7AXYG+ZZ4kW1n+P7XnLdC0H8c6UN/irj0Ldjz1NyKWqGy3I11B0tyK4DsENs3A==
X-Received: by 2002:a17:902:ab8f:: with SMTP id
 f15mr11029537plr.280.1583657092804; 
 Sun, 08 Mar 2020 00:44:52 -0800 (PST)
Received: from localhost.localdomain ([1.38.148.20])
 by smtp.gmail.com with ESMTPSA id b3sm14587244pjo.30.2020.03.08.00.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 00:44:52 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  8 Mar 2020 14:13:55 +0530
Message-Id: <20200308084356.14506-13-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
References: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 12/13] tests: Add test case for
	assigned enumerator
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

Add a test case to verify correct pretty printing of
enumerators that are assigned. The test case should cover
minused assigned enumerators, plussed assigned enumerators
and correct matching of an enum with an assigned enumerator.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/enum_assign.c     |  6 ++++++
 tests/enum_assign.cocci | 11 +++++++++++
 tests/enum_assign.res   |  7 +++++++
 3 files changed, 24 insertions(+)
 create mode 100644 tests/enum_assign.c
 create mode 100644 tests/enum_assign.cocci
 create mode 100644 tests/enum_assign.res

diff --git a/tests/enum_assign.c b/tests/enum_assign.c
new file mode 100644
index 00000000..9c2d16df
--- /dev/null
+++ b/tests/enum_assign.c
@@ -0,0 +1,6 @@
+enum h {
+	a = 0,
+	c,
+	x,
+	b
+};
diff --git a/tests/enum_assign.cocci b/tests/enum_assign.cocci
new file mode 100644
index 00000000..a1a59ef8
--- /dev/null
+++ b/tests/enum_assign.cocci
@@ -0,0 +1,11 @@
+@@
+@@
+
+enum h {
+  ...,
+- a = 0,
++ q = 0,
+  ...,
+  b,
++ z
+};
diff --git a/tests/enum_assign.res b/tests/enum_assign.res
new file mode 100644
index 00000000..3b204aa0
--- /dev/null
+++ b/tests/enum_assign.res
@@ -0,0 +1,7 @@
+enum h {
+	q = 0,
+	c,
+	x,
+	b,
+	z
+};
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
