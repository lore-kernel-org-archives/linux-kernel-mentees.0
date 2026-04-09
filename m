Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D8D3B2FC7
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Apr 2026 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742689; cv=none; b=aznzt2TLucvDG9ixQb0zYxW0BycwPxe+O8b7ugPS4q6Mj+dPt6XzUuAQxJflnBsEHNQLYRFRLBvr9kihzetzBiVCpEOP5R5Lr19zhgvakd9aRQoB0dbVI5bO9APASeOvoLZFTAQKdPV1GD4D2fY+WeHVx3oLdhqVTShqo7ASt4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742689; c=relaxed/simple;
	bh=cgZY4JYcYNuxKFJSK6ipW5wyPi1mPE0bqbjnMORWqN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lKsaaVW8ITdmHBw7oxsAkvXvSO3erUAazqakdUdAAB91v+c/ghVOpmpOxVhCU6iqwiMvEZHtu8t/GFPY31qqcvBx5YJGmd8sSREWDuU2zU3ZD6UuzMIePyTxlbPWH9U/75wjniYn+G4jcF2K0kR5OWA0zdxiMWbAyRTAC5BgH7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEYXdOFz; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEYXdOFz"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ad617d5b80so6509555ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 09 Apr 2026 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775742687; x=1776347487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmjALA6V37PHOvR1b73ZH9/lB8Vpxb+o5ifXzvgJEJI=;
        b=HEYXdOFzFCA48JGrxgY6EZzUCeJlOaP+PHoTE0/Ny0yNM9YZkqSvSZvFhYwKFBG8Hh
         qCwsFBnEx1LmGK6KBuuAazF9zMSKGarC5Pg2E4NV00X5kmlF0XFSuJs6Qb2gaSwWJ/+/
         BnjQfs3xQhb+WE5rKV6UE73b+Szu/j9RD9Qu1A25xPFPR04pGcODF4D41pC3E1N65KKb
         vRXO7Z+uLJy+1vcsjKt2rZSv3minaftCfM35RTJoRoJXB6uv5zksEuYKgLzcTtHxI3oO
         I7sWLt2vjaQ3VAQKrLhIbkcyqki0A5pMHRBZAhKcSGMo761UZ8apIZqxby3K+k0rVc06
         1PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742687; x=1776347487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pmjALA6V37PHOvR1b73ZH9/lB8Vpxb+o5ifXzvgJEJI=;
        b=pDNJvMx1vS6jfP/gV2NUa+6x9Pv51TTHhDgEY80TPDEtDpduH0by0VGDZDx3hB0ygd
         gVjgS0gLbZo3k71OyJz/2DSnc9rJqIsfMgqVsf5heK0H4iw5sgfM/b2Y+fzL31rxF9Qr
         HvkDfiitZ29wl0zwnScqjx5tmDPqr7WW/LxzYC8eGiquI9kTcCCVEWXnXvaM4PnDS6cr
         lgwoIrEfmHjlMzHoH85T6g55gl4s8sB+RvaQJj0zixSYvP1zejUB+5I0J0INwPX9WiWB
         Qyr+EzFA2sprNinyAikYs/Sy6xJbn2bVWPjJa/YHMqAqLjC32blLN22a0g+sQdAuH0OR
         Fxmg==
X-Forwarded-Encrypted: i=1; AJvYcCVMJp9jClrklRF7VaaFaUY4mUg9g3B68j+zqGO2ykVVYpWaW4QsROWTlY67b5Ajw6g2p31RWwTWtqL0fLdX6JXaC1m0Tg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYuBl9Znk9l+SYpDc/+94aeTW0lrNoTMVpRmMnIoGePtIK1pwT
	jRLeUjO0Zi1zHqProX0A1F3I9ziNdTf+2oWYSAiRjoHSx4Z0/vP8Zp0c
X-Gm-Gg: AeBDiesBy9qBZJFqpoXPj9Loe71fz82gFRsGOQ9RJAWbdbcI1gcuTuOEPM7BQU4pT3O
	pGwIypRQdXi0w9kiSYZ35oie41IBgKgYBKjO/A2n7j/jq1eyUeDCyeoG6Z9QkEsltg/I6VLeqA0
	6SX/BUJHlA+jCKBxKYq53wv3GignLCfYeY02Y+vMGTCGkennCYDpX0fGTa7C4f9u3K8lumtutfd
	faNvVz0pxWAyGca1+7RTPsNP/xP2ik7Dz+Ll87fMUKmR+c9gF1wBkmBmcpqAppO39icK9BMY6J+
	A0Ps3TzT+ed9xvewT4DHzRVw30DsIPPpoh4zaRcFPWpIn65DdJF+JbCvaI/WjQIRLSN7vj5jxWo
	b74eAULcM+g6HCT3SP5mw6uIYjNoqoG4FgcKg7gxhZpzWkfEAhNGZWz4kfv7m6FutNcSvYyynkV
	0+2VE0CeVseP6vuRQtAbbwH60VfLgNq/dFJ3j54R5/oV78xk9vWTM=
X-Received: by 2002:a17:903:2ed0:b0:2b2:5091:1c26 with SMTP id d9443c01a7336-2b2816d8626mr286574105ad.22.1775742686802;
        Thu, 09 Apr 2026 06:51:26 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478945asm315288855ad.28.2026.04.09.06.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:51:26 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	tmimiharoen@gmail.com,
	filippo.muschera@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	rayfraytech@gmail.com,
	david@cardinalsystem.net,
	weibu@redadmin.org,
	dharanitharan725@gmail.com,
	ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	luka.gejak@linux.dev,
	khushalchitturi@gmail.com,
	suunj1331@gmail.com,
	s9430939@naver.com,
	nikolayof23@gmail.com,
	bryant.boatright@proton.me,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [PATCH v4 3/5] staging: rtl8723bs: simplify boolean return in IsFrameTypeCtrl()
Date: Thu,  9 Apr 2026 19:20:24 +0530
Message-Id: <20260409135026.137904-4-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409135026.137904-1-activprithvi@gmail.com>
References: <20260409135026.137904-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the simple if-else statement which checked value of
GetFrameType(pframe), if equal to WIFI_CTRL_TYPE, function
IsFrameTypeCtrl() returned true else false, with a single return
statement returning true only if GetFrameType(pframe) == WIFI_CTRL_TYPE
otherwise returns false.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/include/wifi.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 230b2c4ffd3b..2876f15f13d1 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -275,10 +275,7 @@ static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 
 static inline int IsFrameTypeCtrl(unsigned char *pframe)
 {
-	if (WIFI_CTRL_TYPE == GetFrameType(pframe))
-		return true;
-	else
-		return false;
+	return GetFrameType(pframe) == WIFI_CTRL_TYPE;
 }
 /*-----------------------------------------------------------------------------
 			Below is for the security related definition
-- 
2.34.1

