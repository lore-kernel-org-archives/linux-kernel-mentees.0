Return-Path: <SRS0=8Gt8=LL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471BBC2B9F4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Jun 2021 09:21:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEB3A613C1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Jun 2021 09:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEB3A613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A266460AC8;
	Thu, 17 Jun 2021 09:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id so-ln028LZKL; Thu, 17 Jun 2021 09:21:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D9EBE60761;
	Thu, 17 Jun 2021 09:21:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C02A5C000E;
	Thu, 17 Jun 2021 09:21:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25269C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 09:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14001607A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 09:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jWNjdx27zX0L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 09:21:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4420160761
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 09:21:50 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id n12so4431024pgs.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MjsgFk/OhGmlyJ9GkStbusQuxohzSr2Dr8cvabytXHY=;
 b=RKBazyE/iOSOGeAmvhw7ob6qBNoGdlYLkINn9y/wKri5cOtojSjkMkkzrbEDQkFmsw
 TG5olJiPpWKXPkGKaAHjSkPnJWaVzcGmWnh0f7Kn39y2rtkss5rS3tFcUudyHDTVUWFQ
 amg1ml5G8U0vdKR4Kolk4m6qO9gzk944/Uyngefd65QBCaonRbZG8gMyiuMeFwXx+awT
 sen/fAKLWgqzhYJIxxrl6fhbauI4/oBrO8Qwg6hwVwjqKNQ670xEXQCsTFfIZz0hDf79
 Q+2jn7kCXWGXAFhpa2pqXZ/NCoOTG9plmXABtU3Nx+qKkJCC38g3Fxc0ZWPKwYfNb8la
 eFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MjsgFk/OhGmlyJ9GkStbusQuxohzSr2Dr8cvabytXHY=;
 b=DuK71JwQQQeKXZze8iuAiaO6QNTY5TblchnWM5o0P2d1XCtM1OcKFA1gnT45U78XhW
 6ctMAHrQpjue3I7Met8nrORlJCVkopEDAp/j0MTPvasgj78ombt9wkTLjdNlnx7InSm/
 9XYjy0cLEWwontftDZTydwCgkNU3gtDW0DluKqAHVQLen6PO/yOD+9+Mb/brjyT9wKI5
 ee/IUaTBPbvZKhDqaCstY65+SH8ht1VKuPkvas+f0sNovrirSlO7Pxu7KJEfhIwF9jGN
 P+tysFRFTY60CSSVDNECk8/+0aEdxuRYPnIxUoT+8jUjSPEiR7w45Bq3tFuh47M6+0bV
 Oj/Q==
X-Gm-Message-State: AOAM533tP2ps/ThgowalPg7nAmM9DHq5UNtol0b/07r+59WpMj0QvEIw
 4Dooo0tt3oTVtKKlvkRlQUQ=
X-Google-Smtp-Source: ABdhPJxZSlvznUD/LnFtSXnCP+oNyD0cSKUXJLDJllcY/fa9oZZufuRZx2HQZO6pw9+feqlxFHi0jQ==
X-Received: by 2002:aa7:949c:0:b029:2fa:c881:dd0 with SMTP id
 z28-20020aa7949c0000b02902fac8810dd0mr4329426pfk.9.1623921709657; 
 Thu, 17 Jun 2021 02:21:49 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id v14sm5090542pgo.89.2021.06.17.02.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:21:49 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: axboe@kernel.dk
Subject: [PATCH] block: break circular locks in blk_request_module
Date: Thu, 17 Jun 2021 17:20:16 +0800
Message-Id: <20210617092016.522985-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
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

Syzbot reported a circular locking dependency:
https://syzkaller.appspot.com/bug?id=7bd106c28e846d1023d4ca915718b1a0905444cb

This happens because of the following lock dependencies:

1. loop_ctl_mutex -> bdev->bd_mutex (when loop_control_ioctl calls
loop_remove, which then calls del_gendisk; this also happens in
loop_exit which eventually calls loop_remove)

2. bdev->bd_mutex -> mtd_table_mutex (when blkdev_get_by_dev calls
__blkdev_get, which then calls blktrans_open)

3. mtd_table_mutex -> major_names_lock (when register_mtd_blktrans
calls __register_blkdev)

4. major_names_lock -> loop_ctl_mutex (when blk_request_module calls
loop_probe)

Hence there's an overall dependency of:

loop_ctl_mutex   ----------> bdev->bd_mutex
      ^                            |
      |                            |
      |                            v
major_names_lock <---------  mtd_table_mutex

We can break this circular dependency by saving the reference to
probe in blk_request_module, then calling it after releasing
major_names_lock. This is safe because even if struct blk_major_name
is freed, the reference to the probe function is still valid.

Reported-and-tested-by: syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 block/genhd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/genhd.c b/block/genhd.c
index 9f8cb7beaad1..ccaa5cf620f5 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -676,12 +676,14 @@ void blk_request_module(dev_t devt)
 {
 	unsigned int major = MAJOR(devt);
 	struct blk_major_name **n;
+	void (*probe)(dev_t devt);
 
 	mutex_lock(&major_names_lock);
 	for (n = &major_names[major_to_index(major)]; *n; n = &(*n)->next) {
 		if ((*n)->major == major && (*n)->probe) {
-			(*n)->probe(devt);
+			probe = (*n)->probe;
 			mutex_unlock(&major_names_lock);
+			probe(devt);
 			return;
 		}
 	}
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
