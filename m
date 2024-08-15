Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E75539FF3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 07:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723706256; cv=none; b=tFBm3TybVPZOpi69x5BbbvsWKaosDeZ5ldubyxjAnTXeGXpPcoRJSpYvftqEtSl3seGoZJyzX5SL+rEAKWjtdpgjs8E3r4HDjPmYvnZ525nC7yXbEvCDq4/FRvoxgQTjJY0ozqjknSPlAPE3X3+1lHgKtZBjWe1yDwg41atmKms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723706256; c=relaxed/simple;
	bh=aaFDd5ISb84lhCJFQsTbHtxY5uuIzKwhP/XKSewykcU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=idC3OvMpXXDf3w9wsgascja+SHk2W5Uy0SQ1hqJA/zLU6Mr8kOHmbMJhiivdZQN1re9BGNAWCdI6EN7GDzyGO+zO0JusyB7D2SBXLN7h3AFcrbfXDJ1mns1L8oV6TJA1ebimzOPtVXK8xmeb4R3FHattJzuLC/YYHDzEQAGObAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6Xu3RL7; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6Xu3RL7"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FAE681E23
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 07:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YyfHMel68tZ9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Aug 2024 07:17:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D428F81E21
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D428F81E21
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f6Xu3RL7
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D428F81E21
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 07:17:33 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70d28023accso512803b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 00:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723706253; x=1724311053; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jvruj7SsdqsHY133idfzMsgdOO/tE81N6D79Gm7sQSA=;
        b=f6Xu3RL7qbLw6I+JJTHGqmjor8i9WEunPwn2aGhhlwL1pZ7qJRW/RZEt9BElSklUmk
         HqbSnL4jTQJeG8cmDBO+NH/4pc+FVFjy4m0rPHW1a+dnae/IOhYpujsRo2OWiCmV/fZl
         cEB1BySjYP01ANuIDbdv/M5mor9qI3diBBtKgdPg2ySVY5cAvExCXeibRlM7EX8+8c1e
         NlBFzs8ZBxiEzSIJm2autCbtl7VbcFatK31H16QYKATNSbV4wovZw/AawFXxxC9/GBy/
         0y3P9eINKY8W9DCYPtIxysS8HPe/Jur9/+g3UFAtRD2eA9acgZTb8Jplj8WOIarCBDkh
         nKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723706253; x=1724311053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvruj7SsdqsHY133idfzMsgdOO/tE81N6D79Gm7sQSA=;
        b=YM5a7gz7wGOWzSR/3xIF4ZPYV61UGChBoqTs/vTJEbkut9k5dfmi9czhic4sUr4vb2
         K9YBB5siJQFG07i7EgH6szpOK9Ga9L6BGCmthgiLq2RnXFd8EvMpTbPOhZ+RXxpPGqfp
         7WkXhrvH64FurgCt+cxY99CPQB1NPK2poSM94MWWTR6djwFjII/DeyYHPmGxda1L00bb
         aSfxLLi442ttdS6bbeO8G2fv3SDw4VqU7QEKb76hPqGIH+kZCXZhDW7vmw78NVoFS4aj
         hUWWtaIOIU21lXhpjmUXuKkPMicjFYL/jfQ+DoUCyGtMJn1WwbZ2nJq2au9beAxocPEO
         rI4g==
X-Forwarded-Encrypted: i=1; AJvYcCXUHN7k1CNkKgu0Cc0VQcQG7Yxoz63oNFccECdplgqm+Lpvi4lm0GFlYucnIkDwlypFRM5eYO1Uhh4wdhAytsIH0Ul4nMjhELRX2sg5FZO9i9/KSl+A4OgbKx5f3fjV
X-Gm-Message-State: AOJu0YwO7g5JyQpBfP+wE2KUlshsLE5zROjKgqFFgryckRQfW6Unba15
	fJs9g4rg5C8z5KNGsaldZ4togvhEmg8jtw1Wv6lNhQYdXY1rcSfn
X-Google-Smtp-Source: AGHT+IHnq8ZsMvaDul8KdxjK2STZStCb5oTgnTG8zdSTjLFE5fRFXTJFZbeFFOVy7c6u8+cQmX0/3w==
X-Received: by 2002:a05:6a00:170a:b0:70e:91ca:32ab with SMTP id d2e1a72fcca58-712670fa539mr6744797b3a.6.1723706252977;
        Thu, 15 Aug 2024 00:17:32 -0700 (PDT)
Received: from embed-PC.. ([117.99.192.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61a7672sm604455a12.4.2024.08.15.00.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 00:17:32 -0700 (PDT)
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
Subject: [PATCH v2] usb: gadget: uvc: Fix ERR_PTR dereference in uvc_v4l2.c
Date: Thu, 15 Aug 2024 12:44:16 +0530
Message-Id: <20240815071416.585559-1-abhishektamboli9@gmail.com>
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

