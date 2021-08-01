Return-Path: <SRS0=qNgb=MY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41607C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 22:06:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4C5C60EB5
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 22:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4C5C60EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9638583848;
	Sun,  1 Aug 2021 22:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7CreBmNLYXFO; Sun,  1 Aug 2021 22:06:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 87632836F1;
	Sun,  1 Aug 2021 22:06:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 682EEC0010;
	Sun,  1 Aug 2021 22:06:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4011AC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 22:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C15E4046B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 22:06:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GZozxlW9DpNv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 22:06:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C862440331
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 22:06:32 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id x14so21826976edr.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Aug 2021 15:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WkpeRKqnIMaLK0vt8UaSwMqNHjkUEz70WFHme/ttgXM=;
 b=I86+YN/f8jKMe/4vR4S4HtpnkqTv1kM8WiECDEc9zD+ZwxJUv/z3+JpM24xMnQTSVK
 RYVQlY6EORW9z5HjKan2z0orP8GimUsBWG7OhJRaL2NW0u6YXfXihhcMGD1p/JVcWO4o
 MDu5rrHMMDHcS0brAmgl52h5TbUuDRaWhiiRlUetHhdTeaKsHSfmX1ar87MGLxu/FGb5
 tyaguCwkPXQkvIj3LOxe6rdmbYR6DkPA3Dk1gSJeLQ8C+2e3Rxj8+TkD+rVq16/rCXO/
 lL06icE7ZY3vKjG2rtkxX3o9qSUEmJ9mp+0AY4DeiqOwkIUDOITj1ZC+W5eXPPiABSQJ
 EfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WkpeRKqnIMaLK0vt8UaSwMqNHjkUEz70WFHme/ttgXM=;
 b=mvriUtTlMZFkzu2HV0LNZzKtg5318f/UBsRRGy/wJh3sCwRJRlcDLW3ZxHRFF//DHy
 fQaalaq5sPmxUFryo/EdjQ/vQvcvokGJWcsnxsvzg+TAlD0MRWbO13o1oS9oqp43gkFW
 uWxjzHPzinSbByqF6r9zN7wN3jodbKkMahbB1tfF3S3w8ye9Vl6iOLA5AiBbPu10z4UI
 QsgFBIpKhTAp8e4b2Pi+hHprrDCTtJjVSckUQ7osKwOPU0fyuKftfkyB8cpuwlKYOJds
 k/w8aM5jOeaKCPuXXIi1ys904mzzHQJMiOC+1o0L9eNXR1QppzhmPdEc6/q6JsCIPSON
 wPGg==
X-Gm-Message-State: AOAM531mwDFzJF7w/3KP5rzg+4d6B8TDP6X2/upsEBQjIfobFcjFtNbe
 QYoavj7W3PqmsW+gntNd74s=
X-Google-Smtp-Source: ABdhPJxMZxtwCG7CAjs7tuElOPofDN4gQkXEb4Fws1pOaet0StfQsieLSbpFpDfIqwXYxENmJjuwww==
X-Received: by 2002:a05:6402:b83:: with SMTP id
 cf3mr15764344edb.12.1627855591043; 
 Sun, 01 Aug 2021 15:06:31 -0700 (PDT)
Received: from localhost.localdomain ([85.154.106.253])
 by smtp.gmail.com with ESMTPSA id gr14sm3525490ejb.60.2021.08.01.15.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 15:06:30 -0700 (PDT)
From: Rahul Balaji <rahulbalaji78@gmail.com>
To: lukas.bulwahn@gmail.com
Subject: [PATCH] drivers: mtd: ubi: fixed a semicolon style issue in block.c
Date: Mon,  2 Aug 2021 02:04:53 +0400
Message-Id: <20210801220453.17028-1-rahulbalaji78@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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

fixed a small coding style issue in using semicolon.

signed-off-by: Rahul Balaji <rahulbalaji78@gmail.com>
---
 drivers/mtd/ubi/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index e003b4b44ffa..e0402c2f8959 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -405,7 +405,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	ret = blk_mq_alloc_tag_set(&dev->tag_set);
 	if (ret) {
 		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
-		goto out_free_dev;;
+		goto out_free_dev;
 	}
 
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
