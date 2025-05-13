Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A310E1E9B02
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 18:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747159616; cv=none; b=W957d2RHh++kGge6omjSppSEYm2Rs+j3A+FT6soklXD2Vn0X4FPVaYG7cL8P4cLsxkPe4l6HGfbkzf3OpK303SKOP0qJhfQBOE4SA/GPBzqtXn1eZK1FugnfvbIPFtJUVoqHjc7CJuCWaZfwsMIDlYKBZGWpZxQeLjE0vAqbVAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747159616; c=relaxed/simple;
	bh=yFRBvohKdlZ7B4RWAFGUxev84xRH0/iVU0WAsNtNfHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VJmFA5mYHCwt81u0XOUflM3UL66mEeKLGxUJFS24lqxkUn1gyufdExuYLIAx5uEeYPWfRpXUwds1UOvEqaaq3jxGGhwlIvX4psu6hX9h4Mg4NhuTSII2m/WkKCpkTv0thX0JrDqyTeGUb8XCylBTpTOubkYD6D8bXttk3qt3lbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hraEbEzZ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hraEbEzZ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a1fa0d8884so2801807f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 11:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747159613; x=1747764413; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=45Sal1szolo0FzhZOdc/VH7IQpuY3JSh8KROU8WIfeo=;
        b=hraEbEzZh8DgZ2dSqzHgGKrmF/0B/RpoR4viTFWg/oU7XAsv5AJQLRbbS14NLjjqMM
         tHSL8O1XmlOpnzbksXWpzzhLeIvugLS5TC84XIxo41zFen+xjWPOGc82x0/FWiY1c1Q0
         d4ACsXZZ+fnqHwgPEonK0u8lz34Al9p0BO9CHcHe6F3scmFJpOL0xLxFlEQ8qncjP2QC
         4+sIbohhC1FG4+CiHI6dgdGCrDTb4hFZ55f7TX/VcOBTDoZ5H+MXJI7DWXAhKu4Snqwy
         onQsG4jvAGBK7zCZK5z/sf2iPPFgaqh2AQdiQ4jx+W5bCf+VqIqL2ogmr72yqkyxnNZr
         qwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747159613; x=1747764413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45Sal1szolo0FzhZOdc/VH7IQpuY3JSh8KROU8WIfeo=;
        b=CQQSW3OqNHBjLW5392r/hoHyjTYxtPQ3q2CW78Dw4SJpQQbWhEMRg/wZoDHUC1Q5AE
         zHxRGPNxeM5SXQ5ERKkz+L2xn5L/0xsMg9Zc4XELfzaD+HAaFOOmfuO8qtDEKpc6jy8W
         cpfWYyCjce5X1+ycA34Hm/e7BmjBICnyArBZND07P1A+wrdLKxwwIWL2lophfKFVtGYf
         TRnqR2kTsaQ4lIlP28s2+VwMpR66DyZgLYVXVhR8EMOl0UXh3ULnTotPRpmGfEmWbW3C
         SkpUwHhhVB0oLt1lG+ErU4kW3ylPq+xmoojTgosHXynQRb/s3HXx7fPXIrR3ZBHqRjdP
         gIjA==
X-Gm-Message-State: AOJu0Yxve5D0+EHW1LcBMlfTXU3+3yGPDGWHMfCL+nJc1I2mML4pJCES
	VJgNdYr0qUqzUgf1xiBl2XM+87/ZkM9lrJyXIas+teh5Ow2EWEPlSUJT4qlK0hHfyT2l
X-Gm-Gg: ASbGncvFVHeq/rqlgoGvP9j6RpQWmUx2jA5Z9/eJJb4p9wFl0umVQeOFHxc6fkVhtG1
	iOjClFRuk7oZKcSda+zrClgjTgA3VJnb1v1CNmjijjvg3IKAdGaBzzlPzMHqtFHfCq0aYA6ztO7
	Na98JynMXx7oeVLRWxrbeLviMzD+3PiP1JUV6jvOmmHq0338b3RlfU7HOJgU71XpkodcgAmzZy5
	3hScMVUfWIhAfvnWXi0EHnqN1JFHrvmtQSKlAI/LV5C5peXpHlaBgcSNn2U/tc1pRvW4zgmC/Gw
	LSgEImQIIMxFAicTIuc7FBWH+IfryE2O+81Mxvwr5jOqsYcgCGz1D3KMet8zXoobEwls0AjIKUM
	8GLshJaoAj8zZbyKbFSYoOU/gkWX1XQSru9lgY8Ku7PRu
X-Google-Smtp-Source: AGHT+IFRfPrf4vvsJMPf2/qJFtsS/TjgGxZQaWiKOf7Djy7ys6wLUTu0Oi9ef1cJKLAca3b4bxYWGg==
X-Received: by 2002:a5d:648a:0:b0:3a0:b1de:1be0 with SMTP id ffacd0b85a97d-3a3496c271cmr244133f8f.31.1747159612531;
        Tue, 13 May 2025 11:06:52 -0700 (PDT)
Received: from localhost.localdomain (host86-152-218-15.range86-152.btcentralplus.com. [86.152.218.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm174900785e9.37.2025.05.13.11.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:06:51 -0700 (PDT)
From: Thomas Thelen <tommythelen@gmail.com>
To: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org
Cc: Thomas Thelen <tommythelen@gmail.com>
Subject: [PATCH] Fix typo in 'limit' for bpf test
Date: Tue, 13 May 2025 11:03:37 -0700
Message-ID: <20250513180543.33488-1-tommythelen@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Thomas Thelen <tommythelen@gmail.com>
---
 tools/testing/selftests/bpf/bench.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/bench.c b/tools/testing/selftests/bpf/bench.c
index 1bd403a5ef7b..b25db4142126 100644
--- a/tools/testing/selftests/bpf/bench.c
+++ b/tools/testing/selftests/bpf/bench.c
@@ -497,7 +497,7 @@ extern const struct bench bench_rename_rawtp;
 extern const struct bench bench_rename_fentry;
 extern const struct bench bench_rename_fexit;
 
-/* pure counting benchmarks to establish theoretical lmits */
+/* pure counting benchmarks to establish theoretical limits */
 extern const struct bench bench_trig_usermode_count;
 extern const struct bench bench_trig_syscall_count;
 extern const struct bench bench_trig_kernel_count;
-- 
2.48.1

