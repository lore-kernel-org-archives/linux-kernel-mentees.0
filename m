Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8AC1F190F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 10:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269816; cv=none; b=EUVWhybxl7DWZn1gZEA6JB9qUC/UMqx+I42M6h6yIBM9xE8bnFHMl+0MfKKe1hAh4ARZ8IP6++3UvwUHlrn+QZaQIbub7kYntcJtPzbphmUcwIXQFhFDZT3F8GQlivFrRV2VFayDvt30iR1nSepWC+c5yqmsbjTHmTGmGHmp8F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269816; c=relaxed/simple;
	bh=fNsV/w5qlTC0UnjLXwyi9kyQZ7wIrrmDxbP6Hk8uLLY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O8FYV6liof88miB0YUdGN8vSW9qT2t9gzeZlmU1X8VmwaFuILNWjcUGELhcej+8XfiLOExiv49VqG/sXdINiscPfdwXJ1KZcM35/ykGNh5txKe8YdwfZYLfDnCw/892yT+an7XiemnrnuVPlSeVsuVf9kydw6ZJbKpJFUP569so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6J3wGka; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6J3wGka"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CC7640798
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 10:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9we6wAn0IGLf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2025 10:30:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=duttaditya18@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EC11C40790
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC11C40790
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k6J3wGka
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EC11C40790
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 10:30:13 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21f7f1e1194so62850585ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 02:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739269813; x=1739874613; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sHfbaJWue40oGVU9gl6xqWDxiyf5UiEbsGPKoxtQUu8=;
        b=k6J3wGkaSd/Ly+On2wJFu+AnflnHc76CVCGR6/vM9YZEByLyZS3eiJyuoteqD3BVKS
         /kSL2W5hoeX7/AUxLUNnFu0cFa6cGfm1o9i2/IHuI+rvr5byO1J8qLece4HyAXN8SMXe
         9aLVYFdaTtaUJVv+wd/aFCzMI1yml5ZG5tlwVCe7fkgoADzqblyk6RGe0LQR1i/eqM8X
         8m4fnASBrMwqSbn43O2srzI64yuhmVnLbWHreR3FEeLhsNdDzPDlYymdrq4IRYibVHUC
         AkHsNAmKIE11OkKhyOM+rVuQt0NapBfEGEKcuNsWfOPoP3E2MvVYcUXS2jsB0PQyjb9o
         PNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269813; x=1739874613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHfbaJWue40oGVU9gl6xqWDxiyf5UiEbsGPKoxtQUu8=;
        b=b5r/uDG3/gislk/oi79hMTGgyCdQZiPPj1NaHYl/03TDRT8QULqinS8sBKMGpyPDjR
         /x6oMA7c+9TppFvTIYEsr81EhI+BNXNxiXkWLZnhSHiW4gLCqQ42vhWSA+pju0c6dHw7
         s+MRpGBZ+AGRZWupKkofkqYWibMjJ1dwQSqRgsNDKx/PK3MpwHER+V1JZZwmI4aAxq4f
         5wsGHlA/b2EGA+FtoXxoh9lZvrVWb6W9l5N62pJXOVabOZOMyg8BcukoYTp9Yqk5twju
         4lA2aVc07BhuoBv720nDK3BC6nZvnX+ZqFrEAUKVsmfZKE6kEMF3naoNq+hlKuwwR8rS
         GNcw==
X-Forwarded-Encrypted: i=1; AJvYcCU6lGkaYtW6rXvvv4Cj9sVELw8QX2zIW5XPl/jXBcQKofk2Q3c+qWfkO6T1/x5vZr4YHjfKkyOLf9XIjUtnY5g9IMZKRQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwYTEnewio936B3GKTIuRi5zvT9xepodMNy45ubqYx6j2Cb2Jdy
	NbpqYF5wdRfyyLVoXOv/GqRs2cfcqVIxsEyJfI7djYHkv0Xbelhc
X-Gm-Gg: ASbGnctYdFmUhWHQX3T1nDSyZVPV1G6ShLf06t+s/HCSeeROgzgvWS+RRUerIen0Z+P
	QLU+QaHAgCFzARH31m1YJ6pJLudKgQN5ol5pRc5u/Wnirwc1jx4Hst1SqULwuWeYcw+1IAv0R8o
	vKHMbNZ/+6foeYSRJVi65iO+wfif61SBIrZfRe4nU1UKhuFVz41uXeplm5INNKsOYoJeVilH0F0
	nB1Q3QGrdt9s4lykxlxVonNtrKV3dathRcgdVZOsxYEv39Sac3zw6KOtJzzXRNffNV8WOrSsOLe
	yjgDpKlJDeFX8PKf83w=
