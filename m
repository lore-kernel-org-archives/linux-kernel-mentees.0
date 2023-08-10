Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB83BC001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Aug 2023 16:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6180D80E47;
	Thu, 10 Aug 2023 16:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6180D80E47
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IJ/HEYns
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCh8QBrEroCH; Thu, 10 Aug 2023 16:13:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4FE0480C48;
	Thu, 10 Aug 2023 16:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FE0480C48
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38EEBC0072;
	Thu, 10 Aug 2023 16:13:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63550C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 16:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CD704170F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 16:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CD704170F
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=IJ/HEYns
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0TUGrjvNKMLY
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 16:13:28 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28DA141708
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 16:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28DA141708
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bb7b8390e8so8494125ad.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 09:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691684007; x=1692288807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t8Q9xp1hpHwj6pNr+X5XwC5Li0wmHIWn07CtqwvptdI=;
 b=IJ/HEYnsAODmGUD4SLrT2mk7Kbfjk1jGBf5ows/R6bb0x7AXJDbGwsptPTPHMbM0M5
 MMFSQsDlD9avKRFzTtOUE+YKB7oEOEIah017O3TX/qsEVd7o77QfNMzpw2qLC+XJba7t
 UuVOsAcETenzmYfx1XlUFTh9SfJlC/RjGFzPgYI+dretjrt3lYzpVf0UKxw7MeL2rq4P
 pbKUfxQrtifvATuD+EM/dnqAmb4m7Ko5L6/4ikHw3nDAqULRsfMa4Wudql0nenUeCraX
 Hu+pyUPMXFIlHM7uGuTQfCuljoeGJU6DnrhRzxS3N+tz7Lp7XeZzIZcuMXFbCS/e3WnJ
 JenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691684007; x=1692288807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t8Q9xp1hpHwj6pNr+X5XwC5Li0wmHIWn07CtqwvptdI=;
 b=d9Db/m7VbpIuKxq4HNduNm9hKf7BJgNrqHUaZRB5mkLvWQKU44vqvTT7Oi406mk4o4
 upfDCXQTOeULVWO/yWUhWZKs5kngz/RVV8aOte8CEeToH9LezCTEjBhTPmE5BHbDb40K
 EVJpf8dlRqHUwgFPgNcSk5WCPN++WzTU30YbWoffjnEzXbujYh2eR/eo9bXIatUvhpdJ
 Tf01TVFg2DIInj4rYhW4WOiK4/t3sIDBmdgH+wJuBLFEtrxRVs5ueyHcd3sdH1wfmaq5
 86KSqyeZ5hOaGETqHO4fld49J+ZPRzJGmyRMYJVEzfDizTWJIMGqNaLF4vGh7y6aCqsK
 yXvg==
X-Gm-Message-State: AOJu0Yz3oxQZ9zg+KqSpiTiixfYS309lD/YTwuUpaFGtKipC7YHbop/8
 qiUlmyreWbtlVS0lxiZRBcs=
X-Google-Smtp-Source: AGHT+IF2wwr+Qo2PrhtF+th5PmcbtS3OAFIljYU9PclgzSIHGvB8qfweZAb49T2u7uYeNr0ZCbtWLA==
X-Received: by 2002:a17:902:dacd:b0:1bb:a941:d940 with SMTP id
 q13-20020a170902dacd00b001bba941d940mr3108026plx.15.1691684007304; 
 Thu, 10 Aug 2023 09:13:27 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.179])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a170902b20600b001b9e0918b0asm1960070plr.169.2023.08.10.09.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 09:13:26 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v3] ntfs : fix shift-out-of-bounds in ntfs_iget
Date: Thu, 10 Aug 2023 21:43:08 +0530
Message-Id: <20230810161308.8577-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <2023080811-populace-raven-96d2@gregkh>
References: <2023080811-populace-raven-96d2@gregkh>
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

Added a check to the compression_unit so that out of bound doesn't occur.

Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
Reported-by: syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4768a8f039aa677897d0
---
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
+						vol->cluster_size_bits > 32) {
+						ntfs_error(vi->i_sb,
+							"Found non-standard compression unit (%u).   Cannot handle this.",
+							a->data.non_resident.compression_unit
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
