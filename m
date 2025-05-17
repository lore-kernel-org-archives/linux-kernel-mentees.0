Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1CA7E792
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 03:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747451179; cv=none; b=LORWRaQ/JGv+ojhJB5ahcnBJIAPT08VP+oyJBifD6WEzPNCfSWupmOXMm+LXUPpAhPU7jNWrFreizLbqyEPRAJpEHCoUg6lpk3kd1AeTkYS62nUjxLkJ7YbF4+zS1C+T0Lz0mhoxw1bvON0O0n7Wm+WfTHvqrqeOx1k/ZrHY4qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747451179; c=relaxed/simple;
	bh=zv+Z+CObrsv4IbS6imh34PEuvxtDkiDj8Pr8uiF06Bc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mZNwlGqWdhp2s+IPBkfjJaYnCkt4VpvtxH3Z09KgGfc7d2UVLZKy1qPIcisgP1dC0KRgAvPonpCM1YE7Duixh1ZrMAXZTI8+ZxHFwI0vmKNo1A7zcu+3ABxmjKsegUCsIM2ANU745CYQhPra5LqciZ5zIE3qEsunL5dRpqtFhE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmSpsXyf; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmSpsXyf"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4769f3e19a9so19648741cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 20:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747451177; x=1748055977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZGXEhveDuCitdT22/K4UxFR+ROBomEnJNWF8hsYQo8=;
        b=YmSpsXyffsuLFiROmSb9wMzNGER8cUq4pAx2cIiJRHDg6XkJb+IS/89iwaFpW/ixIS
         MeoGQfxs+sgZu2rk3VLNT9//aQFYx4ThFm9nRWiv/20ruKIkZsufQRJkZvQUMlqpSEdU
         urpthN5G89tO2jjl0rSXP/TrJgnT3XBRTSEF5RrGHX/bDJZjvcFAXPoK7V5dulF1vdKx
         /x+d9pqOMhZiU8IX9XMyuLUUKCj2TeYrp1t+Qa4S50cLN+STCqFQjsd7ItiOnFP1ZVvn
         IDtnvJMqtMFek3Bcc666wgY932OoY/BSOJlGRwx4VrkVA3sdyTTMT6JasJsIgL6OHvgE
         7oUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747451177; x=1748055977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZGXEhveDuCitdT22/K4UxFR+ROBomEnJNWF8hsYQo8=;
        b=l8nbTCsgo6ioZvh/aa4xy6fZ1yLRKa6fog8ieCYam9QbGMzihD5t0KeJ4RJPheEtfu
         X8GUOWPiiE/K4l3V9H7D6nPfIQwiLu67tdnNkcY9gXOQ+4QlZ3sbVALGmMMz23K3xRz3
         CjFC3QJmS8UNLIO5OvFsG0XtbeNE+5rxRtPjL5TKAifsSJl5YtSwVNTu4HK3jedHowoS
         /e+B3wyY9GYb/PAv91xouAvdVs9w70fvgT5V8ZCYfvu5+/eUBy69gKXQa+tqmlU6umbD
         a1Ts9xToiHVrxf3QEvjrqxeFt8NXC6szIFbvEmSTxa9ZLLmJ+cwQdrtyoNvwXnhTzXfg
         C7jA==
X-Forwarded-Encrypted: i=1; AJvYcCWYO7gBhLjySyEwbZuK34+OtBMIOUqxAwLtNIJ8EYlVa/+eR+oPEQ7vIwNwPHxUpSFPMtc1c9b0MxMEhKDL7+lyAXvXNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5AqPrFWQV74LGtTxsOqtDhMDRk/0zeNrtb/u//ktR5GNP7gJk
	825Dlhn8SM17qGBbv83kSiQslAUwtBwQ8SSSVP3BZ9G0RwzAFOpQXVE=
X-Gm-Gg: ASbGnctjvou7AfBS/BJoWn0OGAC/DWMzL5TdB6GIzMo+0aEABa8D3ij6BwzGbA5ueMp
	K65BcE6F3lEwj3ImKNsFZCtD0yRhnSylNpgie6DX7A0z29pZeyIXF3gipoJ7WlSY7QEfHl/87w3
	lx0sKPU/RcAJT2t6EI+0iacHz6jpyTJ1zqT68nUxBuba1D9pU5S/52oUkm7I6gRYjHGBUYBSufY
	AgpO7R3fj5xyJsFCxV7r5TijICHmrFAsbO/guNSwFW2GUx5URxpciW9UcBJriOH7ZMyH/cqjIuY
	MMu5twG3d+FZEBNQDG9Pj8wJhHoY5vWry+q8TIrx5p6ybJdOaHM9v5/70jwqbwE6+hp0IzFkcoO
	j
