Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2132C314B72
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 19:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764183869; cv=none; b=Wc5jKqR1l2zUPPfHEykEuUhdGrLdVRun5BRoqHxorTgcCjh2YZWTNgb9zImwbLIGt56XwNYagCli05yCSoJJDW5FYaxFw0tgW6pwSlXcM7St1T6OQV1w6inY+gi+TSOTSOakJ8W/sQn29jjR5U7O1ANtvbzI7iHuUcjabCWSu7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764183869; c=relaxed/simple;
	bh=TZD2Ey6Z8WvlpW2dfjWUC5ho1c+Z3cypZpbXGhlo5HQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HagS0+wuyZb+YYYGPdxq2+gymQ6dbnpJPdRIS4i5p/tUePMsKWsKfmt1qNjWzLLkJhRy4/pPAlfXsbzO1RzJi1dW8OO215/qTHRgsSPN/grWrToaQZWB5mOclTxwoNW8fkTMgcSWF1Wf9bf4e80p8cECGMaGo9OpZIakmGFD/ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=CmqNzQe1; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="CmqNzQe1"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7ba92341f83so92915b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 11:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764183865; x=1764788665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=04+GJw/QeAhZXEl0aXKPi//aV7HxxJ1aVYtljym3uF0=;
        b=CmqNzQe1t4tMgkZIiXXtwTcTFSJ6PfxojkEOyCdml1ZoSPjGR8/zWCb53iCspL7ObT
         hqbNMnI8qhHJU5LpJidSUoyatGyB9J7t7sEsIFt5OwPHkGFjAebczNDlzsmkgu21T5+V
         i659WhdCbiGwyWR2ZaB1QTy/bRTXZWqPioVqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764183865; x=1764788665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04+GJw/QeAhZXEl0aXKPi//aV7HxxJ1aVYtljym3uF0=;
        b=UBS8vsK0k0bdLLtvQ36N8U3V3QJnYyLTfKjP1lx2s/h53VCHrE9UEXOIE7qgxgENPW
         9ahdfI1xcJt04O/FLDyjJ4JiEFPcR7Kk0Rn6c9d91K43jay3qnodkeZt2/U8TI+MHP0O
         X12pgc+JFg6M7K35lA44eG/jL3SNRR0QHBmrl13Yx9jFV9+UEdU3k2Iq0IBtt8Xj7Zpt
         mvakSDWSxpUIx2DURntfpKrjDeKbcm9sMSax9/h0BrcjCznRjwc8+l7e5rEcb1l9g4TQ
         1yJzkmKCdD9kcJN4UnOdyvowsRYWPYM+Uu9GIqPs+RHJSvmq+mL0tWvrRNAjZRPslsa0
         7l6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvbdjGGjHQqhqHHVIQqvbFRo2d09iuvB3bFilL6H+bEBUKlIa13DsyjTFKbH+nxWxB/z1vCk3xoP+DYPVpLIxjHrDkBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNDoOQqaEu2rCBP+fiYHffQy75ZgaYIqt13ruDQ4tMkplO22Yf
	IdL78IUFa6wDba/8tJmFAIFHEwdND6JY+9rcWTcJPaezBCPPe7U4+gsglfk8OulwkHYHhZNEKEk
	hVv6UkbAZbKSo
X-Gm-Gg: ASbGncv5GwMWEN0TYF/KQjlZfWPMNEAKair6uGJ/yZUk1P+Pu0av1gie2yYTtS1U+Df
	zXTBPoSlMm7qchcoTyA4NFXNYHqGHGV1SXVjm7hFamBpvu0r72vjaGfpSkJyziTUM4bNmsKwyLv
	v+AjgWyMKpFvaUcNmyk1bDVN0pPEB3bgw8dIWPW+gt6ZFQWEEiR+dVL1UzZq4fek48/LjmMbeYG
	zHNoTqRy18WKI+LczkHzBG+VdFOB/NE8sOhlhCR8b4tMUo0MQob2RMbVk7jqIj1tn9cmNO9U1J2
	mX+cOoy5p2Ea75fnZFAJY0UyZ8MGTWCK35SIUxpYygnY3x+kx9NVXiEOMul6RUTEigGqBVJ+IRY
	ZwmHXjdkAO5ue6hLYcLoClUTRc2Dxew6bxcp/rX+p5CBnJbFpICMnLcoaB+rm25QJO58tiBW5t/
	dLHamuNbDG/89xKfb3bie3ry2JGObIBGhSQH4idzvC5AMME1X3AUUoOvHC8Rqpjp8okgTO6w==
X-Google-Smtp-Source: AGHT+IFm+MfJvs/Wf+g788FjoV56T+TV2tLXBCMUGkU9nJcP6d6Kcmdlz0QOSTBOZdqGTzkoz5n/2A==
X-Received: by 2002:a05:6a00:3a0b:b0:7b8:7c1a:7f68 with SMTP id d2e1a72fcca58-7ca8a1392b4mr8897925b3a.32.1764183865271;
        Wed, 26 Nov 2025 11:04:25 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2409:40c0:20:6a17:674c:cac:c69:59f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471f80sm22541529b3a.24.2025.11.26.11.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 11:04:24 -0800 (PST)
From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Subject: [PATCH v3] media: radio-keene: fix memory leak in error path
Date: Thu, 27 Nov 2025 00:34:10 +0530
Message-Id: <20251126190410.94933-1-ssrane_b23@ee.vjti.ac.in>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a memory leak in usb_keene_probe(). The v4l2 control handler is
initialized and controls are added, but if v4l2_device_register() or
video_register_device() fails afterward, the handler was never freed,
leaking memory.

Add v4l2_ctrl_handler_free() call in the err_v4l2 error path to ensure
the control handler is properly freed for all error paths after it is
initialized.

Reported-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a41b73dce23962a74c72
Fixes: 1bf20c3a0c61 ("[media] radio-keene: add a driver for the Keene FM Transmitter")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
v3:
  - Put v4l2_ctrl_handler_free() in err_v4l2 label
    covering all error paths with a single call.
v2:
  - Simplified fix: call v4l2_ctrl_handler_free() inline before goto
    instead of adding a new error label.
---
 drivers/media/radio/radio-keene.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/radio-keene.c b/drivers/media/radio/radio-keene.c
index f3b57f0cb1ec..c133305fd019 100644
--- a/drivers/media/radio/radio-keene.c
+++ b/drivers/media/radio/radio-keene.c
@@ -338,7 +338,6 @@ static int usb_keene_probe(struct usb_interface *intf,
 	if (hdl->error) {
 		retval = hdl->error;
 
-		v4l2_ctrl_handler_free(hdl);
 		goto err_v4l2;
 	}
 	retval = v4l2_device_register(&intf->dev, &radio->v4l2_dev);
@@ -384,6 +383,7 @@ static int usb_keene_probe(struct usb_interface *intf,
 err_vdev:
 	v4l2_device_unregister(&radio->v4l2_dev);
 err_v4l2:
+	v4l2_ctrl_handler_free(&radio->hdl);
 	kfree(radio->buffer);
 	kfree(radio);
 err:
-- 
2.34.1

