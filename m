Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CDE311944
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755592893; cv=none; b=JmOwnOPE0i+wf2Yq3mw3sBS6p90PmTffNSTNaDFPjm7Nybe/Y5gAdMwgV+cLzkW7fOVzxKCULrSHLEipB8UN2S+jydE5OVWPhNvW4eLA/uEoD2Z/WH+tJorb6CXGfFlRId/r8b1m56gzKwMjwH+zMJYeaNnH0jdPgpzsh0naWoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755592893; c=relaxed/simple;
	bh=hC3FF7CqXvYfG8tLDMZoTpgFfJ5oSyKKqMIelDWPp+o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OhIr4wUE/dT8LC9ZYjhnqXjz7naiptldtFETK5sx5TsLqjsWhg4xhcM8K5gQUeEDnkivABuVx2yimLE0iolDuaxMjlMAJDNLVY2Va2wjYD+TQn7GJ0+at62MMx+/9HBbz5oGBDYoaqwtQqdkdAbqupQVR+5nqbUpgky0da3aZAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQNKH2zh; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQNKH2zh"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 203DC4086B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 08:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdBP41e_prd4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Aug 2025 08:41:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=smokthar925@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 654CB40782
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 654CB40782
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IQNKH2zh
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 654CB40782
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 08:41:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45a1b0becf5so27143475e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 01:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755592889; x=1756197689; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FLUOi1Tq4O+Xr4PhuCC16k6tnogmko89GEp/A0Hn1CQ=;
        b=IQNKH2zhUZJaYjFZTsUFy9JGi5vCctcCOnndIcOSLr2BoOFGzRvw6tYbbRaYmwitdh
         kqXshk09EFiToki8l0aITY1mU8XC2Vhu3EIlQtMcVrVeDGtxMbMRh3FznfMp8ZQZpxct
         h+VZFsXh6DDKn6QP07Hgy7kCdMdAoAyBskgpG0VygWrU6ENMdgJfwQtYE/5q8pC6Yryh
         Qrw95h2LC5zq1VxX37Ll0lN3iMInPbqxwmujOdZMD85N2Umw/58E1zESG27HnJAh1JOt
         M3MzcFk8z407PpouEL+pqgIsOOlr8j8ZFTLndl7rZu2YrVmw1fAthcDILqWFBSuIJtVo
         mgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755592889; x=1756197689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLUOi1Tq4O+Xr4PhuCC16k6tnogmko89GEp/A0Hn1CQ=;
        b=nC8iKhNBZsAlSGkM0Qg4nBHv5rL1E54CcIHcjzz+exdMOSFaA70g/STnDNhgRxAMWA
         mlBvGZdGZlhNZrEkoIOLzYtbsUrek4rkRDFE79KXrcarkd9Yunl1UefVD9f/LeMxaHna
         iDxdUAVaL8mW+uE9TPuL0Zb9ouUllhe1E9TjgZR5UfWVcb2FooUZISPw+Qx8v1yjD8j6
         s33LMSBIeoW4wcvIh8JMw2fp/9e4HkgMts+l0wdseJ3wLx3x/VGQ+SEj72kj6Q2N59DR
         r35GCxEjHjjB0vMNaPkLGkIraqSawmMN4MuQ5CJDw0fPJGN4jpEJxC3Xs0XzzxP5iNVc
         0bUw==
X-Forwarded-Encrypted: i=1; AJvYcCVPTGXYB4yDAQparWxkG2u14O/T6dCVl2WkGaIztOLalwBvL0Rb1Slp276FX8iCe8S2hBNObZya45+OF+iHFvBzQTAayg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YypFXHxUhNcU3x/46Pkujwh3/Z+fRoPtXpbVqjA5iZcSE1A4eBS
	nDWTnM2LxkAJgLiZma2cPf66rm0z4loT/WSCdUb+r3cwJrHiuzICW04A
X-Gm-Gg: ASbGncvIbOlwik1yPt0QSekG+owflhOm4YO1b3LAgaPL6XixA+tIwD3NayaQl8KfrzJ
	6nN3i/DD0iyl9fg6ySVxqvZzn3RhdD8db1CZhEQ75Iy8lS1xaMR19SRNiJZ1co9kBnN1wW4Bm29
	Z0tDLg8fY/fi8XdqySY0pWTS43B1MIPnGQKMZ4V8llSiXNwooQx3E74cL7pxhpmHAVcxAW9OV8A
	PPQ3LjSIXpglgCGtVtZBrqe+0LyvHdw+jWJRjv0GMl00+MTLlYEdVO31YomzjYBqHWDVSNTuW6S
	658NuHXq6InrA7pA83rQbV5xUZEQFQZq345FTraG0bR2e5j+Uo+sMyF8TLj1vYl/7AkwzXx6ePg
	6cbrzbcUUiE8LoHeZdkJOvcnTb63rQug=
X-Google-Smtp-Source: AGHT+IHpZR4chIo9Jhe+nlOC9eKX5wgesPXTSJhgCyQ/YeZ6CrLEnmtm986TctbTOdpsG7HXLXCAnA==
X-Received: by 2002:a05:600c:5249:b0:456:24aa:958e with SMTP id 5b1f17b1804b1-45b43d464e9mr15595945e9.0.1755592888840;
        Tue, 19 Aug 2025 01:41:28 -0700 (PDT)
Received: from moktar-desktop.. ([102.31.181.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074879859sm2746131f8f.3.2025.08.19.01.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 01:41:28 -0700 (PDT)
From: Moktar SELLAMI <smokthar925@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Gregory Price <gourry@gourry.net>,
	Moktar SELLAMI <smokthar925@gmail.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: [PATCH] Documentation/driver-api: Fix typo error in cxl
Date: Tue, 19 Aug 2025 09:41:16 +0100
Message-Id: <20250819084116.13108-1-smokthar925@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed Typo in the driver-api/cxl/devices/devices.rst

functionalty -> functionality

Signed-off-by: Moktar SELLAMI <smokthar925@gmail.com>
---
 Documentation/driver-api/cxl/devices/device-types.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/cxl/devices/device-types.rst b/Documentation/driver-api/cxl/devices/device-types.rst
index 923f5d89bc04..7f69dfa4509b 100644
--- a/Documentation/driver-api/cxl/devices/device-types.rst
+++ b/Documentation/driver-api/cxl/devices/device-types.rst
@@ -22,7 +22,7 @@ The basic interaction protocol, similar to PCIe configuration mechanisms.
 Typically used for initialization, configuration, and I/O access for anything
 other than memory (CXL.mem) or cache (CXL.cache) operations.
 
-The Linux CXL driver exposes access to .io functionalty via the various sysfs
+The Linux CXL driver exposes access to .io functionality via the various sysfs
 interfaces and /dev/cxl/ devices (which exposes direct access to device
 mailboxes).
 
-- 
2.34.1

