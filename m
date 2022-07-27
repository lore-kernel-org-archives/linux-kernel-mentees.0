Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A71BC00144
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Jul 2022 00:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FD424032A;
	Wed, 27 Jul 2022 00:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FD424032A
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f41v0gAS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNdWO_cvvUET; Wed, 27 Jul 2022 00:15:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A5A7D402E7;
	Wed, 27 Jul 2022 00:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5A7D402E7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70F04C0035;
	Wed, 27 Jul 2022 00:15:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E960C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 00:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 161EF6079D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 00:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 161EF6079D
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f41v0gAS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GbGdBVnfyO73
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 00:15:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C60C60A78
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C60C60A78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 00:15:33 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id jw17so2480783pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 17:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=3RSdu/ftksH2kRInjQ7CZe/PjouCCOaY6R6ufSLyASQ=;
 b=f41v0gASRs2LjNLebJYIoYGWdNbcVY8lv8LN8tQ+PTdDq0Urge2d0L6C8cVHnaTv8D
 f6E7yF1xorMNuLPPljCe1JOZ4/NEU5Tlo61Yd22WX+X6U4jB9Vb4+xa8v1wiBTppAVBa
 5NAoLJrpeou6wOHiBxpZQLxfanle34MvNySVnXsmFqkuq/TnQelZk/vodXcWx47pYw/j
 YCyH2F2ib040lYlZU7uiiG3s0WPrizg6ocD1f60ITQ+PRZuCKu2/exloxEl9jRVXu5/o
 QWEyEN7ToWRTmDnkNJCaXZRc7AouklgkLN36Lw2QHbZaByD5wh0suSYhrwbfc0/zNH3V
 GWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3RSdu/ftksH2kRInjQ7CZe/PjouCCOaY6R6ufSLyASQ=;
 b=2MCBSR7xMwfEO0QWm9muvw0L/7yhJX3/GVmgzERmmsWSWAhJS1JtAfCvXWUxKGqord
 e6mF9H7Il2UO3V9JS46QUBtPA/F+k420Xp2MCpWgO2wWErE/FFS+cegB1cOGJktCtt7k
 axV77TeVke15KhVh3EYjmQ57/AViLzGRYLzO7OQ/fyEWJ5bSb5VwsQvpJbO+cGRrrvDF
 QH8Cow6ebL5RErxRkkT7bd6pHsaivUyL+GGNwfh3eUHYbp6KCJzk/PJ6E5eKayQvKqPD
 sAV/RWPA0ePs6IegXrQXLim0WqwJo/DKw50khdKi9Wju4WVNmsEmOOJtWiDKFraR3F6s
 Lbng==
X-Gm-Message-State: AJIora9O9n+lDue4XJAUYAXzCWEbr9yC4hny3CHxLAcfAbTpuoiGiiUJ
 0/eT5IKs8NwQYDqqIvI6ly8=
X-Google-Smtp-Source: AGRyM1u/LwAsCEZMgKu58cdfbc6X+rmkg7cqtKiuXRSrO5N9j0sBr+6aBlnWLpe1hpNWMkNbTvncBA==
X-Received: by 2002:a17:903:110e:b0:16c:defc:a092 with SMTP id
 n14-20020a170903110e00b0016cdefca092mr19142661plh.143.1658880932457; 
 Tue, 26 Jul 2022 17:15:32 -0700 (PDT)
Received: from Negi ([68.181.16.133]) by smtp.gmail.com with ESMTPSA id
 u5-20020a627905000000b005259578e8fcsm12298305pfc.181.2022.07.26.17.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 17:15:31 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Anton Altaparmakov <anton@tuxera.com>,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2] ntfs: Ensure $Extend is a directory
Date: Tue, 26 Jul 2022 17:15:13 -0700
Message-Id: <20220727001513.11902-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

Fix Syzbot bug: kernel BUG in ntfs_lookup_inode_by_name
https://syzkaller.appspot.com/bug?id=32cf53b48c1846ffc25a185a2e92e170d1a95d71

Check whether $Extend is a directory or not( for NTFS3.0+) while
loading system files. If it isn't(as in the case of this bug where the
mft record for $Extend contains a regular file), load_system_files()
returns false.

Reported-by: syzbot+30b7f850c6d98ea461d2@syzkaller.appspotmail.com
CC: stable@vger.kernel.org # 4.9+
Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
Changes since v1:
* Added CC tag for stable
* Formatted changelog to fit within 72 cols

---
 fs/ntfs/super.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 5ae8de09b271..18e2902531f9 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -2092,10 +2092,15 @@ static bool load_system_files(ntfs_volume *vol)
 	// TODO: Initialize security.
 	/* Get the extended system files' directory inode. */
 	vol->extend_ino = ntfs_iget(sb, FILE_Extend);
-	if (IS_ERR(vol->extend_ino) || is_bad_inode(vol->extend_ino)) {
+	if (IS_ERR(vol->extend_ino) || is_bad_inode(vol->extend_ino) ||
+	    !S_ISDIR(vol->extend_ino->i_mode)) {
+		static const char *es1 = "$Extend is not a directory";
+		static const char *es2 = "Failed to load $Extend";
+		const char *es = !S_ISDIR(vol->extend_ino->i_mode) ? es1 : es2;
+
 		if (!IS_ERR(vol->extend_ino))
 			iput(vol->extend_ino);
-		ntfs_error(sb, "Failed to load $Extend.");
+		ntfs_error(sb, "%s.", es);
 		goto iput_sec_err_out;
 	}
 #ifdef NTFS_RW
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
