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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CB1C2D0DE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jan 2020 22:26:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C90802073D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jan 2020 22:26:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pp2EwJl6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C90802073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9E8528734E;
	Wed,  1 Jan 2020 22:26:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1W8yR2mHwMD; Wed,  1 Jan 2020 22:26:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 25FF387158;
	Wed,  1 Jan 2020 22:26:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 228CFC18DC;
	Wed,  1 Jan 2020 22:26:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F03E3C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DC21885321
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SuBRg05Pri5o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 69BC685361
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:45 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id s21so14386337plr.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jan 2020 14:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UKYzkJmn43x5CDYs8QtDG9L2pvD3Vr420sYEsSqBq+w=;
 b=Pp2EwJl63ahhLhtXbpN+WK09YsZuRYDOAILFXVLQ5q4UvREamZBJGhnJMo/rRaJS25
 /aKCJsm6MssSAtPZxxUDkpBnf0nxDGllG5LmoqZVzdWxA7lW/gUJ7hfjfEfMDk3wtEqu
 KDKsQyIUl+sIHLU4rHTdzqG0Y/PJh5BgVmuyAei8X6+Z1Q53E7wESA0qFGKXSoqeMbDO
 Xo4fJeBE+LrmlK2HWJGBQKRP4eG/foeyIJGUOqJW4YMakMmEu4TTHwNJoW4OcSEXxm8L
 btlRGzo12qe1lZGwl97fXle7c6SVqWtnXCeiNUWsOBMvrQeUV61rNd8jVcVSrJG7IYAu
 xsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UKYzkJmn43x5CDYs8QtDG9L2pvD3Vr420sYEsSqBq+w=;
 b=mWhKehs8K/y+NpwV4hAufnPdrVaIA7JX6RGihKpASy8t9rEnd81owxv4WOtzbVzdV1
 WHSkytQavWJf87oljufTHRtcGmgOAVezZOovO3SSd6qHn1pEtAwJhUyUpstS09OvKTc2
 9i+LX6hjWDTt8c/1abyqbh9ISuO0nrtw5LxUmFY4kLnV+gTgtQiF97Spz4L1mchdsQX/
 +rs0MND0sGihADb14yBqs0zfc6/jx/zinKZO5nicicBgZF1tdN2E3B6q2SKTLvQUU/Hk
 CCFo61ZuGT7sWvaYMHl69GCkncw+ULqiCFBSamML39Q79c19NUAIynh6JIjdBpRMr/X7
 kpUw==
X-Gm-Message-State: APjAAAXnh3rpwfUbZz6hG698LqJigo8a/GU/Oqir18Ml0U/HHS3pJuTM
 MARwM4eiJ2dvhDVPcvIXjxQ=
X-Google-Smtp-Source: APXvYqyZ2ZXvyFl5RI+CWSphG6g3BJgl+LQIhcMI7+XYmzfm1YzM2nvipwB0leEizFXYk7tTunv3SQ==
X-Received: by 2002:a17:90a:d50:: with SMTP id
 16mr15930090pju.117.1577917605044; 
 Wed, 01 Jan 2020 14:26:45 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id o2sm8601008pjo.26.2020.01.01.14.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 14:26:44 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+samsung@kernel.org,
	corbet@lwn.net
Date: Wed,  1 Jan 2020 19:26:13 -0300
Message-Id: <a9df2212dbdc479413b1b796315b2c97d914d28f.1577917076.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577917076.git.dwlsalmeida@gmail.com>
References: <cover.1577917076.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3 6/8] Documentation: nfs: convert
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
