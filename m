Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C8AEEA6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Feb 2025 04:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739937974; cv=none; b=HVj/DjD+P77wHbv3JGoWn5yTmj3tL/YnaK6bgwlJskOjMHqBO+//DS5OGIs188Mf6zU10gDrHLGNZp9ZQqUudYUZl+lnpQLPvug8PUQP0beHznPmxRSyBXQtwJwUgRh4VU2jWH5OIhTavVfqc6nEQL73nlU84PoKX/N/7wTCekw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739937974; c=relaxed/simple;
	bh=LY909uE20HGY8kbg7QsQ+Tfz4kh5u73Tnd8efP6URZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kHX/isc0LzBO6LrElqp5Goaj+aWdhc5sGVpUJmXHX7ELq8CeB5i7x9hF8C2KsYsP652yxrY0yg4gaDu1DSL1F1Hfb2jj7OwEf+PTYihfbYstvmPVlAy0B7nY5es+pUeQ32i+pJ3T5o5Nw18ekWpg3tfWTjfnl0NrK5f3r/uJHjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+mzXWCz; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+mzXWCz"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D4AF607A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Feb 2025 04:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnL__Q5oBb3q for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2025 04:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ritvikfoss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF20D60787
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF20D60787
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K+mzXWCz
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EF20D60787
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Feb 2025 04:06:11 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-220c2a87378so88353545ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Feb 2025 20:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739937971; x=1740542771; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cGCD8Xmo4CTXqvRSBwD5tpydeLKW3NyH+g1I9UkvPF8=;
        b=K+mzXWCzC/LfCG2q9PVT2jz2wyjZumbeeM6/D4VWhjNhAqr99uLontGf+443bxpBP/
         Nv4EJgJHeCpNLtEBRoJTcXPEogKeRfDSfwu4gRWz0WdXpt7C8E5vtQz8Kbf5y+8mCPS5
         BnH9QbBMfQ2MX4Kat7T5MD8msrWGHyXFCPaKsBWcd6NW5V1HVc4x4bYKfEFPlm+J4ZtN
         w8LFQVRzYVtRhCq9ppGb+DppKZUD2DDLkVulzRP0Y5nTDSD/5blEB508nxBu529pm94g
         35Y9tR3dO6PYuu2M+Q/Qq1pKybJLM2PthiVDZ7ROCvADUJinmuVUS8KIcjvjcYf+HT09
         TYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739937971; x=1740542771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGCD8Xmo4CTXqvRSBwD5tpydeLKW3NyH+g1I9UkvPF8=;
        b=SqPpQB7uezF9vt4PV9iMxNVtporigjiD/VYAND3paivGFC7ywG99Q4ul4llIkXCRC7
         Tts30g/YcVIe3AhJL7WmIZfTSPR+jsxVe+jRRjzELUSvLu/tIkSoirEiF7hjnWFilOQN
         bx17vheKpDTZ3wAJFqSThlFp5pt3clMY7ligGUdZzqZ6TpHKV8S9ea0Ib3bEmEewgypE
         A4BjQrUz7OT7QFX6zPRQgaY1b2kCgBmg2ByrTE8D0gUbXaMEaHoNUxFxgZxNGyZjt9l3
         Gtz0MTE+NGOsxofsqadwNDCkezAqTnlq/7mk8sKk/j7Jx+CDe2tAWR2swr/RYhLd7JKG
         TXfA==
X-Forwarded-Encrypted: i=1; AJvYcCUDx6SQdtLEPWlIGl/Vo+R8WdvCFKAFmkFpBpeOphKtcYLFaPKdvTAKnRoWc80qEM49TbhmUHFiqPpQTAxBbsfprGcgBg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx6McaM/QV0w5MDuLFj9nEwDHZlm8S9kK8zg8fQSMSWzUArEnvR
	kKreWALMQbfLljICBrT9gEIcHqd4D0ZIoJ95vzF9f50Oy8FNJu2k
X-Gm-Gg: ASbGncvnbdrmkWd9pE5emikefPFmO/b+DUvB75FWGRFOvnLDjfxV8QoUl6BbbqIV9CR
	1+owsoeIMVgl37wQQxrCHz+f+Ubzwpu5t8ntQ5ueZI6CYn/mwNYrQmEOEyp71EYm3irrcBXQpPn
	jC5ycSJJ424D4n5jrTLv+mFp5qA07obt1j5evY3eS4ZlW6HQ3l0L3oCCqvbwgl4oZL7KvrZ0feK
	vZgwSAG2/ckelBFsMYC744k+J8KmuFf0q4iI4Wdt8tWL6w57hl214WxU04v9gN8zfYyHYHfjOrK
	uYzEWh9QOejZtv0jRmwrxE4d6BclVsQsPZhJz3M=
X-Google-Smtp-Source: AGHT+IEJo5xx38QelHQ3VismoM+WbmQd+Pv73e1M94U1VKsMxtpOT03lAb8m33HD4OV99iK9FPBEPQ==
X-Received: by 2002:a17:902:ce89:b0:21f:6c81:f6c with SMTP id d9443c01a7336-221040bdab7mr272925205ad.41.1739937971166;
        Tue, 18 Feb 2025 20:06:11 -0800 (PST)
Received: from ritvikos.localdomain ([49.36.192.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5596133sm96625285ad.259.2025.02.18.20.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 20:06:10 -0800 (PST)
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id 8408EB8D541; Wed, 19 Feb 2025 09:36:07 +0530 (IST)
From: ritvikfoss@gmail.com
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] Fix SC2181 warning
Date: Wed, 19 Feb 2025 09:36:07 +0530
Message-ID: <20250219040607.17125-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ritvik Gupta <ritvikfoss@gmail.com>

Check exit-code directly with '!' instead of '$?'
to improve readability and fix SC2181 warning,
reported by shellcheck.

Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
 tools/testing/selftests/kselftest_deps.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kselftest_deps.sh b/tools/testing/selftests/kselftest_deps.sh
index 487e49fdf2a6..2a4720723ebf 100755
--- a/tools/testing/selftests/kselftest_deps.sh
+++ b/tools/testing/selftests/kselftest_deps.sh
@@ -262,8 +262,8 @@ then
 	for lib in $test_libs; do
 
 	let total_cnt+=1
-	$CC -o $tmp_file.bin $lib $tmp_file > /dev/null 2>&1
-	if [ $? -ne 0 ]; then
+	if ! $CC -o $tmp_file.bin $lib $tmp_file > /dev/null 2>&1
+	then
 		echo "FAIL: $test dependency check: $lib" >> $fail
 		let fail_cnt+=1
 		fail_libs+="$lib "
-- 
2.48.1

