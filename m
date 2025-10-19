Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673CB2EA74D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 13:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760882392; cv=none; b=gN0bl8dBKjNwRH9jiWTmgsmvI3hZ0DXUBhGTyxrgiEsKaIpycNwcTbhWu5CFSG+HBXdM8tcPAcJ0uJJ/zDei31j+Q3IqZ7nd+wkqORXR8VIuzxtOIZnppTO0W0ON6UrwQtrf4vzavTAFdVQmXtatbXTViMvsSPSAe0dJpWsfCkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760882392; c=relaxed/simple;
	bh=zUtbLDy2uvin1t6B5rhoy0/MeRjeuBSxqlz3kP0hk2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bVMpc0K++FMiyNdZgBi13J1TIX9zxQ1aGspaNrNL+sEjNYRqVHfjlS0KamCTkhTOtCK41G0zhEHxyBQJFWV1HG7/hKRWPZDJxwVvaUry2Ksdv75U+h05gWtel6MPfUZvtkFL/oZhaUHkMRoq6RSBNkehe+B+S+zCFIq9p/RFEQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FcNhKRgM; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FcNhKRgM"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F186A83EC2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 13:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PJByOFVb1MI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Oct 2025 13:59:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 065C183E8E
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 065C183E8E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FcNhKRgM
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 065C183E8E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 13:59:49 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b3c82276592so66942266b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 06:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760882388; x=1761487188; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IpzQRX6WX639uhyZU+I8IkskcZk9DHNRhRlL05G9pLA=;
        b=FcNhKRgMTePq+zrXdyJYdYfaFB2MXHIiDSceflgCq40+BlyPiMFoyJEcCbylsepun3
         NEVLiqY+41SD6op1RiMnnF4fFPa9KXwtKkR5OJ2pZ0ilfvIzaNXwxis1RaBWSGqxEEEu
         CHhwC6bjhL1w3h6KMgZTsQHaUnXyFyeDdVxbZeFZYa+MiHo6ZQZ2z1Q1Z0lMvVJGqrts
         22Xb8b8WtlL61jHaulhzk1jmTyB42x4TF2JvayWLKAmtDauboqh4gBF4/wHGK2KCd95H
         fp1QSdSiyOAB8yXhOwuJq7Bvgfet7GYEKEgr0wvMnSWXbUMdBK0aFthOowEZ2xc+Zb+t
         AlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760882388; x=1761487188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpzQRX6WX639uhyZU+I8IkskcZk9DHNRhRlL05G9pLA=;
        b=CnEW3EMplmYy9LfbvqaeKux3GpwYxC+haYRSLCNWL3UP8PSL99Y2SZh6Re8a1EOoN1
         Bv4Kkj2oKFDtEiPnTmQAIrBBi660KCsxxKmnZDuOGLs7rgBIrWvePB6MPzLhDgxj+CWV
         WF88K3WYKnME9+ua5EJ2W1ounp8C29hzyDXvXhflPUB97Z7aONpaVFBwCnwvBktYUftG
         Bg4qQYulx+sn3CTGhwvVSxW6fayn0+4x59l5fD2OTRbDdR52yvjf9ZQ5W1subf25yizV
         gzOFEE2W9KnDnYk7Eir5FFIK/TIv7I9+RsPuKU9n3AYQXR1j0PPtE0GIEVtuXsSYqE9q
         wAfA==
X-Forwarded-Encrypted: i=1; AJvYcCVC+TyRFxPCUTU2JBj6wTrOAi6LGO9U3vjcTdeZuT4lyOjgXDwULo2rUlxYtklosFjfcP+pEvU99QXhAcXo89YnHUVfSg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz8e1psHHIzlPTp7rwcSl+kobiPU1Ah/xdznfNu3J58xCJaTiuf
	gy3HB6hoWjZ2jr+YC/t9AYE96raYI17O5qJWwjFmo+pCNqK02RQ3GtCi
X-Gm-Gg: ASbGncsmJ3r0cGlWxnPYDtkBevMlkzddc22eiW6IqW9UC0WGfmxD2R9yqzLyJHtzybN
	c9S1M+TQcgVkGJjKgfenlObTlHWDVw8RLF1sFB1uE+99HHaNqR79NEpvhmL7sNNl+0nGdexk60P
	fdpFWNwXiD5lN+49xPH/2o7ZRI9XurSLn1x4PUQHBzsD6VZUyCkVPuNWvdwIDPGAZi2uZHoGZyn
	nL+A62RIW0u7fB1vfd3GHoW7u2Rg+tq8jAOCwH5hbnWvk+LTx0L92iIb/V27HoeLaJzlaxMJV6p
	A9XKs0djALeyeu0Q1RbqrlYih+vKZDSv0o1RSLhxxlocm/0G7guXFBp7Cw+EBzinGY3ZF4BQ2WA
	LfAnRt62wB/+AuUK+6AYyVsUQV03LcJOlODlleMw1v0oZiJwIz6r+iEDUnA8c/MkptFhqtzbpkX
	Q+xarI
X-Google-Smtp-Source: AGHT+IGKsrS2Ps3uAG4Ijn1Z/Ftl6Ae/MX6Mq06xwDMBoDY2q0splxnviYgwXvJO0FFabIICGi4lTw==
X-Received: by 2002:a17:907:9708:b0:b04:2d89:5d3a with SMTP id a640c23a62f3a-b6475505d94mr636158166b.7.1760882387324;
        Sun, 19 Oct 2025 06:59:47 -0700 (PDT)
Received: from bhk ([165.50.121.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25c9sm520425966b.11.2025.10.19.06.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 06:59:46 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] drm/solomon: Use kmalloc_array() instead of kmalloc()
Date: Sun, 19 Oct 2025 15:58:56 +0100
Message-ID: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kmalloc() with kmalloc_array() in several places to correctly
handle array allocations and benefit from built-in overflow checking.
This prevents potential integer overflows[1] when computing allocation
sizes from width, height, pitch, or page values.

[1]:https://docs.kernel.org/process/deprecated.html

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index eec43d1a5595..0ce630861d34 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1498,7 +1498,7 @@ static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(ssd130x->width * pages, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(pages, ssd130x->width, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -1519,7 +1519,7 @@ static int ssd132x_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(columns * ssd130x->height, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(ssd130x->height, columns, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -1546,7 +1546,7 @@ static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
 
 	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
 
-	ssd130x_state->data_array = kmalloc(pitch * ssd130x->height, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(ssd130x->height, pitch, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
-- 
2.51.1.dirty

