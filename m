Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB542E1EFA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790896; cv=none; b=UaodBx2DZMC0kRhq3zFInrC3Lnshy7F7p9bW+W23Zj+0NXqt/+KMwMopgoi6iVCUtCookcS+YgghGinrQrpJ20WDWBYW7W3Ddmw2Pxr38ePAf1i5hxPUfrYUL8PU8llGYbby5jkPxBPlNHNqf+NoOyRCEtztTyl09wveUnql53o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790896; c=relaxed/simple;
	bh=xZfQUgbZnh68Crkj2L8djsDkAGtbGZgFkYXgmuw/02s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EjvZgjUzVs+ISbKh1hW3g5AITkNdcF3QaC4Nv4hVfbirpUYPzH8qnFK+5w/XwAIdipRBvnO3mDT/yjs5PS3agGIZIQ3EPpyvqYzpLGYWK89ALnV6aubic0SmuoyeFp81TCF1MOZAbNqe7ITd6kOvf/Axl6iWnYai34eeFmX1vQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdFxwmHp; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdFxwmHp"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0844E413C3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 15:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgTcjJuHW_U8 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 15:41:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A40D4012D
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A40D4012D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kdFxwmHp
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7A40D4012D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 15:41:33 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-244580523a0so10853235ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 08:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755790893; x=1756395693; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5RWfX5SToSzLPcly9AU1U5Uw7VFDv2dnTyM+JJFNb14=;
        b=kdFxwmHpXAao6Qz9JhMq0h+Up1wLxTn1zAWu/VdExrXrymaFOEZIEux9trETWVYr+8
         M8kS23GrKLb91aTNNkumCsFxA2FnNA6fUyFUkSMduU3d9NLe/Q5DBUOe3BvA9zdlqlHc
         iaArbvtSUVMAf2bHs2necUmgOIPJegEBLcQoXX+Ru4wl7nB+s2sdhHPo9xAc8JM+9yRQ
         X6N9kesg0otlTQYrb2WVBRqfGDfCU00u/xo6QDI4AT81hlsMwkvRFHW9L/J2Th5X/B6b
         M3CtFjrBJHMkdqplfHXi2eVxXpHoSK/INl0FZM/x4SXYuEevysXrp3FOzLsB9ghe9zSC
         AHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790893; x=1756395693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RWfX5SToSzLPcly9AU1U5Uw7VFDv2dnTyM+JJFNb14=;
        b=BLdVh6+Q/wS9I2QYLw7RvvxuKxiEFV3Sc1I5Rt6KBDqSlaxXbwY0AgYRRBSBL2jh0Y
         e5d1lxgbcZfnmejA/PqGPT6Z0+fVIQMMXa0+ooZy2XvDsMBAB2K3HhsxURat9NUvUSSB
         +tojsXDcpu2BKnNxwWLAJpjm4ezTqFKBgtXerXyHcwduCKKVk3QfDN93cxdMSIiEJAzW
         ce61jNWtL1qAJRrM9oYy6mSOqH7nNqXRYmhRzUmSjNgQaUmBx2rkt+Y1NNEmiSuWUZ/f
         JojRnif0CfBzXImyQhPZq0pbLcFAs8sqjjSUufNIyW55FL/gdhpdPpaDA553Okzvw2GL
         k2TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTEExNuoWGSlpzwpsqxDCPBHlrPET6K8Oj3kTrdQTg0jkxdbmFIsDIC1+5Xh3Mx7NGMamKcI370nIbCgks31bcGtq8Xg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxRFcD1Jl7D2xc9F3Yat6+/2QpnU9Yc8XLJ8sdq7CjP3pQJQ4wb
	eI1T3kVmk3AUhP17t5NZh92K0/HpmFa925EB6V2pmeeE0qdfI55y9rn2
X-Gm-Gg: ASbGncuT6LWIzu1ucYGCZjVhBjsAf93D0zyeJTCcrO/tckISPDDyWZqaXZaLB1zaXjA
	kbC8VgZIEra9Kcn6MKASyBdnH3Yr3A4UjyAupX0zo84bRZriU5rETm0/BRtr7EpFO+MNaP0oDqb
	Zv2nwduCGkfgLf/nzSUtq5CezsOb0L2vT2Ql4Ig1Nju4TJvUx6tevSjK5X+Y8h2ZJ3ydbw3NJrD
	WOs7czNgFBWBi6GcCLVEqxsKDXTRn567vpc9mEkq+MexHX+TEcKA9ud5F3MlXu6rPyE7oUaRj0J
	7QbvOZJ0P3v/BBDhNCsiRWuD5fX/uBqyE+D+58whC7B16cUXn5r1PBzCVi0e4ETltAzFm6rUphi
	K3fUSiqKOg10SxBhuouf4qqwaSaj6k+g9zLgHgtoMewnHlqMn
X-Google-Smtp-Source: AGHT+IFoS5sjeqDzHKWvRWy3jAZgwmRoH6W/HrMPd3Q27lnUP/3qOikzDhMaT/C+xdmi4QUuen54/w==
X-Received: by 2002:a17:902:fc8d:b0:23f:cf96:3072 with SMTP id d9443c01a7336-245fed88bf0mr40353715ad.26.1755790892570;
        Thu, 21 Aug 2025 08:41:32 -0700 (PDT)
Received: from ti-am64x-sdk.. ([152.57.22.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51c027sm58971345ad.148.2025.08.21.08.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:41:32 -0700 (PDT)
From: bhanuseshukumar <bhanuseshukumar@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	shuah@kernel.org
Cc: peterz@infradead.org,
	dvhart@infradead.org,
	dave@stgolabs.net,
	andrealmeid@igalia.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	bigeasy@linutronix.de,
	colin.i.king@gmail.com,
	bhanuseshukumar <bhanuseshukumar@gmail.com>
Subject: [PATCH] selftests: futex; Fix spelling in test messages
Date: Thu, 21 Aug 2025 21:11:03 +0530
Message-Id: <20250821154103.115110-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a few spelling mistakes in selftest output messages to improve
readability

Signed-off-by: bhanuseshukumar <bhanuseshukumar@gmail.com>
---
 This fix is part of kselftest pre-requisite task for kernel mentorship fall 2025
 tools/testing/selftests/futex/functional/futex_priv_hash.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/tools/testing/selftests/futex/functional/futex_priv_hash.c
index aea001ac4946..a8cec7bd2b5d 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -132,7 +132,7 @@ static void usage(char *prog)
 {
 	printf("Usage: %s\n", prog);
 	printf("  -c    Use color\n");
-	printf("  -g    Test global hash instead intead local immutable \n");
+	printf("  -g    Test global hash instead local immutable\n");
 	printf("  -h    Display this help message\n");
 	printf("  -v L  Verbosity level: %d=QUIET %d=CRITICAL %d=INFO\n",
 	       VQUIET, VCRITICAL, VINFO);
@@ -267,7 +267,7 @@ int main(int argc, char *argv[])
 	join_max_threads();
 
 	ret = futex_hash_slots_get();
-	ksft_test_result(ret == 2, "No more auto-resize after manaul setting, got %d\n",
+	ksft_test_result(ret == 2, "No more auto-resize after manual setting, got %d\n",
 			 ret);
 
 	futex_hash_slots_set_must_fail(1 << 29);
-- 
2.34.1

