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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B860C33CA3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 23:25:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D62F120882
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 23:25:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rubp6YBU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D62F120882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B87CA228DC;
	Fri, 10 Jan 2020 23:25:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OEAaGLBnhrvX; Fri, 10 Jan 2020 23:25:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3A9DD20430;
	Fri, 10 Jan 2020 23:25:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A6A5C1D7D;
	Fri, 10 Jan 2020 23:25:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 242EAC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1383586B51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ZbhSBoXoPqL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8E6E586B24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:10 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id dp13so1584687qvb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=APIIct3N0R8QchxFnn4VxAewqgWseTMk/OomcP8BgHQ=;
 b=rubp6YBUHBHKJlStId2ueiybZ2dE81kZYpYtLnh1ozoDIiwGnbULIM8lhn7tyrtYB6
 Jpa5510Kd1P6US5fRPN5JJwsHOFbP4vk7RFz7/Z2G/IA1N6/hM+AHrZUqYYeLRo3vF4h
 cS0iNqB4xRIItAhDqhjFLP4sLZ2B0w+TIzTw+Q7j+cQR3Tx2+NgCYy0EYLSIC8NGFhuC
 zkpnwXjoeFOH32uj3+u4kLzsQEHoZVH0pHH9EVjat3v7P4N95XL0mHCK81I+tg87uH2N
 t4Ay6zlZSJXtQJBvlZNw3/0ohZ+dytFIJHIJrvDpGm+XbhAVDXIXxIIya/l/hM4WeOJr
 5kcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=APIIct3N0R8QchxFnn4VxAewqgWseTMk/OomcP8BgHQ=;
 b=bNbMnRV2P8Pi0Caod05ugc8WK4qLha/8XgC479K2jb+igpiCxWj38tg892NyxC3DDj
 UIGjOShVCsixYJKc8bKD/XnLJmxGcFrArQBAa4VRsxoH62D5by+5evKOC83v+OQuK8YQ
 ybDNUShxxof2l0dKWQ4hQ9BCXEBra2fJheuS8JCeIt30zN/N53QOUKb5Q9ehl8RsTaWQ
 sDt7d/whTotn/T6nWuNqqCXmS37GGs9Caq4UVmWIHcTuMIwdavROkeZIThNX8uNlpnqD
 7JrRLjPbWYCZt2rlSWc9Jnwfny3rYPyVDR1FNXZbSxl8ug7SP3Js+AMQjVte5tQCymIt
 HqSg==
X-Gm-Message-State: APjAAAUB+jMfDh7a4L//RG1IuNipqqQ2X40fCn7ZTL7jFM2EVgVEL1f+
 +RqrxrS9sEE4xBNu1CekcKc=
X-Google-Smtp-Source: APXvYqw24IkI5R+Qnyv4XBr4naZprro/1HggkyT1vXPUns4tWePdzTJRBDos50aSe1mhilBveihDsQ==
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr1099862qvg.197.1578698709516; 
 Fri, 10 Jan 2020 15:25:09 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id i2sm1774752qte.87.2020.01.10.15.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 15:25:09 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+samsung@kernel.org,
	corbet@lwn.net
Date: Fri, 10 Jan 2020 20:24:30 -0300
Message-Id: <5c4b8af41ca0a427a3987535815bccf47a65d320.1578697871.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578697871.git.dwlsalmeida@gmail.com>
References: <cover.1578697871.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v4 8/9] Documentation: nfs:
	pnfs-scsi-server: convert to ReST
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

Convert pnfs-scsi-server to ReST and move it to admin-guide. Content
remains mostly unchanged.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/admin-guide/nfs/index.rst                          | 1 +
 .../nfs/pnfs-scsi-server.rst}                                    | 1 +
 2 files changed, 2 insertions(+)
 rename Documentation/{filesystems/nfs/pnfs-scsi-server.txt => admin-guide/nfs/pnfs-scsi-server.rst} (97%)

diff --git a/Documentation/admin-guide/nfs/index.rst b/Documentation/admin-guide/nfs/index.rst
index 365f42a611a4..3601a708f333 100644
--- a/Documentation/admin-guide/nfs/index.rst
+++ b/Documentation/admin-guide/nfs/index.rst
@@ -11,3 +11,4 @@ NFS
     nfsd-admin-interfaces
     nfs-idmapper
     pnfs-block-server
+    pnfs-scsi-server
diff --git a/Documentation/filesystems/nfs/pnfs-scsi-server.txt b/Documentation/admin-guide/nfs/pnfs-scsi-server.rst
similarity index 97%
rename from Documentation/filesystems/nfs/pnfs-scsi-server.txt
rename to Documentation/admin-guide/nfs/pnfs-scsi-server.rst
index 5bef7268bd9f..d2f6ee558071 100644
--- a/Documentation/filesystems/nfs/pnfs-scsi-server.txt
+++ b/Documentation/admin-guide/nfs/pnfs-scsi-server.rst
@@ -1,4 +1,5 @@
 
+==================================
 pNFS SCSI layout server user guide
 ==================================
 
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
