Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B2F154BF5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755453117; cv=none; b=XgrDZZFH1Nn3IG7wvLcKrQ2M2v8gPkWRO9knh+4DgEdTuWIczSmgMcu9lFQvuUiulY8+qIp+u34X6CfwbOeHH049vHLq8iLpKd4wpRimsNI/PfQJWBMoAvmskk7a2NhdmbpHXOjDDcLZT6fEYLbPqDQ5rR9zaFjz0JVHKWG6Ye4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755453117; c=relaxed/simple;
	bh=cURaJ+5cVQSqJU9KslDGDbYDBdJAmFLl/jJs6cOvljU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qFrag6M9nwPP2xScY+JA9L/vwqyNsLtF48KXlDptmdIfElbQBcKdjHdUQBY1+v4WimuIwKRVdmcstElzYV1Mp2HNB0hzBBNihKnCHUjKLuOefHQjUPSP0ZKCjt40pZwtwZhX8+JtvqINzKk4HdzFN5agPfm7mbflK5SLeXySQ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvdn9bFW; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvdn9bFW"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B07176143C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sjji6H4gOdtf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Aug 2025 17:51:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E73E613B8
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E73E613B8
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kvdn9bFW
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2E73E613B8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:51:55 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b4717ba0d5dso2302084a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 10:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755453114; x=1756057914; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3QG507El1mmJsiZaCHgTNCBhi5aSvoL795gwkq7Ka5E=;
        b=kvdn9bFWiFDO3QjPQo2DdwkCWP7NWDSaFQEG/xAQl/QeOsS8sPiBrxmdobhWYxhX4L
         0t4ntNS3iC+nlNN5uF82cMURVNE7iJFLfauLfF4QPFmZ8SslXKVa/j1Jp3JHnt6WoLsj
         r2JChTmKbtnDIgsPIl65ajvk3iod8gVyHDwF9i1wPafhKlEB1VvI+EV17ylb9RPb4sl+
         PrAsN/H5qLTskSISYErZ1ASWgr1W9BrUirXUtEKlOXofblUH5VK5e5Q9ySRifuRPVU2c
         nDZLnzAGhUm5izLfFxg1Txy+cPlV+b8SkrLJyvR3BwjKl3afUQwj/BoYY6SVEEGQaJpb
         zv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755453114; x=1756057914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QG507El1mmJsiZaCHgTNCBhi5aSvoL795gwkq7Ka5E=;
        b=j7OpwVXZaYjYw0DZfPBGK3BFQNqzCVUGoEOTj5ykyQAOr5/tRQXaeierOgNW/2IJh8
         eBT305OAh5lJ8GqOGiPzStIXCV66PK99Ncvht8XILyWZ3Ab2n/BZ6b7Fx/+l/DUtqfsM
         /sRwyDjjUvDjIUMFEKHc13yBSkZalm9pE1T6+PR4qsnGMHgRzamRAKrh1oF76vjJr77w
         FP56GntSNBcaOTOk5/t1bg4Wpki1Nc4+Lugt7JO04KIAr0Rnpu5lZhyI9D4OtHRcbVo8
         oMsD5l10hakQKBsCB/GPTtVQRHewNLyBxST6aPMy4hHKmdGi6Jhu76kneVDcElyofl/b
         AFEw==
X-Forwarded-Encrypted: i=1; AJvYcCVpcf/gjyzNNim/IuU4hjtgINqdPIeGmez5r6QyXNXLDSouZa1qJt7F+wWav1ijQsir20bUFC/dfJUfIrynLlzVLqoKcg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwntPaG7dAI5vfSKm17iJHDY6dK7/ivlMThKx+oPQ5PDRe1OZL+
	E18QkxSYfCcl4b3zKsE6ojZJH+mSqz8hISMgoQ2HGUM4z+EBF7gV2+TR
X-Gm-Gg: ASbGncviYfWDxEJyHcyZIBRTBrPrytTHDf0h6RIweqTqyuhgtWng/Tjz2v8DgsxBHWV
	AGAVSNYVU6ijY0T2C8nG82WbSOBFTq5LQZqYisl4nLzO6Z1AKiAArw0NlG8JAOXCi316CUJURIK
	/geMV5BeBqGXfgtReIgCEz5QvPwklj1S3w6LAMEhKohAuRSL6Oh6f0DctMke5uVXDWdTB9UkNkJ
	FO1r3JYrfSzq191+getw37dFYZ0h89TUbJnjwHFu0Q54yFhf+Ss96E6Eq6mVOkBXhWKhtYElaXY
	y4H0N38ZNwsvVv2okTsFGAPkOu9jiblllwM1M6La6NcZb/kiEIwicEBN1jgVGjyykGNrqT2JQvM
	NZCL0Re5Z6Zcx36IpA+M5AN39d+CihA==
X-Google-Smtp-Source: AGHT+IGWskQPRNPAgR8Rze5fL7J5s4uZcyQT3GWuhl8vgwShbcJQ7Fou5ZqjMHZQ9ifBAuMxmQVxYw==
X-Received: by 2002:a17:902:e88b:b0:240:5c75:4d48 with SMTP id d9443c01a7336-2446bdfd789mr134078535ad.25.1755453114191;
        Sun, 17 Aug 2025 10:51:54 -0700 (PDT)
Received: from lkmp.. ([157.51.82.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cb0635csm58931965ad.53.2025.08.17.10.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 10:51:53 -0700 (PDT)
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
Subject: [PATCH v2] Documentation/driver-api: Fix typo error in cxl
Date: Sun, 17 Aug 2025 23:03:56 +0530
Message-ID: <20250817173355.6615-2-rakuram.e96@gmail.com>
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

---
Changelog:

Changes since v1:
Dropped fix for page-allocator.rst as requested by Gregory

Suggested-by: Gregory Price <gourry@gourry.net> 
Signed-off-by: rakuram <rakuram.e96@gmail.com>
---
 Documentation/driver-api/cxl/platform/bios-and-efi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

