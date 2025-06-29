Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D15920B7F4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Jun 2025 23:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751240127; cv=none; b=ZgHZ5nY0fIIfC1VMFzOrr15hbDV77zRQ/WkdJhX2lRltO7VyV3GKbO/8L5MKjh9ejP+XpdoZjkWZUgy7WxJduM64CONOi7LV2rXCDqe7DKNoR+ClRgHYEhSUBCG0pSJPE8wkykuhCFsnzIO04ht+iHr6AmReTrdd0evLKeonGU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751240127; c=relaxed/simple;
	bh=hnAex+xrS8FpUWygXla21LOG0suo16GMo41+67qfg/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r4OJj8U3QFISOnrFPIjqqHIsZu1LkxcTihgY/NLcZYWcby6T0bjUWLrtB1OEAqRUBbJvExlI55hQh7KOer5MrfXNH4zIxHvRMHUpZ4ZX6agDcoKWTzGTHXUsK4bFvMrgP+IO5gPz08Wyv6inxzMH0SHyhXzZAYU8R5iEU+/cdWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNPwGQRa; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNPwGQRa"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE78A846E4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Jun 2025 23:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GkXwWlcF2iFx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Jun 2025 23:35:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A3E2843CB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A3E2843CB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HNPwGQRa
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2A3E2843CB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Jun 2025 23:35:24 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-234f17910d8so34413065ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Jun 2025 16:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751240124; x=1751844924; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pXPOk3nqEUuFIqBZ1Us9rXYq5TplB4NjRHfPRWTgB30=;
        b=HNPwGQRapjKjh1OgWIaA3ZkyP+kyTuyrntAfAJ7b0DZqZ3bpFJyNGqB2N7zhWxTGev
         jsPPh7GjATbroRhdKePddEklm1zB+1R03+j3HlaVKpe6QHGusWDHZUorV1MXMy0jYY3q
         jbt7K5Ycx3oR9en9ehwSAOJL7cmIFtNqUHFPGimmJ4WL780iukbneusJQeLvuOooXKGb
         nlc0yuPp12P+CouP8Ld+n3BBYGyPwa0aUIF7iW7SybuDsFoGj/gb1svhahwJNLOO3iVm
         XFPzyzeiAUDyIa/2W2AJbv1Kkx01cxzcWalNSwfcjIzXLdqFdZeckbbfV5CblUk5L9Pa
         y9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751240124; x=1751844924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXPOk3nqEUuFIqBZ1Us9rXYq5TplB4NjRHfPRWTgB30=;
        b=RWmsSALcq7HgOmSGT+s0vYW7khkwxzsc654T/gTctlajIjeNW6uZID+xH+foRtBmL6
         vQ5UVOGi0SFxsm2mdcLBBsivEva9EzFoqroT43VmJb6UicpIaYvOiTU7oIyAsY5ekmMm
         AouaVH+GzQFTVdJPE9x/sbSz0Mo6HZB9MhyJ+QWQETxnSwDW1Wn3dV01ol3Y1aG/0TTf
         tHhTrFWXiuXycJJg8mwPg/zNOqdtv0bZ+CRcuW1xiEx/7lhCC8kFHtgSE5yNs2dCi2gU
         B2kwqkSSus173dQ5mko0oTzWG/SAYBbgOtzJIym1BVfyJZ0QP62guwOk+KiuKTz3f1RH
         xT6g==
X-Forwarded-Encrypted: i=1; AJvYcCXX2Az62Jq5beqMsl56+RopvFwmsQdaCO4XvfEPMapuhx2FqnFdlWiTw0vnt+blf2e0ho02F9B5a+oX58dfuEt2pn+98w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw4RUNeQUd73Alj96kL8NFO79G8dtTI8k2kRk+t7s4yrK7CswKa
	Y6lMXufHdP08CeJSEwN0Y1qzH1o0MvTrqxGjQlk6Vnv1EJ8ni/RnRUbg
X-Gm-Gg: ASbGnctpBUJFepl8M5TdHkT/TZE8fUDXeZUfs/JySPNvx9jHSdvJCzabBxMGsCFY8nU
	UFLG7Y7rYnZPTVlb0Fn7c8UlXOn27Ok/FXdOdItDqwzz6tzZz6CA17ONXOT4v71Um2MF+E5Fk43
	sI2Pdx31x43HnZbzrNSyNrJtjz8mMxtJg/uixIaP0BwBE9UL0P5BSG9e+K0+rDcjn6aACLeLNh4
	saz1gLe8jZHtuUtUPdu0k9p+Wy59bgPWDzNyc8PgExjir6vvnBVYHeV57VPCKm2TyZNqmlaWoWU
	LOtCdlKAphOUjGoSafh2vY5qzzHFFyjny+Ose6tstuPKoweF
