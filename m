Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C7515C122
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 Aug 2024 18:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722621780; cv=none; b=OrRqrvWrb6/afGf0IRADjLk7OK/tCA0rOI0YBYnxcuiDBq6kA9SvP4EKOIFBq3ePBDnaAAFj26HRZFoL9IHeRvxqBvDk/+W5jrw1qLLJkFysGrzLlckKOH9rCXQgYohqNGiNMSe/dtAdSNVqWRu9C/bSyLs0IUtUKKwPoor4IN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722621780; c=relaxed/simple;
	bh=6hvbMe9SheGBFUFKV6yIecTRBlDtV2orfIV7/7UFeio=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Swo2v9g0FUZlk99Gc2U7u0updnlJTeXSMc9mdBbSjXUBL2Xzyi3Wt/hovS76UOUButdSPVZQT+DnzmQHiCDU+G9nnC/n9+WiSwizIYTMb2IYvYouxFS6ZK8P5Vl+h1Yi67OqCNThi+FMEV/K1dG5sj2iPGuN3HMzrSnuwhOoI00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/QxCIk7; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/QxCIk7"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A21C81E25
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 Aug 2024 18:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGT9z89gdNSf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Aug 2024 18:02:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8868E81E0C
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8868E81E0C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G/QxCIk7
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8868E81E0C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 Aug 2024 18:02:57 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1fc5296e214so67824535ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 02 Aug 2024 11:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722621777; x=1723226577; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPYuykDQTpLV0QVmWDRVRbfOLAntW1izmGLDn5w1M+Y=;
        b=G/QxCIk7b/cHBK2Kc02dil34eb0ovhqYbW6XhJ8hEfseTGWG10Ds3wjUxPagVxIXaw
         B8F4c3fpMUxr0I7LAjbj79f1qM9GJV49/CrkKBPW/t+ck5JDx/hotYEReQQ8bPz3iLfx
         prIaDW6quFVcHARwG8Gkm/0THLxQcdCavKYg7z+nSCgu68Yzk9LPuPbwKkhCYpCsr6hE
         xtqj5qbOzjOftmoXkG9ed8/s0UO9G0B9l+7S/Z8InqLxIl3SWQ7cSYgPwZ8Dg74hc4gw
         d1LXLpv1la4WqeOPEOdl8DHDds+FwhV1Zpd97LWdbzyX8ibVizE2mGjZtzuv31rHDvhb
         0ThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722621777; x=1723226577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPYuykDQTpLV0QVmWDRVRbfOLAntW1izmGLDn5w1M+Y=;
        b=AwGYTuV09AnHxRBnj/o2MWMnHZIIf1v5751vu9T9qPln1F81WgEIfTw1LnzZrg3tBc
         +hteMjewte3xsTwtRq4bVxB+nRqcUw7f2tGeo7fLPLWXFwqUrSmPy9DdpZ3XkKNOG+L1
         F+YPnhW/yVW2efH0KvSuTHqMYLHPhomSX1qBeO478yioPWK/vU075jt9TagvUwXl/4Ih
         LL7AJFGupBhz8e+YLxbpqYym//WJ8vNxRJEAKfNoBzvyT8koaThTpdvJ98ud1fG7QK10
         gUZWRuPDf4xFqh007MqZRvkeR7C9gfQvn+V6kuJQ4bM+8MPsgcjNb/gJiCBiwK2Cn7uf
         wJsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5Gq2mg+ZNMmpsWcycXRjNVD2sAnu4KIsdqOyEByO9E4y0mjVA3R6yhDxgCAuWyEndp2BALHCD4FHc5jhvOxtxDqfBLxtmGaEPOqxI/Zo5dG0tpNQQP1idYUhCvj4S
X-Gm-Message-State: AOJu0YzavHTDighYjyvNzK/f21ejqbyLGH0Z6f48H54S9GYGKUnBZ858
	00GS1xcSVyfcdH56yjTf9w0ZLGuD1hjppn0z0JvFlv1OkrlPEDr5
X-Google-Smtp-Source: AGHT+IEmbXzRbqA4Dm+Dxp5Q8sQ1FoKhxrnpwm3+tkLRLaaAjRfENRwciTj6Hpe7OoQfEyQiMj3I0g==
X-Received: by 2002:a17:903:1245:b0:1fb:3ce5:122d with SMTP id d9443c01a7336-1ff573bfe4amr59659145ad.41.1722621776519;
        Fri, 02 Aug 2024 11:02:56 -0700 (PDT)
Received: from embed-PC.. ([106.205.109.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592979d7sm20082015ad.259.2024.08.02.11.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 11:02:56 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	dan.scally@ideasonboard.com
Cc: gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: uvc: Fix ERR_PTR dereference in uvc_v4l2.c
Date: Fri,  2 Aug 2024 23:32:47 +0530
Message-Id: <20240802180247.519273-1-abhishektamboli9@gmail.com>
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

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/usb/gadget/function/uvc_v4l2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index a024aecb76dc..9dd602a742c4 100644
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
@@ -389,6 +392,9 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 		return -EINVAL;

 	fmtdesc = to_uvc_format(uformat);
+	if (IS_ERR(fmtdesc))
+		return -EINVAL;
+
 	f->pixelformat = fmtdesc->fcc;

 	return 0;
--
2.34.1

