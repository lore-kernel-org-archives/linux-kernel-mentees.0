Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD50839F191
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Oct 2026 23:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792281459; cv=none; b=qKPK7L6s/k4GQxol1Heb8kGl4p+7DzNofGqH/MA/sCDkJl1mdY72nj7EqJ+o3NF2kY436Kozj87+Buz+X2d2ODS9m55QdyY/NfRpiHQ3ZySFe3nILYqJVzFzX6ON5OCLVhLacpjIJ3EOyq301GvwK/SLXmOLdgz/PBNqzVevpps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792281459; c=relaxed/simple;
	bh=o2NBSx/FDXqBMksdU/mUlTzX6/bzw8/craKKvdkqRIE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mlAvV5Jy6ymzTmOY8KDJFBrMvlxmrGCEsCu8h6T+ObzESBvCf7+27yzIwiSdJYDmrHc6D09xX0Zclqfd7pVubPVDVexT9MDl1A/iHKNz9IN310JEjkL23Qr6ZswU/OhpKlXpTUNeZ7/5snOPHR5YftblI9qUEIw5WfVSKHb/dd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IW3syYmK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IW3syYmK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so9999205e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Oct 2026 16:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792281456; x=1792886256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pex06CPzZvFqO9bOYfRUEtlWF/y2fI6jKIVDllT5g/E=;
        b=IW3syYmK6B4Goal6k7DmZkfIXD0+ns8uD0yO+jPTp52xAx0pRcM4XEvpejrBY3q4fm
         jTe8gGz679x5V6QxH8HkXQXmqoHZTKnT07PCw7GSIupBNEUwxNp82FPJm321PjUgXAMT
         wUynQYDQXRq18CQ7s+N7L4Z97hXKGOhUtbfNhRwiR/0/RlYZoIQ+BDc7iM9R2uNn4hSy
         Q4MiKHPDmj6YsksFyT0hlVri0dUE0ZxnXbjhyqKipXfJfWh/pe/1c+FvgkLeadqW63q1
         j50T7wn0Ris83av+KhPtdOaKIvCXjX7FnUotC/j2oJ/t15iDoqLFUOeceUqNSpLwjYGc
         gC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792281456; x=1792886256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pex06CPzZvFqO9bOYfRUEtlWF/y2fI6jKIVDllT5g/E=;
        b=n68yEi40tE0AhU/NuUsoFlCEDRy/pPt0fkp8jhsFU5B7UMUsJ/aj34IfZ2mwRsawWB
         95IetrbbMV2o754A42Z8/7eu6WUqq1u3YzRIH88yTK/aSs3vEOHc7vp3NNXxwIhEA50K
         x0LEtlt7xYxPd8eyxg6sS5NELQVWtpxhrFsWfgX/a0jUnmYUFKCrZtxCgw2s8CRmvhOF
         Y0uYxL60wYeAV2k4uxCGnVv91UO4lT07BKsFiV97h/YMGjj82lVnXBwqIT4kc5QP8pyT
         7+AmqtqDGBCP6EWgj4JhEX3hULEeajDVoCJZdsyT81WhpRfeZxTjU8D6BakoOofwrqo9
         xAag==
X-Forwarded-Encrypted: i=1; AKwUvBySRBNFvwq/i6u4dr2tlqxHnmXTm4QHeac1Rq44RD+ez5s5Oy22+rO3zT0uIzbQfIV/FeazMbpJHgEjDBrgP2SM5nu6/g==@lists.linux.dev
X-Gm-Message-State: AFq9FYIseOxSxQaV/bjL5ytYw+MzDIIgi9vePtkJy9idPbttXHm8KKfW
	y9mwv1HjQhERAWWYZWQSM3o2fR/u/DOhD7uPioOKMOaLl8UCySUEhxvR0AQTHhCIS8s=