X-Google-Smtp-Source: AGHT+IGC2KqqWdKSLgraq4ZAjWt6t+IYKKHBmiJqJ15wcpjY1936g/G59NR3qvc/8AmiYG0AaW0wow==
X-Received: by 2002:a05:622a:2447:b0:48b:512a:a919 with SMTP id d75a77b69052e-494ae3500acmr97122961cf.3.1747451176587;
        Fri, 16 May 2025 20:06:16 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:156f:5546:ce07:3a5c:a2f1:3741])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3cd517sm19165721cf.10.2025.05.16.20.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 20:06:16 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 1/2] fixing typo in macro name
Date: Sat, 17 May 2025 05:06:09 +0200
Message-Id: <20250517030609.818725-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS

PS: checkpatch.pl is complaining about the presence of a space at the
start of drivers/gpu/drm/amd/include/atomfirmware.h line: 1716 
This is propably because this file uses (two) spaces and not tabs.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h | 2 +-
 drivers/gpu/drm/amd/include/atombios.h                      | 4 ++--
 drivers/gpu/drm/amd/include/atomfirmware.h                  | 2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c                  | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c         | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
index 813463ffe..cc4670316 100644
--- a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
+++ b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
@@ -424,7 +424,7 @@ struct integrated_info {
 /*
  * DFS-bypass flag
  */
-/* Copy of SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS from atombios.h */
+/* Copy of SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS from atombios.h */
 enum {
 	DFS_BYPASS_ENABLE = 0x10
 };
diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index b78360a71..a99923b4e 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -6017,7 +6017,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_7
 #define SYS_INFO_GPUCAPS__TMDSHDMI_COHERENT_SINGLEPLL_MODE                0x01
 #define SYS_INFO_GPUCAPS__DP_SINGLEPLL_MODE                               0x02
 #define SYS_INFO_GPUCAPS__DISABLE_AUX_MODE_DETECT                         0x08
-#define SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS                               0x10
+#define SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS                               0x10
 //ulGPUCapInfo[16]=1 indicate SMC firmware is able to support GNB fast resume function, so that driver can call SMC to program most of GNB register during resuming, from ML
 #define SYS_INFO_GPUCAPS__GNB_FAST_RESUME_CAPABLE                         0x00010000
 
@@ -6460,7 +6460,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_9
 
 // ulGPUCapInfo
 #define SYS_INFO_V1_9_GPUCAPSINFO_DISABLE_AUX_MODE_DETECT                         0x08
-#define SYS_INFO_V1_9_GPUCAPSINFO_ENABEL_DFS_BYPASS                               0x10
+#define SYS_INFO_V1_9_GPUCAPSINFO_ENABLE_DFS_BYPASS                               0x10
 //ulGPUCapInfo[16]=1 indicate SMC firmware is able to support GNB fast resume function, so that driver can call SMC to program most of GNB register during resuming, from ML
 #define SYS_INFO_V1_9_GPUCAPSINFO_GNB_FAST_RESUME_CAPABLE                         0x00010000
 //ulGPUCapInfo[18]=1 indicate the IOMMU is not available
diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
index 0160d65f3..52eb3a474 100644
--- a/drivers/gpu/drm/amd/include/atomfirmware.h
+++ b/drivers/gpu/drm/amd/include/atomfirmware.h
@@ -1713,7 +1713,7 @@ enum atom_system_vbiosmisc_def{
 
 // gpucapinfo
 enum atom_system_gpucapinf_def{
-  SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS  = 0x10,
+  SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS  = 0x10,
 };
 
 //dpphy_override
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
index 59fae668d..34e71727b 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
@@ -2594,7 +2594,7 @@ static int kv_parse_sys_info_table(struct amdgpu_device *adev)
 				le32_to_cpu(igp_info->info_8.ulNbpStateNClkFreq[i]);
 		}
 		if (le32_to_cpu(igp_info->info_8.ulGPUCapInfo) &
-		    SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS)
+		    SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS)
 			pi->caps_enable_dfs_bypass = true;
 
 		sumo_construct_sclk_voltage_mapping_table(adev,
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
index 9d3b33446..9b20076e2 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
@@ -394,7 +394,7 @@ static int smu8_get_system_info_data(struct pp_hwmgr *hwmgr)
 	}
 
 	if (le32_to_cpu(info->ulGPUCapInfo) &
-		SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS) {
+		SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS) {
 		phm_cap_set(hwmgr->platform_descriptor.platformCaps,
 				    PHM_PlatformCaps_EnableDFSBypass);
 	}
-- 
2.39.5

