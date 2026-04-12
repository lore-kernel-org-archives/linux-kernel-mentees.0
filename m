Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BAF4503B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Apr 2026 14:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776005208; cv=none; b=PxMhLhZkz5WROw4Bw4DIPBXixcrjPj+T1BXY9n3nxtxude41AstPm7i/UokKV2zqwEoI9aBFf0koIhW2wb4+aJFRsJdWYRhDoW66Bb82u54sOef/MIqR4PVNF/aRzPuKLc/pmPhHMb8bnQtcuUI5lyGobSdQPLlzSLEsYfGkU44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776005208; c=relaxed/simple;
	bh=3iWQYpa4v/976oSNv3UVleyySQonyVZzxNwcwTPUUGg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O8ZRq4pXVlmBQNfVuaeoyDXQ3NGjFVbMVLc0M+FIy/OHOxCDPKVH3atBN5ob0tq4BmrZ/dk6A9i+PWt4vbMUl5o6thf8rS0OMZO2/QRKjt1XGKwjS2sqjQ0OxrkK+zOBfSBdOIB+9BpW27F8AZ1JmloMB6bLhdT+Adp5M+KjJXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxIMkWxZ; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxIMkWxZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB73260C1E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Apr 2026 14:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BlZyZ8ViD8yK for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Apr 2026 14:46:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=mahad.ibrahim.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D260C60BF0
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D260C60BF0
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UxIMkWxZ
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D260C60BF0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Apr 2026 14:46:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d03db7f87so2275261f8f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Apr 2026 07:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776005204; x=1776610004; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bBPvbkrYp9W7ICoOlah1q6oHXqyE/KvHmdfXYMP2BrU=;
        b=UxIMkWxZLO/335GujHNckWjMdK65htEz8vmr5dZ5JI/ujvGN+jaUkXdB3nW2j2v03p
         iJqP0L3JoStFMCn4HTjXYblekI3YMd6iCBVoNBECzM9r1XXS2nTzCV+zxBrDDWZKCj91
         n2g9/qNrVU8ghJ+bItvej/7EnNvXHuWoFgZ2Z8UlE+qFFQ13TADq8OI1GCvTIsIR0LEK
         slLy14U3fYtvxDm6eA1zC8NF4yUWD5DSylvxpPNhbOJHhciMYW1rqUSiWsE4dFM5XCt7
         VQYgP2XOquz7pZOkZlm/b75Juu4DszHuzlhBAA3oMRvBgwrb85EoY3+YH4d13AYw1zUE
         CS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776005204; x=1776610004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBPvbkrYp9W7ICoOlah1q6oHXqyE/KvHmdfXYMP2BrU=;
        b=TDxgLHxieXRsSORi3Kjirxq0p9vD9iHjp32ozqtoTJXLJjgjv+QEpUNPqTSsZAlBwM
         SW/n8x9Py5eU9CzWVtR2+f0yW9QcPVrtjDk6o1EyD6czAaPadRFkdVLUQALiQcLUsi9q
         Af5DXIakuSNC1973utylnBZlAumIPdr1mCsBCt8D9m7GQNY0F965Mf5mKPt/heU3rSMB
         oTpm5Gdz9BmDMQlsyJgufzFcP7KyjWShmJSzECRvb1qYcnF4k6YGphKdpxeCfilf+6q6
         kXKuh8sJmGJwu8XeWN022Uc4yrHwb744V0LryB7jIlICaGqGKLIkJM8mTdgdRADwQCdq
         0Img==
X-Forwarded-Encrypted: i=1; AFNElJ8W22rkR+RRFPE1plie9ebpy2VAYgigNy+DwvS2pLIXpTNqwwhn/ZEItkdb36m2HniZ9Gik+J6VtNcyJL3gc5aBlum94Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwHJ9I1Ogx5SLnxt12+SgSZPeWsmKz/F0BqACXZ8IB56hUmyFvs
	RKkRQVYlrFz+E2oIs5h/ryWEWIyf8g20D+Apn89BbOAajpjg2mgrdV83
X-Gm-Gg: AeBDiesizARWB4bwmiSQbMCsCu8HbHKHev9AUo/BT7aecu8EFwL5JnIv7PFkDyjwPwS
	0YclyrJaubkklF0wNhZrzFzIaz1qO0PuBQAjtrSX+UZNDqhZ7cG4Jz2JgRTjgoKHl8QI/5lqCyt
	Y/yK3yQEsbUIKindcbTCsJ3Z5HwScZ76mCsA8PLlVVPTotVBEVrgAusv16yyb9l0uXBRG8+Q9vN
	BXrTqCoD2vyKV0dCPAbv3HM/emjQcZ/yMLkkYVJiNBYyALob8kHXoJOo08ZcmG+HjKfFJVAwG2b
	6qKcgurh6sTQI9CttJiQrowYbK8PpZvPKMTGVrprTPg9j+P1qXI9Ndh7NFb5vUH0A2Y+vNXH1IQ
	mFibNRSBdwkuptlUuWCjDehErl+3+n2Hqx02ulAc+R0IvLxf/MzDJfO9UMDgOGsYpm8Du94rhJ7
	3G0Nddu8QKY3tpONbNxjH9hJzaxQCQoZtHwb70dD1q3KQB8UoDQw==
X-Received: by 2002:a05:6000:2489:b0:43d:77c6:be6d with SMTP id ffacd0b85a97d-43d77c6c43bmr1268704f8f.7.1776005203537;
        Sun, 12 Apr 2026 07:46:43 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5ccdasm26622541f8f.34.2026.04.12.07.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 07:46:43 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH] staging: fbtft: Use %pe format specifier for error pointers
Date: Sun, 12 Apr 2026 10:45:52 -0400
Message-Id: <20260412144552.18493-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The %pe format specifier resolves error pointers to their symbolic
representation. Previously %ld with PTR_ERR() was being used, %pe is a
better alternative.

Fixes the following coccinelle warnings reported by coccicheck:
WARNING: Consider using %pe to print PTR_ERR()

Testing: I do not own the hardware, therefore I could not perform
hardware testing. Compile tested only.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/staging/fbtft/fb_ssd1351.c | 3 +--
 drivers/staging/fbtft/fbtft-core.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index 6736b09b2f45..15524b80035a 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -218,8 +218,7 @@ static void register_onboard_backlight(struct fbtft_par *par)
 				       &bl_props);
 	if (IS_ERR(bd)) {
 		dev_err(par->info->device,
-			"cannot register backlight device (%ld)\n",
-			PTR_ERR(bd));
+			"cannot register backlight device (%pe)\n", bd);
 		return;
 	}
 	par->info->bl_dev = bd;
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index f427c0914907..823315dfbf5d 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -187,8 +187,7 @@ void fbtft_register_backlight(struct fbtft_par *par)
 				       &fbtft_bl_ops, &bl_props);
 	if (IS_ERR(bd)) {
 		dev_err(par->info->device,
-			"cannot register backlight device (%ld)\n",
-			PTR_ERR(bd));
+			"cannot register backlight device (%pe)\n", bd);
 		return;
 	}
 	par->info->bl_dev = bd;
-- 
2.39.5

