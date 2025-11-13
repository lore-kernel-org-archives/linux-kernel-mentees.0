Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212E52EA490
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 20:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763064593; cv=none; b=nlAxxQAztdANtu6CgGqB9GmpGBH6CQfqA1XH5ZLEkSJfP1CwBPknmXCOgSyJKodvJcrdy1VlViN0HGcTnjM69TQ5QxAikbPGa0cZgGWnoeORivvHLffUwQJYZy5KfbQ3fKTYBJ1XMXJ+4BMdT0zHaMRTcWkJ0/9kaFMeX10NQXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763064593; c=relaxed/simple;
	bh=QKdBCUlNwtR+F2VgsVfMTt/KnsuIIdUNrx84lK3lLbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VVpA0E66JBY4RmKrQGPn53XO1SDPdarVga+m00Qivx8u/MUeZ5O+SxJBTWfOs6ee6a7dzb8H4tIfxngWZxQM1koFnIVqguc10WFKbmGsU9VgY1sov8g9sR0zNwiNHn3zAX0/dFG6VM+Ot2deYNk1Bdzz+jMvyaEDOiMKLeLz9ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNL6NZDO; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNL6NZDO"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE34680BDC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 20:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpId6Wlytfjs for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Nov 2025 20:09:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1733880BCE
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1733880BCE
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eNL6NZDO
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1733880BCE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 20:09:50 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-298250d7769so7716645ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 12:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763064590; x=1763669390; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gpG9MFDfcOAig9lTA5rz8MkmRR9OX2bi+Q5guu7HZEs=;
        b=eNL6NZDOCzM2G5OrOKgBy+lx0R4Vb46dZQqogy+9/xTcNSWWzCSwB9svUJAuqfhH72
         mSm068Fb0Khk/nHwrbtULY6Otb9mVHbMedQuFe6lU/10dd3WmATWUpu/4sPtPM4X61Ei
         BKvES4EM6fZyGDu6sOPVMOxgL+GPO1oLqnQ/1tT/+q3OWGPG3sXnlZcWlCGKPcEH5Tq2
         vH/iQDcZ9uknieW80ym9/tNk3gYlBBV8sztm81KFCWPVEw0k3ULX8JJJMe0rMozfRo96
         WmUpt5eM3yzoNBxKxtmlIDVmqMa0XMZxwAeAfQAxM0hc0QmeeMq05eRkRetbII4LTlFA
         NOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763064590; x=1763669390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpG9MFDfcOAig9lTA5rz8MkmRR9OX2bi+Q5guu7HZEs=;
        b=GLuJAbfL/296KAb7Df0i/qSP0u4HRIJwGFr4AHymHX0zZVHcWotHsS+0SZPHl7uJzG
         S6IUCduJ70zIGP/zn/hjdFYN/jZ1sGFS3ErFUKpRK8dKF40GPT5Aq/t2HMWj29AMGIVA
         O/qbRUz1oSPTMbauuvlfkkrv6RTg9EnJaDJ/zQLbgCQ8f+pj55IUb8f+xFdnCiS1rJAr
         W5y6frN0ckEoBu9RXfSOkBuVR8QYd+Zx76gjB4kAjE543UFyc1sQ4n4D2MCkKDv30ipQ
         zJY/IrDS4XXFC963ZZgbf7JcqsbMPqcDN170U+xwDq7/lwqz0SbUAp7xLpcbF8RJ+ChO
         whlw==
X-Forwarded-Encrypted: i=1; AJvYcCUnr8/lXMflU2Zqsk4XT5F1bUOheGgUPA4JGU98L3bgjnEtklYMffi54NYmR4nCn0OHzGbvO0tL2rrzsHkxrbeDfltaGA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxluUOXTra9zhEYmiUq/5BluwFuQmSFZmGalP8SG7A+KKNtxlSR
	49YTPOuAJaj8H3EbWDquRuPc6+sePZtURtQD8YArIJnxvcPOGOkd5xPc
