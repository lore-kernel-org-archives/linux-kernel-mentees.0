Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E82419E98C
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Sep 2025 17:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757957202; cv=none; b=h8PwVn8pK/5T46brdngr4m0iX1Crn2S3QjHRc/nPXtv3H3MK0ATuqp2VinBvrD52yTLU3hWOj6WlvVy9nMazfEQ4HUAb8Oa8T+0pQgBGM2AKEg/BvSB6wZI3Hqizt4pu1PTSB8/s4UOsOWoqg44C/+3iZPl8OWGzFd3QimybL6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757957202; c=relaxed/simple;
	bh=2qnxaUu2tTKkrWTyVo9Vi/vwv9iCm1iQxSgeRs/Cpoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nqf2aXkQ3kwReeh9zro9Iat3ttJYGAmYX/61vbA3bAGDcBm+YA74Ei3K6tKHTaL68x0SgU9rwA3DdiH5ulnsFfbkAB3StH647fdknMMHy9XKaQi4Z14Fw2y5HGu3fRgEmKgvs3UuIv7mrZIZY5BsBbAa4y6JnZBzSeZAYNh/Bjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJUFe8le; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJUFe8le"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32e3726e2bbso1627237a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Sep 2025 10:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757957201; x=1758562001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TSaBeHJ4VWzJEnuTxptRHvKvxYMpNe/6t44dG9eOeg4=;
        b=KJUFe8leupk53AV81i6BXogLHn0M+7Tjhy62Cq3qwFEQ7me70mCHbWlaOh7qcAt+9Z
         NGJF8P9yaValcl0e2/f+bv5k9Q29F+9Ch9vWrUGmvh2kDCo7K6i8WQjADFaOPr9J2C9O
         lhT4ROO93Rg5v9VDefor6cXfsDO7j5oqvOctAPcEEKCY+dkmMM8SE7ObtIwzWBTGr0Hn
         1ANLQHdyRXC3Yn0Ptdrp1Pt5BcYnTltc6hROkosSQuX6Xzp5YXBcAGPHJ37OJPXP2NFy
         5fa2nU9+SIbp+LfZu7W+I9gp4I5hXvLy4fXdr5EK1/V+ElfSXswN7HSzcjXGZKGtVmbd
         PJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757957201; x=1758562001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSaBeHJ4VWzJEnuTxptRHvKvxYMpNe/6t44dG9eOeg4=;
        b=tg6O32ZE10/vFndopC3i8FFjP9Tqg/J58NwGe2zcV9tMwr4pbp/yCuG6281UBfsm8l
         ZG38diR7qixvmHu/Qs9X/Gphdt/OmCAFXZvo8X96iNl9Be/rEUzBH4KLzMchOBc5s/Rg
         Vz+373jnf8Ahbc1QhP4/LDf/T9kVcRTl2P6EfknRHgB3xW3mx5Zk3dfRYNtYH/kr/gaE
         OhyIOsEakcH6kdxbXsLhnP7d+2Zm5G+tfXy/e3GGwnKR4aZuSXHP4KX0igyxgfnrl0P0
         GfzMP04v98qeZgdBJjUZYdKTit8oFy1HDqI0USUx5yXMaRCulFeEuwBZEb64GxIrJQa7
         q1jg==
X-Gm-Message-State: AOJu0Yw1HDBNiL3ZPOCR8z6tjqfpPELNwxf1YVZbgiuUdLffZbU18O5F
	N+XrzbnZEzFaC+aGvpRQ5sN1UeXcev4dS9PaVRKvRN7zEO+8ZvjJ8kHS
X-Gm-Gg: ASbGncvomS0bBQA4r52PvUge4vKuphiGcuFNLK8wse7cn47gO9TZkxj/Y4g+3HHNEO8
	Kkq99N17Tu/22p9bWzxnuQQBhzMc7V15vcvDO7WujY0yoNHHjKPg5X3ujJ/UDxW8rWxxOfKheYT
	W13a/6zeTGHS89P5semA+Y8Pfg37VUFv1X9TTPXwXKnRpfbthuvePnpr2l73mQcFCgPYFhCD7VA
	T0Pu3/r9uSsV7LihvOlrY1QbXBClZrcq8puqBxpC+NDcw2gnJCQ9z8o6dBU+KV/dGfpgQFU1PdJ
	zoQ6TamlXblVs7Cg7owuL7Ys43DoXfJREuIJIf2LbqZ/UFblJd40e9PX/gNG8RySU4SWuEUcNw+
	4O1DtI9sZknZ1SXCLdqZ9idiwT5eUUeSeUnNFtq087aqk/MwuHZ4=
X-Google-Smtp-Source: AGHT+IHwKuhCYVpyRN6Z1L9KKYuhZIK5pz1VswC1PNUOa5us4Z8TUA5E75rVbVYasChRnKiuSxo4CA==
X-Received: by 2002:a17:90b:3cc8:b0:32e:7270:949c with SMTP id 98e67ed59e1d1-32e72709600mr4179506a91.35.1757957200600;
        Mon, 15 Sep 2025 10:26:40 -0700 (PDT)
Received: from cortexauth ([2401:4900:1c7b:db3a:1c7b:a123:6d26:f0bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a3aa1a22sm12158237a12.52.2025.09.15.10.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 10:26:38 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Deepak Sharma <deepak.sharma.472935@gmail.com>,
	syzbot+6c905ab800f20cf4086c@syzkaller.appspotmail.com
Subject: [PATCH] usb: hub: Fix RPM teardown on usb_disconnect
Date: Mon, 15 Sep 2025 22:54:44 +0530
Message-ID: <20250915172444.269336-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On usb_disconnect, the free-ing of the device structure of usb_device is
not well synchornized with the RPM subsystem, which leads to a possible
use-after-free

Add proper device's handling for unregistering from the runtime PM to
usb_disconnect

Reported-by: syzbot+6c905ab800f20cf4086c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6c905ab800f20cf4086c
Signed-off-by: Deepak Sharma <deepak.sharma.472935@gmail.com>
---
 drivers/usb/core/hub.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 256fe8c86828..887d987f855e 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2329,8 +2329,13 @@ void usb_disconnect(struct usb_device **pdev)
 	/*
 	 * Ensure that the pm runtime code knows that the USB device
 	 * is in the process of being disconnected.
+	 * This is safe to do here, since all the code paths after
+	 * here will lead to eventual deletion of the device
 	 */
-	pm_runtime_barrier(&udev->dev);
+	pm_runtime_disable(&udev->dev);
+	pm_runtime_dont_use_autosuspend(&udev->dev);
+	pm_runtime_put_noidle(&udev->dev);
+	pm_runtime_set_suspended(&udev->dev);
 
 	usb_lock_device(udev);
 
-- 
2.51.0

