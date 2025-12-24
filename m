Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95240218AAD
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Dec 2025 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766594607; cv=none; b=L/MD08b7XgxzqmfbLjwRfj4JephQaowul727Sk4xEtL18+/6K3FdQOX81Hae1DEgzo9XL7SvS7M2DccJIiqYMqmbRTFRSBc1lx0W/WdwKfTA6pEl6QRYDisGBxuCYrT/Hpi8t/HrvxWG20tCnqJiUKZp/YqQG3KlWC8DIM98A50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766594607; c=relaxed/simple;
	bh=AiiMcR0T/Q577F9tdt0FEwOLmgTPTKSndvU3PGKdp/o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ADfWdefEcMzsALnNN5jHpn8KdwVuUCg8x5AQk/zZJQoXgtBhqOlqhHrcVQ71PRceGdvLV+Si9YJ5x4qfStpCzLLBLfe/Q3xyTNyNAq6WdF5EqmkHdok1/xN5JNIoV4X/J/J4q5CjJsbLkRdk1CaDUVCDAKcd3uomqDYJ5JrXh0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwhfbFi9; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwhfbFi9"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7f216280242so2179715b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Dec 2025 08:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766594605; x=1767199405; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssG8N04RBTKk33KNiGJ23C3mBaOiOd3tZk3DIrx1DLk=;
        b=JwhfbFi97iUn9CjCGuV6cGTz60Rq0HLOgLGW4THHiiIZd3poNyk7pc86lipTC7IIke
         uqSJP5vO+dNfOtteLru0AdBD3y2ZUelfVLzJtdbYo636YwTyqP35t/edYefInjR3vadP
         pqPVMmDc2Cj2VGXyCjKU2PsJglDXjY6257+RGgy2vBjr6NC8yhoAfbTNJtAOGtJax3fh
         2se/JJ5GV38DSlYPRUfzwyqSegCvZWgxRnkL0xcr5X2Mse97p+ovIi/Xp8ifqK2O6NS8
         U9B4kdZa3OdcGFKGxzgkF6GGBMJWmyCAFNHkXnLZ9HjHPRpupGbjTA9QzlpaQaXzEqIG
         GjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766594605; x=1767199405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssG8N04RBTKk33KNiGJ23C3mBaOiOd3tZk3DIrx1DLk=;
        b=qJTp27WND/2FHpgMDO/jOoum2Iven9TIyFcZr/fxs3tzj0j0CbmelwZtk/SbCuk0RT
         yI6v4q748aF+4a43yg8O/hLGTbPAhiRXN1ms6Wa4y1qmnWa3g0RMFfEvDBGQlbf/YH7a
         U75p9oPSuLcdlbUlLiUImsSXmVBlzRtY7dMjWFRbpwNP0GnbB7jBYpNoprWVC4yo+gw0
         tqPemI1rWt18MHpJvDSOWqPFlmUDiPG4h9n4pE9e6eeSChdUVWkEUjDRK55GdwBrz4Hv
         8r9V8VPN1cxL0ZsKOSGdIpokM5GYSruOK9uv6gGfOnjBTEiT6bW69/MNKuRbPyRFjjQ+
         2iEA==
X-Forwarded-Encrypted: i=1; AJvYcCUTOOn6NekDQBrRMFzu4V+5SXv3j1HYTRWb0Am8f7vDEbH3ZvIWVNBQMeuUoET3UAi4qnaYX2eb3POyNL+g3dY/BWoppw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdKKYHlScH5trKQa3wz+YiBSdLywFasalqEH9nYlpsUG8sHxN+
	wPQy3jGGsBXCXWm2MrfasjmSqHsPJpKGTpRtKiZG7geIoxj8Y7MJKk8E
X-Gm-Gg: AY/fxX7cBT6PV9XpDdTIg/SBzeeEGBNA/lwsc8jZah4oE9nhAyg0jdGVaOGjeW7ErCn
	GS+1J20VcZyc0++4V8tAsgkA7xbWsaeQJnf3Yn/lXxNbT59Uann5M2i/2fRaK20GpVF+2Q9EB7D
	L5l2rMLJd0ezFfRBAmvaHfNunBUgNpge1zf32NnI/QXdwVXAHu5TWpuy/Z/Ma8PxNBiXZu4FAQi
	mFemPepH83tQXATa8WyA6962fQf8lm/tYblzkPWTszuLk7MpD12CWufHb58nSeOmE/ORQ9MiK2u
	OqvHTuTuPavLtbE6WS7jIRPuLYke97nti2UBW+Azz0S9x6sBTudcDJNJpVnnHLL3HNIJDPBuJMc
	kS8vlSTYvBjuTwzS09bWICZHAWX0gRpMiLJj+9cL+OPxHUeghec7/dm+hcp+so5nSOjTW33I/Fx
	jI9WFBr28DaEZXoDqk/Jn8+SBVG95WJivI2r8/qqs=
X-Google-Smtp-Source: AGHT+IESuNtdg7r6U8V3avyj/W74Bs7jNYRoapVQX/S1yMhl+s9xpYrFbDcjHGddBIRzo8KRQZaBBQ==
X-Received: by 2002:a05:6a21:328c:b0:342:fa5:8b20 with SMTP id adf61e73a8af0-3769f9332a1mr18035364637.30.1766594604796;
        Wed, 24 Dec 2025 08:43:24 -0800 (PST)
Received: from localhost.localdomain ([111.125.235.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82a10sm159726745ad.26.2025.12.24.08.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 08:43:24 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	brauner@kernel.org,
	jack@suse.cz,
	viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>,
	syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] io_uring: fix filename leak in __io_openat_prep()
Date: Wed, 24 Dec 2025 22:12:47 +0530
Message-Id: <20251224164247.103336-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__io_openat_prep() allocates a struct filename using getname(), but
it isn't freed in case the present file is installed in the fixed file
table and simultaneously, it has the flag O_CLOEXEC set in the
open->how.flags field.

This is an erroneous condition, since for a file installed in the fixed
file table, it won't be installed in the normal file table, due to which
the file cannot support close on exec. Earlier, the code just returned
-EINVAL error code for this condition, however, the memory allocated for
that struct filename wasn't freed, resulting in a memory leak.

Hence, the case of file being installed in the fixed file table as well
as having O_CLOEXEC flag in open->how.flags set, is adressed by using
putname() to release the memory allocated to the struct filename, then
setting the field open->filename to NULL, and after that, returning
-EINVAL.

Reported-by: syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=00e61c43eb5e4740438f
Tested-by: syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 io_uring/openclose.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/io_uring/openclose.c b/io_uring/openclose.c
index bfeb91b31bba..fc190a3d8112 100644
--- a/io_uring/openclose.c
+++ b/io_uring/openclose.c
@@ -75,8 +75,11 @@ static int __io_openat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe
 	}
 
 	open->file_slot = READ_ONCE(sqe->file_index);
-	if (open->file_slot && (open->how.flags & O_CLOEXEC))
+	if (open->file_slot && (open->how.flags & O_CLOEXEC)) {
+		putname(open->filename);
+		open->filename = NULL;
 		return -EINVAL;
+	}
 
 	open->nofile = rlimit(RLIMIT_NOFILE);
 	req->flags |= REQ_F_NEED_CLEANUP;

base-commit: b927546677c876e26eba308550207c2ddf812a43
-- 
2.34.1

