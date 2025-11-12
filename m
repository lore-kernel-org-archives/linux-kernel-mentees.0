Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAE628853E
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Nov 2025 14:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762957219; cv=none; b=Pal9AZtJHCe5N/ywt4AZQdL30sgFFmRoMGrPsXBYgdNqDruUCqmcvmd4ZJ7e20soxnld3bgCZPrItZG0bB9y+NcV384EgRZsbK4AFk7qXV5ldlG5LDzH/NVw3NinUuH1pz52TeliKpAJ1i7kEIZE/BAuBvt46nDVK5KdIC3hggc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762957219; c=relaxed/simple;
	bh=PLEsEAFhjPh2pioJvZvoAHlFGMw3+0W/MvVkutfYANE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mIPy8eRnNsOYlQL/tZ/e0nDo2nGNQexL7Cm/blnNg6Qcj2XQkjas42rh50+fZr/2/Ksi6odcrrLn/j23n9tr6K0juLedHP2S2p13WoA3qJn0TtXnV3FVIjm+lgcj6Wmv4MYgKYcbcn1dE1izmdzW5Zm+0xbqDvGQjJItDr3BT+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGXRKNz0; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGXRKNz0"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-88f239686f2so83615685a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Nov 2025 06:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762957216; x=1763562016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=23Yna8J3d3mh9gPmuO4K36N9DnURcSnrYweW3R/KSeg=;
        b=aGXRKNz0dWuzc5wSB9fQLM3IvrMADxJemQULvbkvDo7G5jzkZ49lkJAZuhNCf+y+oQ
         wD0LXMdA9wVFtxJqNiS3bzLJOjL22Ko5rdRRVMt+Mg7bK6kv9ocro6a9A9RJOjvLZDg4
         Db2zwSotK7DMmCbkA7mkV2HGcNKyEX6VLA/kYwUFy5iQW1yPufM6AW4SxIie/dHYdo7A
         1QbXuQ+y2gCpkeiT8bWlqvINyRp5sEsRSdFdXOSeRTB/SboA/tfNYNEU1GculF0YpA9K
         56paCgMbwyqzamjmUei6NAt7zjioKZkkiFJIeyeQflOszC1ysrlod5MQ8P5HFmfnWBVH
         hjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762957216; x=1763562016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23Yna8J3d3mh9gPmuO4K36N9DnURcSnrYweW3R/KSeg=;
        b=kQIx529uts9WvuezSNmHckjdko3Qp84yKNE+t76UTgs2RN4RyLT3VLd0pX0cpKH675
         xA/DfNbCuCMMKfw8L8bqRgOnDGAki4vqvhFiOespwcWNZPIoSBsm8JC7JS9koQ8GqEPF
         xcRnlek8X6ybcLnznVHAEY7RVFEBh9EgYgKTiEIMXsmNrx0Em1EIeTEW4Z+IrPLjYop5
         4NQpuGIloGkUY+i/lpUVns9lycx8T0LxKApO3EDcVf800vPvi2uUlXjFs2QzNd3pWMCd
         P6TSmG3nqTwLW92zi87hViI5q27AZbSo+y8CSv1l9M04CHOOF2g8WDZUThg03lo91dDV
         1o7g==
X-Forwarded-Encrypted: i=1; AJvYcCVQKUSldmOB7QLeqyl3QAWOGfZDMY/g02An+36n2eZ0aB1J32vKv+EMxv6qnUVs0pqu0MrVZJL2arRPWA4Gcfpj1Uap5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZNmg53WgPNsN7d0tLpJ9roMQIpIBucMKbqfdSwqZzqh+0dUfs
	MiRhahI2UUnwQn6fMsjkWbC1vKNw8abxo3Xuz4kK3HE5Y9o1HCjevtaB
