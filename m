Return-Path: <SRS0=6zuU=KL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B63DC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 May 2021 19:27:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B23061040
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 May 2021 19:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B23061040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45879402C4;
	Sun, 16 May 2021 19:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tkXu1Q27FdU3; Sun, 16 May 2021 19:27:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6210740294;
	Sun, 16 May 2021 19:27:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 345A7C000D;
	Sun, 16 May 2021 19:27:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4DAFC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 19:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7468F402B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 19:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diYxpv7PDIl2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 19:27:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DA3D4011A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 19:27:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1621193252; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GpTODC/DLEfsPiaz5f0uHe14TK/B7PCR6E2MSep8ov0URKYeSoEyibrf+uLFV4b9tqtfLmX7iA7r1M7Vy0aSvH6+2CMmi++xAk4rUr9HLKv3FKsa5X8O1ggjlF2f9P7H9nfB2JWtIhvRv6pvxuV9x9Oa8maV2T9axI6xCi6kkHw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1621193252;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=kcMsIBb4mr1nm3LmQ5wyFHGYyNEsGyNz7p4rtiGeyZw=; 
 b=ebmZ0BvljHKpi8/DOujECR5AqX0ciAlFM9R6cmX/xRDHAj6xXR2NzNoQ2pu35XolsRZ5n9UPJhUXv7H3DTZfqoAumH5MmtYzaa0S8eVYfrN82HFYWV6j13EigW/HOWjU7LtCFooji08pSwiMhO8hPlURpCQIwiOo/7XYGwxw8SY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com> header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1621193252; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 bh=kcMsIBb4mr1nm3LmQ5wyFHGYyNEsGyNz7p4rtiGeyZw=;
 b=yKN+eYUKedxDvM/J8PgnoWdA/PYpQ/ssg6uNKVFtcUdxu+VXHAUmoJdfB3NBMyqz
 mHDG/qCeHPOlI2IKSwASWbtWhWj7QOrSwjxUfhx/r80gP3eQWaxm8WJtqIlNis6xvqo
 /birjyRZtdje8eIcI1A0jppl2fvCvnj1ZNEm0p8g=
Received: from localhost.localdomain (106.51.110.61 [106.51.110.61]) by
 mx.zohomail.com with SMTPS id 1621193251338853.0225315553987;
 Sun, 16 May 2021 12:27:31 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] video: hgafb: correctly handle card detect failure during
 probe
Date: Mon, 17 May 2021 00:57:14 +0530
Message-Id: <20210516192714.25823-1-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <oliver.sang@intel.com>,
 stable <stable@vger.kernel.org>, linux-nvidia@lists.surfsouth.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

The return value of hga_card_detect() is not properly handled causing
the probe to succeed even though hga_card_detect() failed. Since probe
succeeds, hgafb_open() can be called which will end up operating on an
unmapped hga_vram. This results in an out-of-bounds access as reported
by kernel test robot [1].

To fix this, correctly detect failure of hga_card_detect() by checking
for a non-zero error code.

[1]: https://lore.kernel.org/lkml/20210516150019.GB25903@xsang-OptiPlex-9020/

Reported-by: kernel test robot <oliver.sang@intel.com>
Fixes: dc13cac4862c ("video: hgafb: fix potential NULL pointer dereference")
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
---
 drivers/video/fbdev/hgafb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
index cc8e62ae93f6..bd3d07aa4f0e 100644
--- a/drivers/video/fbdev/hgafb.c
+++ b/drivers/video/fbdev/hgafb.c
@@ -558,7 +558,7 @@ static int hgafb_probe(struct platform_device *pdev)
 	int ret;
 
 	ret = hga_card_detect();
-	if (!ret)
+	if (ret)
 		return ret;
 
 	printk(KERN_INFO "hgafb: %s with %ldK of memory detected.\n",
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
