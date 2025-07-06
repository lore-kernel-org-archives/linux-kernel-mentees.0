Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D6574BE1
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  6 Jul 2025 09:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751793933; cv=none; b=eSvbAoJdNhQIKLWl9t+JWKQiqE30mXP6SGWI9mO7/ZRRgixsc7NKk84Dqak2TGLbDZbdqDP1s1vutOD1HwV7t0rYOMdXnU5sGrWIdoEJe9sOOQcrCxcQNjmTfzL1UXagSq8WfuWgGbfEoYuzqP93ytEP6bctKfeZmkWjPr/WkTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751793933; c=relaxed/simple;
	bh=uNRG7Dp9Y5lA1BfsuxAk7MQ5UhU9xjl3Bg3u9K1zj8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZD7OxcoiQRvm3GolODJjIGZ+qDQx+mWpJSbFATPzC5zxyBxjM4SZNaLOq//ZoXue+vrbSukcSM0VJTu5pPCVCzp7toVp7FaEbwRWoe0t8Qo9l7CWFUziblAgMdUds02EoiUqJt0UCmoB2j9XluSNu2lol76CUU6kGT0SBnWl49E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wuas0d2e; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wuas0d2e"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23694cec0feso17273575ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 06 Jul 2025 02:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751793932; x=1752398732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lA8KNkPs04Haqqyk/LQTF4+bgbkvtNg6lmvOnF3xgBo=;
        b=Wuas0d2eR9YjcSZYUlnDcLN68VdBzKuDO8qc2VpJ2WNLiPLsM5DhUpIglNm8JT/mJi
         2RDSih6s8um2IghaSxkw/DE7vStC6f5I1ZhnqKUIAdFmDKGHMVwSCHdufkn/ecnfF1bD
         tBBAhem9PtGRcvzOuE/dg8HV+6eRIQymTT7WxKRU1PyU7EBC4VUxxRhqiWh36spcXxKv
         EbqiTaSZKGuZk85EHJMuOnrRbTUfvSrA2POKfsSLwwUX9s6n8RLaRx+e0ZBEQqk2R98f
         CWwTixMzRHsFA75G7+14w1G3MB9VuYz5I6xSjywGCh4JDq2DsXPbu0tUL9Z2K1BEPfFx
         LLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751793932; x=1752398732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lA8KNkPs04Haqqyk/LQTF4+bgbkvtNg6lmvOnF3xgBo=;
        b=IWCff51zC40w55WAo/0eZu8fMJpCuS1OnxUpg6UOLz6C3j+1MZ0g3f5yLjNvA6YSFG
         kt8fbsbxNJdUAyqyn0cmWVMrloipLhd/i23AvSflay/NqY/jzMk3f2x29iSWTmgUSGEB
         a+0vZG7MKiohosSfMf5ORqscXzpXWSd9z1LPy63tF93OQIj3AP7Yibaxf6MypnPSnrrk
         fJm8eRbZL5NuJPLthtJo85/NvT3WBx44X3TSRPDTq80RcrSzKx/7vKxi07fjHWRIB1S8
         oxagsLe/T+jmDgyot+Guk0bHcso5gj1DtLn92ggPsodyQRN7PPx2a/hiOZ8Z5SbH3pfJ
         Jrpg==
X-Forwarded-Encrypted: i=1; AJvYcCXEKONdlSfB0mN12NNWLnznfHCpH1TJ5EOxn+P0KHQzbfUGyaHeFDMTAkcZmG+X0yCDF8kq+hL1F056bV6EHMm/HhANIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXFalgD3BJteEatdH63opwLZbmzOI6FLaD2ZNZiB3+bdV1ZfFa
	kCv2hp8afRb2QWU4ihMv9sT0l0S75rfoBo7OyC+++1p9L63lGj6jg0Rz
X-Gm-Gg: ASbGncv7gDnQpXso6CCU/BNjrSCJiKjHwMmVMy5zo36O5teVQHv3+LRvkg8Hrs8hTQX
	GF3lP2mPnLH9w7oc2YVrb3g0Plr6C2mvrHYoEXYR5fh/WUw6oCVAmW09iM1tGM8F6Qvjv/kKjAJ
	H6PF+JSPhWA2IizmDY5F5ubgzcwpA083iL5ICVL8VQmza/XBvuE9Fp/98aDvXjZu9u+REgVNkmN
	e4KbVzzGz8SErzFUSFqOxyMCRE7RJQk0qxSt6txJMyfAERvr4I/zjC9nrwAgOAP2IPkjWF6XCdW
	3PkGR/DI4I/6a7mcC1XopU6V77+w7qi6gxvqiZBMbpuMD0ZsmqhZ3e91WpjlMT/1wgxGwNhgvGH
	Kokipuw==
X-Google-Smtp-Source: AGHT+IH3vq2oxcWMOz4KCi0buYRStjOlQa2oNevR3gflhsdNi9rysjwR5KZGyuusMR46XX2R/z7LXQ==
X-Received: by 2002:a17:902:db0c:b0:234:8ec1:4af6 with SMTP id d9443c01a7336-23c91056ecfmr73738155ad.45.1751793931566;
        Sun, 06 Jul 2025 02:25:31 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c30:6f3f:3d1:c4c0:3855:2a18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae5393dsm6247089a91.11.2025.07.06.02.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 02:25:31 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] target/core: replace strncpy with strscpy
Date: Sun,  6 Jul 2025 14:55:22 +0530
Message-ID: <20250706092522.9298-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strncpy() is deprecated and its use is discouraged. Replace strncpy()
with safer strscpy() as the p_buf buffer should be NUL-terminated, since
it holds human readable debug output strings.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 drivers/target/target_core_transport.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index 0a76bdfe5528..9c255ed21789 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -1112,7 +1112,7 @@ void transport_dump_vpd_proto_id(
 	}
 
 	if (p_buf)
-		strncpy(p_buf, buf, p_buf_len);
+		strscpy(p_buf, buf, p_buf_len);
 	else
 		pr_debug("%s", buf);
 }
@@ -1162,7 +1162,7 @@ int transport_dump_vpd_assoc(
 	}
 
 	if (p_buf)
-		strncpy(p_buf, buf, p_buf_len);
+		strscpy(p_buf, buf, p_buf_len);
 	else
 		pr_debug("%s", buf);
 
@@ -1222,7 +1222,7 @@ int transport_dump_vpd_ident_type(
 	if (p_buf) {
 		if (p_buf_len < strlen(buf)+1)
 			return -EINVAL;
-		strncpy(p_buf, buf, p_buf_len);
+		strscpy(p_buf, buf, p_buf_len);
 	} else {
 		pr_debug("%s", buf);
 	}
@@ -1276,7 +1276,7 @@ int transport_dump_vpd_ident(
 	}
 
 	if (p_buf)
-		strncpy(p_buf, buf, p_buf_len);
+		strscpy(p_buf, buf, p_buf_len);
 	else
 		pr_debug("%s", buf);
 
-- 
2.49.0

