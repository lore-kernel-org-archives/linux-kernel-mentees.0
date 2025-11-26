Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E89430E0D1
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 03:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764128478; cv=none; b=EvlcTrdIV8JDOMq8Xvt2U5Tlm1sL6W87mWJ7IFf8wq4mHa4fz1W5jBfA4f8kyZM0k7V9SEc0tTKV71J5ie7JG4xwKbLD2/y+RZ1CY0HN3fHFy9xGU8ge7SLYUnze11fesSPb9PKulAIS93bGZttRTi78Ua1Cz1KEFXLR/azwTv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764128478; c=relaxed/simple;
	bh=a9NYLup+GHVLFnigeOor2tUWrU5w0BB3Ez/xbw4Q8GI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tmTMbDDygJK8zQ0N+Ner2afLOmdHynhU9fYqHDdmIKKGnnJxqY1azog1kCHCBWuCYxs34RNkqbwM/8+HeJBwnp+PUvjR49FE9VlKv5EtEWvzuU/+AAjKqUNwnWnVA1t90S2+Chr6ABMEThXSKx3ydA7skJYiU4PtCdzCdmrDnqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=QzJYR0tX; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="QzJYR0tX"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so5883803b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Nov 2025 19:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764128476; x=1764733276; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L06KdTNJX/VzLn2Sdswq1zSZJ8ncJFeN/TZrwKb7bDA=;
        b=QzJYR0tX75ym+SP/3UuJtHyICL+Q0uFIPw+MYRnDLiGZMfQZg1KUUmdAtzLoGLmKTb
         nY79nshJQ1nAp/d+MoJpsR1ZnjjW5Qtn32BwgGKR5SVW3iiefsjMFTdT5SG2GfE02WBg
         xgJJdoOpdw/euZEApQZmLbrMa+Jog9YP3vIeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764128476; x=1764733276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L06KdTNJX/VzLn2Sdswq1zSZJ8ncJFeN/TZrwKb7bDA=;
        b=S1E8EgCQ2GfQXb4SH6oz91reNQIC3ejW3ivHAIUMUQtTSDf7GY+xlpFbIB2ZoqSWjm
         qe/ZtnCF7i28ys7XUCnoj8OmJ+8eqTAqFTFENqSxWSS6lC2RnekC8ihRq5lDY1gT/UX6
         RjAa9jioh4qq65PgjIBMkF2DmeCBfTRicx99tXcyjGKIxGrLEk6IUgFUb7G7i2A95b+1
         BForIGOWAbJ8QxvhXTFA6LGrRDK+OSC3y0WlSts+2ccUfcuFvxBFnsFCbaOvSr1DGjEN
         pWzzFcbz40X/Pk9ixDzmHD4GHaLxUCyKNB992mX4/OuGFSNxVVyVPtDePTwmW8poYf1n
         oVYw==
X-Forwarded-Encrypted: i=1; AJvYcCV5x3hoNAZYugz0K4992QU2nhGWbXQbUEscIESaow3RF26zVF1sl/FNx9LmiZkc3b+D9eqmmoy005/OdpMcIIbu4f5LJA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb/GQNW4mHb7GIa2lpDaTWeHdxJwnUJ4F0tAqBWUIS2vaXvTKv
	P7UqURnUPyKf1RprPU0vSh/EOhTuvCGL8NzEZl056SwQJ0yTKlSrUphwpGkkwVwB+wc=
X-Gm-Gg: ASbGncsS9RwrndUVknYFrrcNuSdE3FShAyyzBEDPr3+1M3/n9OCFYWojMm3E2KZaLjF
	4HVHafN0m0o8fjKskUImqIDJ88QgJbMDnJgVh3kHi0/lVaMMlTcQZyjNq/WQsmcuBYySP8Z2iXO
	J232gw1V3JqLaN1yLU0QzHg2xuwycGKZG/M/ubQ7AJWon6q4Lc2j2PeQce1VQmV13Xksvcm7xbJ
	LU48CpAIotGS80vjJ01zeIze7Vbe36qAow7uhvkjkzEzR+z+FS6iM1NOFRk0UCt4+zJpIes73mO
	RwmdKwq6urNl0oBKpFiqnbjwz1D18HLe3hYS6RdoAaFpfIA33AcgBy9UGrLrClZxqLeZungU2hY
	BdohVqMhW6UbUsMh5AOjFQp341mewyohRkGs9QiGaYUfeXXW3mDoqXsUd4D1vVjBa5LdSWVJf6r
	kzYpKoWxLtpDaiI4AmP3v6Hbp4XVYkbYyLjD5EjbCM9B0SIkFZmLJo9L58
X-Google-Smtp-Source: AGHT+IFn0YyK8uoIBkvy3BywAsW6leMDGURDB5DGi/SakuSKZblQSgFbhnhe1dMYdgyoOjGxyQCmAg==
X-Received: by 2002:a05:6a00:1890:b0:7a4:460e:f86a with SMTP id d2e1a72fcca58-7c58e6014e2mr15281081b3a.25.1764128475771;
        Tue, 25 Nov 2025 19:41:15 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d869:f53f:2666:7529:e5cd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f174ba7dsm19410224b3a.64.2025.11.25.19.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 19:41:15 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: hverkuil@kernel.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Subject: [PATCH] media: radio-keene: fix memory leak in error path
Date: Wed, 26 Nov 2025 09:11:05 +0530
Message-Id: <20251126034105.236131-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

Fix a memory leak in usb_keene_probe() when v4l2_device_register()
fails. The v4l2 control handler was initialized and controls were
added, but if v4l2_device_register() failed, the handler was never
freed, leaking the allocated memory for the handler buckets and
control structures.

Fixes the error handling by adding an err_hdl label that
ensures v4l2_ctrl_handler_free() is called for all error paths
after the handler is initialized.

Reported-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a41b73dce23962a74c72
Fixes: 1bf20c3a0c61 ("[media] radio-keene: add a driver for the Keene FM Transmitter")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
 drivers/media/radio/radio-keene.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/radio/radio-keene.c b/drivers/media/radio/radio-keene.c
index f3b57f0cb1ec..84916b5ebcb2 100644
--- a/drivers/media/radio/radio-keene.c
+++ b/drivers/media/radio/radio-keene.c
@@ -337,14 +337,12 @@ static int usb_keene_probe(struct usb_interface *intf,
 	radio->stereo = true;
 	if (hdl->error) {
 		retval = hdl->error;
-
-		v4l2_ctrl_handler_free(hdl);
-		goto err_v4l2;
+		goto err_hdl;
 	}
 	retval = v4l2_device_register(&intf->dev, &radio->v4l2_dev);
 	if (retval < 0) {
 		dev_err(&intf->dev, "couldn't register v4l2_device\n");
-		goto err_v4l2;
+		goto err_hdl;
 	}
 
 	mutex_init(&radio->lock);
@@ -383,6 +381,8 @@ static int usb_keene_probe(struct usb_interface *intf,
 
 err_vdev:
 	v4l2_device_unregister(&radio->v4l2_dev);
+err_hdl:
+	v4l2_ctrl_handler_free(&radio->hdl);
 err_v4l2:
 	kfree(radio->buffer);
 	kfree(radio);
-- 
2.34.1

