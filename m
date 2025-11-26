Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D5E3161A8
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 06:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764138625; cv=none; b=TaNEFvnIt9HmAyUHYyNw9ES6bk+nIUxeRMffBAtg8bYNXmp1iYQZgpCgUT95SSOIwDkz1NJJtVZKO3XKv2wJSY7X+RpyKFkvhoeESteFM7XlzWTxzjqI21QBrvSWDYCOQcB+r9iiTdIL4WVyKEP/YIRY13ei2TMOfa+uxeut2co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764138625; c=relaxed/simple;
	bh=U6bQmkUxd70UqE5e2zL7MVt9+dVE77Ehtb/US7OhAYg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mfI3ijIXrJ2XWr7F2KXPLSR5IyLkEFFqA3xEWpwSavMjVKCYEgpWTFTWzo6/iO6a6azfJOrsxggW5xXo9VOUUJ/5vYynMHqAWBzsRWTpBP0GnYwdoN2EtfndFa3Xv49lXzqYKMt/DSlKm9ANCzwME0ZPIyqqDFgnceN09k17Rhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=Ee5aIjpp; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="Ee5aIjpp"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-34381ec9197so5665933a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Nov 2025 22:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764138623; x=1764743423; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IzRkGTCq3jZ+jOaGIzMctMlQ71AdgQEN3oB90COYnDU=;
        b=Ee5aIjppJKEM1hzDSBSRx4waFlBjAAOebRe9ZDeMymqzA4mQsMRwBjlHa4EhneEZMm
         6hMvDG4w9GaN4W5+Am8l7gabh4PSeY1BGilf8srQxWzVb6tja9grZhCJ0C4QsmPZU4LW
         3Mc9ik/qb+boFtB6y4BP5J0J9arlF1lqNzbQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764138623; x=1764743423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzRkGTCq3jZ+jOaGIzMctMlQ71AdgQEN3oB90COYnDU=;
        b=JJD9z0nY83lSj3c1kRmvROOsuEoGwNZ7Mwl40kpKkWOLmO1wbjRg99AT4g8SH5Meu4
         mlYg8RUJeTEdFWrVwCaA0n2LUZXXW/ctOUk0tVVdA1Gl6qmLmc+hjSdaF4jkm+Vpv70g
         /tG6TtjEZrA08ynKwJW7tHhlVEBNbbGtzw9HbLVH/dNsUByjcdgd3c8uX4jnXdh8+lhS
         zWKq8BoVpidIPUIN5jOZ0dWTh7/BI2runnhoSW5Z30P0UAWj94xBuIZCahw3sePLkaSh
         l8ngh/hfbNHvCssO61t4uahOKBhzwT682+PZ6g1ZcaO4/Q0B3XpMaVNs9zitzLMpwleT
         /B5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzmqK0K3y2Um+I61OwVjMZ09j+MFJZK78iECc4fYSuy5qg/hnXlUM5uCgrmIFHkFHH8PaVe5H1UrifH6ZvEhtl1wU9aQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy59Mwx6JHgpV5I4e0MOTz4kX/3Bcho2SSXx6jmlCbVD/lWTjXJ
	b/m75/XxgAqRGaeXewTZVr8be9JFZwDDaLzUKd6s/AKX/ZJEGQJun2C413kOq9lnmS7J2kGPiNI
	NCT0d3K9XTSJ4BOE=
X-Gm-Gg: ASbGncspokgFYjea9KY/Y1KLsMSjcs41Y5cm/6pt/A6KXSSQo37gOr/OdGftvt/2xDK
	+j1srnqVzjdzmjU4anG1XaEoUH2+RAK2N2f3trjfNUD7OAqh0WrN724zRiOz5JgmIeM5nBf8y+H
	dB2U0PRArTUwav3Bw1LiPkqUmKgx26T+FAjyXupenOZTapNmQstlQCQNNokJz6v3dl5UmrEPtTJ
	EV/IMPvXSQMfVq3S5KlmrAdgQpyZVmIak4wm4HFm+EZqg7A3hOFHnAfyJXpkvJ9vxG9yys9DzMP
	fxkCeTXMac/XpUy+OWwYuMZP7Kidfhbn6/ysj98aESDw/CSpNuqv0ldXRLEQZMXeXPdLZeJG9w7
	62wCI8vN64KcMmf3fn6HmVllGCgj3rOfRkfMdnVmfB/mqaloMtIwOMuUI86MTqPOdjvvIx1iEeD
	cRRz88ifM7seX8GGFKpZdYHlSQ2oVmJCd6U6BHJe8JX5vILz4iHeSC+B/o
X-Google-Smtp-Source: AGHT+IEuaHOrzBEFxv16/3EUkSrMUsaXs6T/9SLzDvNZQkcQxKIdKmZkZuFocPDxwf8ehClgPQYvyQ==
X-Received: by 2002:a17:90b:4b8c:b0:340:d578:f2a2 with SMTP id 98e67ed59e1d1-34733e4cb74mr19340413a91.6.1764138622659;
        Tue, 25 Nov 2025 22:30:22 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d869:7ab4:fdd5:842b:6bfe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63dbcsm20088553b3a.50.2025.11.25.22.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 22:30:22 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Subject: [PATCH v2] media: radio-keene: fix memory leak in error path
Date: Wed, 26 Nov 2025 12:00:00 +0530
Message-Id: <20251126063000.28493-1-ssranevjti@gmail.com>
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

Consolidate the error handling by adding an err_hdl label that
ensures v4l2_ctrl_handler_free() is called for all error paths
after the handler is initialized.

Reported-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a41b73dce23962a74c72
Fixes: 1bf20c3a0c61 ("[media] radio-keene: add a driver for the Keene FM Transmitter")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
v2:
  - Simplified fix: call v4l2_ctrl_handler_free() inline before goto
    instead of adding a new error label, avoiding unused label warning
    reported by Media CI.
---
 drivers/media/radio/radio-keene.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/radio/radio-keene.c b/drivers/media/radio/radio-keene.c
index f3b57f0cb1ec..4a203e958a4f 100644
--- a/drivers/media/radio/radio-keene.c
+++ b/drivers/media/radio/radio-keene.c
@@ -344,6 +344,7 @@ static int usb_keene_probe(struct usb_interface *intf,
 	retval = v4l2_device_register(&intf->dev, &radio->v4l2_dev);
 	if (retval < 0) {
 		dev_err(&intf->dev, "couldn't register v4l2_device\n");
+		v4l2_ctrl_handler_free(hdl);
 		goto err_v4l2;
 	}
 
-- 
2.34.1

