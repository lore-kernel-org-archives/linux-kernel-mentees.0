Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E008D2FDC39
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Nov 2025 19:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763060496; cv=none; b=l8Ti4lTrX9SgOosBIBbXAsLAVUEyI+AQhjxl+zRjxOVE8Gt+qcZY2pKOTo6C55WdyBg3xTnPG9iW/4FVn7+5+ll5OVjh5RHjmoPz2ouSRA6fcpBF+SgWc9jS3fSWTDfKTpHe3WBfm7d3Z1lG8ESPcuviXYif42Kxly6QrkGDaYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763060496; c=relaxed/simple;
	bh=fID0wlKsgbuZ7rLqJxq2UYo2wKKAiX+fNDsl08zChrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJfdknTlAbLtCE9p0HXTzJIsFx51ziw6R/P7MQ0Ei5aJ0oq9ALvjlpMJQ2yfM0x+TLXgc52pQiaaA6MyvSWwIdRzeH8o2eJK/jKRALacYQH15pKUdEP0T0MHJGJcOhJ0bXVnNs5cXT9oTGRH4ofeOOriaRTFGAppzRVWz01Fdzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMPx89bl; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMPx89bl"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2627269d5so144036785a.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Nov 2025 11:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763060494; x=1763665294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUv3ig7gKTZiQnNq1vm5mpP4T0fDG8gYNVbuktfcpJs=;
        b=nMPx89blVKi2K02uznnACBjk9wggi8zf/zWDCfGX7Kack24QaPuKyVh+val7j4MOr6
         r5XPv1fscW1TNJ0PqgNT1Cuhdd5+K/7j/xk73oocL4U0LCZPe3OOpamAzJTPOTYzjju6
         icZvo4L4KNQlfNt/FuVhnho7AHPZUHWHKySukHnN3p3RzLIaAKUZQoRtM0G1T7TQxRaY
         zf+nBQeFpY6ZA6aeqkE6ScQj/s94BPzizKyNILbBPUAOgLrqiGXSTupAX4OBkYMC3IPX
         kz70JP5R62T5C4JCnMhla3L5e7fdmWIm6ZFTJU0hBQWBwvvu+W47MozQRyWewZOCqKCU
         xbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763060494; x=1763665294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MUv3ig7gKTZiQnNq1vm5mpP4T0fDG8gYNVbuktfcpJs=;
        b=RKh0r7lpcu/HcWJ2KARa3W8Qpf0bpii+PeyjCUsyIz8wiKa8bPPbWLk/4p0YLUakq9
         HOsxgXjbSZc4ueqTWB+Fp3nFBJBy9ITth83ph5XK8C4C1O15FxH1eCYb4FiAME27pQLR
         cqZ/YKbYKl/YEPUYn8Qc2dqdOcYj5T+gOzNJ/2B8PRVLzpQFAp4oelbQNH+AecxXE23q
         JYzroTVvreqRjxiHyKnJw/gIMgK7K2IsHaKpl55M0Btoo7CeTZZGflTxw73JKw8b0tps
         zxzzIaUdmS1TWfB2W/+wWht1jZdHt0ELMYQsev1nq65prI2aIErna3mT1X6E5jptv4zP
         LvQA==
X-Forwarded-Encrypted: i=1; AJvYcCV0I9jLQ1zVIGKjGjhkwE8CyiRNdtnZsga3mFCQ1OCAH6dC5FXxxFKKjuoMTUzw9gpbaKI17ptUA8LocOYTP8+i3X92jw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAlq4g8L8mi8wQE4QTQYVns/tE2yhDedvmKQb9OpCXTOMW4HbK
	BZQHVjXVgFTbngvyMbh6FqQKx0bu63JVxflnOxXTndAQbvhp4rUI9HMW
