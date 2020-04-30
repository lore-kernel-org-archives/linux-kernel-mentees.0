Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0B4C4724C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 17:43:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB6F620870
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 17:43:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="g6mJ7QVf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB6F620870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B80BC88808;
	Thu, 30 Apr 2020 17:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qq3C4FhsUY4b; Thu, 30 Apr 2020 17:43:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 37C9588805;
	Thu, 30 Apr 2020 17:43:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CAE5C0889;
	Thu, 30 Apr 2020 17:43:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 141B3C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 17:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 032C786E29
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 17:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4wz3AQeLV7L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 17:43:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D2C6886E23
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 17:43:13 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id s63so6614507qke.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 10:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IW4+oneEvAWkOsDviGfjkPQapL7Lb3e5T9feItSCKYI=;
 b=g6mJ7QVf09kvhuPzY4IiFoJ560v7yeRDHnCM6ZDWbwpnOsBo6+7zv2pLbUVAtITFYn
 L8IR6eY/EKZ43dH1uJAPmzmHdhWo1leFYokPatkGCK2ME88QeGdMAIxuUQZowt7fjPlQ
 Ru+G16lSTJ9ZtG0NcWbRQ5SOvoEVLbzA2FfCU733ko6a0e7CJP4ywgUYG4fML6Bb5elU
 6ysT4ofgB03RpIyfKQjmoNDXSO81wJetkTN3w4aSkvBWNqwWwwV+f0W7B0RdkLhzpCiX
 +Xn2l9RgGlpsDYYPpzzB89icqS+vBR1dbQl/ZOJx0eQbRr/zjfjANj3Hhqkv7x1PqqbP
 g0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IW4+oneEvAWkOsDviGfjkPQapL7Lb3e5T9feItSCKYI=;
 b=CySefM8apfOY6PDsE0881ztWlt1+GH0c8R6ah2CmYWP4hyTGi7OP2Hq8q+V7SMRn8j
 3NtTbs38nr/XKpMRrX8Zr9H4+TqvHhwIj9BIRCB6muUzv4Q+DUlcdUJ6xdFxHt1gnmOw
 WTQM4+rWDg0LEotgHl5CG9SG5CBYrmbE/teJr4TNMS87iUZ4sFY15O35PQReQDEYl9Oo
 PQNnigL4YKtg0whzyxF8yZC0rR3hgPOxdEG4AWPyczifXVN2ce6sWvsE3DofpruEHp12
 dnf3ECa3aaGhWj0Vw21odd44soeJVotqQtaaKFdnCH2GAO5oKQ68OLFMUPUvRdH3l14p
 6/bQ==
X-Gm-Message-State: AGi0PuZK7FcK2LAXx0/bHzRoG7ZAU39pm+b77ZYq4esXhd1ZtsElETQj
 iWJIpypeEgLFmRDNMzhaphzTMQ==
X-Google-Smtp-Source: APiQypK/FFlu9lluECG70Gz5FZSzggGL9pU5PcR/BvR8UNS5AToOVyS3gQQR53A0LgpUKwccIF/4mA==
X-Received: by 2002:a37:b3c1:: with SMTP id c184mr4761166qkf.194.1588268591752; 
 Thu, 30 Apr 2020 10:43:11 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id j76sm537531qke.114.2020.04.30.10.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 10:43:11 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Date: Thu, 30 Apr 2020 14:43:07 -0300
Message-Id: <20200430174307.69233-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: aou@eecs.berkeley.edu, paul.walmsley@sifive.com, brendanhiggins@google.com,
 palmer@dabbelt.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] scsi: mptfusion: fix `make htmldocs`
	Warning
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

make htmldocs
./drivers/message/fusion/mptbase.c:5057: WARNING: Definition list ends without a blank line; unexpected unindent.

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 drivers/message/fusion/mptbase.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/message/fusion/mptbase.c b/drivers/message/fusion/mptbase.c
index c2dd322691d1..8e583c4873ac 100644
--- a/drivers/message/fusion/mptbase.c
+++ b/drivers/message/fusion/mptbase.c
@@ -5054,6 +5054,7 @@ GetLanConfigPages(MPT_ADAPTER *ioc)
  *
  *	MPI_SAS_OP_CLEAR_NOT_PRESENT - Free all persist TargetID mappings for
  *		devices not currently present.
+ *
  *	MPI_SAS_OP_CLEAR_ALL_PERSISTENT - Clear al persist TargetID mappings
  *
  *	NOTE: Don't use not this function during interrupt time.
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
