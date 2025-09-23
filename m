Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC7C2E2665
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Sep 2025 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758643605; cv=none; b=trD0RZPdPvKu1sAIMjxeqF/6/zp1WfshhHybFalQqqd0wfFC5pv9TJUIq8UbD8So++f7AySRGLQ8KA9vVz39NXH/tGUC74GoOwmLdgZ+Qx1heBKDWzkRqGgg28u686iz3k4kop8u3Q0tzby7M7MBLXnXayNw26iVDOejpqBgmws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758643605; c=relaxed/simple;
	bh=yRZBREAJTaU8sSOhttVeLwSntMyFmzNWX36Gn0HWzTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UrqriRe03DpWB2yqfpGaL3fXyV3NdPrW+KecpMeJGKIxpFktJNl1jAm/D61CCG14z6Dn6w55IcLWGgQkS28EU+mF6yiNLjdkPHuY2pjMJeP5veJ2Rql5hU7Rnc/VsObk0l5832xY2hMcJFeFw1qflhrz06DZx8bJh6EmDlzQ/oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cno4h15m; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cno4h15m"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b551350adfaso4589409a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Sep 2025 09:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758643603; x=1759248403; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t309JLGTHyrQ93SF2bmZLkppAVP5+5xihRdA8pDsPLU=;
        b=Cno4h15mw1eIhpM4Iuw8Ktyqmq+n+xDCBqtOxrzS7b5AqQ5t2vejitaGq4ziRytQiC
         M3gUdLN7OSiM+0cBr5I60sOQj/5LfbJLKxmv61+3fN0yN6VCox863A95TghUOVsgP7me
         w5jDR++C82W3yMtZW712HUqXXqAKp9eotVvcyYhR6PNdwayPuzAAnZrcR9gapVk26t/K
         cTrrQf2UQHpT8aJ6o4cynD1UKLVQgBOtASSrxlsK6Feh27IXS6c4iEkjQf29mrWSlXFh
         KYIkcBK/1BbjuohkYogsJcF9M/LOUKU02HtiQAfAXZ0sFmOpsRrDF7v4rrCFLtD29J/I
         g/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758643603; x=1759248403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t309JLGTHyrQ93SF2bmZLkppAVP5+5xihRdA8pDsPLU=;
        b=kR0rkZlHLVihchIErOcXsbnkzoFfAoeaEQ1zZ39ewKalenTQ0ZWDH9JqLZWanrQJmh
         WXoTXat1DP3p+u9Qxok/YqlSSpZumH/QAAOvAVU+9X8yj2pEQY8v57aDUgS/0vOyVwsh
         h5V0J/0rLyraFM1zP9hpmzcc11HvIR3hehbg76u1mzkiFfC3BripmUFlBQn4B7ZFWhfY
         y6XMRezPgBsB4LCwGKbpcQYz6pEDBk4SFocghgjOsNbWWlEGCQpDOBwuF6b5XFx/Zrdo
         9Pp7t0AjPjRMKKPjR4w5WCNo37Fzyv361BjjFwaxBJZZ9cYNAhFG5KJQ6nUpWko+AIE1
         poLA==
X-Forwarded-Encrypted: i=1; AJvYcCVeS8tR0ddmBbHGlBF6YMzgkvws9ndbEMR8VLtRSreMS+5RrwBvCOW8PQQpX3qETVVCVRuz7SZAWjoWu6bgkVDRVWWL2A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yydn5qM4Q0QeHROiNSsJ1ecY/zMLzHSqsi/fwhNBEj8mjycpakC
	m9tys/C9U8SGL1ISkzvfHTlRE+nuchZ/Odg5iarVi9zn5nuQ0c82Nx3I
