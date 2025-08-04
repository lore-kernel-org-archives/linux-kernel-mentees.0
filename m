Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED60221FDD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  4 Aug 2025 17:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754329362; cv=none; b=frcWzdwpQMqPS+vQt7zm21He6WgU0tQ7QqYNWi7OSI/c2UOcSQheZZtPgV1sObaBi+MSxiSWNEzES6J0uN4oykr4oGuLNNVXUR9vfu0Z4oIuq3rp8BB3DbRxWi0pt4uSKO9cT+3cpK54u/3/Rm19EW1YbX3uBlt3ND52OCE5ZXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754329362; c=relaxed/simple;
	bh=vzrXIt5TL4b9Ng5jv3r+kCVZCYVNZ1OqQdurqTIo3t0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZYY0PJfxr2MxcUV6bgqUnx+HFfTrkm3dUH5PMtGnW1vKDXSVsKWSObkEG5sSU0LqYV06YNq+8WO3dKXBIH3PdcexwR60pVAmsc0RAkUO7w9/d3brFWJJqRhQmHMzDsKZLn3u4xsyDhxJNt8ztQn9c/Hu3+TAUMX4xYEYl238uOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mK/17aJ7; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mK/17aJ7"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2759440B91
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  4 Aug 2025 17:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xtA9hvEvj0VN for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Aug 2025 17:42:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A80A40C62
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A80A40C62
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mK/17aJ7
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8A80A40C62
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  4 Aug 2025 17:42:40 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-23dc5bcf49eso70403915ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 04 Aug 2025 10:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754329360; x=1754934160; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmpuDQw4lcTu4tXxdtVUEIunPau4aNsOSJumWE7v3Hs=;
        b=mK/17aJ7QabbXRNK3QUgYAa+e05G+OMvXw43OKdGZMDWp+ngFpFeQWdH+K/B4o3jyl
         uSMpnC56JCIX+SCp4JSSjo2R5STRbm6pxxI8zPG/LnABK1r6kIhUj/rXZFPR5cTfU5zo
         ifaJbBj1ddxc2Ff4kFAHpBX1Hx1mEx/v24w/7uBqTAGtliL+fNXk/XpWv4pxaOE6MHtl
         6kJjcZZX5ZYJ1tt5cz80Ix0heQyP3JdrcjONEauvua2f9bYlt9CzCGimo3vpM01ZAXv2
         sneqnR1bS3vEeqQHaZcSwOmd9idsU7A6tpa4dxnrViifzsZf55KBNH646n4yVf+YXINi
         JgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754329360; x=1754934160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmpuDQw4lcTu4tXxdtVUEIunPau4aNsOSJumWE7v3Hs=;
        b=XOujs5M2/dsRkI7dealWDBiZlHHcr2akj/SXWnnv+jyRcf10ZzhFDNbjYqKLnbvYwF
         z/pf1TL1k+qSbDtrpvM8ABnQq6RKeHkh+NuwdpP0gfiCTQvQWzg9Sv6X8zhFBkXfFKyS
         /8VEBOPtTHTKEl14ivQxDOR8cgokSOozkn6p0yAW1L7f7yhdUezZr+09JsWPwQThsR59
         3RZZEd6FF93NCK7HJ3ZPIVU0doM7BjL16bPicHrklFZ/R0Ft0PtMyWaNhMX5/ljwNGJP
         boZB1ziy1rzxWndPnu8ZibmtOEB8whWSZ7s2BdZtKcCeocEdcV2JJZ6KB4wvgdSvTbHe
         zt+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+zy4+2CklMzcEaia3VQQhC0UNlSGu6m63yhLire0cay3HzowNC5T1S5DRM6pM1xpmRqtfuEnmcmNQCzLEGatfeQoj+Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxZ24iIkfoc2b1mhNRvkmzqQVnQ7c1bDJ7FSiF+ChG7Sv+RZ73x
	V+cETsAjIdu20DEzNibNb7yKvuZOswvobeCmOHJ892fJ4bOEaMb2xRy3
X-Gm-Gg: ASbGncvKgCFPXywBL4v3VtzNy+R2VrYO1N9N1xb4fy9LY+XWPoQwkhnmPUU22XvmAkx
	VvKj/YzHV+qy23f0jxsi9jN50J16bs1RyCiRLZ/blLM4KzAKV+iaHCHB+botar64QAEYmPx4Ce4
	uPKoemWIhYbPNf6Ha6IqFOXkHDLHKMoyGTY5z3dDrE/BlidGE0ChGyvzoUpNIAFa0KAVP+NYsh2
	FdBgcYFu3Q6ZjgAkMha6IV+KWcJ2xlEIvT+pcpw708nCq0CJFIXSyhUxuGoWMe9lLD229yxOO1K
	Hxhp45Z8sQsn4rfJc/dk/dPGPDhot+uc2aVRdoA46Lq4d9hcip6hrxec5WSqnPMvgrhEo217VhH
	QwKkRBEQuRYV5uuFiFzBencFGydOFtnXm
X-Google-Smtp-Source: AGHT+IFI+8SdSFUw0aVzC0ng054xt2X3I1hBjCdWEE3aIB2LDKXSVvzTElJ/rk4zbP2WnqZwBQ+KGA==
X-Received: by 2002:a17:902:db11:b0:234:d292:be7a with SMTP id d9443c01a7336-24246f30349mr169796815ad.1.1754329359639;
        Mon, 04 Aug 2025 10:42:39 -0700 (PDT)
Received: from fedora.. ([110.225.60.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef6713sm114370935ad.12.2025.08.04.10.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 10:42:39 -0700 (PDT)
From: Devaansh Kumar <devaanshk840@gmail.com>
To: linux-perf-users@vger.kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: Devaansh Kumar <devaanshk840@gmail.com>,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] perf test: Added .gitignore to shell base_report
Date: Mon,  4 Aug 2025 23:11:55 +0530
Message-ID: <20250804174157.319224-1-devaanshk840@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Created .gitignore to include base_report files so
git status doesn't gripe about untracked files.

Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
---
 tools/perf/tests/shell/base_report/.gitignore | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 tools/perf/tests/shell/base_report/.gitignore

diff --git a/tools/perf/tests/shell/base_report/.gitignore b/tools/perf/tests/shell/base_report/.gitignore
new file mode 100644
index 000000000000..8d3ce1278d83
--- /dev/null
+++ b/tools/perf/tests/shell/base_report/.gitignore
@@ -0,0 +1,2 @@
+*.log
+*.err
-- 
2.49.0

