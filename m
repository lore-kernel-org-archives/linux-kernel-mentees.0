Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C4BC04A6A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Aug 2023 06:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A2EE403E9;
	Sun, 13 Aug 2023 06:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A2EE403E9
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=h24Q6I/U
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id st8nabRqP_M5; Sun, 13 Aug 2023 06:01:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B960E402F5;
	Sun, 13 Aug 2023 06:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B960E402F5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A32AC0072;
	Sun, 13 Aug 2023 06:01:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27CADC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 06:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6D39414CC
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 06:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6D39414CC
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=h24Q6I/U
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hm7C4U-wb7cK
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 06:01:06 +0000 (UTC)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A326C414CA
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 06:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A326C414CA
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3a7f74134e7so495352b6e.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Aug 2023 23:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691906465; x=1692511265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TLM5KpkpD4gWxC6Oek1rSBQnlEYGRzxn9MLl0BpU5F0=;
 b=h24Q6I/UsAD9vYa6jWbyFrJMuP2WS8zeeAADdQF+/t+9qok/gC3ZdOu7v3zjXS+HN9
 POMQIUzExaDsIOJ9zpRIb49ugrUGwr9bYAhhc9zxnJpVXmPx4O60ISxyr0jslPERJd3S
 2m7KMb61RCZVkJ87N6ZJMAWdSJjKdtBUJnc9Nn2Y1dZ1NVTsF134gVhZ2e8to/7mTTBV
 re9gE4SQXvBdORy87nq2vF82jddTqCCKlHP8pZexRk8o2AcZOiqZbSkaylcwtIdAxIyN
 MYzo04t5tdIZhKoABdMFlMnsVFqp57Fb/FLd72USMctkmU4QyVQ4xVPRTnu6NipaEYBy
 dVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691906465; x=1692511265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TLM5KpkpD4gWxC6Oek1rSBQnlEYGRzxn9MLl0BpU5F0=;
 b=OmubIWcTXenkXtNY545ncFIyA9VVwRPxRKEQ9AidQBbagxPIeuBWekaCrbAEnJ4qxi
 5Ni4ncI1oTalGAx2WLEmw34oMK+UJ30ZD1OkTYmtf94qbqoiZfKj1eS2+Tk40wR2s7N/
 0kBqWEU3mOFGkLa+fFt3lBRV9+rnLBi2CbQYL/9D971LyPUDrpNKd/jzlrvn7EzQR0VE
 e86NWzXwslZjSTkx6IvvkT74MAPT7yojJ9cbFkTYvuQwKdd9I4bwhu50DH+lLQKmRoJc
 Dju9fkhidhT7ru9lbwdUJp+T/vkk+SIAhCF8UxxaDStxZa/sLZQFrP16QBNigfkZHiVM
 l2HA==
X-Gm-Message-State: AOJu0YwO5Wv/+118TJFNg3vQNl3AP89YCg9zwdQCUYWT35MVLuqfi50A
 xP/IIQbTb7Hwk6L14+3PiQM=
X-Google-Smtp-Source: AGHT+IHHF3g51CV/WubhxPwpRm7sZqAoSXFa+dkSSWPQxBTL5FkGpDuLblN2HAN/MDR9Kq3V61Kv8w==
X-Received: by 2002:a05:6808:1792:b0:3a7:3ce0:1ae5 with SMTP id
 bg18-20020a056808179200b003a73ce01ae5mr9451677oib.47.1691906465578; 
 Sat, 12 Aug 2023 23:01:05 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.173])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a637057000000b00564aee22f33sm6022339pgn.14.2023.08.12.23.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Aug 2023 23:01:05 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v4] ntfs : fix shift-out-of-bounds in ntfs_iget
Date: Sun, 13 Aug 2023 11:29:49 +0530
Message-Id: <20230813055948.12513-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: Manas Ghandat <ghandatmanas@gmail.com>,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Linux-kernel-mentees@lists.linuxfoundation.org,
 linkinjeon@kernel.org, anton@tuxera.com
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

Currently there is not check for ni->itype.compressed.block_size when
a->data.non_resident.compression_unit is present and NInoSparse(ni) is
true. Added the required check to calculation of block size.

Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
Reported-by: syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4768a8f039aa677897d0
Fix-commit-ID: upstream f40ddce88593482919761f74910f42f4b84c004b
---
V3 -> V4: Fix description
V2 -> V3: Fix patching issue.
V1 -> V2: Cleaned up coding style.

 fs/ntfs/inode.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 6c3f38d66579..a657322874ed 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1077,6 +1077,15 @@ static int ntfs_read_locked_inode(struct inode *vi)
 					goto unm_err_out;
 				}
 				if (a->data.non_resident.compression_unit) {
+					if (a->data.non_resident.compression_unit +
+					vol->cluster_size_bits > 32) {
+						ntfs_error(vi->i_sb,
+						"Found non-standard compression unit (%u).   Cannot handle this.",
+						a->data.non_resident.compression_unit
+						);
+						err = -EOPNOTSUPP;
+						goto unm_err_out;
+					}
 					ni->itype.compressed.block_size = 1U <<
 							(a->data.non_resident.
 							compression_unit +
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
