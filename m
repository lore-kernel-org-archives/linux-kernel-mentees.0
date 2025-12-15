Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9A431ED7F
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Dec 2025 05:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765776325; cv=none; b=NpWerkHkxSmpZ1E1ozrYuy98L5W6iWl8aPZMGFxI1FUcCEeDbAxFHwbylllpuxBjrXAMjap0qc4plS9rAhvO0SX1QOlHSVXt4Gi6IegV/uLyKtijGCdHm5R6IHL3ut2K5CViU2J9G16fIHM3jDRVEG/6eB+R0/U2V1yRpIHYNEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765776325; c=relaxed/simple;
	bh=4WohUcn53T/uQEEyf6y7BAhROophdwysksZvlgisaoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lu+Nhb8BjzCWOgM5b/p/psz17KAzuvEYdkELuT7CK0CSMSBtcVyAOKjhTDWkZEol0lv63cDtt89DO3O3i4njmPT7Vh1MT0RI0vLAoapWXSNlFqgtQRLm/XWEqYH92mLSVW/mZowaMG2n0VWh+DfTu5w07fo2Y6m0F8j7s7DlG/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnMuzZQw; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnMuzZQw"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34c902f6845so660159a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 14 Dec 2025 21:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765776323; x=1766381123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SyeYl+lpYngXeRFB+8S2RI9/QB/GCDHNJHtpaYarljI=;
        b=dnMuzZQwt+Nrvu0a4kUq0NgQfIuk2bAnPs3T/7f84Ro3ZbxC+yU64uvU1VkMJaKFVN
         uzAJmQKlWwejotxVqWvBvbBu6Wy4+hkifsxZ9aT+nktfDR2zOR1OZpo4ma/cJxb0ssHv
         hOLr/gGVesbl1Pq2t7+pI7elCVZoYOcHGR6IIp+3W6gHVUbyG0NfL+LG8nRYg+uGpJDX
         EdLjVzVlIrV76+u/9z/vmbVYt2t3xdkFDnlGgRP0/4VMsVIeUMLZkvTH9m5FOhW6e0xf
         5OZ3GM/FsjFOWbzIYQZwLNxvUg9BWWQuHOmjwygxLcCxlSlNe51Bl0kPQiLed78PSyHr
         7iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765776323; x=1766381123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyeYl+lpYngXeRFB+8S2RI9/QB/GCDHNJHtpaYarljI=;
        b=ZSaTWwo0FWG7sVPKa3D2huUhbBwiOFDGiQkPhOnirlLiY9bocrfGUw2+0trpoj13ey
         PVSOima1ZXY+x8L3gfTk0dwvvVnl0MbSnqkXuJn5o45SgXFfdJwSV/nttUsrEM23/YUu
         hXHx0D2aqT6WLwDUqdp6hGDVJh7mu8wJ3I1YHRlZiqD4xj0EHVPnzTNLH+lfPDogPKGP
         V+ag1k4cLQDC9j20GtatB1ZR7jLbhr5Hr8OhfNSi9V+S6PyxHPtpo8k6APRe8jsQp5R3
         syEA4Cwx3miLla9aS+Bm+X3EWe1un1CZOis1iVfUFoq1srL4qczLa+JjTmTCIGc4tivH
         dQjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcmkZFPrGh+dBZNMduUfusP47rRE9yVKJXSbWY10/+63EmQelQSnmZmWkVjFbdOGtveWiIQyabv3/jUOkkwYnofQrbow==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9G/oNH0o7fMYbdK5Z7MydF3fdfXT7r064GtkbTtmihsCwJt7m
	49JsmP8kbVRNsGaE4g9UUQwr/XKLmjNuPO4NsZVhcOhu5nyVZ1YY/7d2
