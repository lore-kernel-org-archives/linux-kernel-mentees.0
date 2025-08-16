Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F3814F9FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 18:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755369054; cv=none; b=gwYrW5CRWOThwXw8sSZvJ2DGEMTf9IJYne+w8NTabNaSkB/dEqKBupzoZKLXqhfFJH3bm1dRLru1W5pTamM2eQC0susut+m5ZK5mdY5078QNGPjuFGk8EPW+RINshgQkSrBmfq9GllH/UnqTEhT5vQVvgx6IycjgerQdkWjnZHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755369054; c=relaxed/simple;
	bh=Ca9Tn1UJzfTzHyDL78FjDFTXk6DN5IoHNYT47ja8cTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E9PTxYlopApl+AeJMAUWKA/AMYOJBFVZ8b45egj1pWPczIXwPD8ACRKxd1Xz0zuS8IcMB7hulADWApWAPIZ6wjmjCK2aBv+MIXJulcQNhy1u/gyetHFWJtl7T+iUg6lhqQCmy+eQXBjgEmCLy141fSkxNRvNownD0uddLWvsQzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f68n8GOj; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f68n8GOj"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F2C76139F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 18:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAFJWgqTnvG2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Aug 2025 18:30:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6244A61397
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6244A61397
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f68n8GOj
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6244A61397
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 18:30:52 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-76e2eb6d07bso2632161b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 11:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755369051; x=1755973851; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fhn2t1l0lC8TOAJKE/KsB3bglQE6ARXTKvnpQpTHz8U=;
        b=f68n8GOjRYuU42UxN33AnpIxKk8BlkcFjBlB44stZd8+KndjdI2g0Cf/E0zvbtDWJI
         KYIW+wzgEYAUt4wXkXDZ+VOghOtZqjDX2WbjW9FsZgyOQqfsV1fatsUEfzDeWy5yVegr
         xlgN5Yx8mA5qUtd/CWklOXeM/GSuLWPFdKSnRur/vFdMe8C24QzqHtcDXR/ptct5NzV4
         jpv8ftfvoG1p9xX+kUP1D1yAFbejKCl2w4aSFS1nP2LzuEgMmd+DL9QWzlLMfyM7BjjO
         AGV3ih5KHPQTCbl/cCPL2AgRy95a1namkOp0l94SAGVdGWMK1SRM2LpT5jzDbqeb6Aoe
         fg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755369051; x=1755973851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fhn2t1l0lC8TOAJKE/KsB3bglQE6ARXTKvnpQpTHz8U=;
        b=EZ2/Oaq6FpfKAvMm9t8EADWRvnLFPw/AUZbV7XPaRcUM0XbACxECF0adNkMdNCqjYc
         rcGnrl8Qwax4V0yJTTEwmox8/23ShcO9m7U7GrWX59i8X4Xe/qGlQGKw5QgyhLrjdfrr
         JfpkxCQG3vDpMwZt0VQaZBd3xFPuwjuH0SEIuahKoRQ+ZAQLCJUZwWqjC1udML29iJGm
         unfTcn7TT86G90RYMIpUfhKAtZdV+u7QOO3Vrx9LiFDLhiUwFQPA/nU4CKOn99yznANh
         W1nO1tc1TARVXE0TQnct1am4jqcGdiVL/4vkmzifC8t0Hp0S8xjxVcYXcyL/3urZtC2b
         b+Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWSy6lMOOaqwYyvBlNV3WAQo4sC1yggJnP757cIuBVMiGZZ+nIzcqrhJY9ohVdcfzYGiT9EPDHE4lS4fwDnLrQh5uJFAA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzd/VORQrDNSFT0oA4XeTgrLRr1Ir0RK4U+0ZV3003/pAsdIpZA
	U/PnSglwIBvMEhPdTz2qVeIX3OvV0845c8Zz6CxWORHWZmw1xsBfNXxe
