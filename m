Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B9C17332C
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749897443; cv=none; b=WcxLWn15rtMPBpMe1sIYITsGAYxwpmLQIu2uWZHYPSDWSKNFcQQon4wb+DC2k9E9vUj9H5cK0EDaOCuuU19cTdCmBZDGPlCJ92TUk8NdOCgiWuqx/As5iEn8f7H2lZj0M6foZzaeI8TM/Z1VdUCgbUwjWP4f1iwFbkYRTiBv/Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749897443; c=relaxed/simple;
	bh=V7uu/VARavhUP6rwGCjJXOTwLAbvEiVz1O2YrqzoPZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ieFLHfJTU8LBKvf3KeB9r5bJ9ZIMPzk7lf6MQivzWQvhVt27g2AxjYfdFhVN86s3jTC/zCWcg2grtpmOeG6JMoAm1QugveU/diHNR7AZckQ5pqs2ezQ9Vmjx+HODIVX9FS7oSDdDrN0G65ZuDgHSSKJVKl79OHM/5zEr2cB5i/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClOFurx1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClOFurx1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so188314f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749897440; x=1750502240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PLl1qEEwnvWsAvy9J8JIB4fScmcygAgIc7ADndq+ADY=;
        b=ClOFurx18IezrG3IYeaJvg1c7QoLPubx27+6FRTfNw2PjDWUig9tZFSifcHW/8qxhW
         41S7tUBvsvTL38PjIcAFpyq3EYz4caKUcGC84aSn507asA0tOWdHZKR+92RPfWuer//x
         TfDMoEteqzfrSOxPdrQcGvjQoWUTN+2nrQSWAMjQ0YCljhI6+XSKoKK7cSjRjQ2G7nEJ
         wcZ8MfWzjbLJ/SvV8rE2Z86cOFD5Ed86+uQYYIpgDoxMHkBDJ+jpcCoTDbd3nVUjvSdQ
         z0TIZyK9I8t4djLGdtz5nsLZhcczzK5MlFn/emKG+zmqG7xtVH/BkQDSNnzyXCyUBH93
         QXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749897440; x=1750502240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLl1qEEwnvWsAvy9J8JIB4fScmcygAgIc7ADndq+ADY=;
        b=m6S0QxCSiKWZlaWPHNoL375/UPevveQmNg+rOpNFVEMqeDyQEPN9+jLrAnydts6u/4
         rURQO0Gm5OG0BT2ozF1qUWpsLdWd93gltSUprvcvs+Ic8VfG9JIwQwneSZSncsAmX9n+
         nZtJRQMIxBehyK3fuqtObKrl4s9NAPj0C26nzpZb0FJCIh0yROahM51gjLFEiBoIa29Q
         MvUvg5LGZg57lZGs5NoApNdBfQ/mzeJ04SSB+nShuiUkaK5PYHoTtSRha/7Lad81iBGu
         t3wWiwjp+IEPFwW/6qW+IiJTY67P/8HFwMvTauwJlep2GCCwUqrHuNRHRYyM335F448f
         CXmg==
X-Forwarded-Encrypted: i=1; AJvYcCVxhTSZpKunH6UbJWB4ZmUxzYIYu3DUj666z2QrigqsYf091V7hslQJFEhLQ1bDgf5StOsR2ofNUn3j+D20HVY9mZU/Ig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4jFqE10qRnpMffmbbpAlDVmZRZjlZYrKjMzQFZC6yX5ia0uGn
	duxm8Q+jHMtbwWcGEUrdnBc/dDMm1LIbaXzJb2Hu3J0R5lAqvWa8Yu8Q
X-Gm-Gg: ASbGncs5IY1Nnrlng0RaGcS4UmvKbQ2OIqT8TzqGAOZc+KuP+f1k4CH2hRrImFPze4J
	Ylryp2cuzn3WeyG/x21wL3pHWXlK2IuyT9/LDe6cZWXy9JQlcsLgDadhsx28kaPVoqAv969afCG
	fIFMp71B0f1saXPi5gR9PdIXq8DchUI+iGvGnmVPagrfoGI70Iue1Gb36DaCe11v5wgeHsF+cTH
	0rwfEXVXcjjBtnmM8ZqyuU3f4v09Alid0dLimtk5E5Zal2tj1saLuQRQ7ZG5eXuYT/w2gLqf0vI
	l0dq2me8aA9q9ZHq21A+tOCo6aFHnnf05yrkEglzTShwyw/a81+AKg1UOW1TvzuaVA940/lHmne
	u8PbqspqcbrDyrpCm1DJCEK+0hz4OCzKHOw==
X-Google-Smtp-Source: AGHT+IEO2WJsG7rm3hmH9d2SJMbbIL0GVTNr61YBvUZhyy9Qp55TsFSXVuwBOr+Ocv8M12TzoBRQiA==
X-Received: by 2002:a05:6000:2f84:b0:3a5:2ee8:ee1d with SMTP id ffacd0b85a97d-3a572e99672mr881171f8f.16.1749897439458;
        Sat, 14 Jun 2025 03:37:19 -0700 (PDT)
Received: from localhost.localdomain ([154.182.223.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24420csm78091745e9.20.2025.06.14.03.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 03:37:18 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.com,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] drm/amd/display: Add kernel-doc for mpc_funcs.mcm and rmcm
Date: Sat, 14 Jun 2025 13:37:09 +0300
Message-Id: <20250614103709.72045-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes documentation build warnings:
- WARNING: ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1068 
struct member 'mcm' not described in 'mpc_funcs'
- WARNING: ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1068
struct member 'rmcm' not described in 'mpc_funcs'

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index 6e303b81bfb0..ac2957c9fdd2 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -1038,6 +1038,16 @@ struct mpc_funcs {
 	*/
 	void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, int mpcc_id);
 
+     /**
+	* @mcm: Multi-Channel Mode configuration operations
+	*
+	* Contains functions for programming Multi-Channel Mode features:
+	* - 3D LUT sizing
+	* - Bias/scale programming
+	* - Bit depth configuration
+	* - LUT read/write control
+	* - LUT population
+	*/
 	struct {
 		void (*program_3dlut_size)(struct mpc *mpc, uint32_t width, int mpcc_id);
 		void (*program_bias_scale)(struct mpc *mpc, uint16_t bias, uint16_t scale, int mpcc_id);
@@ -1050,6 +1060,11 @@ struct mpc_funcs {
 			bool lut_bank_a, int mpcc_id);
 	} mcm;
 
+     /**
+	* @rmcm: Remove Multi-Channel Mode configuration operations
+	*
+	* Contains functions for removing or resetting Multi-Channel Mode features
+	*/
 	struct {
 		void (*enable_3dlut_fl)(struct mpc *mpc, bool enable, int mpcc_id);
 		void (*update_3dlut_fast_load_select)(struct mpc *mpc, int mpcc_id, int hubp_idx);
-- 
2.25.1

