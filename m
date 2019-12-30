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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2053C2D0D1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 04:56:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 887E621744
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 04:56:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqyeeOAS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 887E621744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5253285DE0;
	Mon, 30 Dec 2019 04:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14FLPpwLv52s; Mon, 30 Dec 2019 04:56:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C855B85D22;
	Mon, 30 Dec 2019 04:56:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1D2AC18DC;
	Mon, 30 Dec 2019 04:56:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB402C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9ACD38409C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pl0eNy0AD9iZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2C03783B47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:37 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id s7so7616724pjc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Dec 2019 20:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UKYzkJmn43x5CDYs8QtDG9L2pvD3Vr420sYEsSqBq+w=;
 b=KqyeeOASvfyy32tYw5yo/OLxFTEbzNzO8X26K9EbBduFJRUFgGKc+EzI5NstL17vj7
 EQ3BSdovcPcfWkdl2AmUaYw3xld9d2b3Db7BZMddlP1dpkCZE9nK9rRt4LlVsTUHRvmO
 1wvHTbA8y4SrXZ2OhsSV1pOWlLnoMKMC3UJBE6lXHn4fGDqjjYrdyUog+rClsphZ+vZ3
 tu5/ugCa805B+1XlVBAHoCysAvi/dvN5sfc3+2ou5ph/rEC2So79uQwJHVc5YeJO6QY8
 piza+H/DHRqgzHZsHi1xpTYvSgtOD1NaRCSCy8LdOHikOC4UZMe+OXnGMEYpfxosyORv
 0DSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UKYzkJmn43x5CDYs8QtDG9L2pvD3Vr420sYEsSqBq+w=;
 b=kC7tITGqFHLP3zH3MHjr+/uf/y8QbBUuUk9NLq5FqxbdysHXgexoj4eODI1v7E3//P
 NkoP8OvqYUZJDjk6+ws3A4koc+N0i2jWTRfEk85xlwfxaf0Y9D46PpftJGFxYo/V88qq
 9Hc3DAJF3nQo+jKqnDoOihqPmknpmYRejN+AkqLhPvjli4TgPvpLg17if0ZNdKCj2nnM
 U1SgPEWMSF654iMKbymYtyWPgrEhlnbKBUAKUfMmK9YiUuRLX0w+nmstphC2YWZgL5T/
 WaPVOsIsmViVg3f1+XyV23YdhJNvNKIhm7S4CZTnhcoWptp3IGXnhYxU+ORU6A5iw2/a
 Iyaw==
X-Gm-Message-State: APjAAAXwbjGoka9hpfNO03WP0sWPjYrD/SuuJlZv5jfE/vvpK/+4BHjf
 N/URl8cx2q9VlELGbSSniqQ=
X-Google-Smtp-Source: APXvYqxVxdmvh0X/bPKt4pCt7OhiiEdzghkZ6BOH2gYZAlobIy0nn3trPdfeiGL6uRzDCjKS/KCWsA==
X-Received: by 2002:a17:90a:2486:: with SMTP id
 i6mr45605013pje.9.1577681796767; 
 Sun, 29 Dec 2019 20:56:36 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id b1sm22373189pjw.4.2019.12.29.20.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 20:56:36 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Mon, 30 Dec 2019 01:56:00 -0300
Message-Id: <549bf486ec209a1e119b6e00b05f7034bf98b8fd.1577681164.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577681164.git.dwlsalmeida@gmail.com>
References: <cover.1577681164.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 6/8] Documentation: nfs: convert
	pnfs-block-server to ReST
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

Convert pnfs-block-server.txt to ReST and move it to admin-guide.
Content remains mostly unchanged.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/admin-guide/nfs/index.rst       |  1 +
 .../nfs/pnfs-block-server.rst}                | 25 +++++++++++--------
 2 files changed, 16 insertions(+), 10 deletions(-)
 rename Documentation/{filesystems/nfs/pnfs-block-server.txt => admin-guide/nfs/pnfs-block-server.rst} (80%)

diff --git a/Documentation/admin-guide/nfs/index.rst b/Documentation/admin-guide/nfs/index.rst
index c90fd5ebc640..f3bfd0f5a362 100644
--- a/Documentation/admin-guide/nfs/index.rst
+++ b/Documentation/admin-guide/nfs/index.rst
@@ -10,4 +10,5 @@ NFS
     nfs-rdma
     nfsd-admin-interfaces
     nfs-idmapper
+    pnfs-block-server
 
diff --git a/Documentation/filesystems/nfs/pnfs-block-server.txt b/Documentation/admin-guide/nfs/pnfs-block-server.rst
similarity index 80%
rename from Documentation/filesystems/nfs/pnfs-block-server.txt
rename to Documentation/admin-guide/nfs/pnfs-block-server.rst
index 2143673cf154..b00a2e705cc4 100644
--- a/Documentation/filesystems/nfs/pnfs-block-server.txt
+++ b/Documentation/admin-guide/nfs/pnfs-block-server.rst
@@ -1,4 +1,6 @@
+===================================
 pNFS block layout server user guide
+===================================
 
 The Linux NFS server now supports the pNFS block layout extension.  In this
 case the NFS server acts as Metadata Server (MDS) for pNFS, which in addition
@@ -22,16 +24,19 @@ If the nfsd server needs to fence a non-responding client it calls
 /sbin/nfsd-recall-failed with the first argument set to the IP address of
 the client, and the second argument set to the device node without the /dev
 prefix for the file system to be fenced. Below is an example file that shows
-how to translate the device into a serial number from SCSI EVPD 0x80:
+how to translate the device into a serial number from SCSI EVPD 0x80::
 
-cat > /sbin/nfsd-recall-failed << EOF
-#!/bin/sh
+	cat > /sbin/nfsd-recall-failed << EOF
 
-CLIENT="$1"
-DEV="/dev/$2"
-EVPD=`sg_inq --page=0x80 ${DEV} | \
-	grep "Unit serial number:" | \
-	awk -F ': ' '{print $2}'`
+.. code-block:: sh
 
-echo "fencing client ${CLIENT} serial ${EVPD}" >> /var/log/pnfsd-fence.log
-EOF
+	#!/bin/sh
+
+	CLIENT="$1"
+	DEV="/dev/$2"
+	EVPD=`sg_inq --page=0x80 ${DEV} | \
+		grep "Unit serial number:" | \
+		awk -F ': ' '{print $2}'`
+
+	echo "fencing client ${CLIENT} serial ${EVPD}" >> /var/log/pnfsd-fence.log
+	EOF
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
