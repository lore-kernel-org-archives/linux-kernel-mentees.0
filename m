Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECD21C6B4
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 03:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747451383; cv=none; b=VmzvJ2Ly/sfoN5AUnZftYUfJI9YqzA161vcfn/Ou/A0hmkoyJ+TCvvgcTen87zxK2y7yGAHheVRMx1bX1fx7jHgIPwF/SJstNPqOLQaOq5PcfQOZME1BT0Ak3/5TSkYJq2G9q03L2OsKZenYez+6xEIk+CQkFAX7Pn2zGZmcApM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747451383; c=relaxed/simple;
	bh=sQ0SEi8+VhRFz4W8nCt63NwfeaeVosLlIspPPRiUdwU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FQd/1f+TzcRP0SBvKb0TeScrKjz8pd/q5dQaxj1oOJ/LUakuayttKGxtZ4LW0OwtE78BwwqiOWziFIRJ/SRUt8B6B+V1QZBjEaTekcubmB1v5CSwKX/yj5oNkPK4AEFmrmy06m1w7GZIi3OnssQI0RvKVxM2tuf9jdtWzDSL25A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUarggDT; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUarggDT"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4769b16d4fbso17086451cf.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 20:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747451381; x=1748056181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffCQ/OEpQBGYzhPI44r26h6E9XjNcAQxTXB2Nzg9x64=;
        b=HUarggDT1/cG/alzy+Txln0ssjeRWiTRODkQp0ZKJz29GgXEDe8NQRSCCtaaBC+L6N
         axnqiU+SYKTXGVFvke012DGNMzCRVxszIkWD5gOF1OX5oHAJa4Oor2oCAT5Uf8JPutM8
         6U76S5H1a/iccGnhxzzVzPVWbwUw35+XzpZyyp3ePQgXBGdwUztMXBKyMw66+xx/YN+4
         G4EyYXvUBgYufoMW07KfVM1yGYV+j9KBzKfsnxO2rAUH/rT5e+hCo+V8RObMnw11cyCX
         GlcnRsAp1z41g2oVaf43OLGOUVtwL4Kq1yRNwIEdUGeSq23136wTFL3XycK1uhsPCagV
         KjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747451381; x=1748056181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffCQ/OEpQBGYzhPI44r26h6E9XjNcAQxTXB2Nzg9x64=;
        b=Evwt145/q1zjiPt18QF9iUhN12qd7CApqbiOBTUBVwNjKkSdRSc8cdnp3dE6MQuGmo
         eGvS+wqfasejtkTrhXz3Acpl8hPnX7MVFJuFCwByf4PSa9bh6EgGngEQQL2tTC6CN4oU
         wykCr4sZZJt99biTzMZ7wCfR9KasWym8NpjzbGQu4hXuM0c2Nx6DfmUPoRhs2OcBaN5s
         hbadUm0XG8EnmCivJOUJXDE3GjpUm12ai5+cl6WSOPJrM5X8x8169TV9GwVFPyw8OFqi
         G6uiZI6fZP4LEcJfmsRukgKVIr4PiKCxT3UAPI7vBYg1riBMVejTlNtoE/WBNfghuQML
         vSyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXysvcC1uoBl5W5D71PAjCRmgOCKht7sJ6DjwXfYZJunwkuRTCn4HhBnoqt6Bedyb2iQYAf9VkL6bAkEOltSe9YjBqYPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPUIM9KIZC/RuNAwtc7vx/ZRpUqXWtaRYBYRmb/5SHSlneyPHs
	ftCGlhGwf7LlfXQI4T0MNozG2e2XeXtpnBNnjvBkfZtGeWfO0t7oNDs=
X-Gm-Gg: ASbGnctYGJmjGSjMLM2w3aUoBkvf5o2fqvqK58WxSlRbHdwkoj0+pRSlcwjJ8Y35p1y
	i/1maeq97IpI2EFZn+MHdL+/Pu6+oR+JDxqcpdUU4Q3bHDhgI8hDZLkqZpqCICqWkrZXjLeqzgL
	jTBM4BBJqQ6ht6QRglaSVNWD35Cs0x8mIMBjy1s3hwByX8IzxOIEfXz0pGG8DA1X/2z3nDFVAvS
	QsrH88U8EYje4z3N1ULQ/pc/2mbxEaVGo82wM9R/Ay499rpaFlEoi4S5ON6+QwK4xMrENxLe63g
	e0u6+82Ieynsiq4wMkBmFtf/eCALZCNG9UjYH0JK8uk5okTaKq7qNvTdXWdLgBF+dHlIB6hTKhf
	b
X-Google-Smtp-Source: AGHT+IFAY96+ViAXpFtWvPTpkpmN/e9/h01C8VfuwPJZMxAbErTShgFH39ZlL3cy+dkElD1U1qsPfw==
X-Received: by 2002:ac8:5c95:0:b0:479:c1:6c21 with SMTP id d75a77b69052e-494ae3509eemr113366961cf.5.1747451381027;
        Fri, 16 May 2025 20:09:41 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:156f:5546:ce07:3a5c:a2f1:3741])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3f8f6fsm19165861cf.30.2025.05.16.20.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 20:09:40 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 2/2] fixing typo in function name
Date: Sat, 17 May 2025 05:09:35 +0200
Message-Id: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 drivers/gpu/drm/radeon/atombios.h | 2 +-
 drivers/gpu/drm/radeon/kv_dpm.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index 2db407892..b961096a4 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -5072,7 +5072,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_7
 #define SYS_INFO_GPUCAPS__TMDSHDMI_COHERENT_SINGLEPLL_MODE                0x01
 #define SYS_INFO_GPUCAPS__DP_SINGLEPLL_MODE                               0x02
 #define SYS_INFO_GPUCAPS__DISABLE_AUX_MODE_DETECT                         0x08
-#define SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS                               0x10
+#define SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS                               0x10
 
 /**********************************************************************************************************************
   ATOM_INTEGRATED_SYSTEM_INFO_V1_7 Description
diff --git a/drivers/gpu/drm/radeon/kv_dpm.c b/drivers/gpu/drm/radeon/kv_dpm.c
index 55dbf450b..4aa050385 100644
--- a/drivers/gpu/drm/radeon/kv_dpm.c
+++ b/drivers/gpu/drm/radeon/kv_dpm.c
@@ -2329,7 +2329,7 @@ static int kv_parse_sys_info_table(struct radeon_device *rdev)
 				le32_to_cpu(igp_info->info_8.ulNbpStateNClkFreq[i]);
 		}
 		if (le32_to_cpu(igp_info->info_8.ulGPUCapInfo) &
-		    SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS)
+		    SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS)
 			pi->caps_enable_dfs_bypass = true;
 
 		sumo_construct_sclk_voltage_mapping_table(rdev,
-- 
2.39.5

