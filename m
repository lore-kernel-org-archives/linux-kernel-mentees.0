Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48CF30DD01
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509530; cv=none; b=Qx25AKIYovd4WwVl/IFx0nvZ8lsbNSA821bJ3Y1tmF4bTOCKy1lVONldusFxPQj0VKAGOQkour+P0HxWAnp8ezg1Z8k6jiX+SmQ3Z9fssdHOqgSFAOtWExUfzvv91Sy/4cCy3zCAv1Uzh6lQsg2lnd81hreQmdEDiM/T5VpcAvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509530; c=relaxed/simple;
	bh=yHL+XSbBNGsMKJsHH4Uy4eDS/KVeEkZxpkCETJV5GnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FxmFmR/CpuDGTZnu7eWjECYT5y2szgD1/cJzv45ScJVjPT8fursCfeAxc2s2zN79ZSaNfBDUq2gVNTXjkxUcQbZEBbDJd3MhxHstD94kGmQ2yaGZw/UQwiftvz8ZK+5+ZBteHkht+pj7dEg/3wLIjJzKtxI0HnFeg6asACZzxDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5U08pnO; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5U08pnO"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2445806d44fso31834745ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755509528; x=1756114328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xHfYVwbmP+gPFXz8CWcley05MtbRCnNcrivNbsDjwVo=;
        b=j5U08pnO9NtqLooEuoiwOf6Lw+tqHmFG+IprBqY5JV6P6DSUQLYmsqy7zNlHZDMuje
         2YIaOgPwGWgPfP0+0gzd9wM7EwqvSWx5nyQ7A2hW/ZQV5LL2RlDMw1QXtFpMyZhDk2VH
         H0W3cHIvMezl12MHg6KwLUbkNMlxxHKK9UIQsZ3EywrRbzXol6ySOj1Jv657abVu20t2
         TsLsw0N95LSt5tmjVKc+XGSSk7IUi/gYDKAqwNzCftlRUYct/as+OyElsp6rBYy5S1VG
         6yi8syjGNlEtd5NCN8RcNGg2AnIy2KEeKoUiIMn/owf0fnfg6PkAL6shGt+e8F8ufuu1
         QN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755509528; x=1756114328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHfYVwbmP+gPFXz8CWcley05MtbRCnNcrivNbsDjwVo=;
        b=fZXZfJw34WTjOfjBEZD3F/2/eaTdSX+gIfyT9wliNntvgY+UCM6Or+aSwkaJsKoEoh
         NmjDeC6cK5HUuL4jMVY7UNaUCxPT6Ms86lXOWGpLO2yr4K6NgLdOvqTSBLOPkvCIsOqC
         j1zT1XOl+jHqLvrdGB2oi5N/WapBjf/IlI5gQZLrV1B2trhsWrBVLQQ4u4ci8MwwoaWt
         ffw2GpRvcXONp8TTVYXw+hMWeNtTTWP0F5EAtMvwHvrPIGy1DBvVnU+t0xFDo54J82Ui
         7EnJ6TbS0zwaX98vZEwvBRRP+xaE5/PQsgT1oIuoSb5MktZx6rxcP1CVKvstZGPb2WII
         rsQg==
X-Forwarded-Encrypted: i=1; AJvYcCXtHtgn1r7hcG23a3OsXPOf98XovUzz+Czla3O9ryhbmaWvJ4rPNaL8wVTQWxrVaGYmJAA8yua0Hk6weT01ygycadePXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzK9e8pVCaTRI1pf549g+DFw5pVEBBluh6fcc6CLCbB9/mvkWfQ
	1/a1OUMhk/fzMCNHi2F2rjCfkdQBLwqWw3OFmo3lCX7genIPUVUJiEG5
X-Gm-Gg: ASbGncsKdDPBvYmjVKMLjpzGS7g/RLuC0po4/v/XOBuXnRcRK/xx+NgoiXOXlyvXaya
	rxeihGFtaSvNo8a3VPHoT+MG2C3WZXZM5aGXey/0JKEiJpKAngxzOtrCspHWPellUOrbRk4flyJ
	lQN9E+tECZqfPI2LLQ8N4RCkY8mcnDzpE9/J9KJSwV1fTStg9D0GNaYjGvHPIH8oH70P84RVHg1
	eApAVSkRR8d4gco98YFSLfrNNxplWRUugDw153qkuMWFL6q8HUAKuWPyHWn9xhKhAc780mxh3ay
	6VVsnsS3UNwLp+BUQ6kF5UX3w79kR3CB4NN/LRQmuSI58jD3ST40bb0fFtb+EnyrbY9O9R39WHo
	fTX/P8KL85UrQLT7zVJop6Z5M5//kd/Cw3EHkLupr+NGp+V1lsBgU
X-Google-Smtp-Source: AGHT+IFCRtT2UOKN4GdguapaDt33D0B736i93LRmByQ1B2I3PXdFqVr/n+fJRYAuoJpHAa/pY3mMdw==
X-Received: by 2002:a17:902:e88c:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2446d8b67f5mr216185465ad.38.1755509528108;
        Mon, 18 Aug 2025 02:32:08 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1cb8:46d9:adba:d08d:ac6:8cbb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cb0f007sm75092045ad.69.2025.08.18.02.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 02:32:07 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: alain.volmat@foss.st.com,
	mchehab@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shuah@kernel.org
Cc: Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] media: v4l: Fix dereference before NULL check
Date: Mon, 18 Aug 2025 15:01:57 +0530
Message-ID: <20250818093159.612208-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 'stm32_csi_start', 'csidev->s_subdev' is dereferenced directly while
assigning a value to the 'src_pad'. However the same value is being
checked against NULL at a later point of time indicating that there
are chances that the value can be NULL.

Move the dereference after the NULL check.

Fixes: e7bad98c205d1 ("media: v4l: Convert the users of v4l2_get_link_freq to call it on a pad")
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index b69048144cc1..fd2b6dfbd44c 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -443,8 +443,7 @@ static void stm32_csi_phy_reg_write(struct stm32_csi_dev *csidev,
 static int stm32_csi_start(struct stm32_csi_dev *csidev,
 			   struct v4l2_subdev_state *state)
 {
-	struct media_pad *src_pad =
-		&csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
+	struct media_pad *src_pad;
 	const struct stm32_csi_mbps_phy_reg *phy_regs = NULL;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	const struct stm32_csi_fmts *fmt;
@@ -466,6 +465,7 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 	if (!csidev->s_subdev)
 		return -EIO;
 
+	src_pad = &csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
 	link_freq = v4l2_get_link_freq(src_pad,
 				       fmt->bpp, 2 * csidev->num_lanes);
 	if (link_freq < 0)
-- 
2.43.0

