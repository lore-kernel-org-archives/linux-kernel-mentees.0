Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C281805A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755217279; cv=none; b=OgiJPJdgzuDsWyG+v3ux4Hghy24wAlb/mOObYNR8h9i/wXfWKRA+CRRW0MR2j5YDO4QqVYLRNUn9OpkkeNgmHqZtqR65eAznmwYqZyR/0xmF6dNRlI/2EeEPPFnPTh2YmtfG+lQoWzvuS8EENESYn0NFCblkoNlo+R2AqgbtC9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755217279; c=relaxed/simple;
	bh=LUcgKwJABBj+TwKsngLhzjNx8DqesdGJKilNG5TyVRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I9ksdu0Nnw/y+GY/8ZSnJX9vtQ6c3ZfepwltRh7/OB4AzvKnirGYBUSqGz7st9B2g68vrlMuQQ6zR4HvRb7J/766yC+O39VrqOHQ2dscA1UpbbI7X7wx6i2VbOhJjZcQP0Ag4MilzQ3wiIlnd+nAG3BrX3d9qHR8OqwN76cxD7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDVkHFea; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDVkHFea"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F21B40670
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FLJml9Frtpby for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Aug 2025 00:21:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B341740600
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B341740600
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BDVkHFea
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B341740600
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:21:16 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2430c3684d1so21027325ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 17:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755217276; x=1755822076; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISuSy7IMRKobKe6bhJDdOBVYdJ8VbTUzSrfjPom4VAc=;
        b=BDVkHFeasg9sdmJgyW/pTdq6KkOA82ToPA501UqDSOSQA1yUB4N0OvxdRgMiTSXQzF
         xCPmB0gUaRCcAQQXpyjY4pk8Ld4yRnv+3DqAhQQhot+QBsFUkQbiS0n6D1fwKPtdNVIe
         oU5ND1xkArVu/QySdWDjvER3fReGW4Lr0qtNnoUAu9TXketc0iIXjoaG7e0DwCW48rZU
         Xn/gkLPJ8ectT/yyfIXC1S4U6jonUufd903K2PSpHQ6nZ8xgPuR8bzagoNZBfwwnSlXz
         VpkAwo9Q2ljLabrXD447WeMsfVgGA98h3rwPdCOny1/AS3IDWGhVlOe2sn6BgjMAHtge
         YSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217276; x=1755822076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISuSy7IMRKobKe6bhJDdOBVYdJ8VbTUzSrfjPom4VAc=;
        b=k3pvrjljQ+DYTtPBQfJMaXj5TCI3IcHy7FfZ4dFLGJ2Ow1DJiGngjitnnA3D3zk2Ty
         dNvqYrMJgBurhNa7PCVm3IywfD4wOdfR5gfQLn0ejTD9cFdmJasZjx2OH9N24/XlZ9Vx
         5KWPdzcpg3Q3GQ2bODCgc6hXuMI7MwDo6tAdczi+yyIxj8uBEwLYhA4TuxAGwo5SPpoj
         RmaE8rJ6eqDDOhhI0wLkHKYRRf2oCF5BqRveQWettA4BSBEmwmwKo5oJEHllLXlJYxPJ
         FLyxQcgl7Wxvg72bBQpg7ExbB9zBkDYRAlNKIuv6zU0xqGf7/yGz9cEEFTSo1/mLLb4T
         1udQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnc8xeWns0IJK6LeM5O7a3vKgc8d5gtQ7kAFn/UlRdiJmha4zy2+gYYfxvWcrj3I5vfDDIZyBLEG7cU/Kq86kyI0JepA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxi/xIo3UnAVYBhprjLPNr7XcU6IPFc/GJM5PUxQhwtBgv6NTPI
	m7HUrVARloNOp6aCPzY2706RzJoWf977Aa7KB5IaR1Xk6sH/2/0b22M8
X-Gm-Gg: ASbGncvJ7a13oxXny+qT/JyWPWJbffgXOoyzLzEgX/738PVU+p/OFwu0LmXnooXEcZl
	SAVwPTOnchwTRsHIbulHq5rtBpubLRNhI44oDth4b9/tHfmt1sTjcdTMcu7ESTSL1ICmsV7xTyI
	5LXAA6YKzAxZd6x8S121qOz9b+3a1w0Bee9n6FG5uD8yUYIlO1za1Ssv9Fq3QtMbPkjOK66HM5c
	1qB3xt/lrLUyCokNbBEpVEojrpFxp4AQYivQ92AACumh1lkNGdvQMv828D8/v+5qfvLha3G8Ts+
	aFSZPrOJJcVTFKX8+725FcYZnnwx2u6pOnTEm+SEdo96ooS13p5ZR/J9xLZRgeTtv2q8Pw/pR9h
	9jsS/iKsreKK/ojI0PEBMGf4eCPy8DPc=
X-Google-Smtp-Source: AGHT+IGLK/7oUU3EsuVi1qb1HakmjkmgPcL0yL6CGWo4A94WXUQimNdT1LfDLhHiD6YEmjgqHGVtJw==
X-Received: by 2002:a17:903:110d:b0:235:f091:11e5 with SMTP id d9443c01a7336-2446bd1dcd1mr4317745ad.10.1755217275848;
        Thu, 14 Aug 2025 17:21:15 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5a451esm700745ad.165.2025.08.14.17.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 17:21:15 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>
Subject: [PATCH 6/6] selftests: net: tcp_ao: fix spelling mistake in comments
Date: Fri, 15 Aug 2025 05:48:03 +0530
Message-Id: <20250815001803.112924-5-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815001803.112924-1-sohammetha01@gmail.com>
References: <20250815000859.112169-1-sohammetha01@gmail.com>
 <20250815001803.112924-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typos

- requries -> requires

in `tools/testing/selftests/safesetid/safesetid-test.c`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 tools/testing/selftests/safesetid/safesetid-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/safesetid/safesetid-test.c b/tools/testing/selftests/safesetid/safesetid-test.c
index eb9bf0aee951..80f736d545a9 100644
--- a/tools/testing/selftests/safesetid/safesetid-test.c
+++ b/tools/testing/selftests/safesetid/safesetid-test.c
@@ -19,7 +19,7 @@
 
 /*
  * NOTES about this test:
- * - requries libcap-dev to be installed on test system
+ * - requires libcap-dev to be installed on test system
  * - requires securityfs to me mounted at /sys/kernel/security, e.g.:
  * mount -n -t securityfs -o nodev,noexec,nosuid securityfs /sys/kernel/security
  * - needs CONFIG_SECURITYFS and CONFIG_SAFESETID to be enabled
-- 
2.34.1

