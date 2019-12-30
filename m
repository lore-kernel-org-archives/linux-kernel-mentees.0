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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A3BC2D0DA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 05:05:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 994AD20663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 05:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/J3wKOK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 994AD20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B9DE78409C;
	Mon, 30 Dec 2019 05:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O4xHxH3qwwuX; Mon, 30 Dec 2019 05:05:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3ABAE838F6;
	Mon, 30 Dec 2019 05:05:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A9E5C18DC;
	Mon, 30 Dec 2019 05:05:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD088C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 94DEA849B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpyQzOr8Au_t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:04:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A919E845DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:04:58 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y8so14165978pll.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Dec 2019 21:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0bGFOBTnjumQZE2kID8F6RH3CwsaMKHdPP5Y224cXIg=;
 b=A/J3wKOK3L5WTy8mt5B7Bn2RTq7etw1YqjFgPdqpMGjSc/oKafJ6pPosZdJK538zV0
 ZvZZXULnpWdMnsa5Et6ZLWsEVggxGCkghGxcpvypkk4rHzlgeAJIE0d1OTiOD1QZeUi1
 BtzDBu8Nnecvdt3IIXqMRXifQAhvj3VclAk7m+IKr/eaPWh1XSB/EJYIW+eNPZd88bO6
 m0pn6yiGBRwGPKc41wJaggZ4ddi5afNFmayqyhTBp9S/9JFrEWuclWmkEaVVrinX7dLu
 N2vQcZIZCe0j80NSnb9Jjf5ikWaqXvER/7Or/PRB/RM4EzBX0NKpeVj3HFPRMbgoR7Fu
 S92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0bGFOBTnjumQZE2kID8F6RH3CwsaMKHdPP5Y224cXIg=;
 b=EwfXSVhqr0KbkH4PuppXtKyuohqo+CX+mdNOLL0V7cGDJAUQcVCC5lX5v7Z5sJO96v
 x2fbJZxXQaF6auIzVEWCR81MEPEF8JYtBQJCRJLRx6ivflAQ7RZR0FL2CdEUua5spt36
 jKswToRp1f5qeyaBi2dMo3ebNxxQHyS4k+b4nGhAtZDLTVPPpoRQ8+2d941Tx5RuM+q7
 0oB3e9tm5W5/09AbiGr3c9X2pAegnihjr6+9f3zvlUe5gZFX1+p20r/apXWNIqEhsW9J
 RmSo7rXtohoAvipWdtuqMf+KMT/GgKyi1tjoQ4ZrE5zgHn7v2zv7qi5oXidDW5G/MYAv
 klOw==
X-Gm-Message-State: APjAAAU/7JJHoK5uyFN/0Gz1Pzd4FYkwJLp00NiYH9BxHYBFewNo9W5M
 H5MX0qFQCUzkEpiDFOZnFTidT17MvRgFOw==
X-Google-Smtp-Source: APXvYqwyDvbObIx9HmuX7qwlep0GnZzAKgwzOP+Xd5qu3gfwnklrFxw2msL5DLrJBLXw9Vlr8p05qA==
X-Received: by 2002:a17:902:8bc4:: with SMTP id
 r4mr66088386plo.291.1577682298168; 
 Sun, 29 Dec 2019 21:04:58 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id r2sm45054727pgv.16.2019.12.29.21.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 21:04:57 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Mon, 30 Dec 2019 02:04:43 -0300
Message-Id: <1523c9b99c383c789c3ae943987b2d700377b979.1577681894.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577681894.git.dwlsalmeida@gmail.com>
References: <cover.1577681894.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 1/5] Documentation: nfs: convert
	pnfs.txt to ReST
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

Convert pnfs.txt to ReST. Content remains mostly unchanged.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/filesystems/index.rst           |  1 +
 Documentation/filesystems/nfs/index.rst       |  9 +++++++
 .../filesystems/nfs/{pnfs.txt => pnfs.rst}    | 25 +++++++++++--------
 3 files changed, 25 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/filesystems/nfs/index.rst
 rename Documentation/filesystems/nfs/{pnfs.txt => pnfs.rst} (87%)

diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index ad6315a48d14..801d773a44b9 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -48,3 +48,4 @@ Documentation for filesystem implementations.
 
    autofs
    virtiofs
+   nfs/index
diff --git a/Documentation/filesystems/nfs/index.rst b/Documentation/filesystems/nfs/index.rst
new file mode 100644
index 000000000000..d19ba592779a
--- /dev/null
+++ b/Documentation/filesystems/nfs/index.rst
@@ -0,0 +1,9 @@
+===============================
+NFS
+===============================
+
+
+.. toctree::
+   :maxdepth: 1
+
+   pnfs
diff --git a/Documentation/filesystems/nfs/pnfs.txt b/Documentation/filesystems/nfs/pnfs.rst
similarity index 87%
rename from Documentation/filesystems/nfs/pnfs.txt
rename to Documentation/filesystems/nfs/pnfs.rst
index 80dc0bdc302a..7c470ecdc3a9 100644
--- a/Documentation/filesystems/nfs/pnfs.txt
+++ b/Documentation/filesystems/nfs/pnfs.rst
@@ -1,15 +1,17 @@
-Reference counting in pnfs:
+==========================
+Reference counting in pnfs
 ==========================
 
 The are several inter-related caches.  We have layouts which can
 reference multiple devices, each of which can reference multiple data servers.
 Each data server can be referenced by multiple devices.  Each device
-can be referenced by multiple layouts.  To keep all of this straight,
+can be referenced by multiple layouts. To keep all of this straight,
 we need to reference count.
 
 
 struct pnfs_layout_hdr
-----------------------
+======================
+
 The on-the-wire command LAYOUTGET corresponds to struct
 pnfs_layout_segment, usually referred to by the variable name lseg.
 Each nfs_inode may hold a pointer to a cache of these layout
@@ -25,7 +27,8 @@ the reference count, as the layout is kept around by the lseg that
 keeps it in the list.
 
 deviceid_cache
---------------
+==============
+
 lsegs reference device ids, which are resolved per nfs_client and
 layout driver type.  The device ids are held in a RCU cache (struct
 nfs4_deviceid_cache).  The cache itself is referenced across each
@@ -38,24 +41,26 @@ justification, but seems reasonable given that we can have multiple
 deviceid's per filesystem, and multiple filesystems per nfs_client.
 
 The hash code is copied from the nfsd code base.  A discussion of
-hashing and variations of this algorithm can be found at:
-http://groups.google.com/group/comp.lang.c/browse_thread/thread/9522965e2b8d3809
+hashing and variations of this algorithm can be found `here.
+<http://groups.google.com/group/comp.lang.c/browse_thread/thread/9522965e2b8d3809>`_
 
 data server cache
------------------
+=================
+
 file driver devices refer to data servers, which are kept in a module
 level cache.  Its reference is held over the lifetime of the deviceid
 pointing to it.
 
 lseg
-----
+====
+
 lseg maintains an extra reference corresponding to the NFS_LSEG_VALID
 bit which holds it in the pnfs_layout_hdr's list.  When the final lseg
 is removed from the pnfs_layout_hdr's list, the NFS_LAYOUT_DESTROYED
 bit is set, preventing any new lsegs from being added.
 
 layout drivers
---------------
+==============
 
 PNFS utilizes what is called layout drivers. The STD defines 4 basic
 layout types: "files", "objects", "blocks", and "flexfiles". For each
@@ -68,6 +73,6 @@ Blocks-layout-driver code is in: fs/nfs/blocklayout/.. directory
 Flexfiles-layout-driver code is in: fs/nfs/flexfilelayout/.. directory
 
 blocks-layout setup
--------------------
+===================
 
 TODO: Document the setup needs of the blocks layout driver
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
