Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9832AC25B0F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Aug 2022 08:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 186B7419A0;
	Sun, 14 Aug 2022 08:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 186B7419A0
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l/H4zND9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drqicIh5txbD; Sun, 14 Aug 2022 08:05:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BA5494199C;
	Sun, 14 Aug 2022 08:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA5494199C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97ECBC0033;
	Sun, 14 Aug 2022 08:05:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F7FDC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 08:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDF7B40439
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 08:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDF7B40439
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l/H4zND9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z-3azSyiu9tO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 08:05:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26C83400FB
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26C83400FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 08:05:38 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id s206so4244610pgs.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 01:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=rWqpd+TDL+uhqq+ZM31CgYmJ/5I6ggTeiRIyfhpx6YE=;
 b=l/H4zND9Wh9LsleFV38bwrmFAMETQ3dei02nqbrPEQvrkhn/Fo7NFXn6zZM3oca66Z
 dxpf7bLIId8OuGXf8/KlgKEHlTse4HJ9JJWFgYQQakC3KHFaJNFKSf4r07fZTh2ITGbI
 /ZqPN8tJLKWrBjlCyDXDTtwddtCZKs1wHYyahsF37u2TYduFpYKX4TV4WwkOH7p0Otlo
 dvUmdgeQARI21JkRN/hstcFfHE/iO4Dt7XBad2lRXDgXkDA+jqh9UZFY/5Bv8sBl59Yh
 u6/wzAYEXig+/+dj1erB+v2YtTgzAwlTOg3w2GgF2Vp+O/ewzAZ6wkWV45gP8flej8HE
 YMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=rWqpd+TDL+uhqq+ZM31CgYmJ/5I6ggTeiRIyfhpx6YE=;
 b=iRMLuDTFPFI4uc1YjtWURo7kk5zSlhScZQvacH+jwBKlrEXBuktesp3SwwdjJxs3wR
 PB9BrQrDuPbzXG8RQLvTOGm+fJRrUByEfr4q41QjYvxYArVZlJCWweyplqceXGDjvp1A
 uoWZjuSFoUHkM/+xHrPL6rCrlgDO5UoNnjjpbVbGfgXFgb29D/3LlUfyPMRvXtmwe66s
 LLCH4YAmGzpJAGQ7b+rUKkxre2cmQqvqeq/0T7j2xoqA2oR3mPNRcXB/J2YdA1KMa1k5
 NO26C6rNVxrFM5Re9G2NCKswKPulfaneojXRfusDrTtnnmxfWdCDby2Y2uoWKFI+UMa9
 4I5w==
X-Gm-Message-State: ACgBeo0gT4zBry/cXTqpCY2R2l2R6wux6b0AJkDukcVYcPt5/ZmeJyR0
 wnSgqnsCRVmqBaGp6UW3jLA=
X-Google-Smtp-Source: AA6agR44dMyyhdx5CLh7qHEoCxg2XQP01uFUUC2ZHzsviRdJfYmkYA7pSnB/CVOgcsGZBfQVeVGwSw==
X-Received: by 2002:aa7:8e91:0:b0:52d:8ebf:29a4 with SMTP id
 a17-20020aa78e91000000b0052d8ebf29a4mr11407833pfr.1.1660464337507; 
 Sun, 14 Aug 2022 01:05:37 -0700 (PDT)
Received: from fedora.. ([103.159.189.159]) by smtp.gmail.com with ESMTPSA id
 l27-20020a63ba5b000000b0041d95d805d6sm4173032pgu.57.2022.08.14.01.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 01:05:37 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
Date: Sun, 14 Aug 2022 14:04:15 +0600
Message-Id: <20220814080416.7531-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Len Brown <lenb@kernel.org>
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

According to the TODO, In sw_bus_master_add, bus->multi_link is to be
populated with properties from FW node props. Make this happen by 
creating a new fwnode_handle flag FWNODE_FLAG_MULTI_LINKED and use 
the flag to store the multi_link value from intel_link_startup. Use 
this flag to initialize bus->multi_link.

Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
I do not think adding a new flag for fwnode_handle is a good idea.
So, what would be the best way to initialize bus->multilink with 
fwnode props?

  -- Khalid Masum

 drivers/soundwire/bus.c   | 4 ++--
 drivers/soundwire/intel.c | 1 +
 include/linux/fwnode.h    | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index a2bfb0434a67..80df1672c60b 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -74,9 +74,9 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 
 	/*
 	 * Initialize multi_link flag
-	 * TODO: populate this flag by reading property from FW node
 	 */
-	bus->multi_link = false;
+	bus->multi_link = (fwnode->flags & FWNODE_FLAG_MULTI_LINKED)
+		== FWNODE_FLAG_MULTI_LINKED;
 	if (bus->ops->read_prop) {
 		ret = bus->ops->read_prop(bus);
 		if (ret < 0) {
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 505c5ef061e3..034d1c523ddf 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1347,6 +1347,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 		 */
 		bus->multi_link = true;
 		bus->hw_sync_min_links = 1;
+		dev->fwnode->flags |= FWNODE_FLAG_MULTI_LINKED;
 	}
 
 	/* Initialize shim, controller */
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 9a81c4410b9f..446a52744953 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -32,6 +32,7 @@ struct device;
 #define FWNODE_FLAG_NOT_DEVICE			BIT(1)
 #define FWNODE_FLAG_INITIALIZED			BIT(2)
 #define FWNODE_FLAG_NEEDS_CHILD_BOUND_ON_ADD	BIT(3)
+#define FWNODE_FLAG_MULTI_LINKED		BIT(4)
 
 struct fwnode_handle {
 	struct fwnode_handle *secondary;
-- 
2.37.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