X-Gm-Gg: ASbGncvcfdxucXYkG6/0ZTEFGi6UdRTvaogJQxAKEhgZQBUSWoTIRzP/XFUhv/+/1WY
	sbFlUXfJC6qmm0vxpthB/j+eHw2fxGdktVOr/OGDuRIDHh8XxZtuwUFQU2rMh13KakdreebFSYV
	qy4NhNKlAVpulF+sfVkE6P8x6x9h1e5xUDOrRK1bNhGb0NVDAA1FNuRygINZgaAJMOFC2KIWuQG
	TqUac3Jx+Zjvi8bfS7WsQGpjJMe7udjN5dMp3/M016zV1v2R+6WpnuSimZDH1FH5LWrJ3dkLEGp
	Zb8C0NbFAEd5AfFEsaJMumje4lNCs0jgr7e73AWxk7/yeTFBmSxLWeQDDsz1AcOJJLZp81arjgR
	vBzciTDKbiZ054XphIvJudNVY0UGK6ErONX1XydGPv28rgOwQ20xlZtj0qS2qZKEF7TvpNdko0g
	qv1qGH9Vd7rBV+6vgGE9CC+DbfeO95alkdtJS5DrMH4JqUxWF7P9Ecn3IShi/END7Hb1Y=
X-Google-Smtp-Source: AGHT+IFVs3N/0Nluydf2W8ohAwTgqQqd1hktqndT0y1P5e+0Z+Tsef7VZeDU5gPIi03W+2qZKgyt9Q==
X-Received: by 2002:a17:903:234a:b0:295:5dbe:f629 with SMTP id d9443c01a7336-2986a6abf18mr2384305ad.8.1763064589974;
        Thu, 13 Nov 2025 12:09:49 -0800 (PST)
Received: from prakrititz-UB.. ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf0f8sm33985925ad.89.2025.11.13.12.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 12:09:49 -0800 (PST)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Shuah Khan <shuah@kernel.org>
Cc: iommu@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>
Subject: [PATCH] selftests/iommu: Fix array-bounds warning in get_hw_info
Date: Fri, 14 Nov 2025 01:38:55 +0530
Message-ID: <20251113200854.429515-2-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC warns about potential out-of-bounds access when the test provides
a buffer smaller than struct iommu_test_hw_info:

iommufd_utils.h:817:37: warning: array subscript 'struct
iommu_test_hw_info[0]' is partly outside array bounds of 'struct
iommu_test_hw_info_buffer_smaller[1]'
[-Warray-bounds=]
  817 |                         assert(!info->flags);
      |                                 ~~~~^~~~~~~

The warning occurs because 'info' is cast to a pointer to the full
8-byte struct at the top of the function, but the buffer_smaller test
case passes only a 4-byte buffer. While the code correctly checks
data_len before accessing each field, GCC's flow analysis with inlining
doesn't recognize that the size check protects the access.

Fix this by accessing fields through appropriately-typed pointers that
match the actual field sizes (__u32), declared only after the bounds
check. This makes the relationship between the size check and memory
access explicit to the compiler.

Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
 tools/testing/selftests/iommu/iommufd_utils.h | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/iommu/iommufd_utils.h b/tools/testing/selftests/iommu/iommufd_utils.h
index 9f472c20c190..37c1b994008c 100644
--- a/tools/testing/selftests/iommu/iommufd_utils.h
+++ b/tools/testing/selftests/iommu/iommufd_utils.h
@@ -770,7 +770,6 @@ static int _test_cmd_get_hw_info(int fd, __u32 device_id, __u32 data_type,
 				 void *data, size_t data_len,
 				 uint32_t *capabilities, uint8_t *max_pasid)
 {
-	struct iommu_test_hw_info *info = (struct iommu_test_hw_info *)data;
 	struct iommu_hw_info cmd = {
 		.size = sizeof(cmd),
 		.dev_id = device_id,
@@ -810,11 +809,19 @@ static int _test_cmd_get_hw_info(int fd, __u32 device_id, __u32 data_type,
 		}
 	}
 
-	if (info) {
-		if (data_len >= offsetofend(struct iommu_test_hw_info, test_reg))
-			assert(info->test_reg == IOMMU_HW_INFO_SELFTEST_REGVAL);
-		if (data_len >= offsetofend(struct iommu_test_hw_info, flags))
-			assert(!info->flags);
+	if (data) {
+		if (data_len >= offsetofend(struct iommu_test_hw_info,
+					    test_reg)) {
+			__u32 *test_reg = (__u32 *)data + 1;
+
+			assert(*test_reg == IOMMU_HW_INFO_SELFTEST_REGVAL);
+		}
+		if (data_len >= offsetofend(struct iommu_test_hw_info,
+					    flags)) {
+			__u32 *flags = data;
+
+			assert(!*flags);
+		}
 	}
 
 	if (max_pasid)
-- 
2.48.1

