Return-Path: <SRS0=vtN2=2U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B375EC2D0DA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 04:56:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 894CD21744
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 04:56:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I26Kt6BX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 894CD21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6E27584514;
	Mon, 30 Dec 2019 04:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8KqWS4i6p-T; Mon, 30 Dec 2019 04:56:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 08F0B81E5F;
	Mon, 30 Dec 2019 04:56:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05EFEC18DC;
	Mon, 30 Dec 2019 04:56:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7166FC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5F4D5847AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fIE9TTi-3t2Z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E396283B47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:45 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id x17so14183047pln.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Dec 2019 20:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rHonOFx9xvoaxw9VR4rjUajN0rQFPRRu1qbwdwLtluM=;
 b=I26Kt6BXe/bs3RKdS7TvuPHoQLPP36DaaylbkeUGm07p/tsj6+xrKZ8EcqzLlX8S3T
 XHtvjSnrV1miNibMIgdxH39rQN0WDy6XpwrnJnjcPStIayC3XCf/8E+ga0u7hwPvW86/
 FoHQPUjKV9xrDq1ScZw/7f0TAV7x8GMg7GirZxEfZIgjlGGmIXvhUoPXM94Ao/lEhU1n
 5lRRonDDEpCUJOZ9JJJizl1fiLsrQZLqLOHkZxLG3DRb/+LLxC7SG07jK/UKi6/Al+To
 PjHHtBeWt3ycq3MQsVRyf1TDmzab7dXLHw3SIEm4dk8NdV3qZdPXb73lFb+dKQdv+k2C
 ESNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rHonOFx9xvoaxw9VR4rjUajN0rQFPRRu1qbwdwLtluM=;
 b=PVwytXQhPN/3VLw2WryjW/3a/VY8awfTqtorjgvfMCkIoBOywh8ZVz1+vxYKbDxawO
 LDDdBkFkvanzPL6gF9VvbWrXCeQLHA9pTSfXLK1hjb7F3ATmv6YqAr3WOm75F8WJBwE7
 /cRCZRpREp2wm8eLX9GuEhQfAiHPmP6GIcxJjUjx1TkGRYvEqL1KOlvu7qkgS46QGgbW
 7P/b7nZyG84AgGahNg6KlTDxL1X2P2xCSyZOhBXiD6RiDnyBzFR7N3WnyO9aoB8gOIC8
 yfw3SskDbpI8Uug8q68QsGfbjnf5ITltheeu5cuQWDofs4ZIhbkwC9yzfFTJx8X93xZx
 OJQQ==
X-Gm-Message-State: APjAAAXJesT/RRcnZKDAFevpkT2zp/ZhgIjONbYdLhg07v9RG1O9Bs/D
 IICL3I48rXfduRkd5gkfkGo=
X-Google-Smtp-Source: APXvYqw1++iHS5nGi4FAQv302tgaxvpsufWb8c0MrnMXtzyVHTs/XWuByUtQY2feaQbTHjYI56VjUg==
X-Received: by 2002:a17:90a:fe02:: with SMTP id
 ck2mr43104676pjb.10.1577681805492; 
 Sun, 29 Dec 2019 20:56:45 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id b1sm22373189pjw.4.2019.12.29.20.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 20:56:45 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Mon, 30 Dec 2019 01:56:02 -0300
Message-Id: <5f2dfdb34ef391d63e126867937ae0216c31cf2e.1577681164.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577681164.git.dwlsalmeida@gmail.com>
References: <cover.1577681164.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 8/8] Documentation: nfs:
	fault_injection: convert to ReST
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Convert fault_injection.txt to ReST and move it to admin-guide.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 .../nfs/fault_injection.rst}                                 | 5 +++--
 Documentation/admin-guide/nfs/index.rst                      | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)
 rename Documentation/{filesystems/nfs/fault_injection.txt => admin-guide/nfs/fault_injection.rst} (98%)

diff --git a/Documentation/filesystems/nfs/fault_injection.txt b/Documentation/admin-guide/nfs/fault_injection.rst
similarity index 98%
rename from Documentation/filesystems/nfs/fault_injection.txt
rename to Documentation/admin-guide/nfs/fault_injection.rst
index f3a5b0a8ac05..eb029c0c15ce 100644
--- a/Documentation/filesystems/nfs/fault_injection.txt
+++ b/Documentation/admin-guide/nfs/fault_injection.rst
@@ -1,6 +1,7 @@
+===================
+NFS Fault Injection
+===================
 
-Fault Injection
-===============
 Fault injection is a method for forcing errors that may not normally occur, or
 may be difficult to reproduce.  Forcing these errors in a controlled environment
 can help the developer find and fix bugs before their code is shipped in a
diff --git a/Documentation/admin-guide/nfs/index.rst b/Documentation/admin-guide/nfs/index.rst
index c96e93b61744..410b8ccad11b 100644
--- a/Documentation/admin-guide/nfs/index.rst
+++ b/Documentation/admin-guide/nfs/index.rst
@@ -12,4 +12,5 @@ NFS
     nfs-idmapper
     pnfs-block-server
     pnfs-scsi-server
+    fault_injection
 
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