X-Gm-Gg: AYBFou0xD/grvaPxxu+cj88QldVVFDMKbxHBfJys5VO5lp34Q4GVG7M6gJwwUR9vXKg
	eKI4/yR+Ga6uTD4yoq8x96FnIyHM5KvVGOHED8+A7O1za5DXphD4813qrGJr+JDeo3eLQahf4UO
	JGmKwvJPWmpwej1npBiXme0m9RRdohyEjAMdsKt86KLIM5ALxYKt4/9zaM3FyMb/GQxyANqrbdn
	kk4zn2PPwAg83IiNpoYZWVajpIm3LKf7GqrFOzAeEaIWc9tChWxtSl2A+GaANfo746QK8X7vflu
	RkrYbJDGEVcYFQkyEOYxBcF/MVffgOidV+Ka7PidBtU6LoMu04E2rc8Hzi0grf/TebLiaa5eeyw
	y2L+wtx1JC0pXtwwWcGBZTB9rJKArYi1qz5XhwdAQwDY2TU+RQq+FIDQ92s09cg+py+358J8oHY
	mMoCUqUypyVD+ch20mKRXvdUolvosjo+e4bqGMJRECzA+3CVxlw5Yl8/TkVqMIdtkFwvQZ60+aD
	durBIzPPPJOho5CdpbAz1VZnLHwsyU1sxbiQvLducRHrYIkmzTbcmN8Z3Vwml2SVZ2y
X-Received: by 2002:a05:600c:8219:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a1d76031bfmr80634935e9.20.1792281455606;
        Sat, 17 Oct 2026 16:57:35 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf05009csm139331075e9.10.2026.10.17.16.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 16:57:35 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: joern@lazybastard.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	stable@vger.kernel.org,
	syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com
Subject: [PATCH] mtd: phram: fix name leak when phram_setup() fails
Date: Sun, 18 Oct 2026 00:57:33 +0100
Message-Id: <20261017235733.14667-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

parse_err() is a macro that prints the message and then does "return 1".
phram_setup() still uses it after parse_name() has allocated the device
name, with a "goto error" right after each call. That goto is never
reached, so the kfree(name) under the error label never runs and the
name leaks every time one of these checks fails.

syzbot hit this by writing "p0,0x8000000000000000,0" to
/sys/module/phram/parameters/phram. The zero length fails the
erasesize/len check and the "p0" string is leaked.

Use pr_err() for these five messages so we really jump to the error
label and free the name. This also means the real error code goes back
to the caller instead of 1, which sysfs returned to userspace as if one
byte had been written.

Fixes: 49c64df88057 ("mtd: phram: fix a double free issue in error path")
Cc: stable@vger.kernel.org
Reported-by: syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c9d8bc9f8ccc03799e1f
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/mtd/devices/phram.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..7aed57b31967 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -289,34 +289,34 @@ static int phram_setup(const char *val)
 
 	ret = parse_num64(&start, token[1]);
 	if (ret) {
-		parse_err("illegal start address\n");
+		pr_err("illegal start address\n");
 		goto error;
 	}
 
 	ret = parse_num64(&len, token[2]);
 	if (ret) {
-		parse_err("illegal device length\n");
+		pr_err("illegal device length\n");
 		goto error;
 	}
 
 	if (token[3]) {
 		ret = parse_num64(&erasesize, token[3]);
 		if (ret) {
-			parse_err("illegal erasesize\n");
+			pr_err("illegal erasesize\n");
 			goto error;
 		}
 	}
 
 	if (len == 0 || erasesize == 0 || erasesize > len
 	    || erasesize > UINT_MAX) {
-		parse_err("illegal erasesize or len\n");
+		pr_err("illegal erasesize or len\n");
 		ret = -EINVAL;
 		goto error;
 	}
 
 	div_u64_rem(len, (uint32_t)erasesize, &rem);
 	if (rem) {
-		parse_err("len is not multiple of erasesize\n");
+		pr_err("len is not multiple of erasesize\n");
 		ret = -EINVAL;
 		goto error;
 	}
-- 
2.34.1

