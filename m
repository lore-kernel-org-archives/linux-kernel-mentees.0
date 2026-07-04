Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9738E34EEF7
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  4 Jul 2026 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783166009; cv=none; b=IniHZOV64Zxv5hteWFY6vg+E2EZRFdSM4EhdSzvHUmxnkw3F+FVYIAXNIUURnakMhxfgyXz+K7cVPh3TDF60ial0wHiYo4J5HEV0KpXCilPY51GxEUGljI1oV1k3j9lSjIl5S/4ro9lDDE/Pr1SjfQLaJy+bhlkFpD7Bj5stWFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783166009; c=relaxed/simple;
	bh=ai4jZCdbrJPe7EUiAYRqiOCk3jA6QZQXOwe8vdOoInE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLlDY3RYH22I3bFLuBd6uWQApyob08D/2kiKFzn6kNgHUVtelKB0iUoSyEtjCfzDfV3mCTqDoe0W4r1z+DLkNzikfY84bbYDFtgyEsxg5lcXqpfjh07JBztpWLms3ZSkSzdl/MpR0hvZrcBYe1TT7AepzpGHSO9X2Rh0gbaDc8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svmoHzo6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svmoHzo6"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ca11143dbbso10177915ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 04 Jul 2026 04:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783166008; x=1783770808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsxMTdTxaGyKiRcEKAGvLn+sq4FSJrsqhtc2CDzMcoo=;
        b=svmoHzo6uucElSKGazOGupaCBrqC8Wz65BOst3Ola10ydoDjl+YGVxGDM0TZxFvXNl
         OCeTSfiXXCsvi7E3px3dis6KM15YTy94GaJRgB04+gsIwrDU+lTzlkVNxbZiK7Iyuwgt
         62/vjkGBAUfH3iyHYn9RKvjhBR8crHPJHDmC6kXSxYIuw13IaSEWmMMk2mBPYhhjIx/A
         41xmDg8zwjPTujbSINNG564KoESgIqno73ogJoahtcSbv07WWxgckL2ZilvI6Z9ckuTh
         PYT/KabODAH79BaC/dIiTewusAkzojne6jwVd3ZtX3TiOag/TSShfQDzXYnQyG5slCea
         vGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783166008; x=1783770808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UsxMTdTxaGyKiRcEKAGvLn+sq4FSJrsqhtc2CDzMcoo=;
        b=CLMW3dJ55pN1Wk8BHUh48cWojiirMhTrdEthKK8DlO5YANdT6LoRGjEG2LfYJgJk8W
         tu2P3tiYQGI5gZ569oXLW7ChyQT/tcvOaYmWIrYjGW5aKyDMV3ahEv4zrciJdeurwLzq
         wSM3p/Cmq/dguqPBdHeSKkamOeQqR314O69dTPS4dOVK7iOKzhH5eljXfB5E+67kWsPf
         KCtlVK5aFUlpshUMBAjRkmXGZvVqt2ymr8bwBlnCBcHXzvdlUT3Vt7tYY4PEYi9MSy2u
         2jneW1N/qA7/SScz7CmcoiM3QyoW74B4iSwuCIE2AgnUsN5+r6StyheDJMW/TgHu4MFC
         8U3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Ek+gEaHHKyOUptaqJvjufTdltlxeHFs7vtgoN3O4yBp4EXVrqogbmOadpK1TCFRvIlPSQHWUcicsyA45+lk//4pnxkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWryEYSq0dDixTTGfDnZtxal/epIqJaeqG+fybfBd23vIx1g5C
	4P4z3nIohuoXHdVboKX6wDpaD6rsmQNXFyCP+MCX6YvJzwQ6XshrC0VE
X-Gm-Gg: AfdE7cmP03GUrW9ZMyUTiUO/dLVQLsGxmOusbI8t0ksdFXJdv49iScyY7ftviCOyfN+
	61Urpi//SHGkvDH5bNRvaxao/T4yjBO9s1NTFvhXulRcZfqw/a05Qz8mFKxW+DPtqpHnXVgkYqp
	DqtRrI8lyqTA9AqcQTfQuKb090uIqc/X3nTyBqECDLaP6YVkhdAIYAKqas/vnrT8Khc+AbfLVl8
	GDBP45gIkq+x9Ba5nJm2K9QmbD/XT3GJsstcU7vzUTWnvknlFkE1TVXigdmuzREcw/ui2r4nXLj
	sH9fzpOqxi/4F5Mop19oZivHq4fNs3e1TVlYV60SfTHMomzCOxAT46NaTFYSs7v1Z0Tj+k2luT2
	hPQitxJkBflYwqusHzOf/2R6g5DGA51BdzF6gQBFtPhWMvkt9Z8wUtv3aXwZCBm2x29CeiA/1Re
	qb5nkerwxi+ft+Nr1+f5LIYenPmvBKVyr+/yHfWRkacg==
X-Received: by 2002:a05:6a21:6e48:b0:3bf:6c04:a816 with SMTP id adf61e73a8af0-3c03e4da45cmr3219460637.55.1783166007775;
        Sat, 04 Jul 2026 04:53:27 -0700 (PDT)
Received: from primary ([223.181.23.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85bde6sm49580285c88.9.2026.07.04.04.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 04:53:27 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH v2] iio: light: al3010: fix incorrect scale for the highest gain range
Date: Sat,  4 Jul 2026 17:22:45 +0530
Message-ID: <20260704115245.11167-1-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702052913.114130-1-vidhu.linux@gmail.com>
References: <20260702052913.114130-1-vidhu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

al3010_scales[] encodes the highest gain range as {0, 1187200}.
For IIO_VAL_INT_PLUS_MICRO, the fractional part must be less than
1000000, so the scale 1.1872 should instead be represented as
{ 1, 187200 }.

Since write_raw() compares the value from userspace against this
table, writing the advertised 1.1872 scale never matches the malformed
entry and returns -EINVAL. As a result, the highest gain range cannot
be selected. Reading the scale in that state also reports the malformed
value.

Fixes: c36b5195ab70 ("iio: light: add Dyna-Image AL3010 driver")
Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
v2:
- Remove trailing whitespace in commit message and Add trailing comma after last array element (Andy)
- Use IIO preferred brace spacing (Jonathan)

 drivers/iio/light/al3010.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/al3010.c b/drivers/iio/light/al3010.c
index d603b4a6b8e8..ca1d7fd6defb 100644
--- a/drivers/iio/light/al3010.c
+++ b/drivers/iio/light/al3010.c
@@ -42,7 +42,7 @@ enum al3xxxx_range {
 };
 
 static const int al3010_scales[][2] = {
-	{0, 1187200}, {0, 296800}, {0, 74200}, {0, 18600}
+	{ 1, 187200 }, { 0, 296800 }, { 0, 74200 }, { 0, 18600 },
 };
 
 static const struct regmap_config al3010_regmap_config = {
-- 
2.53.0

