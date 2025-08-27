Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A1E2BE7A7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 22:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756333126; cv=none; b=OUru110oxqr3N0VvR3F9Vxnp7l6v6hB6NktbInOityP6N6AhTBPxVkQoMV4ChPq0I519Fq3/BS4Zu8MpmNAmHx2gQYa1AfKWtlyCRVmOdcSyyea2ZEOmH9y2yqfsv7plnZqaeYus+HEDVvGzpBByJHnJ7bxLGuXi3dy6R5q5f9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756333126; c=relaxed/simple;
	bh=yKEOzvSZkzMKgqF/7rWC+AeAsHM5EazimO28ln893wg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=IcwD4MvDoZdcK4HOpVPFJyMhtd6uPEKU8ktFfuZ6HqMOUpyxag2tgs8zrzeJMlXl4QKb/LYgnebRhH3czG+BqjE3JKD3Y9Uk8Jf2ihgU6CN+x7i7MaIveisCqJUACu7NjzwbearlggdcsSig6uWVCZM7/XitdppEpcXX2akHDtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vm8wuyD0; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vm8wuyD0"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C40B661274
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 22:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKLP2V0CFMfK for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Aug 2025 22:18:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 083796126E
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 083796126E
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vm8wuyD0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 083796126E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 22:18:43 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-24458272c00so3725255ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 15:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756333123; x=1756937923; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fnKCQ7KlE8GdkQRPdMNE8B421OcFBFXbPzdlUFE9jn4=;
        b=Vm8wuyD09IVRsHOeGgjK9m/FRkjV4ajIK+0LQH0GJXNyQHpmtrDFIiISmKeMGlTceZ
         VsI9CQCf89BV+O4ssPG/K/DuC08iCGKN43C8wksMRedNybh68/Vn5AuYnNC4FyIXULeo
         UgARttJtkNqG5m7DQJqs4IVVwUR6UaspnlglrPqLgkaNlGwdp90mNxzAdNIJ+fT968DV
         kET8cZKZoZrDVEXsWnudHVr2McQPrANYSMmR/66D7E7/MNnIQvAQasST3DFxoKDr4tNv
         R/mVoxvuEv0g0bkqKW9pB9uaddu0SKmAGRWCnwx/kQ0qaKMCFnW9f/QxKnj8O2ZWqzLM
         x6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756333123; x=1756937923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fnKCQ7KlE8GdkQRPdMNE8B421OcFBFXbPzdlUFE9jn4=;
        b=i6kVNpDk12NxePXg+IbT1MpLrPHz74vpPOm7eY08NBxow2v5YslMYXaaIMGeRsyInH
         cjHH+fMUZHEaRWG+//b1ktcA2XaDa12VSgmIW8I396g6J78nRgLBDiLgUtXkpx8c+4ri
         VGs2aGKuPlKH0mcwdcvR30cWKkUWIEBX8y3Gb1pvqrQRv0c9HGl1UOAQOyykYCK6++bw
         gJOPziBD8425Buy6tso4XUjkcszUoAtPvw3ffKGH04XDe8LuM+qW+mkSt02jgX1lUaJQ
         YSQGufLX6R7wjNGOMKoWoymcrbcboxsqisQsmXu98BmD1y4Z8pNpqJ471Ortapve8tFl
         iHlg==
X-Forwarded-Encrypted: i=1; AJvYcCV7Eo92caNvfm8ALjivhA+gm+JVc+e06GSm+dzV3rV6ZWfKXgIj/dBUZ8aLvPRnF8bPggMWr4eRr3R8uqSbS83hOI4T8A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwkQCLN9hjNR5zaSKQpW6TICDkxc/BCyULFl1WIbu/Gyr6a5sIM
	4/sMuAsFbWiMT5fRZmHuco/9yOSe9XW83E6lTXle0d97JRs6h/min+tR
X-Gm-Gg: ASbGnctdw4wJQx9tyGYwNxBMdcGmzdlDRRNn6JDwTgbxu6Giww+8jYOqhJUNQ05P0RR
	YVvDTo1TmZZT3pRX84U1OdPb95xCec75DGNgqWfrTCaXIkMs2qfadTKP7GmjjpTKFURd1QzseEk
	iWdoLUHDU+Dj5VOezJmpUuiMD9oAax6zLrcPHXDSv8cl0MA7MdUkURtagi5EGUpK0za1KQkM5Dw
	zjtf0ART9DNsmC1wSvcwAywhpskCePTdyZTS2L4qto4UQ0LQVUfxLoltbCaV2OV/PnJvANhgV7W
	TresNeKibJQCpN1Mz819zs6E04uz59wVEcvOQZMJwftngPPWedMv1BiB7K20+U6PXAPsWLhtSJr
	wgSgPxMk1/uZ1NcI42x0=
X-Google-Smtp-Source: AGHT+IHGV6KTJjO6YOxBOSnA3bu2gMF+DC1x7BOk7w/9r1S8JPMjnHhC+6uDDjwViwSp+DqWZK5QRg==
X-Received: by 2002:a17:903:288:b0:248:9677:5f33 with SMTP id d9443c01a7336-248967763b3mr56989255ad.3.1756333123181;
        Wed, 27 Aug 2025 15:18:43 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466877b67bsm130771905ad.4.2025.08.27.15.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 15:18:42 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: cem@kernel.org,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3] xfs: Replace strncpy with memcpy
Date: Wed, 27 Aug 2025 19:17:07 -0300
Message-ID: <20250827221830.23032-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The changes modernizes the code by aligning it with current kernel best
practices. It improves code clarity and consistency, as strncpy is deprecated
as explained in Documentation/process/deprecated.rst. This change does
not alter the functionality or introduce any behavioral changes.

Suggested-by: Dave Chinner <david@fromorbit.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Carlos Maiolino <cmaiolino@redhat.com>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
Changes since v2:
- Fixing some errors in the commit message.
Link to v2: https://lore.kernel.org/linux-kernel-mentees/CAPZ3m_iNj2zwpAovv3BTz8gNp5XzdxSRHBFonM9sJvaSjYVBeg@mail.gmail.com/T/#t

 fs/xfs/scrub/symlink_repair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/scrub/symlink_repair.c b/fs/xfs/scrub/symlink_repair.c
index 953ce7be78dc..5902398185a8 100644
--- a/fs/xfs/scrub/symlink_repair.c
+++ b/fs/xfs/scrub/symlink_repair.c
@@ -185,7 +185,7 @@ xrep_symlink_salvage_inline(
 		return 0;
 
 	nr = min(XFS_SYMLINK_MAXLEN, xfs_inode_data_fork_size(ip));
-	strncpy(target_buf, ifp->if_data, nr);
+	memcpy(target_buf, ifp->if_data, nr);
 	return nr;
 }
 
-- 
2.50.1

