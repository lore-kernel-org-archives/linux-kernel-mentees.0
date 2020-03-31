Return-Path: <SRS0=z0fH=5Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872F6C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 22:29:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 592212080C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 22:29:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="1HPT3qPK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 592212080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3791285A78;
	Tue, 31 Mar 2020 22:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4cS4roplz_G; Tue, 31 Mar 2020 22:29:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A26A785168;
	Tue, 31 Mar 2020 22:29:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F3BAC1AE2;
	Tue, 31 Mar 2020 22:29:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53995C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4101F204D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ag3252sMILja
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:29:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 914F42044E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:29:04 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id o10so24932805qki.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 15:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EIvjO3useBmli2uM/TiwQHJ2Nhnb37wdo2/REgTIMZs=;
 b=1HPT3qPKF4EF9BC3fvNrOGqBGrIGMEw/N6QnTXx2h0iMrwZt1fxApFa5I2f+PnrHpq
 IFOQRd9KYU4U3crhwvG1Tv69ZX4X/ZSZfkcJB0F/4LmS404Ny9okaNvOZWH6Vx//JCcY
 HXFOuJmYWOJoNc69bF/N4pTLr6dU68Uq8znrzmBf9088qdZKMOTeMrpsQuK1c0b79KE0
 7fOcHlBBEqJlkIZ8VWS5DKaCbAPERXmQHVwiNZbB+mCv5DcWUQOfAYyt6Rp8hnkGCwkE
 4F5beE/fL1IhefnVEvRBmFGs2ldU4cFy5nOwJElFwcyiXtXfote4mRslLOF0AdgaHynN
 YqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EIvjO3useBmli2uM/TiwQHJ2Nhnb37wdo2/REgTIMZs=;
 b=XyXEQ/c+N81qZaLt6gKGyHL30K7Q/XMQQ8OA3la/qTdrD0IWZ98WcOTCXmC39ZT5cm
 mIl3IkMmcuCvrh1gLZ1F1FdlovDf/qQ0ksC8Jaoah7Y1cg+ZuvsKvCPTjEdBkFKysJmt
 MA80LWd2gYZ4X24B0v5yYNUpSXkEQRIM5IHSHgz4ur8C5I2rO3hoqlgoy9CAGykE3RGN
 qh300FWEWje+kFPmRclTICVZ3kSq6UCcZk14AGoyG2z8OSeQlta0ic9YtZ730lmyHxpT
 K4GXo1CV2NgzebPe6UfSaKWxupVfHDfVAeejqSofdhmpGblb1TXOi96FpBhakmuF6e3h
 KeIg==
X-Gm-Message-State: ANhLgQ1TnFYhjFeN1kulvhUUHypI3w6F6Ntzqknno6Gocm8fZMZlKnB1
 c1t8WrvTO0LTnpjkvSw+lxDzYQ==
X-Google-Smtp-Source: ADFU+vsB9OsLCigCjj1qUXSQG2YbPmxN3ALbi3VoPNxdq8ur1BeKVGK6sYWWNssgVP13PjbMrTT47w==
X-Received: by 2002:a37:a397:: with SMTP id m145mr6970037qke.411.1585693743617; 
 Tue, 31 Mar 2020 15:29:03 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id 206sm238659qkn.36.2020.03.31.15.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 15:29:03 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: linux-doc@vger.kernel.org
Date: Tue, 31 Mar 2020 19:28:56 -0300
Message-Id: <637c0379a76fcf4eb6cdde0de3cc727203fd942f.1585693146.git.vitor@massaru.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <cover.1585693146.git.vitor@massaru.org>
References: <cover.1585693146.git.vitor@massaru.org>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: [Linux-kernel-mentees] [PATCH 1/2] Documentation: filesystems:
	Convert sysfs-pci to ReST
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

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 .../{sysfs-pci.txt => sysfs-pci.rst}          | 40 ++++++++++---------
 1 file changed, 22 insertions(+), 18 deletions(-)
 rename Documentation/filesystems/{sysfs-pci.txt => sysfs-pci.rst} (82%)

diff --git a/Documentation/filesystems/sysfs-pci.txt b/Documentation/filesystems/sysfs-pci.rst
similarity index 82%
rename from Documentation/filesystems/sysfs-pci.txt
rename to Documentation/filesystems/sysfs-pci.rst
index 06f1d64c6f70..9b93e7444b15 100644
--- a/Documentation/filesystems/sysfs-pci.txt
+++ b/Documentation/filesystems/sysfs-pci.rst
@@ -1,5 +1,8 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
 Accessing PCI device resources through sysfs
---------------------------------------------
+============================================
 
 sysfs, usually mounted at /sys, provides access to PCI resources on platforms
 that support it.  For example, a given bus might look like this:
@@ -30,23 +33,24 @@ This bus contains a single function device in slot 0.  The domain and bus
 numbers are reproduced for convenience.  Under the device directory are several
 files, each with their own function.
 
-       file		   function
-       ----		   --------
-       class		   PCI class (ascii, ro)
-       config		   PCI config space (binary, rw)
-       device		   PCI device (ascii, ro)
-       enable	           Whether the device is enabled (ascii, rw)
-       irq		   IRQ number (ascii, ro)
-       local_cpus	   nearby CPU mask (cpumask, ro)
-       remove		   remove device from kernel's list (ascii, wo)
-       resource		   PCI resource host addresses (ascii, ro)
-       resource0..N	   PCI resource N, if present (binary, mmap, rw[1])
-       resource0_wc..N_wc  PCI WC map resource N, if prefetchable (binary, mmap)
-       revision		   PCI revision (ascii, ro)
-       rom		   PCI ROM resource, if present (binary, ro)
-       subsystem_device	   PCI subsystem device (ascii, ro)
-       subsystem_vendor	   PCI subsystem vendor (ascii, ro)
-       vendor		   PCI vendor (ascii, ro)
+	file		    function
+	=================== ======================================================
+	class		    PCI class (ascii, ro)
+	config		    PCI config space (binary, rw)
+	device		    PCI device (ascii, ro)
+	enable		    Whether the device is enabled (ascii, rw)
+	irq		    IRQ number (ascii, ro)
+	local_cpus	    nearby CPU mask (cpumask, ro)
+	remove		    remove device from kernel's list (ascii, wo)
+	resource	    PCI resource host addresses (ascii, ro)
+	resource0..N	    PCI resource N, if present (binary, mmap, rw[1])
+	resource0_wc..N_wc  PCI WC map resource N, if prefetchable (binary, mmap)
+	revision	    PCI revision (ascii, ro)
+	rom		    PCI ROM resource, if present (binary, ro)
+	subsystem_device    PCI subsystem device (ascii, ro)
+	subsystem_vendor    PCI subsystem vendor (ascii, ro)
+	vendor		    PCI vendor (ascii, ro)
+	=================== ======================================================
 
   ro - read only file
   rw - file is readable and writable
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
