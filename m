Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C798FC83F10
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 27 Aug 2023 05:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A3EB4027F;
	Sun, 27 Aug 2023 05:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A3EB4027F
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=i+eBNMdM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pZs9-_Y3VYba; Sun, 27 Aug 2023 05:05:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 27F2F4014B;
	Sun, 27 Aug 2023 05:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27F2F4014B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3208C0071;
	Sun, 27 Aug 2023 05:05:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18B32C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 05:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D303E60B01
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 05:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D303E60B01
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=i+eBNMdM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JmnqVedzd_Jl
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 05:05:32 +0000 (UTC)
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7493260AD5
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 05:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7493260AD5
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1c4c6717e61so1628831fac.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Aug 2023 22:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693112731; x=1693717531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w0rHx36EtjFL/T0ZOtQOOpsSvLpc8KOUwP8osiOZIL0=;
 b=i+eBNMdM4lSTpRFP24YehF6M912k+AQEeLx/6M+9vqHdKwP6B9zqoZpsmlTA6ulZgt
 ZxlgfxV7NTGJDSQ8HfDdT8yU6mVYv5uze24oHmDmTNbyJI+KocZt4rdslWqJojrZFWc/
 fA+K4zN2Wb3cr0fBvInfYDO8BwDizMl10AlFDmKIbg7wol02gH5mKC83CwpX7PHJz14o
 jCqiUeVSBOgzEwJKqYDml9pIBczMUjn03ovr1s98tqPoAePz1UnVzFjvWAUIjtyxnadr
 7mItSjjXIXhf/MBnYTP2zJkaZzWK8IVr52E3oAKGsATe65bLS4K0VI0SwTK+YBdJPI38
 LPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693112731; x=1693717531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w0rHx36EtjFL/T0ZOtQOOpsSvLpc8KOUwP8osiOZIL0=;
 b=P08tzwZhGUiBpDgbfKzV4Q8HaJuNgmOckOln5m9TLfB96ZuKyT5b6N22SrDed9Ckpp
 N8UHCk0qhoLkow0r0QJQ1T9uD4SUg+6ys4HdHFxYJJUAp5RZAMo/WQ0JV0M9HLaCgdlg
 m+VWExPBzXTNi13uugb/ITbJ4M8lkeIhyzSrTxmrY1yX9sVaUg9q5DpDNBj9xF+OAoNI
 6HeBdDxEz49gDlmUdgnWY30efjvTGSQY4fPlGVmrCeo2HmNchIA+4nFwUgdvUsPGNJMj
 UYjfg/GlttaB8dDGL99yb6X/1y7TOizqA9PqfzhdL1lVoDURA6QHl/79Y5+PSM1JIHHL
 nILw==
X-Gm-Message-State: AOJu0YyA7yHT2uaNhfrM/IPrU+UkP6zBWu3tsMEPEWl2hOR0UuAq9Dg3
 k2bVN88GdO/DOhdsBZQAK54=
X-Google-Smtp-Source: AGHT+IFV5CXGL6h7bvJSFe8twRRVDGSZWHsP7/eN8yNry07I+d213Z5bPkoQHWC2NlucLAqNjQ3NUg==
X-Received: by 2002:a05:6870:610b:b0:1bb:9846:94ed with SMTP id
 s11-20020a056870610b00b001bb984694edmr8627537oae.3.1693112730149; 
 Sat, 26 Aug 2023 22:05:30 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.178])
 by smtp.gmail.com with ESMTPSA id
 ci24-20020a17090afc9800b00265a7145fe5sm6169383pjb.41.2023.08.26.22.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Aug 2023 22:05:29 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: shaggy@kernel.org,
	liushixin2@huawei.com
Subject: [PATCH] jfs : fix shift-out-of-bounds in dbUpdatePMap
Date: Sun, 27 Aug 2023 10:35:13 +0530
Message-Id: <20230827050513.364567-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org,
 jfs-discussion@lists.sourceforge.net, Manas Ghandat <ghandatmanas@gmail.com>,
 linux-kernel@vger.kernel.org,
 syzbot+91ad2b52815a08caf4ea@syzkaller.appspotmail.com
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

Currently there is no bound check for number of logical blocks per
page (bmp->db_l2nbperpage). Added the required bound check for the
calculation of dmap.

Reported-by: syzbot+91ad2b52815a08caf4ea@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=91ad2b52815a08caf4ea
Fixes: 4d81715fc5df ("[PATCH] fs/jfs: Conversion to generic boolean")
Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
---
 fs/jfs/jfs_dmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index a3eb1e826947..6a5df296fdc8 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -467,6 +467,10 @@ dbUpdatePMap(struct inode *ipbmap,
 	lastlblkno = 0;
 	for (rem = nblocks; rem > 0; rem -= nblks, blkno += nblks) {
 		/* get the buffer for the current dmap. */
+
+		if (bmp->db_l2nbperpage > L2BPERDMAP)
+			return -EIO;
+
 		lblkno = BLKTODMAP(blkno, bmp->db_l2nbperpage);
 		if (lblkno != lastlblkno) {
 			if (mp) {
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