X-Google-Smtp-Source: AGHT+IFO5QoN4K5K/v4sh7hmW17whurpIN5P0eVHuHATG4/IgZWs2ApHRywY+DGQ0YFm+ysET+U3Qw==
X-Received: by 2002:a17:902:ccc9:b0:234:909b:3da9 with SMTP id d9443c01a7336-23ac4680f11mr161686875ad.27.1751240124361;
        Sun, 29 Jun 2025 16:35:24 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c9695sm69433775ad.238.2025.06.29.16.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 16:35:23 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: it6505: replace scnprintf with sysfs_emit_at in debugfs show
Date: Sun, 29 Jun 2025 20:35:09 -0300
Message-ID: <20250629233509.291786-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the receive_timing_debugfs_show() function to utilize
sysfs_emit_at() for formatting output to the debugfs buffer.
This change adheres to the recommendation outlined
in Documentation/filesystems/sysfs.rst.

This modification aligns with current sysfs guidelines.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 46 ++++++++++++++---------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 1383d1e21afe..98bea08a14e4 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3427,37 +3427,35 @@ static ssize_t receive_timing_debugfs_show(struct file *file, char __user *buf,
 	struct it6505 *it6505 = file->private_data;
 	struct drm_display_mode *vid;
 	u8 read_buf[READ_BUFFER_SIZE];
-	u8 *str = read_buf, *end = read_buf + READ_BUFFER_SIZE;
-	ssize_t ret, count;
+	ssize_t ret;
+	ssize_t count = 0;
 
 	if (!it6505)
 		return -ENODEV;
 
 	it6505_calc_video_info(it6505);
 	vid = &it6505->video_info;
-	str += scnprintf(str, end - str, "---video timing---\n");
-	str += scnprintf(str, end - str, "PCLK:%d.%03dMHz\n",
-			 vid->clock / 1000, vid->clock % 1000);
-	str += scnprintf(str, end - str, "HTotal:%d\n", vid->htotal);
-	str += scnprintf(str, end - str, "HActive:%d\n", vid->hdisplay);
-	str += scnprintf(str, end - str, "HFrontPorch:%d\n",
-			 vid->hsync_start - vid->hdisplay);
-	str += scnprintf(str, end - str, "HSyncWidth:%d\n",
-			 vid->hsync_end - vid->hsync_start);
-	str += scnprintf(str, end - str, "HBackPorch:%d\n",
-			 vid->htotal - vid->hsync_end);
-	str += scnprintf(str, end - str, "VTotal:%d\n", vid->vtotal);
-	str += scnprintf(str, end - str, "VActive:%d\n", vid->vdisplay);
-	str += scnprintf(str, end - str, "VFrontPorch:%d\n",
-			 vid->vsync_start - vid->vdisplay);
-	str += scnprintf(str, end - str, "VSyncWidth:%d\n",
-			 vid->vsync_end - vid->vsync_start);
-	str += scnprintf(str, end - str, "VBackPorch:%d\n",
-			 vid->vtotal - vid->vsync_end);
-
-	count = str - read_buf;
+	count += sysfs_emit_at(read_buf, count, "---video timing---\n");
+	count += sysfs_emit_at(read_buf, count, "PCLK:%d.%03dMHz\n",
+			vid->clock / 1000, vid->clock % 1000);
+	count += sysfs_emit_at(read_buf, count, "HTotal:%d\n", vid->htotal);
+	count += sysfs_emit_at(read_buf, count, "HActive:%d\n", vid->hdisplay);
+	count += sysfs_emit_at(read_buf, count, "HFrontPorch:%d\n",
+			vid->hsync_start - vid->hdisplay);
+	count += sysfs_emit_at(read_buf, count, "HSyncWidth:%d\n",
+			vid->hsync_end - vid->hsync_start);
+	count += sysfs_emit_at(read_buf, count, "HBackPorch:%d\n",
+			vid->htotal - vid->hsync_end);
+	count += sysfs_emit_at(read_buf, count, "VTotal:%d\n", vid->vtotal);
+	count += sysfs_emit_at(read_buf, count, "VActive:%d\n", vid->vdisplay);
+	count += sysfs_emit_at(read_buf, count, "VFrontPorch:%d\n",
+			vid->vsync_start - vid->vdisplay);
+	count += sysfs_emit_at(read_buf, count, "VSyncWidth:%d\n",
+			vid->vsync_end - vid->vsync_start);
+	count += sysfs_emit_at(read_buf, count, "VBackPorch:%d\n",
+			vid->vtotal - vid->vsync_end);
+	
 	ret = simple_read_from_buffer(buf, len, ppos, read_buf, count);
-
 	return ret;
 }
 
-- 
2.50.0

