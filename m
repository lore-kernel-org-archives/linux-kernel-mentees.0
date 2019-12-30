Return-Path: <SRS0=vtN2=2U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F75C47409
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 04:56:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F39920663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 04:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lr56+Iza"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F39920663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 34239203E9;
	Mon, 30 Dec 2019 04:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTVtGZJUA0X7; Mon, 30 Dec 2019 04:56:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 792A2203E7;
	Mon, 30 Dec 2019 04:56:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6854BC18DC;
	Mon, 30 Dec 2019 04:56:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 696E4C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6676881E5F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8Pmp7xc0Z4E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8342783EFE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:29 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z124so17415038pgb.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Dec 2019 20:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H2a6HXueWCHtUZD/OVDlDKAMCXfodyCrP/XbEG2O9ms=;
 b=lr56+IzaweGCX8izsJlkol5dyeiod50EjO7mDPGApbLcjZjkq8RIPHQ9HP9Xsk5/lt
 SpqWcDLSLbKrwQtnXcotRsna1OnPJH3YDXUMsl+4Zpms9u6tVCjSXTpiuBuqqW3JflOQ
 XHJV5SG5K2w2211utYCvlly7YHJU1kLUCxY+OhKSCqfgWYlJ6xznaT2uzPfrfOcWZZc/
 jkGfadib7QPF5knjAiNi/D7JnsGBnf9eMm6HgY6L9C8eL6BkLP1AE+Qh9gdw0hYJ3eGZ
 JXE2u4diWQ8Ha1bZrGtXt7aJKtYgcrTDi18yJxmLnBgDPqNOh+DE1p9+ukbMUibOFpVo
 71hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H2a6HXueWCHtUZD/OVDlDKAMCXfodyCrP/XbEG2O9ms=;
 b=i28+T3Qcf8OSznew20zjM2ruMNqxRmvyConGw6p/WlAt7lVHSfIK7ACWvSVx/P9h3O
 KQzS6nmRzQ+U/YaO/82m8AKDXqvkvN1wx6HMY1KgoR48x2nseLdexRnyLPBEFDVigur8
 D/ucl3w0Yqi23uZbeV9+mwzBA8lw1zaHfukgUTBFO5y3xPWO1FM/YPUfCXPPgPLfheAS
 7jXMcttpGxwk1Jkpx0fQo2yUy0mhaXbJixQn5LTnkYuvFgtTOS8SgUCU2FaKBptnt72O
 rURbXeSubkwoDF1y8lPcQ8UzzmL1nR+srSc6L+/0eDx+R3wAmxy9eXtIkhmAG3emg+kG
 6Vkg==
X-Gm-Message-State: APjAAAWmIbMKC2bkHeZxufetz5XflpW8JIj3i3ZYZ3DLKNyowIZPhsU/
 SIMzBbzY+sSuUQOrUVJTVEY=
X-Google-Smtp-Source: APXvYqzFYAJXjAIEy5Egk8jmD2IpWKXwFpHHVuKMBg45DxEDNESUwHNNlqxGUirm+iExuWb+R8ZVgg==
X-Received: by 2002:aa7:96f9:: with SMTP id i25mr70440416pfq.161.1577681789132; 
 Sun, 29 Dec 2019 20:56:29 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id b1sm22373189pjw.4.2019.12.29.20.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 20:56:28 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Mon, 30 Dec 2019 01:55:58 -0300
Message-Id: <8a7e8fa26c2997d9286174da78e2d85b46e0626a.1577681164.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577681164.git.dwlsalmeida@gmail.com>
References: <cover.1577681164.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 4/8] Documentation: convert
	nfsd-admin-interfaces to ReST
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

Convert nfsd-admin-interfaces to ReST and move it into admin-guide.
Content remains mostly untouched.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/admin-guide/nfs/index.rst       |  1 +
 .../nfs/nfsd-admin-interfaces.rst}            | 19 +++++++++----------
 2 files changed, 10 insertions(+), 10 deletions(-)
 rename Documentation/{filesystems/nfs/nfsd-admin-interfaces.txt => admin-guide/nfs/nfsd-admin-interfaces.rst} (70%)

diff --git a/Documentation/admin-guide/nfs/index.rst b/Documentation/admin-guide/nfs/index.rst
index 498652a8b955..c73ba9c16b77 100644
--- a/Documentation/admin-guide/nfs/index.rst
+++ b/Documentation/admin-guide/nfs/index.rst
@@ -8,4 +8,5 @@ NFS
     nfs-client
     nfsroot
     nfs-rdma
+    nfsd-admin-interfaces
 
diff --git a/Documentation/filesystems/nfs/nfsd-admin-interfaces.txt b/Documentation/admin-guide/nfs/nfsd-admin-interfaces.rst
similarity index 70%
rename from Documentation/filesystems/nfs/nfsd-admin-interfaces.txt
rename to Documentation/admin-guide/nfs/nfsd-admin-interfaces.rst
index 56a96fb08a73..7f8c64ad7632 100644
--- a/Documentation/filesystems/nfs/nfsd-admin-interfaces.txt
+++ b/Documentation/admin-guide/nfs/nfsd-admin-interfaces.rst
@@ -1,5 +1,6 @@
+==================================
 Administrative interfaces for nfsd
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==================================
 
 Note that normally these interfaces are used only by the utilities in
 nfs-utils.
@@ -13,18 +14,16 @@ nfsd/threads.
 Before doing that, NFSD can be told which sockets to listen on by
 writing to nfsd/portlist; that write may be:
 
-	- an ascii-encoded file descriptor, which should refer to a
-	  bound (and listening, for tcp) socket, or
-	- "transportname port", where transportname is currently either
-	  "udp", "tcp", or "rdma".
+	#. an ascii-encoded file descriptor, which should refer to a
+	   bound (and listening, for tcp) socket, or
+	#. "transportname port", where transportname is currently either
+	   "udp", "tcp", or "rdma".
 
 If nfsd is started without doing any of these, then it will create one
 udp and one tcp listener at port 2049 (see nfsd_init_socks).
 
-On startup, nfsd and lockd grace periods start.
-
-nfsd is shut down by a write of 0 to nfsd/threads.  All locks and state
-are thrown away at that point.
+On startup, nfsd and lockd grace periods start. nfsd is shut down by a write of
+0 to nfsd/threads.  All locks and state are thrown away at that point.
 
 Between startup and shutdown, the number of threads may be adjusted up
 or down by additional writes to nfsd/threads or by writes to
@@ -34,7 +33,7 @@ For more detail about files under nfsd/ and what they control, see
 fs/nfsd/nfsctl.c; most of them have detailed comments.
 
 Implementation notes
-^^^^^^^^^^^^^^^^^^^^
+====================
 
 Note that the rpc server requires the caller to serialize addition and
 removal of listening sockets, and startup and shutdown of the server.
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
