Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C260217920A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 07:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723706005; cv=none; b=gdlRmfW6xG2nrky1kyMFFe+LAJZVb4bur7pnj/CXP8EGx3x/0PYLWCK//EqpUmeuK6QSkbMFDYnNKgCq7kozXVRtDjotWemU1rxf2zEwqY+0a3+2tU8pbTNqsgRcWD7Z+ubKUgEzwPFRMnFrGYmDEWUK8LhNVUUHlhvWx8SsogE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723706005; c=relaxed/simple;
	bh=aaFDd5ISb84lhCJFQsTbHtxY5uuIzKwhP/XKSewykcU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FPIyKcqZk2bjCtq1RDrwNAtyIzDfLrbtcFJkCeI2n0vJ/rfyc6UhwD8deVp/mAt4fQSb8V/1KdMHMqWEWeyeTwss8zl5mbliwZA/zdK7G/v4U7mp0Kj/qIcN7hwBmip2AxJuNJxqiKaSrI33OOQKfD2+kYEUF139yZXvquVf9R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoiHbiBo; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoiHbiBo"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 516CF40570
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 07:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxgu8IAnt7xP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Aug 2024 07:13:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 580E740386
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 580E740386
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WoiHbiBo
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 580E740386
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 07:13:23 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-70d23caf8ddso523260b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 00:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723706002; x=1724310802; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jvruj7SsdqsHY133idfzMsgdOO/tE81N6D79Gm7sQSA=;
        b=WoiHbiBo4hFyUUPLLeCzYlwtinIPV6NNtRdwc5H6+s6pPQWCbHPNBniA4piz04oADc
         tR8SprQz1zIMQicyvBB4ggUATq1j2zRyiDJWI18Gx3PdL1+flH1iOOuBQPszTu9RT9J0
         5Xk2ylriRGkqYIULWbkdXDhKRFnKc9Ui7/+YXBnFwEJzf4IfVd0MAoCuIiav6W7Kv6KF
         JNoGZZI1fMmt6D/y0LehkLetSvAEJKyxLsiFrbC9z1pP2dtS6tBBqI4QUncyK/YWxRjV
         PrCbrz1AH6cdDzlppewAzrQbVS8UpuJ6oA8wdnH5p2ATbcnxJpvP7mT/qWaORwj6iz7G
         9kcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723706002; x=1724310802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvruj7SsdqsHY133idfzMsgdOO/tE81N6D79Gm7sQSA=;
        b=cyxIfBOlHewhhAkrvPtaPlWV2fZvg0nxKqkqxeGR0beZcO3qjiJtQ64qLI8TtoMP/l
         Fow+1OmmuTuWfi8uoEn8+mgIwzNKLKml2k2ljlFPyyN7f8OThg6kZ6xfzpnKNUH9ghDi
         8CuwxGqrk/L07tUOqs2LDXERLps1ps813DW0Rqv1VQ9Vikdpu2U5Q5J5yLiv5m3yrUdM
         M9yYl9vPntyaqOL7ByPJFlCvFNxxBXHO7oFFrAhAInSCZEBXBeBk9Bb7+KQp6yu6SP59
         OQEbw8CrYS3rJT89KHLTZDHaAJGl/6d+zqvAmMKlcsmt9FqkjHBMm9Hwco/n7TTvyVrY
         IuyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUobmGvHq3xvxfeOVJ9nL+eGVkGK8gm6z63bT0x59k+a2D9LLbVzruOLrrusP+kYvxiBXjeyuoePZKYldqNOu1uMb6d6vOJI2e5toiZZx6PCxt9ns8woAknPQPXi/3m
X-Gm-Message-State: AOJu0YwNoEtx7Uotm+lBeDkKNqbMBUrjcmvXsSPLNJS4KnUzhXdjjZIw
	Y1/gjlZPFjTW75FJIRgZbA3Lw7Yj6vq7VDdE4+uznoScoizjQLHp
X-Google-Smtp-Source: AGHT+IH+IvT/Oj9VfFCVJHaRTlcxTgxmWb/kFvuImwpkR1wygBW0AcrPrsKQKoyntPTmuxV9TaWaJg==
X-Received: by 2002:a05:6a00:1996:b0:705:b6d3:4f15 with SMTP id d2e1a72fcca58-712673ea24fmr7223501b3a.25.1723706002330;
        Thu, 15 Aug 2024 00:13:22 -0700 (PDT)
Received: from embed-PC.. ([117.99.192.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b60a1122sm612431a12.0.2024.08.15.00.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 00:13:21 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: dan.scally@ideasonboard.com
Cc: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: gadget: uvc: Fix ERR_PTR dereference in uvc_v4l2.c
Date: Thu, 15 Aug 2024 12:41:51 +0530
Message-Id: <20240815071151.585297-1-abhishektamboli9@gmail.com>
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

Fixes: 588b9e85609b ("usb: gadget: uvc: add v4l2 enumeration api calls")
Fixes: e219a712bc06 ("usb: gadget: uvc: add v4l2 try_format api call")
Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v2:
- Add check for dereferencing of ERR_PTR() in uvc_v4l2_try_format()

 drivers/usb/gadget/function/uvc_v4l2.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index a024aecb76dc..8bb88c864b60 100644
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
+			return -EINVAL;
+		fmt->fmt.pix.pixelformat = fmtdesc->fcc;
 	}
 	fmt->fmt.pix.field = V4L2_FIELD_NONE;
 	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
@@ -389,6 +396,9 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 		return -EINVAL;

 	fmtdesc = to_uvc_format(uformat);
+	if (IS_ERR(fmtdesc))
+		return -EINVAL;
+
 	f->pixelformat = fmtdesc->fcc;

 	return 0;
--
2.34.1