X-Gm-Gg: ASbGncvWC2q6qvHyfESyO8NQAMPVcvK6yKtMNxXGfhnLmCCIaOpt9w7V8t9GqK47C9j
	Es88Z5sOojpE4wBi7NQHhICLnXTnV8Sv++/U18+wEEs9bnT4BLveE79yAIpnnqzHMuKWSegWi+g
	5ScOHNqHUOctP4fjf6v2vo2e0or4j62ztNvhUp3VoOAlXSyD2SUXALY9Vy8aQSicmU/u3WSYmlo
	htK+TZznp1Uu1/m6YJLuQHjzVLNlGjKpN24p7SVdDlGjC9lbNT0mu6Oq50HxcgRswNbR+mUlYez
	4XYEpiBuB5w7Bs9/VJ/OZNb9+r/rdPyCq1jWt3k4ffri5hh2JQIyWCbwhmC2sVUCJQKybbI/1Pw
	MXTwcUtx2LBAATFrFgPAAs92l5NXAG55a7UwGraAqGg==
X-Google-Smtp-Source: AGHT+IFjz0rJDhGfparMNY6VC/JIueZmZiEB6VolaLHi06NigLtt9WJc9wH1l8gFuRX+8nKyr9njyg==
X-Received: by 2002:a05:6a21:3391:b0:240:198:7790 with SMTP id adf61e73a8af0-240e619e927mr4884569637.10.1755369051185;
        Sat, 16 Aug 2025 11:30:51 -0700 (PDT)
Received: from lkmp.. ([157.51.100.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d73a418sm4251175a12.38.2025.08.16.11.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 11:30:50 -0700 (PDT)
From: rakuram <rakuram.e96@gmail.com>
To: linux-doc@vger.kernel.org
Cc: dan.j.williams@intel.com,
	dave@stgolabs.net,
	dave.jiang@intel.com,
	jonathan.cameron@huawei.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	linux-cxl@vger.kernel.org,
	alison.schofield@intel.com,
	gourry@gourry.net,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	corbet@lwn.net,
	rakuram.e96@gmail.com
Subject: [PATCH] Documentation/driver-api: Fix typo error in cxl
Date: Sun, 17 Aug 2025 00:00:33 +0530
Message-ID: <20250816183034.7970-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed the following typo errors

intersparsed ==> interspersed
in Documentation/driver-api/cxl/platform/bios-and-efi.rst

ndoe ==> node
in Documentation/driver-api/cxl/allocation/page-allocator.rst

Signed-off-by: rakuram <rakuram.e96@gmail.com>
---
 Documentation/driver-api/cxl/allocation/page-allocator.rst | 2 +-
 Documentation/driver-api/cxl/platform/bios-and-efi.rst     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/cxl/allocation/page-allocator.rst b/Documentation/driver-api/cxl/allocation/page-allocator.rst
index 7b8fe1b8d5bb..4ac3368c3947 100644
--- a/Documentation/driver-api/cxl/allocation/page-allocator.rst
+++ b/Documentation/driver-api/cxl/allocation/page-allocator.rst
@@ -62,7 +62,7 @@ Because the local node does not have :code:`ZONE_MOVABLE`, the CXL node is
 functionally unreachable for direct allocation.  As a result, the only way
 for CXL capacity to be used is via `demotion` in the reclaim path.
 
-This configuration also means that if the DRAM ndoe has :code:`ZONE_MOVABLE`
+This configuration also means that if the DRAM node has :code:`ZONE_MOVABLE`
 capacity - when that capacity is depleted, the page allocator will actually
 prefer CXL :code:`ZONE_MOVABLE` pages over DRAM :code:`ZONE_NORMAL` pages.
 
diff --git a/Documentation/driver-api/cxl/platform/bios-and-efi.rst b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
index 645322632cc9..a9aa0ccd92af 100644
--- a/Documentation/driver-api/cxl/platform/bios-and-efi.rst
+++ b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
@@ -202,7 +202,7 @@ future and such a configuration should be avoided.
 
 Memory Holes
 ------------
-If your platform includes memory holes intersparsed between your CXL memory, it
+If your platform includes memory holes interspersed between your CXL memory, it
 is recommended to utilize multiple decoders to cover these regions of memory,
 rather than try to program the decoders to accept the entire range and expect
 Linux to manage the overlap.
-- 
2.43.0

