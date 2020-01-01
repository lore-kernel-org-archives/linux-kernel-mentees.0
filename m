Return-Path: <SRS0=0ztn=2W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EABFC2D0DE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jan 2020 22:26:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71B032073D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jan 2020 22:26:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OABpaCJL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71B032073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5A4A087347;
	Wed,  1 Jan 2020 22:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwMguIEXdo-C; Wed,  1 Jan 2020 22:26:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5C1FE8731E;
	Wed,  1 Jan 2020 22:26:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C075C18DC;
	Wed,  1 Jan 2020 22:26:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4481C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C3EF18532B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HbQHovTkWWsO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 66FEB85321
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:51 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 2so21187551pfg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jan 2020 14:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rHonOFx9xvoaxw9VR4rjUajN0rQFPRRu1qbwdwLtluM=;
 b=OABpaCJLh1EBuWpeAkWyvsPzKFaLMZ0FLlCDhBwHaBgvL4EYxoqseoH4jdUjJyt3JT
 Kj5uQzW5C8sDpZKxIuPYEb41du4hPvVyUB+fjlnl5N2ubBdsB244drfiRq32oXpUCaE1
 EHIlWy39IslrN3t1QtrDdiMeBZ3+GZy3CelCZw/uP3M8HnTnrJTocoXoXb+N/Gbo0GsK
 K2jgiZ9BmiSSzdutJXAYmefLDMScTwvQJ6suGL4u7Fd2vYPIWCCVRVc9smjCw9CAZnE6
 YD+5OZ5CDoEfXfqCvGtrgQFE2ec6ytCdPlh1rB7v2XJ99wUV5EmMAoHaVMVIK95grs5w
 3K/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rHonOFx9xvoaxw9VR4rjUajN0rQFPRRu1qbwdwLtluM=;
 b=e7eOBMwNwRLalsos2VOsv1XYi6UhzH2wuOKMj8CXGNRagvxVpyeUHCmdKbgsTRvr9X
 1Ny6oV7RGDhe4ZU6iwcliHHitZkHkeUHT2soQXS2rS4N3ANkLpacHflQjjtsaW9LdQRV
 wgKGoBXsJjbsrzJ6IUE4wLGNESwF8qKuE5pMUNak0K+ijbidY1/asvdU8ZWA5tSSwc1s
 FiSn0XE8wHpmvP+RYjcCNq6ZrW5Qo6aUlHeSMVi81E4rcVa6vnD+jOI41SScF5MTr+V2
 afISJWZHEtIL/grLakgSSaeDBfN2Prj4a9u0bNS+/Mho2y8u0Tbj0XLcKLaEMH+bm8uJ
 2XMg==
X-Gm-Message-State: APjAAAU57Ze7Ok6dJeURbJ/hC6QP5DGsufKCfjLnLnHAZUogJVJ101Oc
 mctf9Rknt0qYuCUTX5U+hr8=
X-Google-Smtp-Source: APXvYqyZkhcxp60vHbWJlPQszdfVwIeEwBjmwqgdvEc1vR2ZQkHUxKEqzOi0bUvLcgbzN3H5UANLVA==
X-Received: by 2002:a63:1a19:: with SMTP id a25mr87348598pga.447.1577917610832; 
 Wed, 01 Jan 2020 14:26:50 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id o2sm8601008pjo.26.2020.01.01.14.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 14:26:50 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+samsung@kernel.org,
	corbet@lwn.net
Date: Wed,  1 Jan 2020 19:26:15 -0300
Message-Id: <639820736792d7fc83fac72c8f6b1fefc848f192.1577917076.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577917076.git.dwlsalmeida@gmail.com>
References: <cover.1577917076.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3 8/8] Documentation: nfs:
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
