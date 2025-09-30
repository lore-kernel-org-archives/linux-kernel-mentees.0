Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BB92F60B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759223685; cv=none; b=hJH4Jv+HyF9B+zAlR2acJr+EcUGu34S8z07Sd4zKL2z1siiuNpwBrvE2GujA90seE69kyLjaXat4X3OlyimxIaAb1NUWDc43L8vVuchI6v/S0MMbTWcnmdxqeXMyw1+DxdQqltnVRoA+uEU3ZhSXW5VK3Mouy5PGsEqs1iEIxk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759223685; c=relaxed/simple;
	bh=14yGhWhxJxKPIeIrNLfrEWF/S6UUQE2k4azZt9Ge4F0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EAnE+oAGjblDQqRDltj5cCWBQp9Mfsc+9I5RbDpgYElP0fnObBXE3mVl82HuCIpCTfNUJx0P2+059oUUaWvF158wtJ7VzG63sMVpvARcI7LjmamQXNswv4wW1M4ZTaIZDHwiZRc9Z5Ge0HwCPv9yJmmdanGJlI7Rf3nzTvewBYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1/te4py; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1/te4py"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 557D2807E2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 09:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpBqRXMq9BaO for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Sep 2025 09:14:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E73B807E1
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E73B807E1
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S1/te4py
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7E73B807E1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 09:14:42 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-46e44310dbeso4034835e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223680; x=1759828480; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DH1NlSlaEudUba94N0gvDnLMb1d3cyB+74kEXFRWj1E=;
        b=S1/te4py+RbLtZgq8oIcdXeEs4swaTDXqJQodAiN+zXfOyhA3i+n1N1ZVxkfRBVSc/
         negsPzNOj2bp7fAjzXUi/+fAenLJ3cFkuFgaZxZuv61DzgK0kAotDHHTl79dfgFNei4G
         doukNYJBAAx8q0gPO8Mgiw2l41uNF7Q/gWLc4rqznBa0FK4ahJASS377+mspGyIIxOSR
         m+8lcKSS1S9UIIMG6Cs5tk16C0UyWaKm74ljKV2fq5o41Lp8qPzVFfNioTo6DTNhQXc/
         eapt56Z+Myplw9pT3uCfzr8hENZg+UTYgUO5mzZedWgDoR3cI4kDfvctisK5lZGGJvYX
         wt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223680; x=1759828480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DH1NlSlaEudUba94N0gvDnLMb1d3cyB+74kEXFRWj1E=;
        b=b5Zk/UgcWJWOzvixOk2N9D4ingIv/H1meHTnOKB8OgkjpC7Yj0JQT3QkeO2ZZNDk9o
         0Gu91R25kNR+/f+ei/mO3VyWSfd54bpmEJC+3bPijk+K4OMG6UJbkJj9OB9qsxgCQ2Xl
         InAX2XsnsFDksWK/P/wBFbA7nvMYnU/utFH60aK50i14z0or451mD8HiFgblvP0j8Wo8
         uyY0R7rO0+zNeNkFAERszu0BabKKGr+msBrRdw5kUPLAD4DcIUov44IpJgWRxkFNPDUu
         hWvXKq9A2gM3nBb08qtPZ9ETFiFN/Jd5ByX71kcT9a7qCkHPhkTskNq4wzo7AyWDlK3S
         DDLA==
X-Forwarded-Encrypted: i=1; AJvYcCWxwQk6SY459JC5fa64Ju+glrAvRGZBlE+foGC31DZ7qbw4AWiYNRu69fQ7zyUwzIAYbUbKlnWkGigFXFUt2Ns7DDwVCQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxCtgciJeS4EkYEGvMSWT0i4XWWcPdyYDudedxhC044ggcrbYTD
	3eWKKaeQUlL+E0jXve/HYu74AOKevWyd3hKRAQuCS4pnGCNpmOBeOUIV
X-Gm-Gg: ASbGnctpjGU31JQD/AgPRGjdYDQYVY/SiIURDVGXYtPIl0eTt7f+HvjLadTZu9u79oe
	0cZG0nUSSL8MVhYaqMXnoh/JPNHxUXwyoIn5CLQ1mqPv3Mgt/4sopJ76CklYchwa61QOEz3BnhP
	HLImGTQhjWWbnMccEM6MNSGuheQ6ZCz2c9017DRrfNRgcEKwXcnP6Uzta2ncTHuzn+jUdR9QGcV
	f7lfzs2qryBDEPrtYNIbDXU5LqIiKeLO1S5BnqgCaJdNjSU28sIYIlanchBPy07Q1loscLgNvNA
	F/9FkQHsMOxtQFIObUc1d5mLbohSDeslV567WqBNdktOqasGWcjgMj6BzETQL+cY6elCr3msa0V
	9CZkHOXgnOHWET7i14enUuDpFXCCKgq80PrqXp6qZNNZR6Wb1L1LFcBlyoVQSSaRcLQB+G8ByOH
	Q=
X-Google-Smtp-Source: AGHT+IHLikjr1LvbOBlnMIgFiu5KZJiA4nat4K1Q3fyVS+a1hd0LvhBcizuVjM3yI2Nj4+3iyJlerg==
X-Received: by 2002:adf:b64c:0:b0:3f4:52d3:7a6a with SMTP id ffacd0b85a97d-40e503e0212mr7500503f8f.10.1759223680399;
        Tue, 30 Sep 2025 02:14:40 -0700 (PDT)
Received: from bhk.router ([102.171.36.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb9e1b665sm21775209f8f.27.2025.09.30.02.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:14:40 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: clm@fb.com,
	dsterba@suse.com
Cc: linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] btrfs: Refactor allocation size calculation in kzalloc()
Date: Tue, 30 Sep 2025 10:14:22 +0100
Message-ID: <20250930091440.25078-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap allocation size calculation in size_add() and size_mul() to avoid
any potential overflow.

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 fs/btrfs/volumes.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index c6e3efd6f602..3f1f19b28aac 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -6076,12 +6076,11 @@ struct btrfs_io_context *alloc_btrfs_io_context(struct btrfs_fs_info *fs_info,
 {
 	struct btrfs_io_context *bioc;
 
-	bioc = kzalloc(
-		 /* The size of btrfs_io_context */
-		sizeof(struct btrfs_io_context) +
-		/* Plus the variable array for the stripes */
-		sizeof(struct btrfs_io_stripe) * (total_stripes),
-		GFP_NOFS);
+	/* The size of btrfs_io_context */
+	/* Plus the variable array for the stripes */
+	bioc = kzalloc(size_add(sizeof(struct btrfs_io_context),
+				size_mul(sizeof(struct btrfs_io_stripe),
+						total_stripes)), GFP_NOFS);
 
 	if (!bioc)
 		return NULL;
-- 
2.51.0

