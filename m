Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D5B18953E
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Sep 2024 22:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727389501; cv=none; b=YcmCcHP1gB5pc5zIHOcDDwWpZw0hdrbshwALvvAD7i8KG9NNEjIwHln619XE7qfTlLkyqoHy1hhr7pRR3te29ODGfSNFJGCJ5aWVXlCdNVdRjKMXaPqPIAnOoeF6XVNfXgw/SWqybelNUVQ6IXEcFNN0fu+YeAESShC1KSOIJ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727389501; c=relaxed/simple;
	bh=9LWxw0GkDNKQzpLWJEw8INCGvjdnC+s0GVdlJVVvbaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=clTd2Bq8cvMYMH6Y2t67t6BpYuJ+AgWIXrvllYI6eHFXHBkt0n0GKoLgXfyCcnjHr/VobBhfPwjTC10x/LTf0s5GARGyEFVSBZrYLXqfVNhFZUFFOPn92gAjk4kGBJCQXRkKCTwBpuc5Us/ytpRBS4paBBQIsfs/Cu8vrxf7U/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np; spf=none smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=Fz3YXNds; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="Fz3YXNds"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-208ccde82e6so12475785ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Sep 2024 15:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1727389499; x=1727994299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nwvdoFGxm3KhCqcwA7uNn+nsr1FJVT8Rrylkxk+BHzY=;
        b=Fz3YXNdsI/h4ga7OvoZ8qsXfB8fLsn+7mMohwE0NDQlGSuTr/qXj2SziczhZG1sF/b
         vXG2mnSVfVos3UzUXzfItVi7OKSnrTkEvBnkWOskxRyQgVLTUlJPqk874n1K0mQuiqMQ
         5MTaIdqYMp8zK5VZ6b4/QMw7OCIzpnXQrixf3exaP9rnL/p0BhqD2ywWZxD3zJMgNJTm
         I6wJNpRMrnNpPq3gKubploX8PEGKSe62XPEuffnOtr+XMq/H2XK3JEYAUbswZ45whUDS
         PjidPOfjlVsBedY4g62KNTCQ0Y7SUacN8bl02RJjT3pnsKKuActYNuogUnSBxEE/F+QE
         EZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727389499; x=1727994299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwvdoFGxm3KhCqcwA7uNn+nsr1FJVT8Rrylkxk+BHzY=;
        b=wcyArUuFDJgEyy/KsrKkhyhMdefHEPEmUX0i7jT5q0QCp3yXSXTixTpDk7j3Z2Oe7H
         JqrpogxoCXtYUIzVISQxJh4r5TOEpWrmXmpvb7qhEpFz3kQINc2XGfi4yzj3A5vQ2g10
         eCb5aM+0NhDfyOwP2OJhGCKyGakHRuZBSvib67lwB1vZIcPBxItmCX/oFRmpNUejJRF9
         A8wrKNWhIjEBVgDCX34SmMNoRv4SyhcY021AAP4vX0rF842EDJeC49EmBjSLJrvlVPHa
         u8soePxha1/6zAQ0OCz/YPDLBUVAYYGJpzHo5fI7aAo2FQRijX6DR1pJg02KYjtlErs2
         7Big==
X-Forwarded-Encrypted: i=1; AJvYcCWmOiONsvYK5NFis/9CaA9/fJTPu+zI4lR6q2EoRBZOxhBeZhlkql03Z8hWrC13IoWSxwGBy/bDFu/6tlx1btRnJzSnIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrmNg9rmGC7dMNGPbboZ7rAwJwzM5JvLdvMmXTPGNfUEdqGUK3
	fNd/l/1w6+0aVOzWH7/l7K3SIkUzLqKeBJRpmtrsTW5hVq/xD3UlJ3nvqipVdNE=
X-Google-Smtp-Source: AGHT+IFm/tktsslJFScr7N0Z8rSDXeabptEUKFyK1ckvN8vsNqDXTzaPkw22+7tUHK36g8LVTD4Xmg==
X-Received: by 2002:a17:903:2287:b0:205:43b8:1aa4 with SMTP id d9443c01a7336-20b36ad3bcemr12377615ad.19.1727389499047;
        Thu, 26 Sep 2024 15:24:59 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.27])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20b37da334asm3064755ad.105.2024.09.26.15.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 15:24:58 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andy@kernel.org,
	hverkuil-cisco@xs4all.nl,
	kieran.bingham+renesas@ideasonboard.com,
	benjamin.gaignard@collabora.com
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] media: atomisp: Fix spelling errors reported by codespell
Date: Thu, 26 Sep 2024 16:23:37 -0600
Message-ID: <20240926222351.7116-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed spelling errors as follows:
	unkonwn ==> unknown
	Stablization ==> Stabilization
	previouly ==> previously
	acknowlede ==> acknowledge

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d7e8a9871522..1e42a8ca68f5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -43,7 +43,7 @@ static const char *CARD = "ATOM ISP";	/* max size 31 */
 
 /*
  * FIXME: ISP should not know beforehand all CIDs supported by sensor.
- * Instead, it needs to propagate to sensor unkonwn CIDs.
+ * Instead, it needs to propagate to sensor unknown CIDs.
  */
 static struct v4l2_queryctrl ci_v4l2_controls[] = {
 	{
@@ -112,7 +112,7 @@ static struct v4l2_queryctrl ci_v4l2_controls[] = {
 	{
 		.id = V4L2_CID_ATOMISP_VIDEO_STABLIZATION,
 		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Video Stablization",
+		.name = "Video Stabilization",
 		.minimum = 0,
 		.maximum = 1,
 		.step = 1,
@@ -678,7 +678,7 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 
 	f->fmt.pix = pipe->pix;
 
-	/* If s_fmt was issued, just return whatever is was previouly set */
+	/* If s_fmt was issued, just return whatever is was previously set */
 	if (f->fmt.pix.sizeimage)
 		return 0;
 
@@ -1028,7 +1028,7 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	/*
 	 * ISP work around, need to reset ISP to allow next stream on to work.
 	 * Streams have already been destroyed by atomisp_css_stop().
-	 * Disable PUNIT/ISP acknowlede/handshake - SRSE=3 and then reset.
+	 * Disable PUNIT/ISP acknowledge/handshake - SRSE=3 and then reset.
 	 */
 	pci_write_config_dword(pdev, PCI_I_CONTROL,
 			       isp->saved_regs.i_control | MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);
-- 
2.43.0

