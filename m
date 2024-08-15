Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225381D1759
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 10:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723717439; cv=none; b=omYZ+8kvdaViPqWrpdpM4osSTpzW5OjrKduwvCwKOQ2UbCKJJq//CxXfMqwWjNbpFKcMSsTSBvsekLRRm5dg0vWv4ZsAOqUlf/h73VeHmVJ4tzHo46Hi4d35dBqdX7w/vyiCwc3M+dYC86W9BMDhRKIdTGIWotjrppy9lKl4Yks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723717439; c=relaxed/simple;
	bh=vaO2bQL+x+qVSEjpB5J2V0P2pQYy5iaElBnUbnLPXko=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IcciSh6O000+DMd7MxrkusB8m2EorJDA//nnV4LTJMj/KkVkKxFZo6nooLds0eTWXtP/mTFGcXHf3BSM1lsXfD43N3q9cKWkU2jzu6DvofoddrnsCMPTlM6ooIOf4ntdnExvZqz6vPlwd6k1uX2DU2PNsvKs/DnLdD7L6PZqX1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/I5eD+c; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/I5eD+c"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A65BF60A65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 10:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ep8DDqyTG5s8 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Aug 2024 10:23:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13F7C60726
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13F7C60726
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N/I5eD+c
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 13F7C60726
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 10:23:55 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1fec34f94abso7613215ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 03:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723717435; x=1724322235; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iq7fbg1eOsvG0ItPF//0IwrkFyZmuk5NQdbvO/TCh44=;
        b=N/I5eD+c2uh86J8NRhqhZ5xHYZqGS7qjKZ9Xi2+E8C5ky1H9SDmT0pFNQtRDJzsB6Y
         iad3sb9+b266R5EyCdaBV60tFfx/E8v2eMmnjDVv8s/kSJNeuRl3tTYsLGaAvC5Ig6ck
         bygkZ6aRypmOVAvC3sPQUpTUPblaMMFvvNoIBlXR4TcjuRkw8TK3t7e7G6btOl8BzTkx
         adnMJUMXypemJQEzrkiIzKWiZM7Drx6mIGwAOzTQECBR7lUUkbVP5kG9V141Cpl9vzL3
         uHgJLbS7jfJQ/TgCQ44UyyHCWBpunJXh3KytuyVVosnjCGqHjFvGdkXau9caofQMFJrT
         9nOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723717435; x=1724322235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iq7fbg1eOsvG0ItPF//0IwrkFyZmuk5NQdbvO/TCh44=;
        b=iF+P5TZ/Y8/z0SKsvEeicUmaKvgW29FgJpSRMmUQw7pQCj2o0DvoeMrqn7uzJ9m8/M
         4Yg8+mEYNlWeV+4lnpiez7GgwsLzLrj5CaVsckmcUmdJyEl2Wdo9R9ISF6MZhzQ9U5kT
         BgZO/O4Kd/z0VeRmtPxU11rBPZjf5x4rpfazieWoDDPx7PEsuiNeRbX/gEbMK8w1AuYQ
         g5SEXypCE2NkhtJacKOu0osXqBqxaAPRz/U0OacCFweVn1LiSl31z2WZk+gpBMSJBUau
         rkXoJ23kFZgP21ut/5xmd2m/izzPuoFhEYSq1vYfE9EK1ghGr9SxE5TQe46ffDPKMdPX
         yb3w==
X-Forwarded-Encrypted: i=1; AJvYcCV99iHA6Q2nLjX4VTMBfCFYFpRPU3zu4DUsaNrwAnUuRSr/bB91Cq8gRPYZjKj8BnsPoj6vghVFYtpBqOD7UqR7u09Q82Z9Zq1MM6/ZT/nKFR7BKS5cAoESpbXYEq5U
X-Gm-Message-State: AOJu0YxL5UNeIFIfpmd9D3dOSQCHK9YCk+/vzS1p7LlNTftRK5KteFGX
	2EJU3qNNMNfK+Rg1YhEUYxoemDseoos1J7XbMYiQYKsCd9Tx7hZA
X-Google-Smtp-Source: AGHT+IF65Vk0UJTrOg0O0JsLoJ7hNz2P7gEInAhGTSB5ssnKOUPkBDzbHJf6OrSiEYHxKyNqi53Ylw==
X-Received: by 2002:a17:902:f68b:b0:201:f6e6:c7cf with SMTP id d9443c01a7336-201f6e6d26bmr10889685ad.45.1723717435098;
        Thu, 15 Aug 2024 03:23:55 -0700 (PDT)
Received: from embed-PC.. ([106.222.235.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f038b303sm7892025ad.192.2024.08.15.03.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 03:23:54 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: dan.scally@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Cc: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] usb: gadget: uvc: Fix ERR_PTR dereference in uvc_v4l2.c
Date: Thu, 15 Aug 2024 15:52:02 +0530
Message-Id: <20240815102202.594812-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix potential dereferencing of ERR_PTR() in find_format_by_pix()
and uvc_v4l2_enum_format().

Fix the following smatch errors:

drivers/usb/gadget/function/uvc_v4l2.c:124 find_format_by_pix()
error: 'fmtdesc' dereferencing possible ERR_PTR()

drivers/usb/gadget/function/uvc_v4l2.c:392 uvc_v4l2_enum_format()
error: 'fmtdesc' dereferencing possible ERR_PTR()

Also, fix similar issue in uvc_v4l2_try_format() for potential
dereferencing of ERR_PTR().

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v3:
- Return the error code using PTR_ERR() in uvc_v4l2_try_format()
and uvc_v4l2_enum_format() instead of directly returning -EINVAL.

Changes in v2:
- Add check for dereferencing of ERR_PTR() in uvc_v4l2_try_format().

 drivers/usb/gadget/function/uvc_v4l2.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index a024aecb76dc..de1736f834e6 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -121,6 +121,9 @@ static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
 	list_for_each_entry(format, &uvc->header->formats, entry) {
 		const struct uvc_format_desc *fmtdesc = to_uvc_format(format->fmt);

+		if (IS_ERR(fmtdesc))
+			continue;
+
 		if (fmtdesc->fcc == pixelformat) {
 			uformat = format->fmt;
 			break;
@@ -240,6 +243,7 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	struct uvc_video *video = &uvc->video;
 	struct uvcg_format *uformat;
 	struct uvcg_frame *uframe;
+	const struct uvc_format_desc *fmtdesc;
 	u8 *fcc;

 	if (fmt->type != video->queue.queue.type)
@@ -277,7 +281,10 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
 		fmt->fmt.pix.height = uframe->frame.w_height;
 		fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(uformat, uframe);
 		fmt->fmt.pix.sizeimage = uvc_get_frame_size(uformat, uframe);
-		fmt->fmt.pix.pixelformat = to_uvc_format(uformat)->fcc;
+		fmtdesc = to_uvc_format(uformat);
+		if (IS_ERR(fmtdesc))
+			return PTR_ERR(fmtdesc);
+		fmt->fmt.pix.pixelformat = fmtdesc->fcc;
 	}
 	fmt->fmt.pix.field = V4L2_FIELD_NONE;
 	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
@@ -389,6 +396,9 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 		return -EINVAL;

 	fmtdesc = to_uvc_format(uformat);
+	if (IS_ERR(fmtdesc))
+		return PTR_ERR(fmtdesc);
+
 	f->pixelformat = fmtdesc->fcc;

 	return 0;
--
2.34.1