X-Gm-Gg: ASbGncsnH8MY8HKGIwyUDq/nIbTP/LmVUTx8OaGW1tv/i2bICqa2r5v/fC1Ov8J9u3q
	PhCc6k2U2E2qcYCKnIcKv403pblmjAmr6/2IUYzlTXWZSvaTR8Q9ZsCIbI+FZEPnPDLfw8kkpwF
	xgPIG6QuCbEY2yxJplpchZ0xrG8bjWzGZhB3sSocsCsVYjD4lVMANBc3VMOZJPH0/AESibIggk2
	MqLb1eHvx11JlI5WOqOS6i9pKlResdckua3qaOVGl2ZFXktZkKXqhpj/wrj/3Qp9/1Vpd3/U1Xz
	d2s0raeO0TOrOkKirH4LS9DKlYF5/h/VSD40TJ07GenptK2OYowaN8+Wxq53oWtId9WF6CuRY+h
	Kp0bxqq1lBHS04iqWIrs3l5zt9ANYmadREUiDNz1RJBkdH+gc/+rX7kVKdDYhakPlM/PtHsRaS9
	fQIr24cmvqcaJ9
X-Google-Smtp-Source: AGHT+IFkkB+3aFbUYjMbYAr5CaGup6768qgAaVamVl9anvKViE9FgNGhY1HvWcu+9yfaeLkmeqZekw==
X-Received: by 2002:a17:903:2b10:b0:271:49f:eaf5 with SMTP id d9443c01a7336-27cc696e9efmr39277455ad.30.1758643603090;
        Tue, 23 Sep 2025 09:06:43 -0700 (PDT)
Received: from debian.domain.name ([223.181.105.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802df8aesm167167395ad.89.2025.09.23.09.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 09:06:42 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	I Viswanath <viswanathiyyappan@gmail.com>,
	syzbot+94d20db923b9f51be0df@syzkaller.appspotmail.com
Subject: [RFC PATCH net v2] ptp: Add a hard upper bound on max_vclocks
Date: Tue, 23 Sep 2025 21:36:22 +0530
Message-ID: <20250923160622.8096-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported WARNING in max_vclocks_store.

This occurs when the argument max is too large for kcalloc to handle.

Extend the guard to guard against values that are too large for
kcalloc

What would be a reasonable value for PTP_MAX_VCLOCKS_LIMIT?

KMALLOC_MAX_SIZE/(sizeof(int)) is the absolute max value for which the 
memory allocation wouldn't fail

Reported-by: syzbot+94d20db923b9f51be0df@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=94d20db923b9f51be0df
Tested-by: syzbot+94d20db923b9f51be0df@syzkaller.appspotmail.com
Fixes: 73f37068d540 ("ptp: support ptp physical/virtual clocks conversion")
Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
v1:
Link: https://lore.kernel.org/linux-mm/20250922170357.148588-1-viswanathiyyappan@gmail.com/T/#u

v2:
- Moved the validation to max_vclocks_store

 drivers/ptp/ptp_private.h | 1 +
 drivers/ptp/ptp_sysfs.c   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_private.h b/drivers/ptp/ptp_private.h
index b352df4cd3f9..f329263f33aa 100644
--- a/drivers/ptp/ptp_private.h
+++ b/drivers/ptp/ptp_private.h
@@ -22,6 +22,7 @@
 #define PTP_MAX_TIMESTAMPS 128
 #define PTP_BUF_TIMESTAMPS 30
 #define PTP_DEFAULT_MAX_VCLOCKS 20
+#define PTP_MAX_VCLOCKS_LIMIT (KMALLOC_MAX_SIZE/(sizeof(int)))
 #define PTP_MAX_CHANNELS 2048
 
 enum {
diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index 6b1b8f57cd95..200eaf500696 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -284,7 +284,7 @@ static ssize_t max_vclocks_store(struct device *dev,
 	size_t size;
 	u32 max;
 
-	if (kstrtou32(buf, 0, &max) || max == 0)
+	if (kstrtou32(buf, 0, &max) || max == 0 || max > PTP_MAX_VCLOCKS_LIMIT)
 		return -EINVAL;
 
 	if (max == ptp->max_vclocks)
-- 
2.47.3

