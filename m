Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C96CCD6E77
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Oct 2023 14:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E87AE40205;
	Wed, 11 Oct 2023 14:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E87AE40205
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g2IDFX5/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id feA9VvqNIxxO; Wed, 11 Oct 2023 14:39:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CC972401E2;
	Wed, 11 Oct 2023 14:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC972401E2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2C7EC0071;
	Wed, 11 Oct 2023 14:39:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30294C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 14:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB8B881308
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 14:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB8B881308
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g2IDFX5/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTO89r819HUZ
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 14:39:53 +0000 (UTC)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8F7380ECB
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 14:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8F7380ECB
Received: by mail-pf1-x444.google.com with SMTP id
 d2e1a72fcca58-694ed847889so5345561b3a.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 07:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697035193; x=1697639993;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fQNK4cZppGs8Y8rM4h3XQeL/bSmNLB40k5aLUnjJJ7g=;
 b=g2IDFX5/aj2fcqa//OsSfqoLDDddl8tcPIsSDYQWFFCVT0JXucsGZ1Iu6lXiud+gM8
 FR/oaIqGB2f/j43vAzEJ5FWGZIhMy+siDGjXQZTbfQEfMpkNYgFui0NW6AwLDP2+/KVC
 kdTlIwRNX0EK2c+eG14YM0/wiEQY2/Ev5DGjebTrYWxMpa01hglV1SucypkMPkwdvBt9
 ya93eNAxpCbqBiu7Eqv+yM+tK9UZGXZnHuyqkVKmKNsgewtWke0BXlnr5tYNroOO66J2
 pz50+nrH390H2Weviz0Fd7vCoJ+R+azvJBgn4ynIZbi2O/JHB43azqyEmtEio2ds1wSe
 VuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697035193; x=1697639993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fQNK4cZppGs8Y8rM4h3XQeL/bSmNLB40k5aLUnjJJ7g=;
 b=d0vlPkmUJv4YtlES5iDQCU9QLk1kVQyF1e6DADB/xyAwAxA/i42S3ujiGl306/qseQ
 gaBQNBpefToNDvdjLNH4x3ECW0x/eTBqaPIAESojH19waTdf3ZukQyREUzm7eJkfpfCC
 xkJSe4JvO52riaEFzJG6KzR3tQFgY/MBRjdqxD8CyvxWo7rXITEGFbU9rKpq2LytSqBs
 /3lYc5esEMs0SSytJEnokZwWEYVUqL5WLwpyZkL5Duj7VfBsPtb1q7qrvJMB/j1ABrqH
 rLo8vTDxeVaiuRmnEdH+ufi3GgcBI77Ny85hVOZuo7HbEFg11kdz+pQUm1mqUWBS+D5C
 pLiw==
X-Gm-Message-State: AOJu0Yx8XnGETEuar9ijaDk9gR1OhkDYp73UaKdaKsdeDblfBVzOskf0
 WwROnRWK1EU4aGtSNOjGG2Q=
X-Google-Smtp-Source: AGHT+IE6Ikt3sjADpcL2G+goBGqBF7/yE9bydDfjiJ4t5gPY9YMYFFqsRsWWbZrdhK57fjiyveTMXA==
X-Received: by 2002:a05:6a21:788a:b0:125:517c:4f18 with SMTP id
 bf10-20020a056a21788a00b00125517c4f18mr22055418pzc.8.1697035193173; 
 Wed, 11 Oct 2023 07:39:53 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.179])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a170902ec9000b001c61901ed2esm13874266plg.219.2023.10.11.07.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 07:39:52 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: dave.kleikamp@oracle.com,
	shaggy@kernel.org
Subject: [PATCH] jfs: fix shift-out-of-bounds in dbJoin
Date: Wed, 11 Oct 2023 20:09:37 +0530
Message-Id: <20231011143937.31996-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org,
 jfs-discussion@lists.sourceforge.net, Manas Ghandat <ghandatmanas@gmail.com>,
 linux-kernel@vger.kernel.org,
 syzbot+411debe54d318eaed386@syzkaller.appspotmail.com
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

Currently while joining the leaf in a buddy system there is shift out
of bound error in calculation of BUDSIZE. Added the required check 
to the BUDSIZE and fixed the documentation as well.

Reported-by: syzbot+411debe54d318eaed386@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=411debe54d318eaed386
Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
---
 fs/jfs/jfs_dmap.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index 6b838d3ae7c2..baa97bda1c7a 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -2730,7 +2730,9 @@ static int dbBackSplit(dmtree_t * tp, int leafno)
  *	leafno	- the number of the leaf to be updated.
  *	newval	- the new value for the leaf.
  *
- * RETURN VALUES: none
+ * RETURN VALUES:
+ *  0		- success
+ *	-EIO	- i/o error
  */
 static int dbJoin(dmtree_t * tp, int leafno, int newval)
 {
@@ -2757,6 +2759,10 @@ static int dbJoin(dmtree_t * tp, int leafno, int newval)
 		 * get the buddy size (number of words covered) of
 		 * the new value.
 		 */
+
+		if ((newval - tp->dmt_budmin) > BUDMIN)
+			return -EIO;
+
 		budsz = BUDSIZE(newval, tp->dmt_budmin);
 
 		/* try to join.
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
