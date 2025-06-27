Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB71CEACB
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Jun 2025 16:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042504; cv=none; b=EqO3iGCLK6bwmpmMxbhce2O8tgO7tygAU9L2KJiXHFGXYhTCbPQfUTarXpNZQCtnMUgXo++QcTWt6MJYod6+kSieVCF7bkNS3wbI8JHGsdUg8PacMDAXCZPJ086Ogl2qA2mVWA8gQT4XIbbGNoMlf1AdSM9dZZI6hGa/WIVF9Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042504; c=relaxed/simple;
	bh=ZuEQ1zQrVtuPrJ/IhK0yiaA3AB1kj94s9i4/FDqfzHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HrrWJRjDZREYnGma9NjVQO6NAvdBhaPDoxWvVx7lQh8Tq8d4uuuCtgkVWizF32uhwBOod4NJejgBvSqOkRu9rYtzZtBBy3vIpyk3hUN58YL1VW9y921q3tFGT3qpBxzCFWk3E2TjbGKW62KGh+qkqnRiREapCmozTSFLbxe4fSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6QQ1g5A; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6QQ1g5A"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748e378ba4fso3440524b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Jun 2025 09:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751042503; x=1751647303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2i7605PqYhjxoEfLi96zRKazL0WE2fE/OxEmeLqdoGw=;
        b=b6QQ1g5A2TGytKdp6N8JnrIklc4yIminsHDPZ6cPcVYZjWfBpM2O388m3tA3x4dvhn
         IWAw5PK1O+kXLKk6HhRocqMxi0tTkl1FqkjUGoccaqrG07kFKSqD1sdZcXq8iSOOdQOd
         pMxhSxB8wHsqeoDT/r+p4qrCWr3GeXmBedBfkKsVb63CbMgPDc2IBk2RQqyS/4MMOf1k
         XVAPm+jncghoQkjzIgttqwxihzBw6CkWsX8jBCs2plqJ898yhRFH79fMhxv+Bkwup5TS
         D6GLUIL4kCPYWfioWpNwSV0VSebx/ulkjqpdvuaLoulqWwPRbSjLMa7RXKjYqneBIUyA
         VQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751042503; x=1751647303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2i7605PqYhjxoEfLi96zRKazL0WE2fE/OxEmeLqdoGw=;
        b=G52J5VNRjRsyfrwTXmUUUtkdqrIp3Cob+rduDB9sHKSvkiHRLP3FpGZ73+ZQi+g7eb
         /Q1GizHn3kljhTdZGcH1JFQhEb7YoIacj23rwAhBfC45WDIzTT5dlo1LtOray3kCJiQN
         /2QC0GeUOpyAt2PdX5aPiFL9KeSTSASxvUa1kGpqIDBtBwacW94OhjDhQBpw7TaqHJ+Y
         7+kkrzTc91Gd/XHgTwZs4ZgpII2qNBUYpo/ritzA5ymebhmKO0TWJBYZ8bETdtdNjewD
         f5NWeY/cMrgDLEKTe76VHnaQ2qPvIWrJ8JssI5XLbYjxBSHLE0ZNU8PigeoDkh7QjmBW
         MQWw==
X-Forwarded-Encrypted: i=1; AJvYcCWKo+ITa0aqvpO5sSGBl9sHX/AR+9oXLPnyR9QCg8Rwyf7PjafTvQqjOvgH9NIqLK8XP1lqaA2UVxKzedXOiZ7GimV53A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzShDwWNPf9sseKavxZduZjHQVj57U2jjTpr2J3Z+sm0uMar8UL
	fXWUzBACCp9FqNJ4G8vtXibSfE+uCM9xguj2led5at+FI3I5CDjXAbAQ
X-Gm-Gg: ASbGncs59bbVmHua8UFeF/NI4R2gLi15ghmRuTnXEMVdsqfEnknKjXQquvXCdaew6fp
	3lSf72qvqihyzh4Gjj+oBDGc4TB6boPDtxFQ9H7a8uH+6mxU0JLGgOvSLNKPPrn/pEGL3is/JA9
	QrfvygPuovxynowm/xN1dJ9TMSb0sPRpf6P8O/u2sMJMTzyoIVx+nGo8elVLl+yVMsiNGP0zJuo
	zkCVjFzWMK7paB2raGN2dhncZ52CIt3RLfKWah39UUBl0zzntoIb7Ws/NiKOCwjVG5PbmSTDUFs
	/SGjtl8Vfz1LNbAQbB3znHTmmbu1rjR7jTpzBlg7hncO6YR/3L6gpEG2ZZTB+hhaIVmTkQ==
X-Google-Smtp-Source: AGHT+IHaDj/27wSNKkgOMC54QMnSSkZsPoqTkAu/WqBajOE4jy1fA/XxncHSudIk4NwzKEBXIrs7cA==
X-Received: by 2002:a05:6a00:4fcf:b0:749:b41:2976 with SMTP id d2e1a72fcca58-74af6e631e1mr6081658b3a.3.1751042502636;
        Fri, 27 Jun 2025 09:41:42 -0700 (PDT)
Received: from archlinux ([136.185.226.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57f7e6bsm2644083b3a.179.2025.06.27.09.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:41:42 -0700 (PDT)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: kent.overstreet@linux.dev
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>,
	linux-bcachefs@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+029d1989099aa5ae3e89@syzkaller.appspotmail.com
Subject: [PATCH] bcachefs: mark invalid_btree_id autofix
Date: Fri, 27 Jun 2025 22:11:29 +0530
Message-ID: <20250627164132.25133-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checking for invalid IDs was introduced in 9e7cfb35e266 ("bcachefs: Check for invalid btree IDs")
to prevent an invalid shift later, but since 141526548052 ("bcachefs: Bad btree roots are now autofix")
which made btree_root_bkey_invalid autofix, the fsck_err_on call didn't
do anything.

We can mark this err type (invalid_btree_id) autofix as well, so it gets
handled.

Reported-by: syzbot+029d1989099aa5ae3e89@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=029d1989099aa5ae3e89
Fixes: 141526548052 ("bcachefs: Bad btree roots are now autofix")

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 fs/bcachefs/sb-errors_format.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/sb-errors_format.h b/fs/bcachefs/sb-errors_format.h
index 0641fb634bd4..d154b7651d28 100644
--- a/fs/bcachefs/sb-errors_format.h
+++ b/fs/bcachefs/sb-errors_format.h
@@ -314,7 +314,7 @@ enum bch_fsck_flags {
 	x(accounting_mismatch,					272,	FSCK_AUTOFIX)	\
 	x(accounting_replicas_not_marked,			273,	0)		\
 	x(accounting_to_invalid_device,				289,	0)		\
-	x(invalid_btree_id,					274,	0)		\
+	x(invalid_btree_id,					274,	FSCK_AUTOFIX)		\
 	x(alloc_key_io_time_bad,				275,	0)		\
 	x(alloc_key_fragmentation_lru_wrong,			276,	FSCK_AUTOFIX)	\
 	x(accounting_key_junk_at_end,				277,	FSCK_AUTOFIX)	\
-- 
2.50.0

