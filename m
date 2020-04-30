Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E2DC47254
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 20:36:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A8B0207DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 20:36:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="uMSIOfAs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A8B0207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 77F9385785;
	Thu, 30 Apr 2020 20:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mrNoz01yQgNp; Thu, 30 Apr 2020 20:36:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6689184506;
	Thu, 30 Apr 2020 20:36:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D41EC0864;
	Thu, 30 Apr 2020 20:36:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEF59C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BDD928888A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aipLgnAkOUkO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:36:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 37C2E88699
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:36:18 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id ep1so3777680qvb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 13:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B784zdzXLuU3MW7w8JpAGL5gMXtYDpBs4T/kLswGdYI=;
 b=uMSIOfAsn2hFGW45mcZRbvdrR0oZuPg46JRxQwd1lkwbaW1tw6jN0wtEHppuz5Pymc
 n+Y4RPXGucXE1ycwIGNO881w3MuJPfHQ9+AukN0Kr7jXSLyDsPEfsp6+V26u5lEeAAXR
 raxEz/VZOC4NpQSPTOjRxCyXgHAIO+E2YIdOCDbeZzoFznoyUfS0yaPv4bfRbkFTk9Gp
 yKj2IQmVAY+fL0ZvvRZ8yoBmC3BDIEOfdVUBGaLgKLLiCi8RnDs9YjPiZFN2nlUESzwJ
 vUjhQAc65LmMgTJyyxiGcH25a+/n5eqfhxh71vFy+0kVmRU1druUsoLoMT8Of73qIoaG
 GMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B784zdzXLuU3MW7w8JpAGL5gMXtYDpBs4T/kLswGdYI=;
 b=P78fQZ4EKW0UmkcbP/byIOm8+5EDxeQS4jmYhkzQjla+Ye1xXqeu7e8AsRSrEOoQyc
 uuEvkZ0UREBXwkLfvRXr5efvo2ZpxDVNBuBfC6m0zkyndQk+cNqOBtubbQliswLuAOkX
 sV9ajNXIFCMJkaKsjn5YQu8b8Ll54fd9w5U6yM3B0YGyEcGU2F3P8vwAcoLS/hn1hQo/
 /0RmewaoRQp83cuZiElLJt7cAssu+xbp9FCsiLjrDjalI3Wl1Aw+5xyFjJBpKA9ItTGn
 I0heOviVzYsAbXpwesQ/7tGMVFFwK5dIdhuf77+7uGDuvq40h+rKtxQVHMeaH8OvZMuj
 DXmg==
X-Gm-Message-State: AGi0Puaot4kUYF+FDqaT7964t10KlJVv7v/SoJ9zY80U7DkPq2i2VlXM
 SaYPM8yuHcRNK1oH6l+obaUMSw==
X-Google-Smtp-Source: APiQypLRQfPe42Gh0WlpFSxgINU5DSIJ3P7SrZAZXQDw5bA7/LeWQ/gEeg9sdUq15sUWFrw4nBj+xg==
X-Received: by 2002:ad4:5a48:: with SMTP id ej8mr832303qvb.122.1588278977081; 
 Thu, 30 Apr 2020 13:36:17 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id v5sm926589qkg.9.2020.04.30.13.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 13:36:16 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: linux-doc@vger.kernel.org
Date: Thu, 30 Apr 2020 17:36:12 -0300
Message-Id: <20200430203612.90404-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: corbet@lwn.net, brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 mchehab@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] docs: coresight: fix `make htmldocs`
	warning
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

Fix `make htmldocs` warning:

Documentation/trace/coresight/coresight-ect.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 Documentation/trace/coresight/coresight-ect.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/trace/coresight/coresight-ect.rst b/Documentation/trace/coresight/coresight-ect.rst
index ecc1e57012ef..a93e52abcf46 100644
--- a/Documentation/trace/coresight/coresight-ect.rst
+++ b/Documentation/trace/coresight/coresight-ect.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
+
 =============================================
 CoreSight Embedded Cross Trigger (CTI & CTM).
 =============================================
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
