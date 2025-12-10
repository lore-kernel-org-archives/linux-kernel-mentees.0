Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA713305E14
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 10 Dec 2025 19:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765395224; cv=none; b=IKmgdUJzsWLdx/GrkDOiB4NZZaMGINXskJmJ2HK189QzSEar+ZpExs2f/5nzTEhvj2K160hmjSN4sFYuyuEPGObhGJ/3QtCi+rbZgQ/Dr4rltQeEV24mEHELt8RL/T204DBu/gXptm5gLi+4ZCe+Pa8Sv0+PPPUYdDxtKzd13qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765395224; c=relaxed/simple;
	bh=8UjBTc/l5QErbH4PdB/3AyuN4ByBmBhkEBcnEF8mCkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oX/HtaGCcPGcOL4FbVGETp2BO5THuE7JYXHJSMCHo3H5T7XBbYG3cxtleSuAttSoTXZvLt5BVUd0itprS9SMvGHA1cHbRrDt1OiU5MS2HUkBnn6NnswWVTvllmpSY0nCeQA7xC1rEf2GLKJRDYrrzKPtZ2utkEyE/mANhCLLCWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIBTh6l9; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIBTh6l9"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so191746b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 10 Dec 2025 11:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765395222; x=1766000022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/RcrEPeLqKl6bQA60QkstM/GSbzDgJ1lLxqTexZoic=;
        b=cIBTh6l9aOFXZ62vHMrDjaGd+s7JpCuOUZAGIMSoyn278Xz1lsb0Ig1tyPbv/dNZs2
         kqHxPKUxdLrttEyS7YPk+va84X2+RdZuHmMTW1uZnWXLlWxd58IU4oBs8Fq5w1b9jOlG
         LuY/ipbPYNrMErg3CQQY2qLyavzjcXHq2eWmc2mj+YiFhD17oCpXu4m5FOTrnZ81ewcf
         LMETe1wMMFeaFIrN8nWS9M7LQqD5w9QPPjFR2hXQk0I1F8qy6g8FlaeoIyFD9EUGMb9k
         ZOucyctk0hx9UB7fU7LaqnutSPYpHVBQ0yPFL8YDEjfpEuoe9ml0eBxChFXSpaNClZmc
         g9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765395222; x=1766000022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/RcrEPeLqKl6bQA60QkstM/GSbzDgJ1lLxqTexZoic=;
        b=PZpD6uuNL9kcbpE/4qUwHl0Bzt6QCeym0MZRIbwJIzQ38+4AIa9Qh//3JWYVff+6gi
         3l2CJFUQf5UBhx6ymdZjNXQBpC0TdUhxcMS1g25Fs6nk5SARhItpcYY+1kzosWBs0Mr3
         l1YsHz39pMWuEzv80OdPKIjZMpu83T6+ujutPVtxC/5Ziru5/eiEh2t3epeFXhbyzvT8
         n3hTiPHIPEDq6R4+PiGQsGRAVCYcq5mDCnHLPOETYECfoh/2uwH5crDWbEgViLU5HliW
         loACSTDC9d8pjNv6dvQoE08rMYRxgz54Z2Q7NpV6GaBGamrj9TJpQp+GG4g08ZpVIriB
         JFFw==
X-Forwarded-Encrypted: i=1; AJvYcCVtSMcWikswJS0Yp1+dIAAv57NoVQ0336dVAHzyLYQYUNPTC4V2bbPu7vSVzgwisweP4X8i36mp9UK+iNEgJ8KXjNco1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbbhMspHXeHTkDp6G1ZW+SFhZcAarUqWFpbVBf9DdAg55zMIUl
	JQVuHbLaV8zlKWN3rEnQPNNU5eQy9ypHLAJf675STzSjTgtYg1V6I8WM