X-Gm-Gg: AY/fxX4F7SVCZ/1cWBgI/B7sFmMDRErkJwMur0fkM2sZV+IYnUpsWXE2gkWUPWTypFg
	9ozoLaG4XiD2y9DSe0HSt8lZMp+UY9OxAxPNubjXuH63W8ygDrT/WrXl8jMYvhMNCmp0zQYjzVl
	OzvJ+hEZVks06gtV0RyuPKZtC5pB6eFgcVF5g/9W8NbuEkVAgR1h3yNKBsHhr4q2mOez8KuKDpz
	xdQsdOizL4G87kwZpXzw/taEnyRF05sadqGIr63OEZWgFiioRJzrpb8UDQGtCGO2GKc97/jiu27
	qwiUJaYJ/891Ga/90HU6fys2esXrVlZRH1oalo3Lc57uikDT0h4NjhGd4YAVfBkYW3tgW3zu1+C
	suGP9DypXdaPrbyb3f3MNnr5K9d/nfG31v/olWmL7BKpjji7cbOzfgizb/YKmtuIBoQrNMSirCt
	EA/m0rBq4rZqii2xhW3HcBT5uOTVFKb8Bf9KmnMg==
X-Google-Smtp-Source: AGHT+IGVBhhEJenk45D58KfOANg6YA1gEaTJXYAm9m5FyDU2UPChT5MOuTUtXkkNHjW1zxUFFDj2RQ==
X-Received: by 2002:a17:90b:5288:b0:343:5f43:933e with SMTP id 98e67ed59e1d1-34abd78fcaemr9259366a91.19.1765776323536;
        Sun, 14 Dec 2025 21:25:23 -0800 (PST)
Received: from localhost.localdomain ([111.125.240.40])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2b9d9d6bsm11145324a12.24.2025.12.14.21.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 21:25:23 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	heming.zhao@suse.com
Cc: linux-kernel@vger.kernel.org,
	ocfs2-devel@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>,
	syzbot+c818e5c4559444f88aa0@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3] ocfs2: Add validate function for slot map blocks
Date: Mon, 15 Dec 2025 10:55:13 +0530
Message-ID: <20251215052513.18436-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the filesystem is being mounted, the kernel panics while the data
regarding slot map allocation to the local node, is being written to the
disk. This occurs because the value of slot map buffer head block
number, which should have been greater than or equal to
`OCFS2_SUPER_BLOCK_BLKNO` (evaluating to 2) is less than it, indicative
of disk metadata corruption. This triggers
BUG_ON(bh->b_blocknr < OCFS2_SUPER_BLOCK_BLKNO) in ocfs2_write_block(),
causing the kernel to panic.

This is fixed by introducing  function ocfs2_validate_slot_map_block() to
validate slot map blocks. It first checks if the buffer head passed to it
is up to date and valid, else it panics the kernel at that point itself.
Further, it contains an if condition block, which checks if `bh->b_blocknr`
is lesser than `OCFS2_SUPER_BLOCK_BLKNO`; if yes, then ocfs2_error is
called, which prints the error log, for debugging purposes, and the return
value of ocfs2_error() is returned. If the return value is zero. then error
code EIO is returned.

This function is used as validate function in calls to ocfs2_read_blocks()
in ocfs2_refresh_slot_info() and ocfs2_map_slot_buffers().
In addition, the function also contains

Reported-by: syzbot+c818e5c4559444f88aa0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c818e5c4559444f88aa0
Tested-by: syzbot+c818e5c4559444f88aa0@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
v2->v3:
 - Create new function ocfs2_validate_slot_map_block() to validate block 
   number of slot map blocks, to be greater then or equal to 
   OCFS2_SUPER_BLOCK_BLKNO
 - Use ocfs2_validate_slot_map_block() in calls to ocfs2_read_blocks() in
   ocfs2_refresh_slot_info() and ocfs2_map_slot_buffers()
 - In addition to using previously formulated if block in 
   ocfs2_validate_slot_map_block(), also check if the buffer head passed 
   in this function is up to date; if not, then kernel panics at that point
 - Change title of patch to 'ocfs2: Add validate function for slot map blocks'

