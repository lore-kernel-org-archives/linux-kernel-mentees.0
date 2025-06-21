Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2162063D2
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 21 Jun 2025 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750524040; cv=none; b=SJvIxtIvIPx9kBQgv/QKTQZK1fYL6z/BzbGYTuOpZvqPQxMGelGRGOC+AfM0ciepTR6HlOhBSA/8VPlyA78Z06h5Uzb0uNiISdMD24qpXgkrBMUqQmT8ejF5124yRhWHJeVKMuoTO8A7j63Rl3mXxPpdBmjUuBNBP5OUaVmsP5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750524040; c=relaxed/simple;
	bh=EVmf8TzEW8JxRdGdURPPOuBKozXNkpk3zCaggC36l1A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=fQt5cLIXFqsIMpNGyBxzHls/2y23oAQWe6Snp/wisrupnS2Zosy8Kwrj73FfvLSJK+PxbmnLKwVvSFnq68Ybqg8PTeJ2juyv7nVcKy1qbTMt5P2MSCxvEkBnVa8EauVLC/7PxAsa8uSXbBSUSqCVBzNCP/Y3N9OzVYwZT+kDvqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSsOcLRh; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSsOcLRh"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5535652f42cso3072460e87.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 21 Jun 2025 09:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750524037; x=1751128837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sR1NMUT1yhTOJR/QHSq5p3ddT3ng4Ofa4jScIH8rNIo=;
        b=CSsOcLRhbxJhhkBO3TjKglgVn2fBp/lMARmYoEOUWLA0iL3Etw1PMM4s19NUT5/qir
         h/H6AVCjcTGF0f9Y54mRPO8pb8b3eBRkQdh+xo1y0WKDMZzVJjATjCHzK8+EAQK0UPA6
         mlvHPbBij06glOk/V+S8NGEfgFjb47F1O+P3fGEQlZvwuE+SYW53zaH0LZTGX/W25cgu
         9DQpAUsJ9b1cTSqXoUuLPpnJe16Idf4fnaw0odXTqTPBcZ0qV+yYO09+OY2oVCtF5rrI
         YNOqTgFnk3r3g2/B627TUKcaw0adGTzdQIWqCtUH2Z2jrLU5VeNsOc+bDPyjgt9DDm7y
         gxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750524037; x=1751128837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sR1NMUT1yhTOJR/QHSq5p3ddT3ng4Ofa4jScIH8rNIo=;
        b=EtvAJ2o3qJdEaR011te9cQA4tQnyzQDaHfK+yXEhYBHhRWMn/P7tzDXAhPV9r1Yy0H
         LAEt5Yz06V+T1TmxtRnNVXuIhO2SOaFTDGbHUo2FY/TQpxVuPT6ELJTai8rHeVM7lpcK
         /jOnsjlFsYwHiee2A+ZMqksHS1/h5qAnxygvSvhjIcEBT/p13IR5yon2gVfz32R8pTIR
         TGrZFvqeY2qyeA+BnvI6cW8g4KD9lTn1wj2paIpDztpDQn0bMuizOqEKPeVLSdKAz5Bm
         Spoyb86PdY1SvWK7JVkUQJGWKPdEleHrJTkdwSb8VTguRcuxTPWxajU18EEqc+IG85a/
         0tWA==
X-Forwarded-Encrypted: i=1; AJvYcCXmjsY4xcGzNliO5sEvvr1rcHIq2/SYuuQ7Aa5H2bXmSmZ3ZWhSekprX7Jj8iB+qX/ZSL40LtdSJCtl3NF+yN8ScTlvrw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyB5cNHaFroW2dIBC4b+OBUwip+dYiwP4v0D6Z/iLVJh+Ym2Cf/
	jntkwjfgP5YRc4Ms/FhpyPSWsAFAtG7DbFUyABa81vDlJjutQZLdK0Sa
X-Gm-Gg: ASbGncv+hLnpJ9sxyQybwOpfKN5lI0fSQqoa2mgvUbzeSjvxjqwM55wDXv6XjtR0dQf
	D21R7w8d9OoIjmz5oaVHNhdPKlsQPH8ZUUiysemEfE1/of5YAS8Mfvkg2fpKAf4g20ParTmGmeh
	utMAAbiN6IwAujX6xpugSCMd8tJkAnOkygz6NzpJhw/D9sPIBuNaost4muK5JBhxaSQANGZyxXh
	7c+9vAionUzMIKaiS1fjHmZJte+w8r2/QLCWFXXtyKCA789bBm0n8j61DoX8y5xurKLC5WzrnxA
	xIaEGpPGeGcSSVYXxby5trH88GwRLYenGfmkJ8q8cYuCOa0d7iP//5FOkzRPOpYhPyRxT0WszJP
	PrHb1UB+1yKgwJE8RM6QwiSdI
X-Google-Smtp-Source: AGHT+IHxqWLBSElMYJDacdsNFfRrwGmh+pbTfsDtlw+a+l6yrvBq/9PzP7Rt0WQhltV3zTXUv10ruQ==
X-Received: by 2002:a05:6512:4014:b0:553:acf9:c430 with SMTP id 2adb3069b0e04-553e3ba865emr2701926e87.17.1750524036540;
        Sat, 21 Jun 2025 09:40:36 -0700 (PDT)
Received: from uuba.fritz.box (89-166-61-133.bb.dnainternet.fi. [89.166.61.133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980dc32bsm6561081fa.94.2025.06.21.09.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 09:40:36 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: gregkh@linuxfoundation.org,
	kekrby@gmail.com,
	elder@kernel.org,
	quic_zijuhu@quicinc.com,
	sumit.garg@kernel.org,
	skhan@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH] usb: core: Use sysfs_emit_at() when showing dynamic IDs
Date: Sat, 21 Jun 2025 19:40:05 +0300
Message-Id: <20250621164005.4004-1-hannelotta@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When formatting the dynamic USB device IDs to show to
the user space, instead of scnprintf() function use
sysfs_emit_at(). The functions are equivalent, but
using the latter is recommended as it ensures that
no buffer overruns occur.

Testing the change can be done by assigning new IDs
to the USB driver's sysfs attribute new_id,
and then checking that the same values are returned.

For example:

echo 4533 7515 > /sys/bus/usb/drivers/usbfs/new_id
cat /sys/bus/usb/drivers/usbfs/new_id

The output should match the assigned IDs (4533 7515).

Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---
 drivers/usb/core/driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 460d4dde5994..c3177034b779 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -119,11 +119,11 @@ ssize_t usb_show_dynids(struct usb_dynids *dynids, char *buf)
 	guard(mutex)(&usb_dynids_lock);
 	list_for_each_entry(dynid, &dynids->list, node)
 		if (dynid->id.bInterfaceClass != 0)
-			count += scnprintf(&buf[count], PAGE_SIZE - count, "%04x %04x %02x\n",
+			count += sysfs_emit_at(&buf[count], count, "%04x %04x %02x\n",
 					   dynid->id.idVendor, dynid->id.idProduct,
 					   dynid->id.bInterfaceClass);
 		else
-			count += scnprintf(&buf[count], PAGE_SIZE - count, "%04x %04x\n",
+			count += sysfs_emit_at(&buf[count], count, "%04x %04x\n",
 					   dynid->id.idVendor, dynid->id.idProduct);
 	return count;
 }
-- 
2.39.5