X-Gm-Gg: AY/fxX5S4yDaC2W2sKAluXAk0OrCw27Rq4J/xWTxN3wF+zG0BUTLJ9WZVRvyjvx5OE0
	a0iwB403Cuvc8EUOkJ6mpEgNCJFZ6HTXfDUFY5uAK2KNvT/4lWZkyzqyT27yEDkEsGaXCOQ9nVE
	2t+vCpKVLJgKA/GHyAXfFTTXUhFAK5TOf0DPZbVyvzoPWLmyPsGhm4kj16bRpalexprSZCVJBTn
	qsDsen4X/nJjOLFk2VEr6Y2kBTOuVFa9/exY/XuZ5CRcIq3wM5Gtx+LpmydidGx4CZFr7RO9zjV
	QpAReqUpr7UkIGTGbgG3iIp7UdK/rzbAyw9VaM0XokKooNWO0fbSnydLELHdxjF8OvNXb+8vMsn
	mJEyo9rQHETtXxcoVWMLOWW6XawGi3rW2sdVluM3k/HRTAVWyZ/2ClnOsnoPVHqAuVaiU54CNrO
	HOUwQE0UXl79PjZr0ugwdCIEgxYGlUUMNr68btIQ==
X-Google-Smtp-Source: AGHT+IH/7AZHVflGDIAmJDUB8km9duB1spqmtxvC8h5wY8EGyhYSwMmwBdGOw/GUihrZdBUrNpWeqQ==
X-Received: by 2002:a05:6a00:94f1:b0:7e8:43f5:bd0c with SMTP id d2e1a72fcca58-7f22f716104mr3793601b3a.33.1765395222112;
        Wed, 10 Dec 2025 11:33:42 -0800 (PST)
Received: from localhost.localdomain ([111.125.240.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm304828b3a.27.2025.12.10.11.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 11:33:41 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>,
	syzbot+c818e5c4559444f88aa0@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] ocfs2: fix kernel BUG in ocfs2_write_block
Date: Thu, 11 Dec 2025 01:02:55 +0530
Message-ID: <20251210193257.25500-1-activprithvi@gmail.com>
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

This is fixed by introducing an if condition block in
ocfs2_update_disk_slot(), right before calling ocfs2_write_block(), which
checks if `bh->b_blocknr` is lesser than `OCFS2_SUPER_BLOCK_BLKNO`; if
yes, then ocfs2_error is called, which prints the error log, for
debugging purposes, and the return value of ocfs2_error() is returned
back to caller of ocfs2_update_disk_slot() i.e. ocfs2_find_slot(). If
the return value is zero. then error code EIO is returned.

Reported-by: syzbot+c818e5c4559444f88aa0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c818e5c4559444f88aa0
Tested-by: syzbot+c818e5c4559444f88aa0@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
v1->v2:
 - Remove usage of le16_to_cpu() from ocfs2_error()
 - Cast bh->b_blocknr to unsigned long long
 - Remove type casting for OCFS2_SUPER_BLOCK_BLKNO
 - Fix Sparse warnings reported in v1 by kernel test robot
 - Update title from 'ocfs2: Fix kernel BUG in ocfs2_write_block' to
   'ocfs2: fix kernel BUG in ocfs2_write_block'

v1 link: https://lore.kernel.org/all/20251206154819.175479-1-activprithvi@gmail.com/T/

 fs/ocfs2/slot_map.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ocfs2/slot_map.c b/fs/ocfs2/slot_map.c
index e544c704b583..e916a2e8f92d 100644
--- a/fs/ocfs2/slot_map.c
+++ b/fs/ocfs2/slot_map.c
@@ -193,6 +193,16 @@ static int ocfs2_update_disk_slot(struct ocfs2_super *osb,
 	else
 		ocfs2_update_disk_slot_old(si, slot_num, &bh);
 	spin_unlock(&osb->osb_lock);
+	if (bh->b_blocknr < OCFS2_SUPER_BLOCK_BLKNO) {
+		status = ocfs2_error(osb->sb,
+				     "Invalid Slot Map Buffer Head "
+				     "Block Number : %llu, Should be >= %d",
+				     (unsigned long long)bh->b_blocknr,
+				     OCFS2_SUPER_BLOCK_BLKNO);
+		if (!status)
+			return -EIO;
+		return status;
+	}
 
 	status = ocfs2_write_block(osb, bh, INODE_CACHE(si->si_inode));
 	if (status < 0)

base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
-- 
2.43.0

