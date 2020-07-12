Return-Path: <SRS0=cUZQ=AX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F144C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 12 Jul 2020 21:04:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6E2120674
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 12 Jul 2020 21:04:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiNxFzwn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6E2120674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB5A18966A;
	Sun, 12 Jul 2020 21:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QO0V4ZQL-uNR; Sun, 12 Jul 2020 21:04:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3387589666;
	Sun, 12 Jul 2020 21:04:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14ABFC0894;
	Sun, 12 Jul 2020 21:04:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 376A4C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 21:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2D61F881EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 21:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OG9y2K_lOKCM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 21:04:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 781AA881C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 21:04:50 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id c30so10407363qka.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 14:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xB9P1wmbKeeyGS/z1ZCD7IZWuMRQKqcVFyeZviDeTF0=;
 b=NiNxFzwnf3pELLNi+/CIlQqfbXNr7H16z5BHXH5kkodlEvROo9/iAZifwe7BThm76S
 kNWGhLJ89ZIiRt5B51xcNkA4HsHsonTugEyfCteaEqYygkwKlb4Yd69yqM7QzJ6Nd62m
 xAi565EnbbOZpGsoBheMv/zziCII/fnv5JJD6aOylOESlvh0+Vc+XKolg0eY9ZPukpbl
 Mj1m9TgCYE9ljDUV2gQSxvynT6+6DTIT2iSAoRH7D8nq1LiRYNSMLMhLskRjP5En+QA6
 OtFmHw9QgtvY/3Ry0jAhQdugFkiZ06/u9tnQ1QZpnGCNv6qIomrefuf4HF19KupReuWV
 029Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xB9P1wmbKeeyGS/z1ZCD7IZWuMRQKqcVFyeZviDeTF0=;
 b=qWDJf7QA7j8G+O4k1VLd2BVigMkzrrezshISe6CrlqVl/b6xmRC54EYSHShPiotLmi
 g22dDayuSwXuji8ZLFtncT0bTW/e7RO28va+kcZF8YfB90onQFlvVBvagh/Y9FlzQgyI
 AtPDMvKvRvuIwJDXiIzaEKMbo8rp3AvbyziaPg+wuLtp9NwKRKq+cCfJdOpceUFERp1T
 EQpupLbO7rQe5n0EOQ64hDI4kF+5GUQftYMmcOTu9jesox2BUUjSjSC/yx0lHDHI+OqX
 LHuZKn3T3q6DHS91YV5ou6q5R7GlZ2hiqCE8zIul5bjTS021sQc267wuGgRewp+wD4aQ
 4PsQ==
X-Gm-Message-State: AOAM530OBaTFBRhXAgzy7J/VwMZ4g9novpjumWqOqRTTrOfU9h+gA7iR
 Ob+IETaRjva28AdY7sl9/A==
X-Google-Smtp-Source: ABdhPJz3KAfgxTv/Jz3QogwquKWxsuDv4eP6g8PYHyijMocJTXCI97XiB2Jnvi12qsq3mYhdkvAqOA==
X-Received: by 2002:a37:7b83:: with SMTP id w125mr76348212qkc.6.1594587889513; 
 Sun, 12 Jul 2020 14:04:49 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id o21sm16894766qtt.25.2020.07.12.14.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 14:04:48 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Sun, 12 Jul 2020 17:03:00 -0400
Message-Id: <20200712210300.200399-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, netdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH net] qrtr: Fix ZERO_SIZE_PTR deref in
	qrtr_tun_write_iter()
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

qrtr_tun_write_iter() is dereferencing `ZERO_SIZE_PTR`s when `from->count`
equals to zero. Fix it by rejecting zero-length kzalloc() requests.

This patch fixes the following syzbot bug:

    https://syzkaller.appspot.com/bug?id=f56bbe6668873ee245986bbd23312b895fa5a50a

Reported-by: syzbot+03e343dbccf82a5242a2@syzkaller.appspotmail.com
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 net/qrtr/tun.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/qrtr/tun.c b/net/qrtr/tun.c
index 15ce9b642b25..5465e94ba8e5 100644
--- a/net/qrtr/tun.c
+++ b/net/qrtr/tun.c
@@ -80,6 +80,9 @@ static ssize_t qrtr_tun_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	ssize_t ret;
 	void *kbuf;
 
+	if (!len)
+		return -EINVAL;
+
 	kbuf = kzalloc(len, GFP_KERNEL);
 	if (!kbuf)
 		return -ENOMEM;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
