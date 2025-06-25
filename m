Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A7D307490
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 25 Jun 2025 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750853185; cv=none; b=rhHJy/LVhDP2TeHWImDdHiXB1u3TCaf16ECu2J0a3Y5hCP2VAtKrzyGa2M+Jj8ELIwC4V/3pU1UlLDzUEQUAuaWmowR+Yj2xV+Qt5r5YoHgLbJuWZQ9U3j3ki2yokiulWjhE9peCqC2bgki+Qv9ZvRzThE+0MeQrgtCdp7BRwzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750853185; c=relaxed/simple;
	bh=sk3KwBpIIrphnJBmTDIE4jith+D91+JkwVEhlPpPi5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZIWfsGyJMXW8EruuPQ7+PNMcrjFeguCq9XFsafe78y+L2sc9EIFettNvF4UcqwREIl6ZNEjLNGWjSMzUWGcrPAjroELtjr3INn/eIBkha3/BAMPyq3LZLTzJmmsWO4b8nWLap3ChHID/rP5jwRmrUX7jxOjJ2TDe4yyFkg+wXYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kw+ZKzpR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kw+ZKzpR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-236470b2dceso68720365ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 25 Jun 2025 05:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750853182; x=1751457982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJQyZbGrLGzQaqvoMkS8YTL49u/v3LblMDiOt/0pDDQ=;
        b=Kw+ZKzpRtsjJ2h6arWtPNlEkDxAAbS64oTHfnNgi5F3K5JKCLCSGRv/tIYIxIWan2M
         Jf58C7joklQc/L/VpBGkR4+zmF4YG4UatxGBZDnucgRkP2XbDsCHc4NyYUFHkp0TSoIM
         J5QzUN3XtyuAb1Sxef3dhntWm3ImA1cRSHmAiDvNIE4k5UCaq4SJ4WrW+QJlvcr/hViG
         GRjQIU9aOunn4p14BFES7WXwpAo8BwymD1LvpeR18UBB/S4DU2ZuQi/hKekbzIpW9CHd
         1IyR+V7Vj7BjzG6y22rwoiEBmDCHZ8idWFDOuQYDh9n8Y8AdTEhSNawCD2R46g34hRUZ
         28Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750853182; x=1751457982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJQyZbGrLGzQaqvoMkS8YTL49u/v3LblMDiOt/0pDDQ=;
        b=UrjGjclILWGy8mEduvyIqzRbguNM6RUrWD8ush7/mF2x3xAJ8mhX0MzXpNLS16GoJV
         /v+pnzZHwGvim/lsJmGLVFQE65fClPWRV3AN2tRNo3DZLiyv6/M74GzR42w+SbcZYU5k
         9qxH6s+LN7GC5si6CE93Kyjmd6h3nX7GIPj/7RYlNLhNIsCJemNtceIxDFAFBQJyKvWc
         JKMFpUbIjgPx2Xk8Hh6TOF7zCS0ZliMvDbwCNeFPTvdKkecV4p0VugkqStArCuZzO44q
         7we/uqWReVY/h1JgkoXQEApTSY7nKz/owOHvoSAxAz885p7kD6wbwCGCPT16IXuGKSCu
         hDBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnA73oetWxS/zhe16zmUGkIc3yF2N4JoksYSZ/VLM+YZr5Yfjwn4L5Q6UUCYkyq8vl0rb5DNW4RvT42EdG8w9UlLxvgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKGElg0OL6P7Qzw5H/gd1+4jdQYihCKkm4syvJlV88tQNl4b7w
	WZPDUHlBiY3EFWGIdK/k0oXM84uYAnq6KVBr+5EGiMpathCPwoG8XqwA
X-Gm-Gg: ASbGncv4mWn01rVlKr2vKGyLv5NkS6xpcasGLZsa8pcD/sgwrfFcsJl2i17VURhEd74
	7iofAW1UqCUd3SoPhRC23mT+KA54Z6wA+OTudsG2LiABxw9cA7CfsV92XMHN1KwAaMc+3j5Tddg
	ec+3R+n2JvCINCHJqVVCGT1nfgbkOFPkJQJjBGhAMivGnd+Kn0e/hU8N+5WY7iB8q6KBg9xCXur
	ztBV/inIJ8DFcxOnnwkwgSK6FK4+EK6uYnFaVEQYEivItZ6M/NhMU6MMm44MMZmjlKedHi9n3N+
	mJ+mOWbN6ovsymUCTKjJgLrq4eL044QsXwmmIeKpE3VzJY8v9nmVX+T6xIUdxkECEhNlmDmpyA4
	=
X-Google-Smtp-Source: AGHT+IFW/227zU1PAtWE9n/7D2wZ5EANMebxEyNLnKo86hYDOg//y7zJ4Kqtt6qG413sAQxmvbc/UA==
X-Received: by 2002:a17:902:e543:b0:234:f182:a735 with SMTP id d9443c01a7336-2382403df32mr56141195ad.34.1750853182097;
        Wed, 25 Jun 2025 05:06:22 -0700 (PDT)
Received: from seokw-960QHA.. ([219.250.16.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393784sm129428705ad.11.2025.06.25.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 05:06:21 -0700 (PDT)
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: hao.wu@intel.com,
	trix@redhat.com,
	mdf@kernel.org,
	yilun.xu@intel.com
Cc: Ryan Chung <seokwoo.chung130@gmail.com>,
	linux-fpga@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] dfl-fme-main.c: Replace scnprintf() with sysfs_emit()
Date: Wed, 25 Jun 2025 21:05:49 +0900
Message-ID: <20250625120601.18445-1-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change uses sysfs_emit() API usage for sysfs 'show'
functions as recommended from Documentation/filesystems/sysfs.rst.

No functional change intended.

Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
---
 drivers/fpga/dfl-fme-main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/fpga/dfl-fme-main.c b/drivers/fpga/dfl-fme-main.c
index 8aca2fb20e87..4be51ae60226 100644
--- a/drivers/fpga/dfl-fme-main.c
+++ b/drivers/fpga/dfl-fme-main.c
@@ -36,7 +36,7 @@ static ssize_t ports_num_show(struct device *dev,
 
 	v = readq(base + FME_HDR_CAP);
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n",
+	return sysfs_emit(buf, "%u\n",
 			 (unsigned int)FIELD_GET(FME_CAP_NUM_PORTS, v));
 }
 static DEVICE_ATTR_RO(ports_num);
@@ -56,7 +56,7 @@ static ssize_t bitstream_id_show(struct device *dev,
 
 	v = readq(base + FME_HDR_BITSTREAM_ID);
 
-	return scnprintf(buf, PAGE_SIZE, "0x%llx\n", (unsigned long long)v);
+	return sysfs_emit(buf, "0x%llx\n", (unsigned long long)v);
 }
 static DEVICE_ATTR_RO(bitstream_id);
 
@@ -75,7 +75,7 @@ static ssize_t bitstream_metadata_show(struct device *dev,
 
 	v = readq(base + FME_HDR_BITSTREAM_MD);
 
-	return scnprintf(buf, PAGE_SIZE, "0x%llx\n", (unsigned long long)v);
+	return sysfs_emit(buf, "0x%llx\n", (unsigned long long)v);
 }
 static DEVICE_ATTR_RO(bitstream_metadata);
 
-- 
2.43.0