X-Gm-Gg: ASbGncsEWfvm7I9uOYVykMKyR7LuFUMCj66F5pjshoBHo9nt2wGR0SWiXNj3may8tUa
	vN4vZC/dgxSC0tr4n13r0piJpVcZxSC/h6PjsvtYdSSlt0Vg1x18AQLm7g1x8BG3myjeH9NSt7/
	KImvLK/ydYFKz0Hp5LPQcjp0ItQEuq16CJH0co2doQ3Gto8K3hVvzxI1csJZ+tQadWVP4PHsGgR
	D4ul8oNPaRCFbMYTsns0BermBnUZDqsLlkPoGiSzulUqkJZK5U+Q0QXeLGU0YlpARFcPmgUgFUZ
	0B4W85aMh11BIvPHjDRljHJbSt+d5lxV3CO84ph8ThX1lntGRvvMqshfs8CDwcYaz5NV9AQtL0T
	xY30Jh8HgLVygfjR8pkW62y63rtbNwkL07x8vstGVYzZXGhQrpSdKnZTm2UOBGCYeS4Bcnm59ba
	lcL09vv4mKVLlgA4ZjsIhe
X-Google-Smtp-Source: AGHT+IE//gkdyNvrQQM5f0E3fJn6m5YN9A3KpABhw9zY72kYOdyBFwY0fArMYvrWnTVYGlxGj7DiIA==
X-Received: by 2002:a05:620a:458c:b0:8a1:87f8:6632 with SMTP id af79cd13be357-8b29b77a7fdmr423471885a.32.1762957216282;
        Wed, 12 Nov 2025 06:20:16 -0800 (PST)
Received: from rpthibeault-XPS-13-9305.. ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29a84ae06sm202417785a.12.2025.11.12.06.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 06:20:15 -0800 (PST)
From: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
To: cem@kernel.org,
	djwong@kernel.org,
	chandanbabu@kernel.org,
	bfoster@redhat.com
Cc: linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com,
	Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
Subject: [PATCH] xfs: ensure log recovery buffer is resized to avoid OOB
Date: Wed, 12 Nov 2025 09:10:34 -0500
Message-ID: <20251112141032.2000891-3-rpthibeault@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In xlog_do_recovery_pass(),
commit 45cf976008dd ("xfs: fix log recovery buffer allocation for the legacy h_size fixup")
added a fix to take the corrected h_size (from the xfsprogs bug
workaround) into consideration for the log recovery buffer calculation.
Without it, we would still allocate the buffer based on the incorrect
on-disk size.

However, in a scenario similar to 45cf976008dd, syzbot creates a fuzzed
record where xfs_has_logv2() but the xlog_rec_header h_version !=
XLOG_VERSION_2. Meaning, we skip the log recover buffer calculation
fix and allocate the buffer based on the incorrect on-disk size. Hence,
a KASAN: slab-out-of-bounds read in xlog_do_recovery_pass() ->
xlog_recover_process() -> xlog_cksum().

Fix by removing the check for xlog_rec_header h_version, since the code
is already within the if(xfs_has_logv2) path. The CRC checksum will
reject the bad record anyway, this fix is to ensure we can read the
entire buffer without an OOB.

Reported-by: syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9f6d080dece587cfdd4c
Tested-by: syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com
Fixes: 45cf976008dd ("xfs: fix log recovery buffer allocation for the legacy h_size fixup")
Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
---

Can xfs_has_logv2() and xlog_rec_header h_version ever disagree?

From my understanding, whenever the h_version is set (e.g. in
xlog_add_record()), it is set to 2 when xfs_has_logv2(), and 1
otherwise.

 fs/xfs/xfs_log_recover.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_log_recover.c b/fs/xfs/xfs_log_recover.c
index e6ed9e09c027..08d7b25c4ab1 100644
--- a/fs/xfs/xfs_log_recover.c
+++ b/fs/xfs/xfs_log_recover.c
@@ -3064,8 +3064,7 @@ xlog_do_recovery_pass(
 		 * still allocate the buffer based on the incorrect on-disk
 		 * size.
 		 */
-		if (h_size > XLOG_HEADER_CYCLE_SIZE &&
-		    (rhead->h_version & cpu_to_be32(XLOG_VERSION_2))) {
+		if (h_size > XLOG_HEADER_CYCLE_SIZE) {
 			hblks = DIV_ROUND_UP(h_size, XLOG_HEADER_CYCLE_SIZE);
 			if (hblks > 1) {
 				kvfree(hbp);
-- 
2.43.0

