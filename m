Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1388C2206BF
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 Aug 2025 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754468428; cv=none; b=JxYvhL7wGmM03gfkRRGwzWBBMxTuIbKoZYLiwS8TGZJ7VOZJtn+K2B5MAA39yQxjifFqtdXl13pZSaIXXnUJAke1YtzEevRX1s0ZlvNf5tP3Ra7xwYAu2rk3tdl5uUtMUsrHU4wwHV9AZsV3QNtGmKfvS/5fyrKueXpUbcghT1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754468428; c=relaxed/simple;
	bh=2Zg3JIzvXIyqJnoZOSLrCALPdYrjS+32WFTDqn2TkLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EDDtayuVDVvHJwquAKVowWjoCfV9eMMciBZxHJoV7smgysY3aqnkNGBdTt6GfKBFFWrwa1ZXsTMEPLilZR28IHVe4pUIdr38B+efWvFF5jwp5I1XWzwE8ihzYrJPGvXSq1g+kwu0lc4EglqONs0gCJrid3mXY3Kf5NnkHF4UUI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGjo+fEJ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGjo+fEJ"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b390136ed88so4712594a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 06 Aug 2025 01:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754468426; x=1755073226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tk74vFBOtgpOUaVzdQICrykdzva6RLuKYXQfB725rV0=;
        b=QGjo+fEJBAdPYWjqjrS6/G+CCe8hkFAWxvDJeOcCerHft1/4J+3Aw7L1lstJkl+1wx
         zRm9FpV2nHeyoFMGXXzyROVp3TQyN5Bh5CPfmAuTITWAUEKMF9rWJS5y5l1vt2uBdE4a
         UrKulHSMI8lmPiGxTidn+i2+szsMgBURZWBAmritEK4QV0FPi8siVhoh6F9iPLkLMeQd
         l43PjptYMAQxSv9tvFoZwi6ErUfDW8FGjRiE2L1KUsNkYCuftnAXLXYcILro9MLBYNOP
         l6ToWPIjqlMC5KRUQ6eNtNYk4dx9wWVCXnZOJxJZGzYd3dLvFDtIxrtZnFCqmDISIupJ
         ymWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754468426; x=1755073226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tk74vFBOtgpOUaVzdQICrykdzva6RLuKYXQfB725rV0=;
        b=VJmGIBVSOQqkdR9TYkgBvkgaVIxo623ik6tmz0IzXLQ1s2ZyZJXZjB2gBUw6B4fLnq
         mNvqJDiIpS+24jxZtHtrdYZDenuE/GzQw8cC2ptMrw0PRH0tqu5tcRDRp7kqeB/7b7Yp
         xZp9j04yRscYUL5e8O5kBrsCYn+NFhU/oD5O/335WLzGUxOASQ1VIEaXRDA94fPtcBnN
         vwg6JgknUQKBJHBDUQIWJbOeNycHqxJwoh3b8jZ+mgc1Mcza1qm17KLf0yoCDM02E6KA
         nhpXByTTztB7sQU8RMMFKCgX+cs4x3nZv2ndivwehkt5GU2UdYVUxA99EY8ZRWxLIbmZ
         KIlw==
X-Gm-Message-State: AOJu0Yw70Zeebm1LNJmgNDDpQsxVNXi3TCIiihJDSIu/s+wQjJjUaiot
	GJEgA3TtkXrttUz9PsF2CSRz/QyHX2KYSliNXsCOAiSxh+Zbd4bsudOx
X-Gm-Gg: ASbGncvJ6Xj3yKLK+MopIKEp7QFPWAs28PR2oZ0x5Jc1HMlPNslJ+qI1XHCMGB0zey2
	2Gkp97BfYAjYw6GDQn7mRyrpoXrRwBYhAr4Rx6Z98KzTTl2PmNQEyjw7ZeAHM4qYju5RAtCRHJk
	cFVYO9v4ApFhPB8QRysrbRsvOY+wm+5uLC1ihi0DETkdnBB4sZYUOdnNkO2aOJy1oiuno4VrmEV
	4cHAhz8so/vQ3fHsXRPHjfylDCwiVDiszWetCQZae3pQFzO81wv/F+d7nQZCHUC/JdC1N1znZgp
	87scvVs0w0/kASRcpM0RpAn3iKqHhZw6SCeHXRrJj/kRHoNlIEFe9iiT9gd12aroNb3KAcoLw68
	MXg0JLEGn8xG4Gy+IXO6ZRzeCHyr+xd4tXv3ByjCNNP6Q185NYG9FCQ==
X-Google-Smtp-Source: AGHT+IEReFrA9fu6w4gM/cP7i9PjlBPwmU6McdahgPWGATLeJixMmq/Kf/I51qnimVALN6oZwVx02A==
X-Received: by 2002:a17:90b:48d2:b0:31a:ab75:6e45 with SMTP id 98e67ed59e1d1-32166cb5d9amr2019526a91.28.1754468426250;
        Wed, 06 Aug 2025 01:20:26 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c30:7b0d:6527:282d:9edd:5f40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216126c96esm2078947a91.22.2025.08.06.01.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 01:20:25 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	dw@davidwei.uk,
	haiyuewa@163.com,
	axboe@kernel.dk,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] selftests/drivers/net: replace typeof() with __auto_type
Date: Wed,  6 Aug 2025 13:50:16 +0530
Message-ID: <20250806082016.14891-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace typeof() with __auto_type in iou-zcrx.c.
__auto_type was introduced in GCC 4.9 and reduces the compile time for
all compilers. No functional changes intended.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
index 62456df947bc..85551594bf0f 100644
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
@@ -42,8 +42,8 @@ static long page_size;
 #define SEND_SIZE (512 * 4096)
 #define min(a, b) \
 	({ \
-		typeof(a) _a = (a); \
-		typeof(b) _b = (b); \
+		__auto_type _a = (a); \
+		__auto_type _b = (b); \
 		_a < _b ? _a : _b; \
 	})
 #define min_t(t, a, b) \
-- 
2.49.0

