Return-Path: <SRS0=mlYZ=3Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D87DC33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:15:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 723B220702
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBpuWHqw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 723B220702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D930858BA;
	Mon, 27 Jan 2020 10:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F43Me8T3WKNb; Mon, 27 Jan 2020 10:15:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3AD7E857A4;
	Mon, 27 Jan 2020 10:15:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25734C0177;
	Mon, 27 Jan 2020 10:15:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A684BC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A388D8587E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-1XMoI7EYGj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 29E8D85650
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:56 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id d15so2772554pjw.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 02:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RHsNhx6vrUoikkv5dv3p0L1TT7e/AEExxslakumc+Z8=;
 b=iBpuWHqw7W6e+WbIyYgNgXxWwgmpnsB7liFQRvfA3QK48xe3nWZHLChZvGnbxIzxBB
 Vf7hi52LNJwPany5bVJDVCZSb5kPTnuKlCiacHhlRP+nALLpKroVVEbGbps9hvtqbKI8
 PyvH/lsBSb3L3Ry2cs4cCAokstq6GF2h+ovNPmnbkCqbQTTGdhUUjvZI2rgVkE/HS/gL
 apJT1xHzBnT+4UsbWYyaKlYTBPEKggrjLZQFWO/4N9r8e8WtWdT+156pxBWfzfaw6hEk
 qkY4OKDerbln7baxTgKdvfvTONjpwtwvBjJR3M561BMh/0dNTN0goNcVhGIwMAOK6USd
 IRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RHsNhx6vrUoikkv5dv3p0L1TT7e/AEExxslakumc+Z8=;
 b=tSewFPzsTzjGMAfNzNH8BrvkMSr7QCvJPqu/N3zDZVzadsjHlkOWPCyd4KzS/EbBWX
 7hBcclcB++QhRUm50UG0CM4/ENRZdP+YPKHxopkwXQh7tLBEm8PMLSoAtLRI47kUB6Zv
 lc5pHr0e0Bc6JaTm+lLjPS6GE5eZWRyibRyh/x+rIClfXiD2dnufOSZlCwD7sMKClR0U
 6Vtk8rLU1LBQzx6ici8C6T9dW8Ke28u01qkw9guCxf6J9KAhPZKq2b4u0KzHOqEE2Myk
 dCkwZtir0S092yU/RMDUUibNDCmiyGQCSY8/bf7Kz187KHPVqZ9rVT5lK8Oi73VdmWqw
 jSMw==
X-Gm-Message-State: APjAAAWAw8yUd+7lrP9xTVHQgfPdOlbDASj3s6rpu32JYXumKAxTHSzR
 kHN09mxfzpDMpReygJ9CC28=
X-Google-Smtp-Source: APXvYqyaOwAWnULMWgndBrQQTf+HvNALhpFu4sooB+T8IRuZDVtr82njMNXTS0VWzsWPt9IweH2vZg==
X-Received: by 2002:a17:90a:f84:: with SMTP id 4mr8268094pjz.74.1580120155754; 
 Mon, 27 Jan 2020 02:15:55 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c902:a5e9:3956:8df2:aee5:9cf6])
 by smtp.gmail.com with ESMTPSA id s15sm15504138pgq.4.2020.01.27.02.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 02:15:55 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: valdis.kletnieks@vt.edu,
	gregkh@linuxfoundation.org
Date: Mon, 27 Jan 2020 15:43:40 +0530
Message-Id: <20200127101343.20415-20-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127101343.20415-1-pragat.pandya@gmail.com>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 19/22] staging: exfat: Rename
	variabel "NumSubdirs" to "num_subdirs"
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Change all the occurreces of "NumSubdirs" to "num_subdirs" in exfat.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index ab48bbd083e5..2e07cb6b694a 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -277,7 +277,7 @@ struct dir_entry_t {
 
 	u32 attr;
 	u64 Size;
-	u32 NumSubdirs;
+	u32 num_subdirs;
 	struct date_time_t CreateTimestamp;
 	struct date_time_t ModifyTimestamp;
 	struct date_time_t AccessTimestamp;
diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 27d6362f2102..2fe59bdabb56 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -1484,7 +1484,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 				ret = count; /* propogate error upward */
 				goto out;
 			}
-			info->NumSubdirs = count;
+			info->num_subdirs = count;
 
 			if (p_fs->dev_ejected)
 				ret = -EIO;
@@ -1532,7 +1532,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 						   uni_name.name);
 	nls_uniname_to_cstring(sb, info->name, &uni_name);
 
-	info->NumSubdirs = 2;
+	info->num_subdirs = 2;
 
 	info->Size = p_fs->fs_func->get_entry_size(ep2);
 
@@ -1551,7 +1551,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 			ret = count; /* propogate error upward */
 			goto out;
 		}
-		info->NumSubdirs += count;
+		info->num_subdirs += count;
 	}
 
 	if (p_fs->dev_ejected)
@@ -3167,7 +3167,7 @@ static int exfat_fill_inode(struct inode *inode, struct file_id_t *fid)
 
 		i_size_write(inode, info.Size);
 		EXFAT_I(inode)->mmu_private = i_size_read(inode);
-		set_nlink(inode, info.NumSubdirs);
+		set_nlink(inode, info.num_subdirs);
 	} else if (info.attr & ATTR_SYMLINK) { /* symbolic link */
 		inode->i_generation |= 1;
 		inode->i_mode = exfat_make_mode(sbi, info.attr, 0777);
@@ -3667,7 +3667,7 @@ static int exfat_read_root(struct inode *inode)
 	inode->i_mtime = curtime;
 	inode->i_atime = curtime;
 	inode->i_ctime = curtime;
-	set_nlink(inode, info.NumSubdirs + 2);
+	set_nlink(inode, info.num_subdirs + 2);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
