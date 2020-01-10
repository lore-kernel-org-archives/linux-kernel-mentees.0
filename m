Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F616C33CA4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 23:25:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D62E120838
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 23:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gw0R5Qf1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D62E120838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A333C86483;
	Fri, 10 Jan 2020 23:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PVRq+9NeyxA; Fri, 10 Jan 2020 23:25:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C091F85BC9;
	Fri, 10 Jan 2020 23:25:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBEECC1D7D;
	Fri, 10 Jan 2020 23:25:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 387D1C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 26EBC88547
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ar+1iqmC2dYS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 79DFC87E43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:02 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id t129so3571612qke.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ebLONtqGmJ0g8QdilfQ195Nw3+a7aEVgDzipjzqmmg=;
 b=Gw0R5Qf1xKXXTYVfJYyHt9pm3m2q6WScg95V7llejc0l4Q2N+oP4MQPRYS8ezT3PIm
 QFpU/vL8PQ20hnbn0zuLGZNIIt4yGdDoCX5MFNQNuQLydU7E5ysrIodBDOwReKMwOW8Z
 KjsXmg6knosGz6L+B8wUYXuT//ewjBreJLPz5TDKtxO9NzaUIW4G8RSNrafq7dWLYYMN
 jtU2VaAp3I8A18fsCQZJFWP8EGHUbeenjLRTrsWJVk+fZfwS2c5qjhGdj1iYf6ZU7tSK
 f2djpx0814aYvPaX9sEP9Ycz1k6unfxJ+2mci+5QPxLD4x3lcrhsIMAvW3kz9UA5libJ
 gOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ebLONtqGmJ0g8QdilfQ195Nw3+a7aEVgDzipjzqmmg=;
 b=inxpUT+1XMGGsAKzFQqZ7IgsLPZDKIp6MnZ+6ICBxemRYun7XUTpgar21bbG1IV9FX
 fyN53Ly0pgvSOIHLZ8GTpGltfdjUXBUb/cC2cCJMP5tPwNIhOecyqCBvmB0UFxdpWg8V
 mDEAQ2yuuieWHoPgCVtFiMQnLTLc2ldCdCeks344SnaGGDyBtX7anwGNFVedrKYx1Egw
 XVTNTymcHqnh2j12Hhi+x/i/L2XdugnpFq9g+4ecjR43W5bARKKZhNmErg3EpSKrPChK
 s3O7c50/JOBjwp4ctIncechTSCBSBGlIUoMABIB1dkfes6e5GzRhRXyPt/qZ+K+vUheQ
 vXGw==
X-Gm-Message-State: APjAAAXYhWPYKrQ32Um5ucwnyD7A8cXMeyUc9FM49ikr8NJ2zMX5pcco
 I4DcckMACny1AmaWGZADFSw=
X-Google-Smtp-Source: APXvYqy7ABNVa/nl93DGqZ+C/GmsUunJhoaqIoi4I7mOCqz92jlqlubPJp4tKWefhsXUvBQefSjjOA==
X-Received: by 2002:a05:620a:1001:: with SMTP id
 z1mr958143qkj.99.1578698701428; 
 Fri, 10 Jan 2020 15:25:01 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id i2sm1774752qte.87.2020.01.10.15.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 15:25:01 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+samsung@kernel.org,
	corbet@lwn.net
Date: Fri, 10 Jan 2020 20:24:27 -0300
Message-Id: <d471305e9c96dec38f18d2ff816fca2269a88e29.1578697871.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578697871.git.dwlsalmeida@gmail.com>
References: <cover.1578697871.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v4 5/9] Documentation: convert
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
index 875a96fe9d04..e0b2f4260ad7 100644
--- a/Documentation/admin-guide/nfs/index.rst
+++ b/Documentation/admin-guide/nfs/index.rst
@@ -8,3 +8,4 @@ NFS
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
