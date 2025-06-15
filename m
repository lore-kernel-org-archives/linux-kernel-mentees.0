Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B675023741
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 15 Jun 2025 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006001; cv=none; b=qmHdAY/ppKlGvK3ogIKMM9WzrL9Et5lkbxewwlBRCo+pM4jwh6RRxkFmAr/kyrCNAkBixvUDLHXSFFqTOoe9KM6+kYQjZ8r74jqZdPPQWM19TvfGOYUAKLhaAOWWUPanu9BBYjQFnObo3IPKcVjCrLJGS91Dhrx5Pz6loCS6Tdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006001; c=relaxed/simple;
	bh=q2nxxF8EAq7o49j+77+PCK6HtmLE+7HtQ93eW9eAVmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I1hgqY/keOL26WqK7+3u7uxIOWukwsiclz7KCz83xjenYZcP6z2QUaGMsqU5lnFqO7gm6SuEtwoSeUB5PsLcj29tiFPcdnFEhXhkGSaTKqTZ6jTUkzvY3caBe+Bv+TZOCctmerO37Lj0/GN7l8Vki2MThwHMiV1hg1qSHrryj3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEkOJo1U; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEkOJo1U"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso3314110b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 15 Jun 2025 09:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750005999; x=1750610799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibEFxJXBoB+iT4DQuUV/VzD7OboriX5WpdV9GnZMpc0=;
        b=GEkOJo1U+W6hBg7AIRxzAV6ipRz+xtzEa/+xIUMtuZuTvHFCdNYQ3bgQ35Hg3TCKWw
         h0O7rzLFMBEgrWKyS1JK9BvG7lPEGAfCAkPy5eT+/hZnxBholYM2+PpVrDtoiL4df8Oi
         fv7H+goq50dwdVpPuKvNa5B8NdetPGLq9gccbLUDlXsqWQl2UAJsxTTbyDcrrAaD4602
         bkBTiIxQ2O8yrya9TRiocIC209fXa9YSPghMDEF3NacUeH4yruxrbZTdNEskoQFRc4HO
         8tMdLeN+vFKKN7hp8Sop0WaABBBAomTPhrRjP9TpAUJvdzUlGUWk69wL9sDti9fUYI2e
         u4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750005999; x=1750610799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibEFxJXBoB+iT4DQuUV/VzD7OboriX5WpdV9GnZMpc0=;
        b=devVDbvVJvBtsBzuNWcyUSgFm+1LxnPQVWzz1UF8gLxJYbd2RF+OeT7Q3usg0S+jrj
         ulQwl+8KWGNim/wk1MGIv9XP1TH4YbZGJ3qN/ykGjGvQTgl/RSGBGWrLqY9UA26RLhro
         wtJZtMk+skPB0BRMsmdt/RU77skxRntwMSKcpz2jBdI7dVGWb3UjY3Bo6we//n9I50ac
         AdvAQyT+jcbvTaCRgizWUId4f/PRDyELWuODxT4gM+JRkvWbQOUee0Rw2xG+bC0LsCEV
         Q4quzpfFqBHQMHrzt2H2xpunXkXMtayMhLWXB05LJaMaPcgJAxDCJS4TCB/On6tlnsx0
         st6g==
X-Forwarded-Encrypted: i=1; AJvYcCXXUVRtUPCQry3GiSstRtG30NBPEaOT2kGOqD5oO1YxaUDlLjAHB4RMgGAG0nRPAd322YCaL/l9nNPYXf3NbdIcT9rKKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFO0ySrMC6TCplsrV60BgOriw5dswdiSyVI//HTAT4iHhKX/rG
	C8uDswAbJqQaim6U0XZK8u+dQ9j1N99MNWnB6OaPr5AJpG7pI8MV8oTy
X-Gm-Gg: ASbGncuqfzqK4T/fUbYyMdGZGCKbqPlTdWua8VnH+vPEMceljO5hJ5TBRmE5QR8jGle
	C8C2Wo3c4WIcJVuWunOfBQLVz/udcHk168guwQ6g+9FzTsOhUnQ+j73xHl0Jd2SmoSuHcgT54i8
	bTUTohbvGlFNvcEyIqhLKUutD9z+cROpC/91ikjYEBO70rIgalNPc8qYRtyLDT4UKBIi//gHoZw
	DRDHyeJHwvxf5eKXSG2W+ck2l4AcXAvt9OVIl0aVPUeG02VN9G8Qi8WmuJ1Qjohg9O7acEsQ5Kh
	eSkwRCXmDc5qPswYc+s1JJrXfkPDN2UJXXYjYe9zzDjQuJ9RCIDBGjMBpo1h080Tn89KaaVQ+uc
	H6VTtJc7pRfI=
X-Google-Smtp-Source: AGHT+IGw3WEeq1IegtvXBbQUHIc1MttDbgq2J09zuF57yiEiqxFXoWyS2xx1d8cXCyVf7frzjI88cQ==
X-Received: by 2002:a05:6a00:1781:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-7489cf6a9ebmr8371431b3a.3.1750005998875;
        Sun, 15 Jun 2025 09:46:38 -0700 (PDT)
Received: from localhost.localdomain ([122.174.173.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b2c1asm5233378b3a.143.2025.06.15.09.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 09:46:38 -0700 (PDT)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: kent.overstreet@linux.dev
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>,
	linux-bcachefs@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+cfd994b9cdf00446fd54@syzkaller.appspotmail.com
Subject: [PATCH v2] bcachefs: don't return fsck_fix for unfixable node errors in __btree_err
Date: Sun, 15 Jun 2025 22:15:38 +0530
Message-ID: <20250615164547.11900-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After cd3cdb1ef706 ("Single err message for btree node reads"),
all errors caused __btree_err to return -BCH_ERR_fsck_fix no matter what
the actual error type was if the recovery pass was scanning for btree
nodes. This lead to the code continuing despite things like bad node
formats when they earlier would have caused a jump to fsck_err, because
btree_err only jumps when the return from __btree_err does not match
fsck_fix. Ultimately this lead to undefined behavior by attempting to
unpack a key based on an invalid format.

Make only errors of type -BCH_ERR_btree_node_read_err_fixable cause
__btree_err to return -BCH_ERR_fsck_fix when scanning for btree nodes.

Reported-by: syzbot+cfd994b9cdf00446fd54@syzkaller.appspotmail.com
Fixes: cd3cdb1ef706 ("bcachefs: Single err message for btree node reads")
Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
v2: Return the given ret for all errors which are not btree_node_read_err_fixable when in scan_for_btree_nodes

 fs/bcachefs/btree_io.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/bcachefs/btree_io.c b/fs/bcachefs/btree_io.c
index d8f3c4c65e90..940f7ce2e33e 100644
--- a/fs/bcachefs/btree_io.c
+++ b/fs/bcachefs/btree_io.c
@@ -557,7 +557,9 @@ static int __btree_err(int ret,
 		       const char *fmt, ...)
 {
 	if (c->recovery.curr_pass == BCH_RECOVERY_PASS_scan_for_btree_nodes)
-		return bch_err_throw(c, fsck_fix);
+		return ret == -BCH_ERR_btree_node_read_err_fixable
+			? bch_err_throw(c, fsck_fix)
+			: ret;
 
 	bool have_retry = false;
 	int ret2;
-- 
2.49.0

