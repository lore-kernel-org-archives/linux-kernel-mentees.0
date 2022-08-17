Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784C5C25B08
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Aug 2022 07:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 040C683187;
	Wed, 17 Aug 2022 07:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 040C683187
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fj7UGrTD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mWi6sbwhG0YS; Wed, 17 Aug 2022 07:49:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 088E08316A;
	Wed, 17 Aug 2022 07:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 088E08316A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFDACC0032;
	Wed, 17 Aug 2022 07:49:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 746E0C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 07:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B4528316F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 07:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B4528316F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OkVXY_d1ucUs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 07:49:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69D268316A
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69D268316A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 07:49:10 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id d71so11311803pgc.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 00:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=DNiQd09UafzK11FBkwcs+iSGy+8QGplgYWkm+nS++S0=;
 b=fj7UGrTDJkbe4FoWiYArk+SAIZwBIpOJ3w5z2iz5JNOUtWcHb2r3IvrOOq338ytPo4
 mL9IX54+RP2R5Yrq0rHXROHF39LMDOtiWAx3vrEgr+q8R+Vd7ctvJgALho5IoPZ/PQ6a
 /1bQIoUFBmlFR/5RKc/xOfICfR2SYgfJBw2hFk0qBAU1B2BR6DywKDtUK3zkIjsf6TxK
 G0+JOE1ux1SC+iqIof0qxj+SxF6vafmOVvllp98ElKt/z3eilm9+dGeiAnkkzSIymD2R
 T2icDVH+2Q9u17KY2yi5QZbN0pkGaaTAkz4QOb2upf1r19YyEdz91stc1zCJe1hZj4kQ
 cK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=DNiQd09UafzK11FBkwcs+iSGy+8QGplgYWkm+nS++S0=;
 b=Zm8etm3Ucuv5cjBabvqTah58hQ8ka3o4qbtdoBxQhSPYzLWwB0xkjbaaPKGe1h5WaZ
 6U9a23+BedNgJwr0UC7gMT6WJrJe2n7topHYYZb6wUFO1iEXcvRMEXvidVJPUK5Qr7lg
 oXySsYPeuNV9tcuVaCjBvD3JcG8K3h75SNfpgVPTmLOxQOcX8LrVUhxvYB2On1cMpVCb
 pn14nipSaZeeKmGXOrsnFBKObQTV3QYh5H/xavcVjI/lVrFFjpz4t5wVX7sPpslfUWka
 eUEFp7nCw/2qtqEyjB1IvEz3d6CyN9r3m5Qgkf/NI19thzbShTrFtEDwgXSuu+p1y/X+
 YWmQ==
X-Gm-Message-State: ACgBeo2cyfrEraDCH3Qv5i+33VjFlXA+Az0Gp2Sxr/SA4t8IjOpihEee
 06nJdI9bJ0NVebtQPYACrAE=
X-Google-Smtp-Source: AA6agR4vHtGkmizUZ/tTkNHmlQg+RREpiDotcib74icakxpdWZ1be5OldVWCoVxw1rPgpIsSgCXIvg==
X-Received: by 2002:a63:8b43:0:b0:41c:cb91:2c47 with SMTP id
 j64-20020a638b43000000b0041ccb912c47mr20548848pge.609.1660722549845; 
 Wed, 17 Aug 2022 00:49:09 -0700 (PDT)
Received: from fedora.. ([103.230.104.51]) by smtp.gmail.com with ESMTPSA id
 b14-20020a170902650e00b00172a2a41064sm427208plk.298.2022.08.17.00.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 00:49:09 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3 linux-next] soundwire: intel: Remove unnecessary TODO
Date: Wed, 17 Aug 2022 13:48:59 +0600
Message-Id: <20220817074859.4759-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
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

The capabilities enabled for multi-link are required as part of the
programming sequences, even when a stream uses a single link we still
use the syncArm/syncGo sequences. Therefore the TODO is no longer
necessary.

Suggested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
Previous discussions:
- v2 Link: https://lore.kernel.org/lkml/20220816175954.5259-1-khalid.masum.92@gmail.com/
- v1 Link: https://lore.kernel.org/lkml/20220814080416.7531-1-khalid.masum.92@gmail.com/

Changes since v2:
- Update commit title.

Changes since v1:
- Remove the todo, leave rest of the code as is.
- Update commit message.

 drivers/soundwire/bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 8d4000664fa3..18158825a6d8 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -75,7 +75,6 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 
 	/*
 	 * Initialize multi_link flag
-	 * TODO: populate this flag by reading property from FW node
 	 */
 	bus->multi_link = false;
 	if (bus->ops->read_prop) {
-- 
2.37.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
