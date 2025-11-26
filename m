Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912072DCBE3
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 22:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764194608; cv=none; b=RZShlBnCuFg1vqeUj1bntDg7r95Iu/n7RtUtbe9p8kQ7rCANsY4liG06HIIpOa726U82Kkm84SBvM6xklJT7ipCsS9UWLmLXooEG/pHDT5aRFcR00wpTSsGt9Ktgbfy4D5NpfJVjzQrSr2b4uunmmioxELw4FJaAtJHoosQZn8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764194608; c=relaxed/simple;
	bh=gpEAaLz54ppMQhe8wFhtmghwpmr0jWXftr/o4/+nN0U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=inoExto1G/200hiFcyQc4bne/abhdE59hDNghSbOuHfh1/3NApDV3UZZgvk7T+Wdln0PeAkvDDG7tbXOoCbclRgvsb3ROhltmGU7Q2sV9/VCdyrsFTllfWeBRFP2K1nmuu8xhhQq1SoO24pvQdZm1vwKrsZjwdpWY0jHQSJMthQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXio57A7; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXio57A7"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so523343a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 14:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764194605; x=1764799405; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZrxyU/8eB/Bsi4MeUVNsEcFjdBjR78Q52OmUOblKP4=;
        b=eXio57A7wWYEHTerwPrXqqgq5bclf60Ik15xPOrF3+KtxKl+LvRnZMEVqcxqCsfvW1
         r8uQZXHZFCOKoVjJGmIeG9ZAsU8+bA2ko3/I63X7FeB870h6Kd632dA+73EPfcQDxGkx
         gJLdQ+6tdWqQMDa3fFX2SQVfgS0ELgeULEgy+lsssczFFhK+0AITVW1NOERfUoaRUvCw
         I0VG5fnW8rFT2yheyVjXxAwyhItuLrBc7D8+YH4HJBrF3GCvlfRW3PnWuSCOCJhKZKn0
         FxR4XHfsjmFe5cR2UluzuYBe69KULxY+40DCTWOgOovGmD/gEY8hylb3oFinFPJ8x8/T
         b+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764194605; x=1764799405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZrxyU/8eB/Bsi4MeUVNsEcFjdBjR78Q52OmUOblKP4=;
        b=JXLq6Nt6UVDi8B8A6k2qJhbxLu7py+ts50Sr/MG5E7gdWVgxhOanvahg5IT12DOf6b
         aDBkJMqpbW82yXKl16W6uWlyOnN7wmFGdgne171FcxJFWGkX92fMUgw5/jrtAblPy52X
         sKZD+MhC4h9uvRgsB7f+wCSC8uRV7nnRu0t5uSC2szahwxyoE/nC9a+0wlpD6L0mW6A1
         smuWm4tmSE4J5dwbilsMeCgFHRp5IWH3DuBoAh+Xik2tuXxUVc07JFug+b3Q/dUt7m88
         O1Mj7A5uRfCSK/RNmQeKDEOKsfd3g49KLI39AAgSedMkslHrRFJk+jt7hHVcQsLEdOZz
         NEuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSVzsN2K58wYHVGOzLaapmRSvk1gZD3uCXKwBQolacJHoCR0IdAbA+b+CFpCw0BOGeOOT3DB/8JyBuFRVjOJ1013lanw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo77yXTihU4Bj7r8Qe84K9w+YhU3HWFHUbSx6NEDB406fTj/Oc
	MdsA3Ob22j2e+Mwgrjh/vVAgbGj1uv89NPunaQCgH15n9U8m9LqXjYN9
X-Gm-Gg: ASbGnctjLAJYREZnfukEVN7TdJWW8hlbfyw/vooRXmlD4S8h4iXEAh9jxTf1TeNJChO
	A9EmwGbEScizVNS7LMK4RXbsf4RB1Gqrx9d7/MFoy0SNK0a2gTQf7i2RyZ7mtVQor1LojmgyY6i
	XbuwcrFY2+C/WvvX0uTpQ6HbtnLnKBnvRYXiaqtqSpU6wgreOok1yn6k2GmMSY8nQZS4hNDsh0a
	uV60U1H1uEk+ZnfVw8+ksnnmFPKN4xmAPxlUsggOLGYX34awLKOoqotGzSKp93JCjtj8HmHsSHq
	Kt/mNghH6lAxtaNQJJ7tMjAv/UJYClKiMqxM1M/R+FsXKElQal/aD7TGkMW6WfZPY8hBp5k8cUp
	xQLGPR7iWhj5HWTAqCeki2NFGWeRvM44Aj02VtrHuwsjuOQrTUP0NE9H247cKXh/QTMZdQNs1KY
	SUmFVg6nEcfvh1v8JZ5Zeu9a3WB2YL8qnJN0XYSHyhMfCItDoI4is5wFYfbH+STBk1KuM0VXjO9
	0d0Nw6Y/ohXBk8+zTmWc0/69sPLDjLo5ksxDlglcg==
X-Google-Smtp-Source: AGHT+IEzYIQS5Bno+JN+mY9yGbvukqVhR7pJesFkM8oArSJ0APwzjY6jKMCN8b2tqjZAbKxZl0q34Q==
X-Received: by 2002:a05:6402:2708:b0:640:a50b:609 with SMTP id 4fb4d7f45d1cf-645eb2a8792mr8292964a12.16.1764194604647;
        Wed, 26 Nov 2025 14:03:24 -0800 (PST)
Received: from localhost.localdomain (host194.safe-lock.net. [195.20.212.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363b5a46sm19110312a12.8.2025.11.26.14.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 14:03:23 -0800 (PST)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>,
	syzbot+08d8956768c96a2c52cf@syzkaller.appspotmail.com
Subject: [PATCH] fs/ntfs3: Initialize new folios before use
Date: Wed, 26 Nov 2025 23:02:51 +0100
Message-Id: <20251126220251.856795-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KMSAN reports an uninitialized value in longest_match_std(), invoked
from ntfs_compress_write(). When new folios are allocated without being
marked uptodate and ni_read_frame() is skipped because the caller expects
the frame to be completely overwritten, some reserved folios may remain
only partially filled, leaving the rest memory uninitialized.

Fixes: 584f60ba22f7 ("ntfs3: Convert ntfs_get_frame_pages() to use a folio")
Tested-by: syzbot+08d8956768c96a2c52cf@syzkaller.appspotmail.com
Reported-by: syzbot+08d8956768c96a2c52cf@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf

Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---
 fs/ntfs3/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 4c90ec2fa2ea..00df27876c50 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -930,7 +930,7 @@ static int ntfs_get_frame_pages(struct address_space *mapping, pgoff_t index,

 		folio = __filemap_get_folio(mapping, index,
 					    FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
-					    gfp_mask);
+					    gfp_mask | __GFP_ZERO);
 		if (IS_ERR(folio)) {
 			while (npages--) {
 				folio = page_folio(pages[npages]);
--
2.39.5

