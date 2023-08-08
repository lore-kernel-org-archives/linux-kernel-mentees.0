Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0BFC001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Aug 2023 04:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F49340979;
	Tue,  8 Aug 2023 04:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F49340979
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qO6dcbNU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ixspe6fSsAbd; Tue,  8 Aug 2023 04:34:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1E3D14097B;
	Tue,  8 Aug 2023 04:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E3D14097B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4CB5C0071;
	Tue,  8 Aug 2023 04:34:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B1E2C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 04:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E82E34097B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 04:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E82E34097B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kl14muVvAvmI
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 04:34:36 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86DE940979
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 04:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86DE940979
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-686f1240a22so5078346b3a.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Aug 2023 21:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691469276; x=1692074076;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tT3Th0/cW0C8QpOpbxiYIDyUxnSvmk/dEVgZXb7Tjac=;
 b=qO6dcbNUJ6j2zokQURqtmSsAmbhwBr6zynotQib8X812aQa2IbAN0hlVRyfJmyknxX
 ova3lshoAOsQA0eOPTTKF19RtcYFQR1UNUdPMN1pRAnsrn+KTcXn0EUicDdI6MC9CzR6
 UX3zhNqLNv1Ya7Hm3mMHjw8+KzGgU/HC4z/XqeKGHF+Z/csvSzZkXNgnqmOTfMMW2UwB
 Mn+tO8B51XZA5mb6yX1VA9rAUudR1qk0MP3eesUkyf4yGK2TZyEHFCqwv04WavbpqzsN
 xqOGcKOqQpPgUhj9UW4B6kQeXhtsxG9k84iWQMjVkPP7LZ7vv0Swvu0De/poAEf3CAUI
 sZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691469276; x=1692074076;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tT3Th0/cW0C8QpOpbxiYIDyUxnSvmk/dEVgZXb7Tjac=;
 b=TGy5dBRUgFuMPW6svSKwCnD05U9w5jpJiUl0ZuDnycLwmOtCRff34CNW0vtxfITD7x
 j63XnyM21zUdhio1U/xX2H6sz6rjvLbTJO5whcSq/nvg/VzS6cDSNMDp0lDqaC64Te2y
 Zi/0LbnfGfA/pEfABEZz2Ic7/hy1jFLa8hsKn6A1pzTPCZIFIi6+imuinfaJb+RQAa1S
 o3TfWNTTZnVV/qycOA6/eqiZbj+9Oz4DAYvy75IOhMNdA1JBAnBRWCks0jXEdNohxDSh
 6aapTsyMQRzXacc9BHgNNZBsyKnQ0hueNqd/7oJnamgYig7pMb/OlvGOhLDcuORAn9hS
 MmTA==
X-Gm-Message-State: AOJu0YwJmr/gpDPTqbihUYmb5AkB3R+N5i6IspVNk1tHiO0kDweF8i9f
 uDUpW1B9EiB+0/FdwqIH6oU=
X-Google-Smtp-Source: AGHT+IEDVzUF/xiLAO/scynI8YtPCMd8bJNj1zeo/rRkV58CULjDs5vKoh76aCZ85kWCLMCO9sTzzQ==
X-Received: by 2002:a05:6a20:96d7:b0:137:a3c9:aaa2 with SMTP id
 hq23-20020a056a2096d700b00137a3c9aaa2mr10921555pzc.30.1691469275697; 
 Mon, 07 Aug 2023 21:34:35 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.176])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a62e505000000b0068779015507sm6978787pff.194.2023.08.07.21.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 21:34:35 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: anton@tuxera.com,
	linkinjeon@kernel.org
Subject: [PATCH] ntfs : fix shift-out-of-bounds in ntfs_iget
Date: Tue,  8 Aug 2023 10:04:05 +0530
Message-Id: <20230808043404.9028-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: Manas Ghandat <ghandatmanas@gmail.com>,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Linux-kernel-mentees@lists.linuxfoundation.org
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

Added a check to the compression_unit so that out of bound doesn't
occur.

Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
Reported-by: syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com
---
 fs/ntfs/inode.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 6c3f38d66579..2ee100a7df32 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1077,6 +1077,17 @@ static int ntfs_read_locked_inode(struct inode *vi)
 					goto unm_err_out;
 				}
 				if (a->data.non_resident.compression_unit) {
+					if(a->data.non_resident.compression_unit + 
+						vol->cluster_size_bits > 32) {
+							ntfs_error(vi->i_sb, "Found "
+								"non-standard "
+								"compression unit (%u).   "
+								"Cannot handle this.",
+								a->data.non_resident.
+								compression_unit);
+							err = -EOPNOTSUPP;
+							goto unm_err_out;
+						}
 					ni->itype.compressed.block_size = 1U <<
 							(a->data.non_resident.
 							compression_unit +
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
