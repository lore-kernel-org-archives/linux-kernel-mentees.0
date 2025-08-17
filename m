Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0354939FCE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755445873; cv=none; b=mrYw+Sfw/+11wbPo8vvnFi8DRVTRn/jOepakQ0YSW50LX6OdtQj4zfQGzSv+l1DxWATUVEuxURw+JTpp1+Mo0sMTb09mpSBhS+76buYh32r1Uh86D+Qvy2lMZmvvuMvn9xvDQzg2Y1vCbGJ0IqL1/JWhRcuhMKnrHucVFvdgEuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755445873; c=relaxed/simple;
	bh=JR8jbMCs8QxjEzkOj58G229hlMPUMqRiNV2+nI2zpTc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Lfau0nCZHCwG47zQi8P36flbUfknqSdL7SSFB2SWhIQhALIBKk0FHOLW4P5N06NcnkmAS6w1jZCjIn8A8Dj6zR8NxlcGj8WuQc58GNQmufBx9fZgiZkTyDdMYVGaA+Yfr/rAY6r/8rvqHZUQkIEEMzn3UlwUMkjRq5x4Jve3xXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDPd0VI0; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDPd0VI0"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CA5540D40
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 15:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBHQ25SUzcnf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Aug 2025 15:51:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9ABE940C84
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ABE940C84
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iDPd0VI0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9ABE940C84
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 15:51:06 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-32326df0e75so2636620a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 08:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755445866; x=1756050666; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QjOJABZCp548naVzq1SVUQpsRTFmVx7Vnw2LNaJgSpc=;
        b=iDPd0VI0izyX4Ldvx4gOUf5lZSbOuchD087tsRqDAG9lGyDYCOudnh2r10ZqH20jbq
         Q1+ozGiEKEE9hjr4zwdcBusSzb8Zsa559ysk79WiUWH3valntJNvBHHKUtIj9+xfBUtX
         WknF7cC32aXP+ocMTlExTm/FamXzxUUpfRIkDRN6PNm4raDxb9uUj7IrZKF5vCcUCfcx
         54dBlg+eSMMGzLBUjUM2AYwUZHuEQ25vSF3m/2ze8OaLzsUqcshsO7Zr4IqbE5l0bKC2
         BFXoswA54P8WIOGEDO3QsMJ5uSM725EXwSjaSQjpnPpoIE6xsBEDEnpCuZc5Sd2Ul3Pn
         qLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755445866; x=1756050666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QjOJABZCp548naVzq1SVUQpsRTFmVx7Vnw2LNaJgSpc=;
        b=NVisi0qbeqYGtjB8BlW7eJ4/tlzhP1gw+KB7r15P1EDMhzEL9R2gaJ8dEbGcn3eaPT
         UDwzxpVW0NKEIgKxjFq6ZC97qPnyqZsB7xAJxaXjCYz2LznY93wyI1ebSPUwWLTsBY4I
         PuGPM1LC5X2dQxpuqTiyGnKHdv6bszzG9rGgj98X6tWliPD8a/ffUlniZfIe2ta35Cgj
         qe+AaLJLb4xxqwwTfsI9uSQXKOzDTfCBbNBaEab4RT2DRqq2EIAfNXDhl0VWiEJ5HIrT
         u2XqGhoSoMcvgtmjeaxlJJofz5hzfb+bMWDCUdcoS1j9KQeKBGezOtqgFg/lu2nI8/2t
         jwWg==
X-Forwarded-Encrypted: i=1; AJvYcCXv6Gfs0x55oO0lm/eGFtko66HijeF+CSuURRWiTyhUDkzKtth2/yfQdyDwRtqW7CPLfFQPXLxYnNSvEhKeAwtJDwBTCA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YytVpu8TAen2MmK9MQQr6ZroH0Y7Us/Fu7Wz7t2xfXYyt0fGNl2
	rcGiHAEC5arhC2mxiahg+L30EBwWrf7y4ZggQG20dvCVV63dUbxToADe
X-Gm-Gg: ASbGncskp01mdRaV2AHYx2I07Xy5X6GDbCN+df2KrjTplKX2PES3sqxRqI2zOwrvocv
	ibDj6B2uz3uYqrILLMUjM/psKAL2BARuWnnw2S27YV2ShlZr6KyPGalMcLKlDvBTqzCgoTA5BEW
	8KxsxZVTI2QgMoMJ6IMOfe8h39mJns9Wcvuqf3Hge82XEarlkSXlLFbOXBTbmWGjwndJGF8tfkm
	MvJJujaX3DGCyVxo1ZzfMkBprueOFYIsEkujxFQmvVbmhRYqRwQ7EbVHqHLiM1oqCMliXZlzfv2
	abR8o04bJQKt1B62AijQxu4ESfYw8NUtcMfChNreiXPI/gXeP8xqF5d2wUuEKhgiRxu0uPx+v6C
	RGqyyvCkkZHcrSCCCpr0=
X-Google-Smtp-Source: AGHT+IHpRWgCYbDi4joXJa+E8544/3ray+wLKLWD1YuD6ZGN7D13+dewr7cVSoJHVCWGfA+uB3mVkw==
X-Received: by 2002:a17:90b:3b8c:b0:31c:3651:2d18 with SMTP id 98e67ed59e1d1-3234dc64767mr9865139a91.16.1755445865738;
        Sun, 17 Aug 2025 08:51:05 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e45292dc1sm5221495b3a.50.2025.08.17.08.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 08:51:05 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: cem@kernel.org,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] xfs: Replace strncpy with memcpy
Date: Sun, 17 Aug 2025 12:50:41 -0300
Message-ID: <20250817155053.15856-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following a suggestion from Dave and everyone who contributed to v1, this
changes modernizes the code by aligning it with current kernel best practices.
It improves code clarity and consistency, as strncpy is deprecated as explained
in Documentation/process/deprecated.rst. Furthermore, this change was tested
by xfstests and as it was not an easy task I decided to document on my blog
the step by step of how I did it https://meritissimo1.com/blog/2-xfs-tests :).

This change does not alter the functionality or introduce any behavioral
changes.

Changes include:
 - Replace strncpy with memcpy.

---
Changelog:

Changes since v1:
- Replace strncpy with memcpy instead of strscpy.
- The change was tested using xfstests.

Link to v1: https://lore.kernel.org/linux-kernel-mentees/CAPZ3m_jXwp1FfsvtR2s3nwATT3fER=Mc6qj+GzKuUhY5tjQFNQ@mail.gmail.com/T/#t

Suggested-by: Dave Chinner <david@fromorbit.com>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
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

