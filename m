Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB0AC6FA8F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Aug 2023 16:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E241610A6;
	Tue, 29 Aug 2023 16:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E241610A6
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=oB4niErM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tzAjEBlpHgpU; Tue, 29 Aug 2023 16:52:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 094BF600B3;
	Tue, 29 Aug 2023 16:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 094BF600B3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF9FEC0071;
	Tue, 29 Aug 2023 16:52:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5A5BC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 16:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E558414B9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 16:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E558414B9
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=oB4niErM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qs8TESUJvoLs
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 16:52:53 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C052414B7
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 16:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C052414B7
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bdc19b782aso29228515ad.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 09:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693327973; x=1693932773;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1qQzy70Oe0bgxhcuXv4Qw9ZpdVk+SYDfFf1MSTVPxDk=;
 b=oB4niErMzCvAp+298iHDJV0d4kklPtej65wWAtbzel45dp7FsV5ZCBPQ53aCmcviR6
 blHZo9UdOMdrtc/EOfqqxV0DRBDrFwSyHYd23sKXvDdsQbcXLvYlfIzOIucpJSfiu8eM
 3/HOcDubqKZM/o4oaG4KFWX9p1ahqHrmWRXnVM6QYOZYMPWiKrtW7cQwU4xa2dkKjxA4
 m5+chF2a4q1m2/l7lbCzMSh4yMuLxSs/4YaO1rXUkbzlV1qUTZCWbOZQ9eCi3Jc+tCfn
 QerAivKLgs2C2oanuBV//E1VX36W+RB/ojn+QJn9D5Ego7bVj5vNQ1WHh4j5FPS57/5Q
 0rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693327973; x=1693932773;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1qQzy70Oe0bgxhcuXv4Qw9ZpdVk+SYDfFf1MSTVPxDk=;
 b=IReU6x+KSQiedWVnNh1+0a85bR3AZv1PsXW8tEExnfPLx7V6DdqzNS/2WBwiR7EZY+
 O1sWu9yFFM/CUlLHcC1Det5BQMltXi8iZU9oPcsNfq5RM62u2ti9QQBK7igGqqTomQ1H
 MLqyA1FX/PqTu+u2ob1w3UHZrMAO0W3BGwzHBOLh7CkxJ930+HB0j+UTS7WZFwQa7IHD
 Fn0lz08X6iPoIOSBFAME6TEfRDU0mXIOBtWMm0yOF/r14SvfDXl9VxP3AdKHtLulY1Lq
 fw0kqwYbv0oNyB1iglLc2fw3fX0TFUCfIZ8k7Rg/rNqmhH/827KgqZdyczcMTKduGKMY
 kKxQ==
X-Gm-Message-State: AOJu0YzwE106n6909l5Ed3PPjk1Cf4ESlHECLsoTU6KuisG2NfLs04CO
 ON2mA34L4CWv/E54ciZfKkY=
X-Google-Smtp-Source: AGHT+IEpvMY/b0UIWmQtleMKRid8O5Pm9nwIOdAZ0pHOdoWFJLs2P7BGHY1pmCRM6vcRxWCW3jhj0g==
X-Received: by 2002:a17:902:7408:b0:1bf:73ec:b980 with SMTP id
 g8-20020a170902740800b001bf73ecb980mr19713324pll.66.1693327972489; 
 Tue, 29 Aug 2023 09:52:52 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.179])
 by smtp.gmail.com with ESMTPSA id
 ji18-20020a170903325200b001b9da8b4eb7sm9582735plb.35.2023.08.29.09.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 09:52:51 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: shaggy@kernel.org,
	liushixin2@huawei.com
Subject: [PATCH] jfs: fix array-index-out-of-bounds in dbFindLeaf
Date: Tue, 29 Aug 2023 22:22:44 +0530
Message-Id: <20230829165244.460154-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org,
 jfs-discussion@lists.sourceforge.net, Manas Ghandat <ghandatmanas@gmail.com>,
 linux-kernel@vger.kernel.org,
 syzbot+aea1ad91e854d0a83e04@syzkaller.appspotmail.com
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

Currently while searching for dmtree_t for sufficient free blocks there
is an array out of bounds while getting element in tp->dm_stree. Added
the required bound check.

Ps: After I added the check I am getting the following log

[   22.661748][ T4425] ERROR: (device loop0): dbAllocAny: unable to allocate blocks
[   22.661748][ T4425]
[   22.665536][ T4425] ERROR: (device loop0): remounting filesystem as read-only
[   22.667856][ T4425] jfs_mkdir: dtInsert returned -EIO
[   22.669750][ T4425] ERROR: (device loop0): txAbort:

I was wondering if these checks are significant of not?

Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
Reported-by: syzbot+aea1ad91e854d0a83e04@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=aea1ad91e854d0a83e04
---
 fs/jfs/jfs_dmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index a14a0f18a4c4..5af17b2287be 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -2948,6 +2948,10 @@ static int dbFindLeaf(dmtree_t * tp, int l2nb, int *leafidx)
 			/* sufficient free space found.  move to the next
 			 * level (or quit if this is the last level).
 			 */
+
+			if (x + n > TREESIZE)
+				return -ENOSPC;
+
 			if (l2nb <= tp->dmt_stree[x + n])
 				break;
 		}
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
