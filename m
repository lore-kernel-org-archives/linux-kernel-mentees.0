Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51FB1E1A17
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Nov 2025 19:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764271980; cv=none; b=jnvkQhDHpVdguRvDnw68nuLixIJntrtNL3em+2p2KymIj8jNaVkemWDr6nKxQT0QoirPzJNYiTFhxN9MqrzPHrBr9IUNHbRhB3/Ef6j8rneTo6lP1x7aoyOcfC3AyoVWTiQeluzT/gdGoRYiWesSksvIw6t86kolwW/7/JNgGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764271980; c=relaxed/simple;
	bh=Tn9kt3Rd60qF6RLPM2DBnhkLPhIU66GGiGA+z7bAqHY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hk4yIPx6vUtPZueYDA9v77spICQw+Km9N6UUGSMGAVZKQmuY96VCW+rgRuXsgGMo1Yx7IyrWImwYWlWDSrnVGZn+Mx/lMhhb6yj8xzpWtu3gsaHcRptVvzbqTWe8umYt/1p8DYjkomyubjilYYRD+GbtuCRey9vmJS0GpyWV++c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=YD+xD6Xu; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="YD+xD6Xu"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-297d4ac44fbso12756315ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Nov 2025 11:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764271977; x=1764876777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lM1r++3RTNjRzY120+T4NuENeTC6ZBYSsw5Jwl/MuQU=;
        b=YD+xD6XuLy+YaGjcMDipzO/Sy00GzpRRJVCSzV1jxS7Ag2H//H9ql77OgQqK8HjL+v
         ok3RHrwqJVbXRFEbGTu855qjlLLg0Bsl2o1anV0mJocAS+6fZlx5AugQeHqw722ndYit
         jLZgJUApy4GHBL5Rwj38V9yeTbQC0xBFAD/1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764271977; x=1764876777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lM1r++3RTNjRzY120+T4NuENeTC6ZBYSsw5Jwl/MuQU=;
        b=UWY+LxPJEAPlYgrt5Eq9vQMRf5Lrdqn/KODPzl+zZt8+2rvsWX9FB3EyNKlltYAqe4
         FO3mw1Kf+DtwNWhTm7IRa578IkOvWXDZvUjM3LtLUTh/q7LLsebYEcTtZLx7y/+GBNn9
         WyZcMD1/z6zZuwkjzyxRQ+sj9GvJ/GoiNjK+E6HaeYlPhEhL69ePsCXP7GL6EpKycpnq
         Y0t41NIccOFTqVdIC3FzjjRIGBz/jd5FJNRPXvVtNAg1r6+85D1Qm0HPkv8ydOmUraLd
         d/hpCAiDmCJQyjQ4PUBvvb1hg9rFeaoB/qern+RGkY0fAgHaL392q8mH1qCKcblx2o24
         RpNA==
X-Forwarded-Encrypted: i=1; AJvYcCWbCsw7LNviu70vL/Rjd2VQyKSNi769/HUpaiEaijTFzxu6e6k8+HP+6OUinxNnKM5B9p3GzTg2+j5Nc1KBflD2qnxhrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzixwqRrUQ3iVfj90JSIPyuAro/MoBRteCCzxhm8fraJiq+MSb8
	Lcm70GcIxVZ9MOLsQvmJtBX+5qGspc9RXAOApLnhaZjU1yCpXRZaI90twwmCGFcEfHA=
X-Gm-Gg: ASbGnctubSlAEYpMf3sWvMCpEOteQAroYWv9oz32+6S9T2HWYjywRojfPoKfrZ2yjh1
	lQTiGSBnven+sBaJqTxIQaX/VZxFxBJzp+lpYREPOg0e5f7pxYuDKbXRMo1FWK+KnJLZZ/gOZx7
	8mRZ2WzEr/71x5FSDJpRIjcXokmzd+Hle8HUS0VyMUNfdgwb8VYWS+1k64BONpBrIYQRrY4aRRr
	IdkHh55wCV6NqFWup1dUKb+lxVUFrxNml8dFnXb0NrQfOddDBgE6FXimrESVv+Zvr6vFMe7IDOl
	Vpa6agkvm4goRde/k/FKw4jmJZvPHDjqDKvP3vKbkUN+3/yFvhJbRU01Ww2vNlFU1O62RWbgEl7
	Uh3kVTlAuevBFMkuxvEJxyibgyo0lUZBEiv8ZMMIFgw5zVLtep9YQeyp3P7YPTWf6JhEe1Gvd/B
	eRwYWIOyL9HEmOTbPezP+7tKu/OXhbYxlZc3RXEMJewjhotOrgtmDBmZR6X/DfDQ==
X-Google-Smtp-Source: AGHT+IHKyKUSA2ibNsoBlTuZ1j6vGRVIEJN6h3w9mksWgr8c890wFiPTq7xmArcLJBhP8a/ET+BxEA==
X-Received: by 2002:a17:902:cf41:b0:296:547a:4bf2 with SMTP id d9443c01a7336-29b6c004ae1mr257927005ad.27.1764271976944;
        Thu, 27 Nov 2025 11:32:56 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2409:40c0:1009:d133:e67f:bfbd:c82:9cc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb55192sm24595595ad.91.2025.11.27.11.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 11:32:56 -0800 (PST)
From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
To: agruenba@redhat.com
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+af4d53576692f8956fd6@syzkaller.appspotmail.com
Subject: [PATCH] gfs2: replace BUG_ON with WARN_ON_ONCE in gfs2_quota_cleanup
Date: Fri, 28 Nov 2025 01:02:47 +0530
Message-Id: <20251127193247.17030-1-ssrane_b23@ee.vjti.ac.in>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gfs2_quota_cleanup() triggers a kernel BUG when called while the
journal is still marked live and SDF_NORECOVERY is not set. This
can occur during filesystem withdraw or error recovery paths,
particularly via gfs2_make_fs_ro() during a reconfigure operation.

The BUG_ON was intended to catch unexpected state where quota
cleanup runs while the journal is active. However, the cleanup
code is safe in this scenario because it skips quota entries with
active references and waits for all references to drain via
wait_event_timeout().

Crashing the kernel is unnecessarily harsh for what is a
recoverable situation. Replace the BUG_ON with WARN_ON_ONCE to
flag the unexpected state for debugging while allowing the
cleanup to proceed safely.

Reported-by: syzbot+af4d53576692f8956fd6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=af4d53576692f8956fd6
Fixes: 71733b492200 ("gfs2: fix kernel BUG in gfs2_quota_cleanup")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
 fs/gfs2/quota.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 2298e06797ac..13f113d8aaef 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1516,8 +1516,8 @@ void gfs2_quota_cleanup(struct gfs2_sbd *sdp)
 	LIST_HEAD(dispose);
 	int count;
 
-	BUG_ON(!test_bit(SDF_NORECOVERY, &sdp->sd_flags) &&
-		test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags));
+	WARN_ON_ONCE(!test_bit(SDF_NORECOVERY, &sdp->sd_flags) &&
+		     test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags));
 
 	spin_lock(&qd_lock);
 	list_for_each_entry(qd, &sdp->sd_quota_list, qd_list) {
-- 
2.34.1

