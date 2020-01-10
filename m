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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F5CC33CA4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 23:25:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B78F024125
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 23:25:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1Z059DA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B78F024125
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9C72787E43;
	Fri, 10 Jan 2020 23:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 826GE1kIEeqv; Fri, 10 Jan 2020 23:25:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2D6E388547;
	Fri, 10 Jan 2020 23:25:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D505C1D7D;
	Fri, 10 Jan 2020 23:25:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86D78C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8303C86B24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dyo9ENfqDGyr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C182C86B51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:07 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id g1so3507342qtr.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xk8upTGYpLiwWJz4OqX3lOVzD+11JcT9lOysezL8+cQ=;
 b=K1Z059DAsEtF0G8X2GilAXpTrtpfymy3K2xd89WFLmI8MhCCbvRX01MVt5p59J8Nm5
 AEa8rNWj7NB6ktyH/gdpkpPNq9QfRMgHKpikuMQ6HRca7c8zN63TSdia5eE7+K5zTw0u
 VoeE5FvpnAEjbER2upOqoPf7AlbgXCT86K92OlhoMYfspl0XZ+RKH86DJM3Od34vUKmR
 pEgIR0AJCfumcrqIg1s+13RQ84aK+8SIHhpABIMn7MkMIpE/5HgaH7GYlOhoa+GEt48I
 J9hIcvk58U06zGyR1gPDtn4c1GPiKf2vdmM+luR6Eql6CZZ62ThNKBr5/1lseeSiQekI
 pNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xk8upTGYpLiwWJz4OqX3lOVzD+11JcT9lOysezL8+cQ=;
 b=mMYXFBAqD0e/FUm+1RLlhE/iZpWaobX8msmHYJkAja5mFLpQkWUtQkiwQx7P5lmTr0
 bKcrP9yjVvITadYCwxWUPp4uOI1vD6wXC1jwHwhMiHI0kaHGhX0FmO4XQw2aikDeZM/z
 9PpnXZ1CjQpugcj7TKRy6847mCdTb1Ymn6kuLPhZZXAfkwA1r/Euje0uyrS1/Q/fG6mE
 f78lGwwVLRry0UfHZNA2IzDjyreDYTrDQUQyj2mZUzrVzo+ZwCpqrWQH23yiq3PWdmdM
 Z9Sx1qj5pwKTHzMSUYqZmZ2OJHvesYOF5bUg31XnP/CfSPpu5oCHmjkjqqO290VEwwkk
 LG1g==
X-Gm-Message-State: APjAAAVnVZipspAMgZ2nnY1MOKfSzWWS2oZXJhnQCChUxkwBRFQDhFnn
 am55s5yK9DwA450Q/IUcyAM=
X-Google-Smtp-Source: APXvYqzE/g9FThs68kBo67G97dyaEtLTX25gh5Etw58UQyT5B6XgHYM8ZBe2g0/Kt0Mb+EdVUziOew==
X-Received: by 2002:aed:3f32:: with SMTP id p47mr4786924qtf.374.1578698706848; 
 Fri, 10 Jan 2020 15:25:06 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id i2sm1774752qte.87.2020.01.10.15.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 15:25:06 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+samsung@kernel.org,
	corbet@lwn.net
Date: Fri, 10 Jan 2020 20:24:29 -0300
Message-Id: <c06903760e690c16d9df92f5e75f80381d6326d8.1578697871.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578697871.git.dwlsalmeida@gmail.com>
References: <cover.1578697871.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v4 7/9] Documentation: nfs: convert
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
index 8376d5225fc2..365f42a611a4 100644
--- a/Documentation/admin-guide/nfs/index.rst
+++ b/Documentation/admin-guide/nfs/index.rst
@@ -10,3 +10,4 @@ NFS
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