v2 link: https://lore.kernel.org/ocfs2-devel/nwkfpkm2wlajswykywnpt4sc6gdkesakw2sw7etuw2u2w23hul@6oby33bscwdw/T/#t

v1->v2:
 - Remove usage of le16_to_cpu() from ocfs2_error()
 - Cast bh->b_blocknr to unsigned long long
 - Remove type casting for OCFS2_SUPER_BLOCK_BLKNO
 - Fix Sparse warnings reported in v1 by kernel test robot
 - Update title from 'ocfs2: Fix kernel BUG in ocfs2_write_block' to
   'ocfs2: fix kernel BUG in ocfs2_write_block'

v1 link: https://lore.kernel.org/all/20251206154819.175479-1-activprithvi@gmail.com/T/
 fs/ocfs2/slot_map.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/slot_map.c b/fs/ocfs2/slot_map.c
index e544c704b583..50ddd7f50f8f 100644
--- a/fs/ocfs2/slot_map.c
+++ b/fs/ocfs2/slot_map.c
@@ -44,6 +44,9 @@ struct ocfs2_slot_info {
 static int __ocfs2_node_num_to_slot(struct ocfs2_slot_info *si,
 				    unsigned int node_num);
 
+static int ocfs2_validate_slot_map_block(struct super_block *sb,
+					  struct buffer_head *bh);
+
 static void ocfs2_invalidate_slot(struct ocfs2_slot_info *si,
 				  int slot_num)
 {
@@ -132,7 +135,8 @@ int ocfs2_refresh_slot_info(struct ocfs2_super *osb)
 	 * this is not true, the read of -1 (UINT64_MAX) will fail.
 	 */
 	ret = ocfs2_read_blocks(INODE_CACHE(si->si_inode), -1, si->si_blocks,
-				si->si_bh, OCFS2_BH_IGNORE_CACHE, NULL);
+				si->si_bh, OCFS2_BH_IGNORE_CACHE,
+				ocfs2_validate_slot_map_block);
 	if (ret == 0) {
 		spin_lock(&osb->osb_lock);
 		ocfs2_update_slot_info(si);
@@ -332,6 +336,26 @@ int ocfs2_clear_slot(struct ocfs2_super *osb, int slot_num)
 	return ocfs2_update_disk_slot(osb, osb->slot_info, slot_num);
 }
 
+static int ocfs2_validate_slot_map_block(struct super_block *sb,
+					  struct buffer_head *bh)
+{
+	int rc;
+
+	BUG_ON(!buffer_uptodate(bh));
+
+	if (bh->b_blocknr < OCFS2_SUPER_BLOCK_BLKNO) {
+		rc = ocfs2_error(sb,
+				 "Invalid Slot Map Buffer Head "
+				 "Block Number : %llu, Should be >= %d",
+				 (unsigned long long)bh->b_blocknr,
+				 OCFS2_SUPER_BLOCK_BLKNO);
+		if (!rc)
+			return -EIO;
+		return rc;
+	}
+	return 0;
+}
+
 static int ocfs2_map_slot_buffers(struct ocfs2_super *osb,
 				  struct ocfs2_slot_info *si)
 {
@@ -383,7 +407,8 @@ static int ocfs2_map_slot_buffers(struct ocfs2_super *osb,
 
 		bh = NULL;  /* Acquire a fresh bh */
 		status = ocfs2_read_blocks(INODE_CACHE(si->si_inode), blkno,
-					   1, &bh, OCFS2_BH_IGNORE_CACHE, NULL);
+					   1, &bh, OCFS2_BH_IGNORE_CACHE,
+					   ocfs2_validate_slot_map_block);
 		if (status < 0) {
 			mlog_errno(status);
 			goto bail;

base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
-- 
2.43.0

