Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE454E95A67
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Oct 2023 17:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C4C982104;
	Sun,  8 Oct 2023 17:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C4C982104
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jd+uxA6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jtxz7KZKoZlF; Sun,  8 Oct 2023 17:48:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D4F668208D;
	Sun,  8 Oct 2023 17:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4F668208D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA2BDC0071;
	Sun,  8 Oct 2023 17:48:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93B5EC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 17:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B7C641860
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 17:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B7C641860
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jd+uxA6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qtfPIbFRAFQ8
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 17:47:58 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22697416C9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 17:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22697416C9
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c5c91bec75so25396415ad.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Oct 2023 10:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696787277; x=1697392077;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QJoz8SDUov6EH8w2r891PJdscTvuwkuTW6wM+WMDtO8=;
 b=jd+uxA6E34AhQaKnq157QLDzTbspIzTjg/MA2e0UuDNVi86lu9pa3UiS06+29XzPfd
 1NzhfcmF90LomSsoKxm075YRWV9M1ImjXex+3i8Ptx+paGmD12XdssnAknOYR/RS4F1C
 Gok5T/WzY1OSLHShN+lSDWMd7T4j/ccfuKoaYAPbhgAKRIPy6uYN1o3fk2qvga9BtZys
 crudQyyOFKtDrOZBG4k3X7Dfo/lg9IGgJDybGpnSiABCMgZw+yNFhNyFafSjyHJqKOnR
 4sxEBObA1leorQeSOiVnKxJ6vg99tOZeGJd/4ePx//T1GmaPrlNZOrSiDNb6Emn5Rf9s
 zjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696787277; x=1697392077;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QJoz8SDUov6EH8w2r891PJdscTvuwkuTW6wM+WMDtO8=;
 b=Zyfl/s0/LhkweuRBOCeAWp8NfUrD8qBw7Me7Pn7BWP1lcv4Vbra9BimS2zmd86RHWX
 osGPsX0LC/uD2NZt5kwQFgc+hFc2VeZeHimvQdf9sSCLArtzdNdAFNLnERODyWXMeaNk
 BLfRHNd/Fttk+jkBItYh8wpPelFCdPRdCdDJm0o+cAKdyx7G2CcNknC5TTkiJQlKOh3/
 r6yJdnhjFd9xZQczS8QlWYPU/5B/YltBlUytyGU7CwkqmpVF20D1vFxN8/dfaCzAeu0u
 O+ojgt/NHmQNEqy2ND1v5bOuDvgCeVLJTgKoVF3NSip/1y3AxxhcO8owonKuBivJiX0J
 pgrg==
X-Gm-Message-State: AOJu0YyYzPVTlEPbt3/h6D5jaQ18zJAloDcpRC3vOZCLHfj6HHgVmN/s
 Qk9UjBY0jX+tJokiH/G4MUM=
X-Google-Smtp-Source: AGHT+IE5/VaCHBxl0zQmbH6k5aueCLYd63UoBV/FHcEYzYhDOT8Gh5hnx8Yu2Vjd6+SWWeOZAHn77Q==
X-Received: by 2002:a17:903:48f:b0:1c7:2c07:ca00 with SMTP id
 jj15-20020a170903048f00b001c72c07ca00mr10512562plb.36.1696787277368; 
 Sun, 08 Oct 2023 10:47:57 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.175])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a170902f54900b001c47541ecd7sm7757861plf.250.2023.10.08.10.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 10:47:56 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: dave.kleikamp@oracle.com,
	shaggy@kernel.org
Subject: [PATCH] jfs : fix array-index-out-of-bounds in diWrite
Date: Sun,  8 Oct 2023 23:17:45 +0530
Message-Id: <20231008174745.27342-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org,
 jfs-discussion@lists.sourceforge.net,
 syzbot+c1056fdfe414463fdb33@syzkaller.appspotmail.com,
 Manas Ghandat <ghandatmanas@gmail.com>, linux-kernel@vger.kernel.org
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

Currently while copying dtree root from inode to dnode in the xp slot
there is a out of bound memcpy. Added a bound check to the memcpy.

Reported-by: syzbot+c1056fdfe414463fdb33@syzkaller.appspotmail.com
Fixes: https://syzkaller.appspot.com/bug?extid=c1056fdfe414463fdb33
Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
---
 fs/jfs/jfs_imap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index 799d3837e7c2..d1f897848be0 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -746,7 +746,8 @@ int diWrite(tid_t tid, struct inode *ip)
 		xp = (dtpage_t *) & dp->di_dtroot;
 		lv = ilinelock->lv;
 		for (n = 0; n < ilinelock->index; n++, lv++) {
-			memcpy(&xp->slot[lv->offset], &p->slot[lv->offset],
+			if (lv->offset < 128)
+				memcpy(&xp->slot[lv->offset], &p->slot[lv->offset],
 			       lv->length << L2DTSLOTSIZE);
 		}
 	} else {
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
