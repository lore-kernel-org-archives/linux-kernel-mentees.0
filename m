Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F220A1991AF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Aug 2024 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551639; cv=none; b=SS/Ljub+n1Uk4YZfLPPAFssQUJI3/PcGo8aNlRw+R36mcwyZe1zXzHwHAs+lDqoUhiEpbGMpNgBFIBITTuFm7aTHEsSChfk5pRT8YPZiwVslQBbNpZPc12PlBlcPQ5XY2SG9VegIvqrNpgFZ9oWTPEOAcxjgs2he82Doz+R9TwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551639; c=relaxed/simple;
	bh=chAb2GOyV/hBwqq1AGYRaBy1jbqHrZJBU7pvL4YwHDc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u3RyS/DTxnZZJ+hEtH7DBzJ89Y469YGJ+GI1tR7pp96I9s9joOrjMGLw2JOp4VHNm0GQ4xOatJ22uNQ7zoZ9AGb1N/M9uNFs8J8e643mv9V3F/75A8aOYmqmf91CdE0gXno84yoeO4e5vZSJLi2Y11kSqedvpK9UPEEg4RHdGrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtxGJkyU; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtxGJkyU"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71B1D81656
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Aug 2024 12:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lm9lUo8jjSL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Aug 2024 12:20:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=0xff07@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D39138164A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D39138164A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YtxGJkyU
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D39138164A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Aug 2024 12:20:36 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2cf213128a1so3590134a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Aug 2024 05:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723551635; x=1724156435; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3mWR2mtNanCFR3pbd+apr4voFLl2lzERm6XILSMuMA=;
        b=YtxGJkyUz4e+n+1+C4GQ644yH3xKdh0du/lNyOCzvw+ly282PkpKXd4LyCZS2++tko
         aP5+ZWWAG6319Efo5ytx21ja7Ns8xYbSXnZMic28jTQXN2/zD1laUnY5nzOGf3CARG91
         Xx2e9Og12XQzhf0pdl8ULTT7NzoIPfej7ABvwnYpPlOsvUSTMyLhee9gBFu7Wpk75et9
         73Wkse+GX1Q+DuHZfSxj1qohkMXO/2tNlEvTjdXVRl1M/drq4whVVdPJV0oxuZvQCgtv
         VcYydqCAFEIPc/81wtR8D3EhN4testVLvLhmJpSnAZiP35WIH2K+cN40tgQkLhszczwZ
         +zkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551635; x=1724156435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3mWR2mtNanCFR3pbd+apr4voFLl2lzERm6XILSMuMA=;
        b=urQyyMgMhh/qyoejVIbCftBwjxPYv78mDxOxbrziZUK0x6hXUQbCVi4vPzktLxoPQ3
         FlzCGIRNWgw/flN+fip8QKHT2ZYlXGe3+OTrTJ1H9UH4TWtU8PH71o7RQU1ErHjyminK
         kXGILBBJGYPAECJ6yUzADHEgVWbyD54oh6B/5eMsELmLptqgmmsE4GxeykMmDaGJqd4K
         U3+0IUA1U3aAyMLu/5/Nt6tiCa0QxYbYH0cgYXDKh8gmc0ddBB1kAkKIzHieCnDwPYx/
         sDfpYUHI6Ve6Tk6YDizEl1Bt4WDaFPtq3u0tQHOMW6l1m+i3dUgnkfLaF3QZMTyp6ZrY
         SZ5w==
X-Gm-Message-State: AOJu0YxVNBIBeRQRjrCgYhpRaSs3f1fuHbKAO0J8uq3WIlhknsau/21z
	qTWzg3xPPeK12Zg+JUAsLOYWmpTSqjgdRSInBHSbWuh4sAG6FjHcl/XdNu8S
X-Google-Smtp-Source: AGHT+IE1wpvYvO+X8aOgD1ucXI5Hpo8sCpkifzovrkkhUkzJyZM0MyY3uf4Jalzh0qzJR2XxEwT8ww==
X-Received: by 2002:a17:90a:7448:b0:2d1:b49d:7f2 with SMTP id 98e67ed59e1d1-2d392548219mr3858002a91.22.1723551635481;
        Tue, 13 Aug 2024 05:20:35 -0700 (PDT)
Received: from 0x7f800001.hitronhub.home ([2407:4d00:3c04:81a0:c062:fc81:d816:8b73])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2d1fcf06589sm7092679a91.25.2024.08.13.05.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:20:34 -0700 (PDT)
From: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
To: 
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	ricardo@marliere.net,
	skhan@linuxfoundation.org,
	0xff07@gmail.com,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: vhci: manage mutex with cleanup helpers
Date: Tue, 13 Aug 2024 20:18:28 +0800
Message-Id: <20240813121829.6693-1-0xff07@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use macros in liunx/cleanup.h for automatic resource cleanup.

Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
---
 drivers/bluetooth/hci_vhci.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/hci_vhci.c b/drivers/bluetooth/hci_vhci.c
index c4046f8f1985..70f0c28372ec 100644
--- a/drivers/bluetooth/hci_vhci.c
+++ b/drivers/bluetooth/hci_vhci.c
@@ -19,6 +19,7 @@
 #include <linux/errno.h>
 #include <linux/sched.h>
 #include <linux/poll.h>
+#include <linux/cleanup.h>
 
 #include <linux/skbuff.h>
 #include <linux/miscdevice.h>
@@ -468,9 +469,9 @@ static int vhci_create_device(struct vhci_data *data, __u8 opcode)
 {
 	int err;
 
-	mutex_lock(&data->open_mutex);
-	err = __vhci_create_device(data, opcode);
-	mutex_unlock(&data->open_mutex);
+	scoped_guard(mutex, &data->open_mutex) {
+		err = __vhci_create_device(data, opcode);
+	}
 
 	return err;
 }
-- 
2.34.1

