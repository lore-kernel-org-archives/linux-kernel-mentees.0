Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E6A1422D5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 May 2024 17:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716399152; cv=none; b=TpqK+n3o/N3XPs5vEcR6FQyr5WR5bNserl6JXSaNXWO5fIgiSufpNUbzlz9ZTUxqK3lgMsGAGuR7D4LpQ2/G2CVRXhspCsum8gzA/dLXTYuRP3jKIwzG0uzEvWSSq6k1FWEu00F2SNJgUdw1p5K0j/e1tO6z3IFuoONcVJ/Xe84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716399152; c=relaxed/simple;
	bh=mWrCECWP2Ja7WFtRVbyR5oeOzXIhWB9l1tn+yGrpBZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S3COMrBzqHoQolNXApei1ld/OGZ5rboPPBpI0XxizG6U1/ou1flyixthv3VQ6eYMvx34fUEbVSD6hexlHvRAW3B1jOylOTK0nCuGpqpfQOmrt9XR85GLQhxmjsbtAbEoBEl3XFwuQQ8i/jzWWmgS/RQo2JZe+CyY/HnNSaScHIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZvowiWm; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZvowiWm"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66A4C60710
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 May 2024 17:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEJPP7xD2CoJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 May 2024 17:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::a2c; helo=mail-vk1-xa2c.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56F13606E9
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56F13606E9
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MZvowiWm
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 56F13606E9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 May 2024 17:32:29 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4df2630c49dso409543e0c.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 May 2024 10:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716399148; x=1717003948; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZ/q3U1UJT4wlFXYPXdxRRy8JpDcn2n2sx8wZZMODq8=;
        b=MZvowiWmL9mWA4F7U9EN+Nfhkj4q2I5n0dUL5eA1xn3fGJUEAy45oYd6grg5LyW4ei
         v3E9K9HyAL3LR2cQNWGZSqjB5a/j9Gek9zNaM85x+pdPbfdiC/rVcX8wIk3adtmpL9js
         /WcPMRppqcI+rE0VQaN+ifw7EBnJIk1SVYpFla0Lvy9MZ++kYjizZCSkPOQnJ169a+a9
         Qdt0hv+Fqq7nJlBP9uQqbGiDP8mh7qxd5y62cK4H1Xmsq5EwVqsgC8Zyvhs5g9B7eQGW
         I6lbcQH+Ga4oaDtCiSq4ErhPrz1EBfdWTlORRhWT0H39dNXrjXR0v+KRQmT2Xb7XnQEk
         z4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716399148; x=1717003948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZ/q3U1UJT4wlFXYPXdxRRy8JpDcn2n2sx8wZZMODq8=;
        b=Hnk8ooOgaa9YW/qj3LFU4G/ppbgM2TKGg/Mk3lI9WF7/WwESO4RRhNJj8PeJauUUW0
         3q6XTcHJCaPCosnwiDTKTVd5YIP5oN+6pGYMtfQlEvI7SFmWNhIZyLJF93BjI/Cbo5J7
         oa+jUeCVKFrl35sDFuymfMsMhn1NoO7VbJjeTNATyOoGOF4VzwlrZ7aZsLK0/UVp8Ezf
         iCz+2LTLJRxohKyRWWDPcKwcAHjptcxrY+rdbLzSgoDNaJDn0y+WGKv46fI9PpeIdzPo
         UQvI1EHZmaz/2GRJ7+CipyT8G2pqggaxapPJcLOI5no6MKbBRBf0q6tshJeH/cEZ0CN8
         FQGg==
X-Forwarded-Encrypted: i=1; AJvYcCUpGrVX1jLwOy2Yku7AWc2K3Z59A56xbApFuRZPfsF4lPA+8yTmCxFFI9FQ9mfjVCTGpbCNr55BpO34rBGJbzqNC0OcE5y5qTcDQGK0jRpSLH+S/dYzFKby6D6sDxOS
X-Gm-Message-State: AOJu0YxhZ6ChO+HhPLNQeeGaGqbw/Jne2Hv8f3Vxq4UEkfJ9g5fhk76z
	RiybU/9SjLzyRqoWpCn98TpFOmFbngIzoJOmPeqPiZEreNLp/a8F
X-Google-Smtp-Source: AGHT+IF9+hubiYH33sZJMZsgeXxn+KNANzDpPanTvX7E1MvR5CY9FyS5duW0zBDyqv7tPqUM/15Xtw==
X-Received: by 2002:a05:6122:2a15:b0:4df:2137:e929 with SMTP id 71dfb90a1353d-4e218614d9fmr2346705e0c.15.1716399147906;
        Wed, 22 May 2024 10:32:27 -0700 (PDT)
Received: from x13.. ([156.146.54.84])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-4df7bf45412sm3752513e0c.9.2024.05.22.10.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 10:32:27 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: skhan@linuxfoundation.org,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Fix spelling and grammar in driver doc
Date: Wed, 22 May 2024 13:31:48 -0400
Message-ID: <20240522173218.6103-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* XBox -> Xbox (lowercase 'b') as per official Microsoft branding
* the controller itself has more than one paddle, hence rephrasing
  "exports the paddle" to reflext this
* rephrase the description of "those" usage to explicitly make reference
  to the paddles which lends itself to replace the SDL statement to
them
* report -> reports grammatical fix in favor of present tense verb. Reports is refering to the act the action being performed by
the subject, in this case the kernel
* spelling fix: interpret
* capitalized first word in bullet points for consistency

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
 .../hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c   | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c b/drivers/hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c
index c04abecab8ee..858cf20ebe2c 100644
--- a/drivers/hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c
+++ b/drivers/hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c
@@ -15,20 +15,19 @@ HID_BPF_CONFIG(
 );
 
 /*
- * When using the XBox Wireless Controller Elite 2 over Bluetooth,
- * the device exports the paddle on the back of the device as a single
+ * When using the Xbox Wireless Controller Elite 2 over Bluetooth,
+ * the device exports the paddles on the back of the device as a single
  * bitfield value of usage "Assign Selection".
  *
- * The kernel doesn't process those usages properly and report KEY_UNKNOWN
- * for it.
+ * The kernel doesn't process the paddles usage properly and reports KEY_UNKNOWN.
  *
- * SDL doesn't know how to interprete that KEY_UNKNOWN and thus ignores the paddles.
+ * SDL doesn't know how to interpret KEY_UNKNOWN and thus ignores them.
  *
  * Given that over USB the kernel uses BTN_TRIGGER_HAPPY[5-8], we
- * can tweak the report descriptor to make the kernel interprete it properly:
- * - we need an application collection of gamepad (so we have to close the current
+ * can tweak the report descriptor to make the kernel interpret it properly:
+ * - We need an application collection of gamepad (so we have to close the current
  *   Consumer Control one)
- * - we need to change the usage to be buttons from 0x15 to 0x18
+ * - We need to change the usage to be buttons from 0x15 to 0x18
  */
 
 #define OFFSET_ASSIGN_SELECTION		211
-- 
2.45.1

