Return-Path: <SRS0=w6iK=37=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7F4C3F68F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A15B320842
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI1Jahnp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A15B320842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 68548203F7;
	Tue, 11 Feb 2020 12:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tay2sNocm6Pu; Tue, 11 Feb 2020 12:40:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AB41A2000D;
	Tue, 11 Feb 2020 12:40:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2BC1C1D88;
	Tue, 11 Feb 2020 12:40:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 913DDC07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8D57A204C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6djwHYYmVE3v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id C19292000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:57 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l24so5678581pgk.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vB8/tlMIfHHY6/JMMNWkwheJDn7F+wyT1YK9e+905A8=;
 b=AI1Jahnp3mJx/q/qFF/nSI7JcaXi73sppfYvfhyqY6oGhAHBFdp42+HO9HXbK9Rzkt
 rt1eIfjwxX/8Swwq+X9sExmQakKyBolj88QFbn1bzxnXd1Hg0kajAHudgOfcyJwggVYQ
 8Yebe9WTnQGPeN1hkonkhHY6DE4he5bDBAoBPuHk7exQ/1l2f7w5Id+QtRcRT60PnI2I
 ji3NFN69DpMSXx9G+eKC9MAFpLdkQLqfl/H+pAlP3UpmQn+vXw3YQPuEqFz2KuRQHoPd
 dgtE7QDBMOr6Yz9g9q/1V5A5NTIQCAvwW/E9gGgAAJPMze5r6BWI6oG9MSfGVPKOGUgw
 cKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vB8/tlMIfHHY6/JMMNWkwheJDn7F+wyT1YK9e+905A8=;
 b=cfuufLHijaHPNGftkRIpHpQSf5vUrx/k/3u43vm4fT8OibttthiDrGu77BXjhX2+a4
 CyCXhr8YjWuesvZIGlQi4Soc5gIHHfNbiQmxs4ggC5YXtMbtwgkCbwV5TtPKFvz3EAt2
 VOMDQuvj5FWJOtqRRjKHU7CDGFoYecCf9WYXroq1c+3uDd/N7Z3yvNoguzGYZKeMD3WN
 RZEglaT5Fqbv9Bpegw2F7vXSH7K7ENyYTX4UWBYsuI6vLbl9BjW5fo7qsBIV/G0nmV+5
 55kwCu2ahXSAwMpcGdtYec9nCSBMAIV0hChkJXkbqGf3fdOauNTs7VD8Pdn9gPQ45gwF
 dIPw==
X-Gm-Message-State: APjAAAVF5RAs6vbb8cL0h2SjYNWgzAYLXCHh5oS19YJbntfLhnS10WKd
 by7+czCSrTKq8+cxhopXSpE=
X-Google-Smtp-Source: APXvYqwqBWKNVboD3wYTD1qQefYmtJ7eRYkmgdT5tnRsuEVF/qV/efF4GI9OJ5A8v0V4OetM5tJXDA==
X-Received: by 2002:a63:6387:: with SMTP id x129mr2871091pgb.285.1581424857431; 
 Tue, 11 Feb 2020 04:40:57 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:40:56 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:48 +0530
Message-Id: <20200211123859.10429-8-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211123859.10429-1-pragat.pandya@gmail.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 07/18] staging: exfat: Rename
	variable "LogSector" to "log_sector"
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

Fix checkpatch warning: Avoid CamelCase
Change all occurrences of identifier "LogSector" to "log_sector" in
source.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat_super.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index c7f56f77e4bb..3393c97bd9cb 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -668,7 +668,7 @@ static int ffs_read_file(struct inode *inode, struct file_id_t *fid, void *buffe
 	s32 offset, sec_offset, clu_offset;
 	u32 clu;
 	int ret = 0;
-	sector_t LogSector;
+	sector_t log_sector;
 	u64 oneblkread, read_bytes;
 	struct buffer_head *tmp_bh = NULL;
 	struct super_block *sb = inode->i_sb;
@@ -746,20 +746,20 @@ static int ffs_read_file(struct inode *inode, struct file_id_t *fid, void *buffe
 		/* byte offset in sector */
 		offset &= p_bd->sector_size_mask;
 
-		LogSector = START_SECTOR(clu) + sec_offset;
+		log_sector = START_SECTOR(clu) + sec_offset;
 
 		oneblkread = (u64)(p_bd->sector_size - offset);
 		if (oneblkread > count)
 			oneblkread = count;
 
 		if ((offset == 0) && (oneblkread == p_bd->sector_size)) {
-			if (sector_read(sb, LogSector, &tmp_bh, 1) !=
+			if (sector_read(sb, log_sector, &tmp_bh, 1) !=
 			    0)
 				goto err_out;
 			memcpy((char *)buffer + read_bytes,
 			       (char *)tmp_bh->b_data, (s32)oneblkread);
 		} else {
-			if (sector_read(sb, LogSector, &tmp_bh, 1) !=
+			if (sector_read(sb, log_sector, &tmp_bh, 1) !=
 			    0)
 				goto err_out;
 			memcpy((char *)buffer + read_bytes,
@@ -796,7 +796,7 @@ static int ffsWriteFile(struct inode *inode, struct file_id_t *fid,
 	s32 num_clusters, num_alloc, num_alloced = (s32)~0;
 	int ret = 0;
 	u32 clu, last_clu;
-	sector_t LogSector;
+	sector_t log_sector;
 	u64 oneblkwrite, write_bytes;
 	struct chain_t new_clu;
 	struct timestamp_t tm;
@@ -932,19 +932,19 @@ static int ffsWriteFile(struct inode *inode, struct file_id_t *fid,
 		/* byte offset in sector    */
 		offset &= p_bd->sector_size_mask;
 
-		LogSector = START_SECTOR(clu) + sec_offset;
+		log_sector = START_SECTOR(clu) + sec_offset;
 
 		oneblkwrite = (u64)(p_bd->sector_size - offset);
 		if (oneblkwrite > count)
 			oneblkwrite = count;
 
 		if ((offset == 0) && (oneblkwrite == p_bd->sector_size)) {
-			if (sector_read(sb, LogSector, &tmp_bh, 0) !=
+			if (sector_read(sb, log_sector, &tmp_bh, 0) !=
 			    0)
 				goto err_out;
 			memcpy((char *)tmp_bh->b_data,
 			       (char *)buffer + write_bytes, (s32)oneblkwrite);
-			if (sector_write(sb, LogSector, tmp_bh, 0) !=
+			if (sector_write(sb, log_sector, tmp_bh, 0) !=
 			    0) {
 				brelse(tmp_bh);
 				goto err_out;
@@ -952,18 +952,18 @@ static int ffsWriteFile(struct inode *inode, struct file_id_t *fid,
 		} else {
 			if ((offset > 0) ||
 			    ((fid->rwoffset + oneblkwrite) < fid->size)) {
-				if (sector_read(sb, LogSector, &tmp_bh, 1) !=
+				if (sector_read(sb, log_sector, &tmp_bh, 1) !=
 				    0)
 					goto err_out;
 			} else {
-				if (sector_read(sb, LogSector, &tmp_bh, 0) !=
+				if (sector_read(sb, log_sector, &tmp_bh, 0) !=
 				    0)
 					goto err_out;
 			}
 
 			memcpy((char *)tmp_bh->b_data + offset,
 			       (char *)buffer + write_bytes, (s32)oneblkwrite);
-			if (sector_write(sb, LogSector, tmp_bh, 0) !=
+			if (sector_write(sb, log_sector, tmp_bh, 0) !=
 			    0) {
 				brelse(tmp_bh);
 				goto err_out;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
