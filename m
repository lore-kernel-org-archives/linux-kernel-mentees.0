Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486A281749
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 02:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751940023; cv=none; b=ZH+QOsIVWwOG4DDKC2r/aXMTQq12naTlMmgLliTOyZeDBP52hm6FxlDpHH1M8Bz0e6TjY2VuHyrLma3WAz2gtzM7rZlB3JOXmKIEzlVTB72XgIpDIuScpoP2D4H34UMe7NhSxsjmfllf7sr3uLjcBKLpFqhybneq4+Bl+VsQGYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751940023; c=relaxed/simple;
	bh=91abYvKBk8rNjMKNpDDCVDQ8rk5QYUhAVLWwVW4Yryk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pMIK9jwFrIhprZ3hwL2kxUshyQILSI1vVorbnemeLzPoqjVYlkXvgkgOE3bbDeiXSK1SfQL+2hj/cd3YUvSn18jADxQTu2vs1DTOkTfz2YQfJ714IIGax2JXkpHa6oPBtflC7bQWwMuaJb/RabcDt0Z+RLNvnVjN/iNYfJzWSWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OliLt5NA; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OliLt5NA"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5EA8612D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 02:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ng5IT7Rm_TM2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jul 2025 02:00:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=richard120310@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 35BDF60D67
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35BDF60D67
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OliLt5NA
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 35BDF60D67
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 02:00:21 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so3092940b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 07 Jul 2025 19:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751940020; x=1752544820; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEVd4c9rtKUA5heBsLe2UrTYnSXKGctkRZAQA/g8Z3I=;
        b=OliLt5NAN8ROpH0rBvOia/vCkQKWow3MzcqbGpaHtMXl+7LHHwfu7ozixEGudX7/Wz
         T8itGMWqPcrRxMXBVcf/KzAK/6LCZfl+ybhjuOOTnjEwa6k6eKdR5OxVgNKJxTXbON4P
         tfaoNk1/4RKSui7PTATwQUo/fqReYRJuEMhvkPJcLJvWBAvGpk+MQ8sajTD1aDh5hJxD
         cJrAnraDkv+7UcWBtfHFun2XztKvvW0x9FvDNxmSr4H2ViHqdtzDTHkEfKEeSsMPIQ3d
         rwyM314MmduGXmgJQutieYdzhReUcf2Q4INJ22l7TfE6Ql11I0XLZ6ZUakLfP478tj//
         JT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751940020; x=1752544820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEVd4c9rtKUA5heBsLe2UrTYnSXKGctkRZAQA/g8Z3I=;
        b=jF0HeTOw/+rSPLOXc+V0ULkFTWpnsmEGicvnsr4aO5nBpi0QCWftX/hv0EFYqTeGxq
         lk02N/CiyToH97LiSKR1e2nBojv7euOO1i9H+axwITDPTYTHKEofOGXHW5VFXRf+iL4L
         XqSgdhPjyOm+BOgiwLmjnsIoEANsh6LNbDUHBTn7b+UvslS+uXgiUIFjqVJ29rci2DwF
         z1KvGWq59hkh54l+OE7k1I2fpSdP5SWhrHiOdTIM5R9ynfcPdXMPVzdVOG2/m7x1X9XD
         dE/WHmyePjtIEBOKve4wfKkUV3Sw40CcytW6aRE7TpgSOJpq9ibBAzWZXVFFY0wdn9BY
         C2ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUpHctIS8AIU+0OsfeyoWet19G8h+tRLgLevh7+cSEaAjJVtFNYdJxQcNiPXfA1Q0noRcWR7kWh4kIvw1LBqV4Lw2LT2g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwR0cX+e4LeNxUAKB4SWS2Zx9izdScGh+D0uxbdNLhLUjj2M8W3
	0tR1lf5y0J3KANHHZIO2c3Z7IT6xH6ScWfKfhv2XKHiflleyNzUh/S3B
X-Gm-Gg: ASbGncvx5wNUXouGLbY/f7HoCvYTSvGmdPFnp03LpgbDznPYGeXjbLha2PClXq1bghI
	RQRt5BZjkAfxDpWRdnAXoREEvjkN1wp85tllgS2edYCcYa+FEqKYBueMS29WlBkfxzH2qBCqF06
	WT+K/kYsz+jVzNR//0Tzvid7FhVYELJxvA/5157QoWKoCKmbQSaEWIo5SiOwLgNVFilVkAY6hkw
	zKw1azXj4RuG3kC+ls/3As9AxtAN/y7Tj/rekLRFRFXEPK+AJWRCVqmj/4o0e9O54dk16Hz/A0Y
	ikn2yJnjqvlCX1I1jvZXM5fQGfamT8MoOYKS7dBJ6JDrCxxZotIn9y29a83Rs3uiqkS2M2umYS5
	w7kTaL8bw62VGPTyqbLYf9TnOoSY=
X-Google-Smtp-Source: AGHT+IFOjBA5PhOkJy9LEEIrkR4mzCKiTWeJaAPUPkpAaoNR1TA0Q4AS5fVgl8UdXlXeRkZHj6miSQ==
X-Received: by 2002:a05:6a00:4197:b0:746:2217:5863 with SMTP id d2e1a72fcca58-74d263830b1mr1265352b3a.6.1751940020044;
        Mon, 07 Jul 2025 19:00:20 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:6d05:8a3e:36e4:b104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce43d4f0esm10248049b3a.160.2025.07.07.19.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 19:00:19 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: tytso@mit.edu
Cc: adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] ext4: Refactor breaking condition for xattr_find_entry()
Date: Tue,  8 Jul 2025 10:00:13 +0800
Message-ID: <20250708020013.175728-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the condition for breaking the loop within xattr_find_entry().
Elimate the usage of "<=" and take condition shortcut when "!cmp" is
true.

Originally, the condition was "(cmp <= 0 && (sorted || cmp == 0))", which
means after it knows "cmp <= 0" is true, it has to check the value of
"sorted" and "cmp". The checking of "cmp" here would be redundant since
it has already checked it.

Observing from the logic, when "cmp == 0" the branch is going to be true,
no need to check "cmp == 0" again, so we only need to take shortcut when
"cmp == 0", on the other hand, we'll check "sorted" when "cmp < 0".

The refactor can shrink the generated code size by 44 bytes. Numerous
instructions can be saved thus should also benefit execution efficiency
as well.

$ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-44 (-44)
Function                                     old     new   delta
xattr_find_entry                             300     256     -44
Total: Before=22989434, After=22989390, chg -0.00%

The test is done on kernel version 6.16 with x86_64 defconfig
and gcc 13.3.0.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 fs/ext4/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
index 8d15acbacc20..1993622e3c74 100644
--- a/fs/ext4/xattr.c
+++ b/fs/ext4/xattr.c
@@ -338,7 +338,7 @@ xattr_find_entry(struct inode *inode, struct ext4_xattr_entry **pentry,
 			cmp = name_len - entry->e_name_len;
 		if (!cmp)
 			cmp = memcmp(name, entry->e_name, name_len);
-		if (cmp <= 0 && (sorted || cmp == 0))
+		if (!cmp || (cmp < 0 && sorted))
 			break;
 	}
 	*pentry = entry;
-- 
2.43.0

