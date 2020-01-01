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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EC3C32767
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jan 2020 22:26:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEC7B2073D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jan 2020 22:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vZAIxjjQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEC7B2073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D8A5320003;
	Wed,  1 Jan 2020 22:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O5BjWSVBxJ7x; Wed,  1 Jan 2020 22:26:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CB08F2047A;
	Wed,  1 Jan 2020 22:26:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5F42C18DC;
	Wed,  1 Jan 2020 22:26:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3397DC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3098887216
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ne8OnfvCmjab
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B5AFA87158
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:38 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id n9so13327591pff.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jan 2020 14:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vvp0BLAgFmMstADpwknIGqQeBNz6XeE37rhf2QOsEEA=;
 b=vZAIxjjQV8gkhnAAQl7V2yA2SnUFQ4KkbF/xOnGu4VPVkVq38ZX8R1e0mE3XOnUL7b
 ihTfrwevnvDOaO24DR0d38ILCyxoNNpdwkXiVHcLXmRn4sXFr0vrpDF/EG6lMbCXpWUG
 92Ha0/cWkQn6SsajB4/4HDDcaJqsS88mitBHDtPLbwOoCgOAME3tQ6HH+nFVDgdEGPCc
 KDG47dsrIlkBWWxnGO/8d4kNs9K/iSHPpKrzPV8LnCYUSunqbyW71TbHZMIUmbtvp7FM
 gJohMatXVk5PBBz+KHfMHDiHTy53QHVvW9QTXuCi8EWRD4C3fdLlWEK2RuxrOUdqCu7Z
 K7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vvp0BLAgFmMstADpwknIGqQeBNz6XeE37rhf2QOsEEA=;
 b=fvCj+nFqT/Q6VU53wvGoC+tdi5UYvZ9A4FVEegGDRfNEFZ97mTJQX7x3CV8MM6iLGh
 j8wzYwUpuxevVHHaSuL/iDBsa59WUbz/zhDHMnJ3tx7D/K8RS4MQmm2uTYy31Ep7ttfZ
 UKY/l1eWgrQSy8F4B2SDDnL+OnqoCbHI1Slarj4+1Lt3kwaov7EUCTp3cZQxD9cVgv6n
 EEpDeYpfXa4v1NSDC5pkZFUWAl0ABQIaqxo3q5Bii8CDDF46FslVU38Emss29E9W136N
 9GVA5gaQUxSYuY9qIfs9Z17IMVqGoE9f5roYHF3IEVexQKckoWZay2qMnqp9ioCbEuwk
 DpHg==
X-Gm-Message-State: APjAAAUCr7Mo08mKe5WmyXoiUulkLK1G+w3CAH9np2o9MTeHKWKxAVmm
 5PqSHRVq4iRdtuBMZlViEgs=
X-Google-Smtp-Source: APXvYqw14kQc32Mxm2YZY+VI67AeiNvEeDPUD95vlraB+nYfY3DEW88MiMwQL082JTIbub/cwOCg0A==
X-Received: by 2002:a63:7985:: with SMTP id
 u127mr84556151pgc.169.1577917598239; 
 Wed, 01 Jan 2020 14:26:38 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id o2sm8601008pjo.26.2020.01.01.14.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 14:26:37 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+samsung@kernel.org,
	corbet@lwn.net
Date: Wed,  1 Jan 2020 19:26:11 -0300
Message-Id: <fc0b54cbbd0afb020af5d979593c8e78f9b5cf6b.1577917076.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577917076.git.dwlsalmeida@gmail.com>
References: <cover.1577917076.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3 4/8] Documentation: convert
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
index 56a96fb08a73..c05926f79054 100644
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
+	-  an ascii-encoded file descriptor, which should refer to a
+	   bound (and listening, for tcp) socket, or
+	-  "transportname port", where transportname is currently either
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
