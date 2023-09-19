Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75689CE79A8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 Sep 2023 15:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF87341DEE;
	Tue, 19 Sep 2023 15:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF87341DEE
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P+Dz0ClR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rb6vUq47-Lq1; Tue, 19 Sep 2023 15:56:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C7B9041DCA;
	Tue, 19 Sep 2023 15:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7B9041DCA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A338EC0039;
	Tue, 19 Sep 2023 15:56:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B67FC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 15:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F238241DCA
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 15:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F238241DCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BTB4is3gUpKp
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 15:56:06 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 053DE41E60
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 15:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 053DE41E60
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-690bfd4f3ebso967798b3a.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695138965; x=1695743765;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nOHqs4qAkXtTB8hx364ax6AK99btnMvdjW46PwKkTo4=;
 b=P+Dz0ClRJcoM2cvz1wq0NDRFrE4bB/9O+X7EBbeHhkr9Cebj1HUDV79AQK5PAXhNfr
 VtRW+RzCZlBvJ28zsrXCh1ZeLBT0pu2y0QMr7h0EM060CcHbniUtDZkLLtjTqb+lzr/u
 UCw24rDVV9VnauG2VfrSHiAhiPvtwSzYnSFUG79VlBn/1OVV2yEYDxaJwPESELC8QhJk
 CXp+xZO2OSNjCsa66SMnwKul8xwmb/GaBJcy98TOj2hgnm6EHKxTPc+EPSlxspgCbk2g
 /ZYqyFHmNZ8SJzd9UH7Q2X2jGs5INBMcXGmoz9TWQ0Uu0TEejVYJnYGNGeqxGKB0caLM
 eeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695138965; x=1695743765;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nOHqs4qAkXtTB8hx364ax6AK99btnMvdjW46PwKkTo4=;
 b=RV4vN55Gi+r1duFuQKbSQohncAvFgRxkvaxEdk7wabAduZNyHUT3uvAU5OR6xD1xck
 JXsTtFu5pMP2NdmKGI4yeLIahK4lJm9nt4fX+72ur5xzvJFI5fMmOM8Dn89nkIhAz7NZ
 TrLxpBd1beqor2zgvezPMCDmriNF8r74bjQHCTgeySvEPBhVgSq1ulxtVka1XXQIoZmK
 0kilvVdpJH9XQ2M4c5F8gPkRtaF17puO7exyyKc6UXmH27b13RgkrM52tvNbzr9YlbdZ
 KmFQzoBCTo/VTJyuDOI6YVpRU6BYQE8g85W7drzMve9DrQ84anMKngX4+A9hSgee8MqQ
 4cvg==
X-Gm-Message-State: AOJu0YyjlyyWD24hUscINLIPBQpzMItdGkgH7ip10Pt83nhgwOKc2Z87
 MZxoaA/Z2/7/xtFDkpbP1cg=
X-Google-Smtp-Source: AGHT+IE0y3FysbDgGuSL0FvAtrT32Ve9Gq3DbLiI0l5tKFSTY2C0ADc+ebEoQua8RovmKSbfgcIckA==
X-Received: by 2002:a05:6a21:47c6:b0:140:a25:1c1d with SMTP id
 as6-20020a056a2147c600b001400a251c1dmr9500637pzc.51.1695138965147; 
 Tue, 19 Sep 2023 08:56:05 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.177])
 by smtp.gmail.com with ESMTPSA id
 bm1-20020a056a00320100b0068fece2c190sm8739890pfb.70.2023.09.19.08.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 08:56:04 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: shaggy@kernel.org
Subject: [PATCH] jfs : fs array-index-out-of-bounds in txCommit
Date: Tue, 19 Sep 2023 21:25:42 +0530
Message-Id: <20230919155542.4354-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: syzbot+0558d19c373e44da3c18@syzkaller.appspotmail.com,
 Linux-kernel-mentees@lists.linuxfoundation.org,
 jfs-discussion@lists.sourceforge.net, Manas Ghandat <ghandatmanas@gmail.com>,
 linux-kernel@vger.kernel.org
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

Currently there is no check for out of bound access for xad in the
struct xtpage_t. Added the required check at various places for the same

Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
Reported-by: syzbot+0558d19c373e44da3c18@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0558d19c373e44da3c18
Fixes: df0cc57e057f
---
 fs/jfs/jfs_txnmgr.c | 4 ++++
 fs/jfs/jfs_xtree.c  | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/fs/jfs/jfs_txnmgr.c b/fs/jfs/jfs_txnmgr.c
index ce4b4760fcb1..6c6640942bed 100644
--- a/fs/jfs/jfs_txnmgr.c
+++ b/fs/jfs/jfs_txnmgr.c
@@ -1722,6 +1722,10 @@ static void xtLog(struct jfs_log * log, struct tblock * tblk, struct lrd * lrd,
 			jfs_err("xtLog: lwm > next");
 			goto out;
 		}
+		if (lwm >= XTROOTMAXSLOT) {
+			jfs_err("xtLog: lwm out of range");
+			goto out;
+		}
 		tlck->flag |= tlckUPDATEMAP;
 		xadlock->flag = mlckALLOCXADLIST;
 		xadlock->count = next - lwm;
diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
index 2d304cee884c..57569c52663e 100644
--- a/fs/jfs/jfs_xtree.c
+++ b/fs/jfs/jfs_xtree.c
@@ -357,6 +357,9 @@ static int xtSearch(struct inode *ip, s64 xoff,	s64 *nextp,
 		for (base = XTENTRYSTART; lim; lim >>= 1) {
 			index = base + (lim >> 1);
 
+			if (index >= XTROOTMAXSLOT)
+				goto out;
+
 			XT_CMP(cmp, xoff, &p->xad[index], t64);
 			if (cmp == 0) {
 				/*
@@ -618,6 +621,9 @@ int xtInsert(tid_t tid,		/* transaction id */
 		memmove(&p->xad[index + 1], &p->xad[index],
 			(nextindex - index) * sizeof(xad_t));
 
+	if (index >= XTROOTMAXSLOT)
+		goto out;
+
 	/* insert the new entry: mark the entry NEW */
 	xad = &p->xad[index];
 	XT_PUTENTRY(xad, xflag, xoff, xlen, xaddr);
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
