Return-Path: <SRS0=z0fH=5Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6E7C2D0F0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 22:29:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E00420842
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 22:29:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="WEbQhK9U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E00420842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 53A9085A84;
	Tue, 31 Mar 2020 22:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JYzjhZD-o0jP; Tue, 31 Mar 2020 22:29:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E3A0685A72;
	Tue, 31 Mar 2020 22:29:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7B62C1AE2;
	Tue, 31 Mar 2020 22:29:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91146C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8D980888CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oe5XmHZdu-TL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:29:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EDD90888C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:29:06 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id b62so25013300qkf.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 15:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6nYFV2QWqYi47IsY2NnyndMBRfL9Zb689yvP+ZRhJYQ=;
 b=WEbQhK9UN2CvW9DcH2pEKnkPZxZFQ66KstFZKM4h+j//VHXq4PrK0nS0kMDpen9JyH
 8G7WfaWPzlYy9D7M2q8Ya/+zecQ3uVleocnuvM/goO7i2O9LkxiMkjczGQN6E/cY0Fdf
 eukl1mMNKCk7+x6UJ5Y5svvrFY0qTgqmUdKii7Qp2hJ5UU4L1nZGOmGHOaGauF4SI85b
 zq/V3aJh77372onSSRONdWyJNJtTc0h3pRBV7HCC9+NUlxtTC9UVjOSLZru4m7YRJSR/
 mXX47pjtP9B+U4ZHHeWeXXBIns1Td/Gvc7E5ojSr94dLkemRYH5sV6u8a4c3RzHlm4ks
 t7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6nYFV2QWqYi47IsY2NnyndMBRfL9Zb689yvP+ZRhJYQ=;
 b=js8rxL01XwkLCpKb6hp6DZKxbxF1p7zukoDaAR8Z6eHDNrygmRs0oD1teSTn6e1aan
 qe4TZMaufFmX+aq4Gg9Yh0qPH71sZEbhBiIbimoO2t90wc9SSNHjvTJupKPfqWjJdOJ8
 8ufHwtCJG8MzkiSpU6Fsz6c79/rWDfWN39PIA9FcNc2qPo9Dwlq4Cxd5z90cPjmNRIFR
 7u6uxy+w53ujxsrSiJCtzUw+4Lr8rzkPnjAa+ourr8TTp+n7BID7gXvtQ2LX/LsimB2x
 DWpP5+B5D9AzTdzOkhncyPY8HzjBq6RRGkAzGYvGQPXpEHC4R2odLKyM9beu9XRG6dal
 CbbA==
X-Gm-Message-State: ANhLgQ05JYKOsYm/dMtBu3K6xTe2Mxcr0ELr6P+yBDHv/UCZatZnEtpJ
 poKeKos9SXEqEJ/x/yasV08ghw==
X-Google-Smtp-Source: ADFU+vujLgQRKH4PKzJMmO4KEOhtyZLdp/89fmvgK6ikN22LNygxkkodSRrEqDYEtYdVOw+eHiht/w==
X-Received: by 2002:ae9:efce:: with SMTP id d197mr7149016qkg.211.1585693745963; 
 Tue, 31 Mar 2020 15:29:05 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id 206sm238659qkn.36.2020.03.31.15.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 15:29:05 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: linux-doc@vger.kernel.org
Date: Tue, 31 Mar 2020 19:28:57 -0300
Message-Id: <97cb61253283b4054e9f00364eb08eeedb5bd95e.1585693146.git.vitor@massaru.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <cover.1585693146.git.vitor@massaru.org>
References: <cover.1585693146.git.vitor@massaru.org>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: [Linux-kernel-mentees] [PATCH 2/2] Documentation: filesystems:
	remove whitespaces
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
 Documentation/filesystems/sysfs-pci.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/sysfs-pci.rst b/Documentation/filesystems/sysfs-pci.rst
index 9b93e7444b15..e4df647ec9db 100644
--- a/Documentation/filesystems/sysfs-pci.rst
+++ b/Documentation/filesystems/sysfs-pci.rst
@@ -71,11 +71,11 @@ don't support mmapping of certain resources, so be sure to check the return
 value from any attempted mmap.  The most notable of these are I/O port
 resources, which also provide read/write access.
 
-The 'enable' file provides a counter that indicates how many times the device 
+The 'enable' file provides a counter that indicates how many times the device
 has been enabled.  If the 'enable' file currently returns '4', and a '1' is
 echoed into it, it will then return '5'.  Echoing a '0' into it will decrease
 the count.  Even when it returns to 0, though, some of the initialisation
-may not be reversed.  
+may not be reversed.
 
 The 'rom' file is special in that it provides read-only access to the device's
 ROM file, if available.  It's disabled by default, however, so applications
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
