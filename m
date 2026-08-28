Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A161D241686
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 28 Aug 2026 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929365; cv=none; b=ocL/ZBomPZmq07WQcW2XGGDHBKei/eY/LcI+jNmvIV4d7cVNiQluB399SKespSSEh4jzRIJKx4qG6tNctx9SxKlmlr9NfEsHL/iJiIAK2U6PeqkQEbx5bca+ogOfCVeIRFc/sYJ2gRptvsYlkyx1/eswxOzsnQgxRPAfGUlpm+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929365; c=relaxed/simple;
	bh=3PzgDiqiy1oNIWRe2oB+sNV62Q+Jw0+EhuWagGqurb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gJ3iIUgwu+ZuPKWq0qk+SypP5TbWhCMtXz8IEs1gerSkAatnbOjjMvXAb76yt35eZfTqaPcpqvp2wB6Q6ugysZM/47HjOcbfg3hYOBlDqQCGj4fyt7KNctGxCx5zbsbZyEmxWs83zWSu1Y1jvBXpnHo1qV7+cKxl1FMctMDLVRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZiWhjG1O; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiWhjG1O"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so820172a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 28 Aug 2026 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787929364; x=1788534164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NOOUEhwDmB12LFQNSiGGCOAzSpgGLKnq2vsZHwr0Wgg=;
        b=ZiWhjG1Oi2YJ3PMwIHtSEd49SnkO8rpVUweLoQxPoTu7D4qFGAqyRfkGhL7CU+2rDD
         n0aIHUTACSJFi47nWlawvyNijg1s4xXv3lQUXB31TUr5d9YMf+rvF9bGca5iftbUFfLW
         RpbzNvrlWdHo1cG7V+BO8kj+SVttxQTzDxn1zIi2r8mcIXJwYqgMFJUL8Zwe/s6njutX
         BvtIlU/E8tHbA8MjQJkJDvt6dIEkbsta17qSvvuMSPPJJs4IeXITmeFGaTqs00ecgBLr
         2u5/FVUVWISSJESKCwZYfkfxy3IYmCk0eTVSEYUfPDA3CEaL5T48rgwJrxFIJd7ihvmw
         ZxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787929364; x=1788534164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOOUEhwDmB12LFQNSiGGCOAzSpgGLKnq2vsZHwr0Wgg=;
        b=av6OppEG0yGj52M0uadD31iNW4rQi6UP1RyU3AYFw8YAhO4yEWXm9xCXO978Ufl6eQ
         nBjsU9mzJvIgYjDJM+cEggu3bdetjgJ0VXfV5WnjvfiIq1EKJ96/Klu61AVXx2d0r3PE
         eEWp+DIEMq2y36UEQzi616ICEhINYtQYWLYErf9aE09MC/HHftMwE7lpNTtHf6TJECNf
         5l5bYs6DeJPkzu1274UnbyT1v5Q5yFbU8Es6cO/0lvPOvNKlZV2qJmgOH91pMVVYlNcs
         fadauSMXM7m53tjTPAmCpuVDQvNYRguKQlGiM45eBT+h3h4xrM8QSUnxbh9pIXGka3md
         CIaw==
X-Forwarded-Encrypted: i=1; AHgh+Rp419UZ4I0l9MrfXZ999PoJHbGNg9lOS/nEFioj92UoBAg/dHdI+lIlX2HX7CJgfnp7aQRk1hCkX3kDiDvgnRr709FQyw==@lists.linux.dev
X-Gm-Message-State: AFuF++lplthALLG6g0foD5STmUAKUx7mzvnl8/mn6jQuhm2c9qQXJDYy
	MvIVAh1Hnftn+XOjQUTcD3pFBKltR82qXz/q+gLKvgZrjA+te/KPKbFB
X-Gm-Gg: AR+sD11yK6KJUCtdPym10JN0Q0gysZXxtRE40d+DUohWMopYcY5mY1XLj/YQXfM8fqn
	22RNQncWPZXCKP8RYimO1OCKCYm9wqmZLBlgR5meL/BB1Kdx5ekP0sfUq0IkadeJbacA5w8zOUU
	kvhopwLrI/ILYCbcPnHUoOG6eTNoXsnQwBXzoYmmB+IO8IqMrxa5wMLqtPln044yd6OVcWn2WRW
	M3pQ8IwkwbWGHmDVkBW2YqwtmIEqR4zlZ/KE6HDDprpplEz63lclgflFj/6H5lukgdJ4AG5kr6s
	LbC/JvekxD8eu2kc47cMg2k5YeUTqV0PaOizQTHbPgLMJ1xGFhlt3alN793CZ5d2RgZ7YRaJV5K
	4nZRpVO1xF9q1vgFZ2irQYI1QT9Bklrn8Wa1rgJ7WiG3cYD65iD7OgPWCMgZxU0X+shqLNHeqVO
	727BTCPABUY49D+bHcAS4ssXO7IVkGErFUw7DApABZFIEyeGA9wYDdd+8bu6K6alko4qUlEKHj+
	lfrGY0ROg==
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr17557004a91.4.1787929360339;
        Fri, 28 Aug 2026 08:02:40 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396db196903sm2911068a91.0.2026.08.28.08.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:02:39 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Ridham Khurana <khurana.ridham222@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7915: validate default EEPROM firmware size
Date: Fri, 28 Aug 2026 15:02:22 +0000
Message-ID: <20260828150227.1062217-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt7915_eeprom_load_default() checks that the default EEPROM firmware was
loaded, but not how big it is. It then copies mt7915_eeprom_size() bytes
out of it, which is 3584 on MT7915 and 4096 on MT7916.

If the file is smaller than that, the copy reads past the end of the
firmware buffer. The extra bytes are whatever happens to follow it in
memory, and they end up in the EEPROM buffer that is later used for band
configuration, chainmask and TX power.

Check the size before copying, the same way
mt7996_eeprom_check_or_use_default() already does.

Fixes: bbc1d4154ec1 ("mt76: mt7915: add default calibrated data support")
Cc: stable@vger.kernel.org
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Based on next-20260828; applies cleanly to v7.2.

 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index fe7b29ebc0bf..145d14a1012d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -111,6 +111,12 @@ mt7915_eeprom_load_default(struct mt7915_dev *dev)
 		goto out;
 	}
 
+	if (fw->size < mt7915_eeprom_size(dev)) {
+		dev_err(dev->mt76.dev, "Invalid default bin size\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
 	memcpy(eeprom, fw->data, mt7915_eeprom_size(dev));
 	dev->flash_mode = true;
 
-- 
2.47.3

