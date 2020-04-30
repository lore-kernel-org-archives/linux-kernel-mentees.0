Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809CAC4724C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 22:12:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 408B22166E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 22:12:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="Eb/eEyZs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 408B22166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0348225281;
	Thu, 30 Apr 2020 22:12:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tfoPIO+PfEKN; Thu, 30 Apr 2020 22:12:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 226C52039B;
	Thu, 30 Apr 2020 22:12:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CB9BC0864;
	Thu, 30 Apr 2020 22:12:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D99AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 22:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 25B0488B31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 22:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryTcKGZlMIbm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 22:12:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6E63888B26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 22:12:44 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id fb4so3902201qvb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 15:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+8e16cOdQRUjz5t68beIqqL5FxfhTtgKZlj473a86M=;
 b=Eb/eEyZs/vpxlvhzjl0yHNg5L/G3YYpd/vnGDA3e19ChXB2l1VDf2uGpNUni3sEn9G
 QxnO6RNM7uo/M7PNXukyjY/9lcXjNofE0UMSQYpXP4L/kCb53Y3RW0De2mSNjyC/g9rX
 uEMbMEWz1zvReWekBTsqlBvyJ5n8Fq/gXPFpJnxsRfGjRneRTDyDZywqiidLmZnL8CB7
 JkQzkOJJFVTOxB9x5XdmK82mb6ysupWBdeLVjIv+vRUil7EBIe2kn2Kcdhi+rrwofu0g
 OEnWXaW5c4QzRp+TDjNM5WPb2sGMILUoRt0yF07Yy6xttRwblhTOMbTumbxZabUU8PNJ
 dEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+8e16cOdQRUjz5t68beIqqL5FxfhTtgKZlj473a86M=;
 b=uZxRUmczEOen4dJ32+Gjyo2S4qvT+ySIcdUP1z+dSZIlmI88FkVj2ojtGibaLhD91u
 hiwHpq8qxpJcbRiX3fYht168Ua+94n6e0PYyUEJC4qDPl6VYNtyb3aGbnVfY0GJNtAUR
 Sd33xU59C9j3n1KiGxo4FHGj8e/gt32d+bcLpRKsPlW7qzCm6r//S+C8V3XAensFenhl
 +xS5YBdgiS88uhtuHn/Hh++XB+9lr6zKEU4C9JQ8o74JSCYInxb3bHvQk14s69hxI3am
 eIgbC4h++hd87I/Re7U632MfbhGxT6Bz/JEMzS3FSKrmhV3XdeVTdRynw1zbuhYGbtmH
 kQIA==
X-Gm-Message-State: AGi0Pub8UsS37wR02kp1WNScRHFCP/CDgBGgviiNlcRJOln6wXu+FHmG
 KqgwzOzriHaS9yy3/WXaGjlrVA==
X-Google-Smtp-Source: APiQypLRs9zog3u+05lAVNaP18w7qNd77encvvxAz4NjUHWfm/b97uwNKtE7Tanzzj9doiwukOH7ZA==
X-Received: by 2002:a0c:ed26:: with SMTP id u6mr1195099qvq.220.1588284763114; 
 Thu, 30 Apr 2020 15:12:43 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id i42sm1023283qtc.83.2020.04.30.15.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 15:12:42 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: linux-doc@vger.kernel.org
Date: Thu, 30 Apr 2020 19:12:38 -0300
Message-Id: <20200430221238.101838-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: akrowiak@linux.ibm.com, pmorel@linux.ibm.com, gor@linux.ibm.com,
 corbet@lwn.net, brendanhiggins@google.com, heiko.carstens@de.ibm.com,
 linux-kernel@vger.kernel.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] docs: s390: Fix wrong label Guest2
	instead of Guest3
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

This fixes:

Documentation/s390/vfio-ap.rst:488: WARNING: duplicate label s390/vfio-ap:guest2, other instance in /home/iha/sdb/opensource/lkmp/linux_doc/Documentation/s390/vfio-ap.rst

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 Documentation/s390/vfio-ap.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/s390/vfio-ap.rst b/Documentation/s390/vfio-ap.rst
index b5c51f7c748d..367e27ec3c50 100644
--- a/Documentation/s390/vfio-ap.rst
+++ b/Documentation/s390/vfio-ap.rst
@@ -484,7 +484,7 @@ CARD.DOMAIN TYPE  MODE
 05.00ff     CEX5A Accelerator
 =========== ===== ============
 
-Guest2
+Guest3
 ------
 =========== ===== ============
 CARD.DOMAIN TYPE  MODE
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
