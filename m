Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05383CDB482
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Oct 2023 17:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7343F61170;
	Mon, 16 Oct 2023 17:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7343F61170
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nTfS2sZe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bNXyLgHPU-Qt; Mon, 16 Oct 2023 17:22:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2EF7360A93;
	Mon, 16 Oct 2023 17:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EF7360A93
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02A1EC0071;
	Mon, 16 Oct 2023 17:22:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92D00C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 17:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 688A38145D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 17:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 688A38145D
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nTfS2sZe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TrKQGdb91JoU
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 17:22:26 +0000 (UTC)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD8E1813CE
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 17:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD8E1813CE
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-1c9b7c234a7so40974865ad.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 10:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697476946; x=1698081746;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fzazQLMiElf0E2rTzrIHqd72McOV2ajmxD+aMmf7vqY=;
 b=nTfS2sZew8gv+UHmag83EF4fh4lUFzZ+RGdIM8lKyN+nNvfl4ndcYl2xraL9R6B0fd
 Irk5WxokefhdwaoxP0Kb+WJOakOGEdG64XuMlhrJBvyQ+2293ZFz/+hX3bCuKQ68nFUp
 qolQyxpLDW5dRL1gQrDps4IZ5r3Igwtzr52vNiKODmceU0JvVW28dyR4B2nmNzxDRVbV
 bsIG2pbUY/pesYMC2nQLjF2FHjAtpoKhew4VX/MQ/8IC7tG4dg4oecVqpD/SDt1zkE+O
 lX3qQ0oHzOU+ElUVASnpKK/JSgKARrQNOifN+sBt+M+6ElZB0Ok1y1haBKiH5hyUixHP
 ivWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697476946; x=1698081746;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fzazQLMiElf0E2rTzrIHqd72McOV2ajmxD+aMmf7vqY=;
 b=XngxLKwaduL0el3+sX+dw1NlhqQFq7pJWdz6T3NSYinCkn6ExHU4GRzQoCuD/os6uZ
 uUWuQ30P0E2Ou0QrlHPHgF+lm66vwcgA3p/TyYH1o2yzCO8+HNQY4r2TFIkXhq6WtWuK
 ePTj8LJtt1DyOPjnj0bg5geMeDbOCatSHZLRuKhd0lXT+/+aEDqUGzGEUvuqP3C1z9D3
 LEAupFLH6vba837YXR7KS3t4uQgSjcbmOpUOsVSuP7i+YF16UCYbNQfeUj5Lm/pMWPlY
 Iv93vf0BPvNsktVZT2OV5e2cA8b0MmeBwVJtQylh9/6aEslzKDpg48VSubtsH1MBcT7L
 OgdA==
X-Gm-Message-State: AOJu0YzeiFCsuwB5k5M3UsJKfp1IZLGpoIJ6qF2NhmnTwu65QXtd2u+n
 eQcNCz9RKv+xaO/1twsFljs=
X-Google-Smtp-Source: AGHT+IFu32FXclE93vnrfHvsUnNd7aLyilrnezvtfZPodtmCbOs68G8/SX15ddka7PWiK1VxXkXDQA==
X-Received: by 2002:a17:903:2445:b0:1ca:2497:554 with SMTP id
 l5-20020a170903244500b001ca24970554mr9560472pls.8.1697476945945; 
 Mon, 16 Oct 2023 10:22:25 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.178])
 by smtp.gmail.com with ESMTPSA id
 ik5-20020a170902ab0500b001b8622c1ad2sm8926936plb.130.2023.10.16.10.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 10:22:25 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: dave.kleikamp@oracle.com,
	shaggy@kernel.org
Subject: [PATCH] jfs: fix slab-out-of-bounds Read in dtSearch
Date: Mon, 16 Oct 2023 22:41:30 +0530
Message-Id: <20231016171130.15952-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org,
 jfs-discussion@lists.sourceforge.net, Manas Ghandat <ghandatmanas@gmail.com>,
 linux-kernel@vger.kernel.org,
 syzbot+9924e2a08d9ba0fd4ce2@syzkaller.appspotmail.com
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

Currently while searching for current page in the sorted entry table
of the page there is a out of bound access. Added a bound check to fix
the error.

Reported-by: syzbot+9924e2a08d9ba0fd4ce2@syzkaller.appspotmail.com
Fixes: https://syzkaller.appspot.com/bug?extid=9924e2a08d9ba0fd4ce2
Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
---
 fs/jfs/jfs_dtree.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 92b7c533407c..cf67d32d5b7f 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -633,6 +633,9 @@ int dtSearch(struct inode *ip, struct component_name * key, ino_t * data,
 		for (base = 0, lim = p->header.nextindex; lim; lim >>= 1) {
 			index = base + (lim >> 1);
 
+			if (stbl[index] > 128 || stbl[index] < 0)
+				goto out;
+
 			if (p->header.flag & BT_LEAF) {
 				/* uppercase leaf name to compare */
 				cmp =
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
