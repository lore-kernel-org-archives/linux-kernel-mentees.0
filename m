Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78090353A87
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Aug 2026 11:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830382; cv=none; b=isOivvjIdZOEsU82/tMcIufm2l8cTu4prelJNR6nRZzk1q/y0i8Q74jtou/RwplaD4990IUy69cuH89hgd6Rt6IANPX3PMqHrXJ2nrO718vzxztybPPNB0LtokR5zO/zT5rep0gKFrr2aaKkNkJ5wIyNcYm5qNGvzk4mh/mnCX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830382; c=relaxed/simple;
	bh=aFboEQUKOgtqGi1HmtTJrsu21tmEZQzBtlGP/6ax/go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bOvm3aEVRI1d7D7IzkZjOOGIo7WahV9Lh7BxEISQw86pAMI+EtRyl7hiPty6GNR57Okfvni195bmyMEG+ur3P4ZYyQbDgX6bI8YjGLG+1n+eRf7NeFAujj8hVLxRP3XImoq+dLWXSP9F7xm9JozzrdA+a1gPR+rgx/4eua6UnF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ir2rBfjT; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ir2rBfjT"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso1714694b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Aug 2026 04:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787830381; x=1788435181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MioZ+DUe3WCboe2Lc9ge7bI5SNhCFb/I3FaxFf1rsxI=;
        b=ir2rBfjTzjJAK0AmnFvmaLAhOWjX0bE5m6qyKoIbRp4O2JN3rsK13oXzWCeTsgd5To
         FsRwVOlj9B+QnXb7sqlf2UgcfR/hgH4NGWb4Z3OGdjQirOWJOnlcYNTN74PJGC2mCYFb
         yV6DRjy7fObmzw/FJ7cQl0pdO8Oz3K4dIQuHOetyMFSWb2Un6UZxYGg+70sIa6gQcUKc
         jRNc4JV9TOgSUn78ORTw9zDf/Dan4UawSsXHTMKp7qaDnAnFqxHB3CIMjQBziwQWd4MP
         UZ3I/jrv7oFdreK+dRfh6LoQCn1gJNrUMkLjSsr4FiHZE9BfTNU96PBD4VxmX+NJ/Afb
         ur5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830381; x=1788435181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MioZ+DUe3WCboe2Lc9ge7bI5SNhCFb/I3FaxFf1rsxI=;
        b=ICJpqprzLJj0/O2BmTgnp6losEu8e0xBymPPxjNApPg8uwQeoeu/19+isuBkD8UcUh
         WA+1CjDF3DszKfz99lVTKailuNx8PD0g7Tn5HwS3yNzwUKAB/xWsxxNVFwjPWdh1KxFp
         cFK5O6LQ5q7WjLDIYCbJuvBDuMMgxCQIOQ43rXlp1k5zQwxUBU63719v/QAb3/8aavO2
         t0SgbTt9PoNCso9jTO4GDhKoXXyqEILJOcv5V1ITHwr4WM4ZwRaob1kh6emL/NS0Z4DU
         +EKOV5+DYDF27EoXRFNmo7sHSlYyy8yb6TDWt50EiOzjB/WKU/ETVBscU6zsXOlKF+86
         8l5g==
X-Forwarded-Encrypted: i=1; AHgh+RqT9/o70cNrec32vZCZ3t01n+vgUykXjIVID6Ejl1HW8qTJCZQHhWKo8hN5SGILVG1v+SavpErPMPm2nRhldyIpp1BJ7A==@lists.linux.dev
X-Gm-Message-State: AFuF++lyxpx8FJQw1sZOvy8YjyJ/bDYCoY2EM5OZqEsi/vIl7SclA0oE
	LRMbh4+3dZzAgYCMUgnvUPUH/33rjehVXEKYR8DgLHswfW2jkntdQZsJJ4dF6/bVl97HBw==
X-Gm-Gg: AR+sD12HY8A8VjGxfK8ZNNgBxPCkh4O7J+OwF/f9IfsS8svWP6thVmRfIaqrrDzvmJa
	GOLpZY8JMAwt+UmDsSz4knG2kPI3Z/aTeRLBP7CjGE6/w0nfWA95uKbBqaAHMiwLBhjlT3dQ0UE
	U4+M/NQSuaibL3Ra+UqNDOvBiAabOMBVdhUYDfwF0gT/LbBSx0+4e7myfNXKFm7ITmyfTA0zgDg
	oLwSuycDz397p4gRtlluKVhrkopCFvFphafrVgaaAR/MpOOgNJe42mbDbBIwmnCJzZAoGIEC4KZ
	heWl6w4wIX6Yl40ERuD209P+UulLyM736nu2kNA4GaSx8KIuV9dVTLIJfuBo93mTDre98OUFBuW
	IppC/0Wx7ILqEP0gH8/fFazwEaVxTe3RAvH88UsC/tF/bonfGN2PGaZ7xryFbUxhF2/1603pcMS
	xuwQgkbC6J/bVcExrkhrerG6JFnbwiOR9NnNkx2j/JaPnftqQOfDg8wKloyBlDBJ8XzEcHMHZIR
	83L4o+fMQ==
X-Received: by 2002:a05:6a00:6ca7:b0:84e:24df:3870 with SMTP id d2e1a72fcca58-8536ee112damr26946481b3a.0.1787830379646;
        Thu, 27 Aug 2026 04:32:59 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85359cd71e2sm1940207b3a.12.2026.08.27.04.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:32:59 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>
Subject: [PATCH] platform: cznic: turris-omnia-mcu: Add missing MODULE_DEVICE_TABLE()
Date: Thu, 27 Aug 2026 11:32:41 +0000
Message-ID: <20260827113241.993923-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver wires of_omnia_mcu_match into the i2c_driver's
.of_match_table but never exports it with MODULE_DEVICE_TABLE(), so no
module alias is generated and the module is not autoloaded when the MCU
is probed from the device tree.

Found by code inspection. Not tested on the hardware itself; with the
module built, the alias lookup

  $ modprobe -R 'of:Nsystem-controllerT(null)Ccznic,turris-omnia-mcu'

reports no match before this change and resolves to turris_omnia_mcu
after it.

Fixes: 992f1a3d4e88 ("platform: cznic: Add preliminary support for Turris Omnia MCU")
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Developed and tested on linux-next (next-20260826).  The affected file is
identical in v7.2, so this applies unchanged to mainline.

 drivers/platform/cznic/turris-omnia-mcu-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index e8fc0d7b3343..f0416302a1f3 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -403,6 +403,7 @@ static const struct of_device_id of_omnia_mcu_match[] = {
 	{ .compatible = "cznic,turris-omnia-mcu" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, of_omnia_mcu_match);
 
 static struct i2c_driver omnia_mcu_driver = {
 	.probe		= omnia_mcu_probe,
-- 
2.47.3