X-Gm-Gg: ASbGncti6YGyw2f4gS3FKF6s+GRxK2LiI1ZSYiqYbVxYE6agC2izFhF1B2Xi0VYNi68
	ZaW7DqJA5dOnl6sxOA1RwxdC4Vt1Jpd+Q0Ip58GFPlhzr8IRBvD6JlgketHOjc3bHHtTZpzyX3/
	1HZLh2/EyKx8lLq6Y/Hzt8u4/DUFQrBW+NbOblT3Ld21/k1pSedxgJdzs6eLpNOocvzLfNszCwE
	co+dGNgti9VnyhJ1zdZgfnQg8w+rgSo2VoiViqyEfzQZsKwYGe8+qXIQ4+FupdrofuMMkdM8r2e
	uL+DWPLk81n+WsPqc+tjmsfP8n5CbVDAw/oPso20szqSuJJcqBfsosEohrU14T6Wd6BFlBunV4m
	gI9+qEJZ7AysS9Yk7U1Inb3D3egsA1ZcxWTgsreJa8fCFxGscyjcdLUDvDfphSZRnZHlitnLLSm
	mEakxdww6qQNSqavf/83BbDtVELAICNUA=
X-Google-Smtp-Source: AGHT+IGjX3HXqOY5exKe57ivPtKqQ/8qdqdt8a/LEsPU4MJgln+dlHP9S2HThtsEQtvScJRygs77TQ==
X-Received: by 2002:a05:620a:4614:b0:85c:3bcf:e843 with SMTP id af79cd13be357-8b2c31b46d8mr51876485a.43.1763060490083;
        Thu, 13 Nov 2025 11:01:30 -0800 (PST)
Received: from rpthibeault-XPS-13-9305.. ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aeecb087sm187043085a.26.2025.11.13.11.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 11:01:29 -0800 (PST)
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
Subject: [PATCH v3] xfs: validate log record version against superblock log version
Date: Thu, 13 Nov 2025 14:01:13 -0500
Message-ID: <20251113190112.2214965-2-rpthibeault@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aRUIBj3ntHM1rcfo@dread.disaster.area>
References: <aRUIBj3ntHM1rcfo@dread.disaster.area>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot creates a fuzzed record where xfs_has_logv2() but the
xlog_rec_header h_version != XLOG_VERSION_2. This causes a
KASAN: slab-out-of-bounds read in xlog_do_recovery_pass() ->
xlog_recover_process() -> xlog_cksum().

Fix by adding a check to xlog_valid_rec_header() to abort journal
recovery if the xlog_rec_header h_version does not match the super
block log version.

A file system with a version 2 log will only ever set
XLOG_VERSION_2 in its headers (and v1 will only ever set V_1), so if
there is any mismatch, either the journal or the superblock as been
corrupted and therefore we abort processing with a -EFSCORRUPTED error
immediately.

Reported-by: syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9f6d080dece587cfdd4c
Tested-by: syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com
Fixes: 45cf976008dd ("xfs: fix log recovery buffer allocation for the legacy h_size fixup")
Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
---
changelog
v1 -> v2: 
- reject the mount for h_size > XLOG_HEADER_CYCLE_SIZE && !XLOG_VERSION_2
v2 -> v3:
- abort journal recovery if the xlog_rec_header h_version does not match 
the super block log version
- heavily modify commit description

 fs/xfs/xfs_log_recover.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/xfs/xfs_log_recover.c b/fs/xfs/xfs_log_recover.c
index e6ed9e09c027..b9a708673965 100644
--- a/fs/xfs/xfs_log_recover.c
+++ b/fs/xfs/xfs_log_recover.c
@@ -2963,6 +2963,14 @@ xlog_valid_rec_header(
 			__func__, be32_to_cpu(rhead->h_version));
 		return -EFSCORRUPTED;
 	}
+	if (XFS_IS_CORRUPT(log->l_mp, xfs_has_logv2(log->l_mp) !=
+			   !!(be32_to_cpu(rhead->h_version) & XLOG_VERSION_2))) {
+		xfs_warn(log->l_mp,
+"%s: xlog_rec_header h_version (%d) does not match sb log version (%d)",
+			__func__, be32_to_cpu(rhead->h_version),
+			xfs_has_logv2(log->l_mp) ? 2 : 1);
+		return -EFSCORRUPTED;
+	}
 
 	/*
 	 * LR body must have data (or it wouldn't have been written)
-- 
2.43.0

