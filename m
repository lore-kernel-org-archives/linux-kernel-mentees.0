Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABB77482
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 30 Jan 2025 14:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247539; cv=none; b=HCbnw32VMFxIeqGll8dS8U3qHWMmt9rfbX5rEFNoepMMJZVClzrY0Sq4pKr8nBqh1r4aSIK89UsRWQfd2G2+cKz50Ku7QMD+9Q79W9Rl18wSVZZU41f+upTTi5lnbQh8kNQXMMy0lvMgeu8isRVz/uXXeUI1msjZStsykSQGbNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247539; c=relaxed/simple;
	bh=sA7asZK9ucRprwdIDQlSVHXLkerrhcndTmOGBsM3rV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AKmcculfk+pIZ3vBC01OmbqnwsD1+FKgKU6iY/1pkxxhiAp8kWiOwxUHpqHXNClH5Ak6tXuqA6ymPGJAEzCF61+3+G6h83tjAN9KJ1kw10+gzW/Wj+tkG3u1iAX7U5xBBNu+wMU8Nr5614Z1GSXHw0bnGfpPRyI64KSQz+SX12E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpoboUiR; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpoboUiR"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21649a7bcdcso15671255ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 30 Jan 2025 06:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738247537; x=1738852337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4qvx3FpdL5oMIU/2IZipgSLR8aHKwTjhISv/FQnfDRk=;
        b=JpoboUiRQCh5GwqAMAMSrt/+2qlBJIMyj90kpkGfHQT2tECo17em0xYAVfnZIVQ3qJ
         4QLW46Vr5MnuBEsUCvwT8wkvHvhlTcxznX0C5p4GWezUtxKGQJuL3XT1fhdyJkNJ/gCG
         CmaCWRZK50sWh9J74n3j9B4l+O76gXwnaViWSc9cjvKS3N9tx//1ZpMOis5x80kYNkGn
         uWv0UAbTdU7JCPjPPR/0QB63hNMXyQo7rbhGOZ1rZ1pHrw1AK3H3yFGRUVtXTohLpFE6
         INktxvLy0SB094UnDxvKEfW3unHEYTgpnGofrDQK9/qZQzdMqRiZlYCRyKFDpBShW3kJ
         RXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738247537; x=1738852337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qvx3FpdL5oMIU/2IZipgSLR8aHKwTjhISv/FQnfDRk=;
        b=gNahB+ZJgyLCd5X3tB8Zk70GoVJBm8vqv05YLCUMvK4Hm9CcLE1NhblAZMPcxaR40y
         m7vQaXzV3M5cekjwgm749tbJl0XaFn3+zyeZVVEZaXk+II3db92A4drc8zPLptSqNBBV
         D/fFmX8PA92BhvtUUiq28ItTLQVheAk0yne65IVZo2GIM/PrFX0tAvozkkAOYdZaolyN
         5ZolHEf8yDDLzgt2IMA9gEMBOYBt78wR9fdpJwlPItnfMeY4jpP9y/qW6fxZWX9Dklvc
         56Lc+2JGaz+iJBZAjLbWLopq09qWAmc6Rc8t8gpabPVrjkom4nexODpMJDick/HKYFuQ
         MfRg==
X-Forwarded-Encrypted: i=1; AJvYcCViyyJkl1GJgmcfwc75AabHI1EC8/qHiuZZiFcplt/B2B7dOTG1yWwmke5AIJrZLdSxL8f+KDd99fAJpMLNG3Gv3kYmcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZYzXLzoRiEJUA4Mh9+IqNjkDmhM5Xy4O2xag3NXxRHv1Uh9YV
	U5eb6eEl0aOyLN0FvQzfddc5D1dhUJ2ahKMVLBazgWZP/Wc3dYhjndA0cdbE
X-Gm-Gg: ASbGnctszhywLz6IKe/zat881O42MhAAqnS5aQsv/jG5HEXSW9l0oPunBvKic+/FEZu
	RA8j8zV8ilBGw2k9PVdMQnYx+7Fa4ooAdCrGwt36QazBqFeAW4JTJ0KeldZ7oPAjf+MJrtebGsm
	8TUPfVZoQcpieiXO81ZqI7KsYviUoy8qtZyVbyIx22rMW8aAUWedt57Pqq72ZhmMG8x5+5BgHXt
	cXx0ZasErw6SWjDaqCqFq+I6o/kxQlj08DvqRki/vg+FpzBBY5QYe+0soFYrDoYYPimVpJ94fHq
	3GVi+RREPMdTyE05aLBNjp4eloNd2xWuaftCfQ==
X-Google-Smtp-Source: AGHT+IE8c/vt2QdbZ2f5T200wHLHXYN4IpnyykL+38gCR+TZE2Z882J7JRKJG8r+myXOCnI0SUTICg==
X-Received: by 2002:a17:903:2343:b0:216:1ad4:d8fd with SMTP id d9443c01a7336-21dd7c4994amr88436165ad.8.1738247536332;
        Thu, 30 Jan 2025 06:32:16 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:170a:61d3:1c2c:a5df:6611:5aca])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33200e7sm14690825ad.240.2025.01.30.06.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 06:32:15 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Cc: Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] grammatical correction as part of lfx mentee selection tasks
Date: Thu, 30 Jan 2025 20:02:05 +0530
Message-ID: <20250130143205.13564-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 tools/testing/selftests/net/reuseaddr_ports_exhausted.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/reuseaddr_ports_exhausted.c b/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
index 066efd30e294..7b9bf8a7bbe1 100644
--- a/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
+++ b/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
@@ -112,7 +112,7 @@ TEST(reuseaddr_ports_exhausted_reusable_same_euid)
 		ASSERT_NE(-1, fd[0]) TH_LOG("failed to bind.");
 
 		if (opts->reuseport[0] && opts->reuseport[1]) {
-			EXPECT_EQ(-1, fd[1]) TH_LOG("should fail to bind because both sockets succeed to be listened.");
+			EXPECT_EQ(-1, fd[1]) TH_LOG("should fail to bind because both sockets successfully listened.");
 		} else {
 			EXPECT_NE(-1, fd[1]) TH_LOG("should succeed to bind to connect to different destinations.");
 		}
-- 
2.47.1