X-Google-Smtp-Source: AGHT+IEnKuqhVUNUIpoiBX2xq3wVpCFtMSrJbwfG0VM2EBLTBd73Q6SWH+mSESRCyRpa+aZI0oVCjg==
X-Received: by 2002:a17:902:f787:b0:216:644f:bc0e with SMTP id d9443c01a7336-21f4e6c899dmr327386445ad.24.1739269813123;
        Tue, 11 Feb 2025 02:30:13 -0800 (PST)
Received: from pop-os.. ([2401:4900:4e6e:cd6d:2732:b5a2:e46f:2ac5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c8f7sm94054635ad.178.2025.02.11.02.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:30:12 -0800 (PST)
From: Aditya Dutt <duttaditya18@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Aditya Dutt <duttaditya18@gmail.com>
Subject: [PATCH] Documentation/driver-api: fixed spelling mistakes
Date: Tue, 11 Feb 2025 16:00:02 +0530
Message-Id: <20250211103002.199004-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed some spelling mistakes identified by misspell tool.
The example code in Documentation/driver-api/nvdimm/nvdimm.rst contained a
misspelled identifier (paramaters instead of parameters).
This typo would have caused a compilation error if copied as-is.

Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---
 Documentation/driver-api/media/drivers/zoran.rst            | 2 +-
 Documentation/driver-api/media/maintainer-entry-profile.rst | 2 +-
 Documentation/driver-api/nvdimm/nvdimm.rst                  | 6 +++---
 Documentation/driver-api/pm/devices.rst                     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/zoran.rst b/Documentation/driver-api/media/drivers/zoran.rst
index b205e10c3154..3e05b7f0442a 100644
--- a/Documentation/driver-api/media/drivers/zoran.rst
+++ b/Documentation/driver-api/media/drivers/zoran.rst
@@ -222,7 +222,7 @@ The CCIR - I uses the PAL colorsystem, and is used in Great Britain, Hong Kong,
 Ireland, Nigeria, South Africa.
 
 The CCIR - N uses the PAL colorsystem and PAL frame size but the NTSC framerate,
-and is used in Argentinia, Uruguay, an a few others
+and is used in Argentina, Uruguay, an a few others
 
 We do not talk about how the audio is broadcast !
 
diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index ffc712a5f632..ad96a89ee916 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -116,7 +116,7 @@ CEC drivers		``cec-compliance``
 .. [3] The ``v4l2-compliance`` also covers the media controller usage inside
        V4L2 drivers.
 
-Other compilance tools are under development to check other parts of the
+Other compliance tools are under development to check other parts of the
 subsystem.
 
 Those tests need to pass before the patches go upstream.
diff --git a/Documentation/driver-api/nvdimm/nvdimm.rst b/Documentation/driver-api/nvdimm/nvdimm.rst
index ca16b5acbf30..c205efa4d45b 100644
--- a/Documentation/driver-api/nvdimm/nvdimm.rst
+++ b/Documentation/driver-api/nvdimm/nvdimm.rst
@@ -535,12 +535,12 @@ internally with a static identifier::
           char devname[50];
 
           snprintf(devname, sizeof(devname), "namespace%d.%d",
-                          ndctl_region_get_id(region), paramaters->id);
+                          ndctl_region_get_id(region), parameters->id);
 
           ndctl_namespace_set_alt_name(ndns, devname);
           /* 'uuid' must be set prior to setting size! */
-          ndctl_namespace_set_uuid(ndns, paramaters->uuid);
-          ndctl_namespace_set_size(ndns, paramaters->size);
+          ndctl_namespace_set_uuid(ndns, parameters->uuid);
+          ndctl_namespace_set_size(ndns, parameters->size);
           /* unlike pmem namespaces, blk namespaces have a sector size */
           if (parameters->lbasize)
                   ndctl_namespace_set_sector_size(ndns, parameters->lbasize);
diff --git a/Documentation/driver-api/pm/devices.rst b/Documentation/driver-api/pm/devices.rst
index d448cb57df86..8d86d5da4023 100644
--- a/Documentation/driver-api/pm/devices.rst
+++ b/Documentation/driver-api/pm/devices.rst
@@ -358,7 +358,7 @@ the phases are: ``prepare``, ``suspend``, ``suspend_late``, ``suspend_noirq``.
 	is probed against the device in question by passing them to the
 	:c:func:`dev_pm_set_driver_flags` helper function.]  If the first of
 	these flags is set, the PM core will not apply the direct-complete
-	procedure described above to the given device and, consequenty, to any
+	procedure described above to the given device and, consequently, to any
 	of its ancestors.  The second flag, when set, informs the middle layer
 	code (bus types, device types, PM domains, classes) that it should take
 	the return value of the ``->prepare`` callback provided by the driver
-- 
2.34.1

