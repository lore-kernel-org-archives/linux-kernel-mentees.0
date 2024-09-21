Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC277DA83
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 21 Sep 2024 19:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726948631; cv=none; b=OvY/NDIuh5QBMjCzu7vzN/hl5BxIlIet1ybkclXbnSivnDrauJG7jVWx0D1gWD/x/1SrxbgIAfUOtm2dUud8KeFdxl2XtbAhS0c/EIcQLxu2zyUUdkpLy1jcnKhJVFD9uqwOtxVSEEUrHMNRtr2OcnhB+IEzgWm+bNe17nJWoWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726948631; c=relaxed/simple;
	bh=P0yvwIw4/C32i1K3Ca/Q+dUMGKZrikS92mEUTx5/M/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ugvwg5hM08zslc+GejbDhPFFpEsJjG8hGqjLQ9HZF5Hjw8cLrc939YYBGPZCYZcwXLRlTC72/BIex4h+BAPm6ADdBK9d1hRo3B8V8LKKpM6X8IgG6iSjTMxcoIhn83EN2/RVOBopWKi6WyQRnorNzk4+FNSpL1zfNqbApbpMEQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br1zEbQq; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Br1zEbQq"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7117360607
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 21 Sep 2024 19:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7_XbsKIfudI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Sep 2024 19:57:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=leocstone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA64860606
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA64860606
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Br1zEbQq
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BA64860606
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 21 Sep 2024 19:57:09 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-205909afad3so37666395ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 21 Sep 2024 12:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726948629; x=1727553429; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tL6Q4yRMI5cAA833hyiACaaa+MFKJlXA+BVwOAtvywo=;
        b=Br1zEbQqV2/2Ec6lSfKZDqLfaqcgt7+KCM9c3FFjh24aR+l+fqBwH9jfJ+jOlnME9+
         7jayqDv0CvwJ0OKa+G8Xp8ffc4v4bulTFBSp1VWT0iZDVsqPlbgVRSF1qpP9S2Q2VCRa
         XKWykZRTdHJ49hCA3yTJCBh3tBow7YUas+AqV1PHq1KTw/nDwqSYwYm4Kfas1XjNWZAS
         aPrChDmIxzmjkSUMHZM53mNKH5y0lTl+41wq8osCnN53A3jDjq1JW3Utc0aGTVxV15y7
         I7hF0AmRAxs81fQdtNSFJ8J5SaE2OJH6uHFAARI07NpAQaoqIB8gAaLHwovQ6+Xl1/bT
         KHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726948629; x=1727553429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tL6Q4yRMI5cAA833hyiACaaa+MFKJlXA+BVwOAtvywo=;
        b=UKqCVpQ64I7Ymkd2UYhTkJdQLHAUdTNchPsFjpH4xL9/q0lrVsJ8ILkW7cIg9acvJf
         E0zOPmnn6i0ncVzb1CxY6+AO6Z2MhbzXArtdzAdS9M77MZZWVHCOYWKMxSMD2683hpBK
         8WU97g5joaYckCIihj2s+76dTa+pSjOTk5/CHa4U9gOxRiT7KDdrfVGGX4DI5Tn4wR40
         tMZcszdz3CHnv7Lzu5aMaOLpisGRHieq8JbN94Ks0qt2uHrem5zdcs9P8Y6wy8r+5ixK
         d+20HD0RZzOtueb2ptDu7Gk4I8K1RX8vbrKPV4Ej9kWRbWchsRYZkVrfE5WpG52yZbs8
         BM0A==
X-Forwarded-Encrypted: i=1; AJvYcCUO3LKo5xv/G5/p3wjzWaE7LsdpUGomheUaJT/gnA+Y7wOS20himw+nEwPqROzAt5q3njx6zCq2jRTQRgHKBR/cpW8k8Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyKFqolRrzl1WenVtvqkQsadohteZriZu+yTYzmOPA7V9A0Pi6j
	vPFAAgZrESEyhxnnVpOycNU0BICcJoeEhuCZLYyOMoy96YyZbbPb
X-Google-Smtp-Source: AGHT+IHOVPLtF44VuR8xtKWdO1Sdnkq7LicaBWc92K+g37O0VEZI4c3J/dixnkEOEekfoeeN1wANdA==
X-Received: by 2002:a17:903:181:b0:206:9640:e751 with SMTP id d9443c01a7336-208d830ed11mr115040245ad.3.1726948628817;
        Sat, 21 Sep 2024 12:57:08 -0700 (PDT)
Received: from tc.. (c-67-171-216-181.hsd1.or.comcast.net. [67.171.216.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079472fb94sm112006355ad.253.2024.09.21.12.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 12:57:08 -0700 (PDT)
From: Leo Stone <leocstone@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org,
	ruanjinjie@huawei.com
Cc: Leo Stone <leocstone@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: [PATCH] mm/damon: fix sparse warning for zero initializer
Date: Sat, 21 Sep 2024 12:54:45 -0700
Message-ID: <20240921195511.364023-1-leocstone@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sparse warns about zero initializing an array with {0,}, change it to
the equivalent {0}.

Fixes the sparse warning:
mm/damon/tests/vaddr-kunit.h:69:47: warning: missing braces around initializer

Signed-off-by: Leo Stone <leocstone@gmail.com>
---
 mm/damon/tests/vaddr-kunit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/damon/tests/vaddr-kunit.h b/mm/damon/tests/vaddr-kunit.h
index a339d117150f..3dad8dfd9005 100644
--- a/mm/damon/tests/vaddr-kunit.h
+++ b/mm/damon/tests/vaddr-kunit.h
@@ -66,7 +66,7 @@ static int __link_vmas(struct maple_tree *mt, struct vm_area_struct *vmas,
 static void damon_test_three_regions_in_vmas(struct kunit *test)
 {
 	static struct mm_struct mm;
-	struct damon_addr_range regions[3] = {0,};
+	struct damon_addr_range regions[3] = {0};
 	/* 10-20-25, 200-210-220, 300-305, 307-330 */
 	struct vm_area_struct vmas[] = {
 		(struct vm_area_struct) {.vm_start = 10, .vm_end = 20},
-- 
2.43.0

