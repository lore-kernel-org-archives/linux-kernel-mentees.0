Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958FF33B6C6
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  5 Apr 2026 11:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775389491; cv=none; b=jWkY4GIzNOA6I77V5z8gHy6mbYiJ/hqJu9zvldcehm2OXAwquMXlBkhj8UW3Y42bpWv2m5Rf6xXjYSAn066v0/6/nOIQNwaalnyjLVlE2vi2gjZO/ChIp7lkAopXA6AH2HZqQojAPh28h7HHEfyAT0QLZzfYuoL3BI/WRG+LZwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775389491; c=relaxed/simple;
	bh=1m7QPUYyyVMa0S0thNYyhEYXYa7ZhsPM8QCoJd/VMAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lhiX6RhdTXfxhgmnj3OZjKIpDt1Ml0uTgDj4/EoPch8IrMyw0QjVB7EWCTSZ252Up4ZLw/02FK4fvJFKiw4Mjjxnr2sIMHxdmlfqLSTRYnZEqf9H/Y+gnFZcKY5pPPbNF77o3m3VXGZty1JSv/27kZNxL0mIZI8JaI33zv3nJtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxZK+ic0; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxZK+ic0"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82418b0178cso1376359b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 05 Apr 2026 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775389490; x=1775994290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxgKFMZZZoL6ZZqn5H0A6fG5fvPlDWbVb7/SYgGKcGI=;
        b=gxZK+ic0VsGsav0Epn10W8nn5tUiaIdlHFYaGyR7jenlHpjkzAjkHgzak93W7YGbqk
         eIrKykXUatiZu2zchW5BcLf9/jNGTSgi2KL3LQt7qeOVPCentz8dsEWurzID65ItLQg7
         mFKRP3YwM+KWf7fZhbEKGqEI0xCCwpQ3tVWBh61/jVpVElUhU0ts92e+9r9SYzffW4m/
         OuR63DcVB4ZAVUvlI6VAcIOqBG9cjHzoz7mmVExEZwN8d7l7nUuwFssexwqX1JMzH8hB
         pzJcHfp9lGTxPYxIut3lHJM8vfnOZ/ttyzmVrtxKtKDvIaLVE9Su25x3eotFfJTLK8h5
         rtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775389490; x=1775994290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wxgKFMZZZoL6ZZqn5H0A6fG5fvPlDWbVb7/SYgGKcGI=;
        b=E7Z98xJSjJctbx8EvJ5LyZGwkimnD/v4K/vuTh6GPj+082rGCrj4xCE04/oycLxtjd
         /bMFKV0qW/yU+dPThSzv6ONi11WU9pfv91nhFCqdEEkQ6jH+QpV5wnXsAPq/VYA5pbGM
         wHOj5aXXwRnoxUfjNHgB3d3cQaAfmczdPHHd93Vx05/NjqrBg7CqZXcNz7Don3TSL3+w
         U5lv1fJrBcVTlsIIQy6sqUqqwGp9oRoWYDYbcpG7ZeqGOKxcrLIgm0f2sX2vYfGTlGnN
         B3l8S3g7jsIYBKZ/VIPNzEMjXiCFurXLMzKkMnzHQ56qFVde3RTXoLvz0i5AzkOGDiR/
         bqOg==
X-Forwarded-Encrypted: i=1; AJvYcCWWXA09wJFDtk2leck6epTNqp427jAVZEna9vly5EG9Z2bSi+H2pnh3IDv2M/K/Rgl/pJ5Ikxd2HLSWxj3sGehceVvjhg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9HBdn89BVYmJufY2LMXvEcxHQZUbJ/6jmXiQrb6azTooJzKQc
	A4VqpnH2ToH1r4AGB7Hr2wqP7cfrHwARCyxdK6WOAx9YEjUuPS67ltTM
X-Gm-Gg: AeBDiesCgJydNMeETG2Yl3+MLnWNPOtJQ44b6RMyNZmjOfvuJ7DLYve/LTvZY7HCLff
	7hiqr9/olX32pdfbN5+PzriN7G2jaWduTF4QxE/0qF1p3hdNXXZ989+S39E67fzv68H6g1VA2IL
	ptG9+xM6YvtqIY79si6sKy8M3FK0Wr93PvQjRNignjkBVqiiS5fnn2JyFedZsu/MfQNRnFv/beb
	+6GfNPEt5CLTn0xElpLHZW2Qb16rnztrCMsQZW2miMt+Af9v7CFdL+wCgK5UfosR+pxYDr3DR0N
	0c/cLCymP7iRs49cK8dHashuxoTaDYDmRe4icbyOtxZUi51rQPaR4odXeidt2QukG8p7Qx/ALyD
	32yuXxZtKINM0SSJUpURQh5C/nxa7hMXasJxjB0mCyaisAzOfsjofeIG/rw1F7U9Ay1BvtZL7bN
	4tl/aMFcncl4u7nl4d/8M/IwbkN5OhU0B5yN07YoQ=
X-Received: by 2002:a05:6a00:3902:b0:82c:8c6a:682b with SMTP id d2e1a72fcca58-82d0da6a4efmr8181303b3a.19.1775389489937;
        Sun, 05 Apr 2026 04:44:49 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm13938205b3a.19.2026.04.05.04.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 04:44:48 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org,
	weibu@redadmin.org,
	knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com,
	samasth.norway.ananda@oracle.com,
	lukagejak5@gmail.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	suunj1331@gmail.com,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [RFT PATCH v3 5/5] staging: rtl8723bs: remove duplicate rate checks in PHY_GetTxPowerIndexBase()
Date: Sun,  5 Apr 2026 17:11:32 +0530
Message-Id: <20260405114132.310774-6-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260405114132.310774-1-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code previously checked (Rate >= MGN_MCS0 && Rate <= MGN_MCS7)
condition twice - once for the (BandWidth == CHANNEL_WIDTH_20) check and
once for the (BandWidth == CHANNEL_WIDTH_40) check. Fix if statement
formatting to move that if check as an outer if check to improve code
formatting.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 9e523491a008..efd1c76f2953 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -469,11 +469,10 @@ u8 PHY_GetTxPowerIndexBase(
 	if ((Rate >= MGN_6M && Rate <= MGN_54M) && !IS_CCK_RATE(Rate))
 		txPower += pHalData->OFDM_24G_Diff[RFPath][TX_1S];
 
-	if (BandWidth == CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
-		if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
+	if (Rate >= MGN_MCS0 && Rate <= MGN_MCS7) {
+		if (BandWidth == CHANNEL_WIDTH_20) /*  BW20-1S, BW20-2S */
 			txPower += pHalData->BW20_24G_Diff[RFPath][TX_1S];
-	} else if (BandWidth == CHANNEL_WIDTH_40) { /*  BW40-1S, BW40-2S */
-		if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
+		else if (BandWidth == CHANNEL_WIDTH_40) /*  BW40-1S, BW40-2S */
 			txPower += pHalData->BW40_24G_Diff[RFPath][TX_1S];
 	}
 
-- 
2.34.1

