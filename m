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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC31C2D0DA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 05:05:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E5420748
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 05:05:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cojg7GXD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64E5420748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 47EB2847AB;
	Mon, 30 Dec 2019 05:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vz7Okwcwh6DH; Mon, 30 Dec 2019 05:05:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D2B2F84317;
	Mon, 30 Dec 2019 05:05:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE639C18DC;
	Mon, 30 Dec 2019 05:05:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85B38C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7961B84317
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sg0LfwTQpxp5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:05:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E522F8409C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:05:13 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l24so17457501pgk.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Dec 2019 21:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HqP2eC/S/0O0RhX2WiaVYXHo+vBUqmYrR16Y8AXgU4I=;
 b=cojg7GXDIO0SSd59y/w1fJQVIXWuzd9LkruLF3NswZfHII0HOZeIbAI7O1AqSrV2FN
 oNZB7XabSzGq8Tfl3xB5SPGTDSx6ogKMk/zzmRfG/bwxE5WBteuixDY+C+dyDvbvLGOF
 B1aFjDzO2r5e6PFXFmm25RnbGp6T+GEXZ1vhD6M9MCNtACVcPMihrhlpTTbLMf9Vx80w
 rF2QgL4cge4pe6EeTx2LzwFdUzZqz26+GV3u39OG4q5BdU/kUCeNQHM8qC1KOQhiLg/f
 4ikz/VPIO0F40+8V4gknmQHCf5MNmyCdSMoTscsEw8PyaUf0FWAObw4CN1LYg78z8CAQ
 vDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HqP2eC/S/0O0RhX2WiaVYXHo+vBUqmYrR16Y8AXgU4I=;
 b=lHBHuPgzaToOc07HT8NHQTTnqMLfZNI+4BhArW6DSCxFj+mhDUaZTILNO9/ujrTDxL
 eUuyA9CN78oVbIdIFwDGoyStDn8yH7m7bhUHoXjqpnqT7VtAiq3SOw/2aom2Mqv8+lvs
 Cdkw2wM7OFrDc6zbwFy4XgO4MT6BvKzRohxkhRbwrMBGawdTy6NL6l87rgITveTHOjX3
 g9pbqlf1MPJ8Sb4GvYvLw7tp9+GRPZr4JhIIyukEHWyKBbgV4i0CprK1TwstHs3u1xq6
 9MqtsVMoRkhVixbpFRr9VPJ5nDW7/2hHHH8jDxw73PM5lCcFvfrNjcQnBcAeaanRrMqT
 y06A==
X-Gm-Message-State: APjAAAVm78e3Ae/Y/IsAGjYstpK/AErH57519RKTl4pgz35mZkcYlu6C
 5NB/F/iYZbQT1aM+8dcldSMtBX19iy18Dw==
X-Google-Smtp-Source: APXvYqzuv+nmaHo8IJ76Zo0dAidv1Lebd4Q8nTsHnMhVdhYFiU/A8UDFO/LUppzxwmTFoM0NK6Fx+A==
X-Received: by 2002:a62:1d52:: with SMTP id d79mr69286987pfd.144.1577682313445; 
 Sun, 29 Dec 2019 21:05:13 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id r2sm45054727pgv.16.2019.12.29.21.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 21:05:13 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Mon, 30 Dec 2019 02:04:47 -0300
Message-Id: <f4d72e8ac0b41870e12a6d664666f665aefd3f09.1577681894.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577681894.git.dwlsalmeida@gmail.com>
References: <cover.1577681894.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 5/5] Documentation: nfs: knfsd-stats:
	convert to ReST
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

Convert knfsd-stats.txt to ReST. Content remains mostly the same.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/filesystems/nfs/index.rst         |  1 +
 .../nfs/{knfsd-stats.txt => knfsd-stats.rst}    | 17 ++++++++---------
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename Documentation/filesystems/nfs/{knfsd-stats.txt => knfsd-stats.rst} (95%)

diff --git a/Documentation/filesystems/nfs/index.rst b/Documentation/filesystems/nfs/index.rst
index a0a678af921b..65805624e39b 100644
--- a/Documentation/filesystems/nfs/index.rst
+++ b/Documentation/filesystems/nfs/index.rst
@@ -10,3 +10,4 @@ NFS
    rpc-cache
    rpc-server-gss
    nfs41-server
+   knfsd-stats
diff --git a/Documentation/filesystems/nfs/knfsd-stats.txt b/Documentation/filesystems/nfs/knfsd-stats.rst
similarity index 95%
rename from Documentation/filesystems/nfs/knfsd-stats.txt
rename to Documentation/filesystems/nfs/knfsd-stats.rst
index 1a5d82180b84..80bcf13550de 100644
--- a/Documentation/filesystems/nfs/knfsd-stats.txt
+++ b/Documentation/filesystems/nfs/knfsd-stats.rst
@@ -1,7 +1,9 @@
-
+============================
 Kernel NFS Server Statistics
 ============================
 
+:Authors: Greg Banks <gnb@sgi.com> - 26 Mar 2009
+
 This document describes the format and semantics of the statistics
 which the kernel NFS server makes available to userspace.  These
 statistics are available in several text form pseudo files, each of
@@ -18,7 +20,7 @@ by parsing routines.  All other lines contain a sequence of fields
 separated by whitespace.
 
 /proc/fs/nfsd/pool_stats
-------------------------
+========================
 
 This file is available in kernels from 2.6.30 onwards, if the
 /proc/fs/nfsd filesystem is mounted (it almost always should be).
@@ -109,15 +111,12 @@ this case), or the transport can be enqueued for later attention
 (sockets-enqueued counts this case), or the packet can be temporarily
 deferred because the transport is currently being used by an nfsd
 thread.  This last case is not very interesting and is not explicitly
-counted, but can be inferred from the other counters thus:
+counted, but can be inferred from the other counters thus::
 
-packets-deferred = packets-arrived - ( sockets-enqueued + threads-woken )
+	packets-deferred = packets-arrived - ( sockets-enqueued + threads-woken )
 
 
 More
-----
-Descriptions of the other statistics file should go here.
-
+====
 
-Greg Banks <gnb@sgi.com>
-26 Mar 2009
+Descriptions of the other statistics file should go here.
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
