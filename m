Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4DFEB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 02:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D55F960F97;
	Mon, 31 Jul 2023 02:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D55F960F97
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HEod1mWc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYrTeWqs-ZIk; Mon, 31 Jul 2023 02:00:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D69B660AEC;
	Mon, 31 Jul 2023 02:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D69B660AEC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8B86C0072;
	Mon, 31 Jul 2023 02:00:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B64AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50444402F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50444402F4
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=HEod1mWc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yDT87VJMTvno
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:00:32 +0000 (UTC)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7C2440191
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7C2440191
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-56334abe325so2446997a12.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 19:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690768832; x=1691373632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d5U2Ilj8GVLbGc7iTr2xlVBQQuQUhMOcwW/miVLTfiE=;
 b=HEod1mWc8wbB5MImvcbAWZ65Vmw95QRcHgj9CgEZ6YS87tfQ9Ed9V7T/WibekMQoE0
 dACYlyTJuJ+WS/QmAn2Oj87+nauBBjpcDe+GJEPZUvb1agmCIJwcf5NnN5/RC3Ob9SkU
 zphVzaPW3IFg8jZqJ0ZJqIai0YET0RTaPSb0xWyC5x3FAX/vX8E0EIzkJf1Ek1RpQJ/3
 An91fgvhtXWiFajymhs5zoVmR3bfZwVC8h+mTMLiS4y/H4RibsrijCBFAtsIcjUpOkqr
 TavU4q4wR63nwaCGO4ZAZ15ojHum2KNHT14NRKIcm/R8UGrv37ajJ1BpiX9Tirb/ZITp
 Ut0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690768832; x=1691373632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d5U2Ilj8GVLbGc7iTr2xlVBQQuQUhMOcwW/miVLTfiE=;
 b=AVs/m08z5ACK88WdbUPilinxP7oEVfb+0cgXx7otl+69fcVF1BHY4MEr4kVZA0Rv5L
 SenOqSQK2jmga0BTGEMLhaLUwV0MgKdB5M7X4haN64JNYM5QwJt6Bvx11Ug27WVAO2pt
 6+s53nTv4LUCGHSZnRIN3ZWVe1TSyq0osQNQHXKpMAzK2AbhY44MGHfwGAMZ6voEdHCi
 xAK81eAtJo0WEEreZ1HfvsrknencUjphY6OV2Bg7EnLOU0mEQw8dbPRC5576VsouGwJk
 aFJyeKY4nXDpFdjalkRzs4752zbV8QQdP4kfsAsxv8ad60D71IT3k+/ZiyPftRu2gohh
 duHw==
X-Gm-Message-State: ABy/qLaeDGE+/hGqjBwkgGXpBEwUZgF+/XDKkHzD21/BMjGEofX/et6M
 mWk3HFZw8GI6l2JBhIQoZO0uYVE8YwegFizn
X-Google-Smtp-Source: APBJJlED/s4/sxdQzAr3zwh8kQB2nLQHVlmWyAzR25rrejYVnqWlx+O54RlFIqdzA56zh1gYbYvE4w==
X-Received: by 2002:a05:6a21:778c:b0:134:a478:5e4a with SMTP id
 bd12-20020a056a21778c00b00134a4785e4amr8447462pzc.17.1690768831936; 
 Sun, 30 Jul 2023 19:00:31 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:f50b:8f24:acc4:e5c])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a17090274c800b001bb97e51ad5sm7230880plt.99.2023.07.30.19.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 19:00:31 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: stefan@agner.ch,
	dev@lynxeye.de
Subject: [PATCH] mtd: rawnand: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Date: Sun, 30 Jul 2023 19:00:14 -0700
Message-Id: <20230731020014.23951-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Zero-length arrays are deprecated, and we are moving towards adopting
C99 flexible-array members, instead. So, replace zero-length arrays
declarations alone in structs with the new DECLARE_FLEX_ARRAY()
helper macro.

This fixes warnings such as:
./drivers/mtd/nand/raw/tegra_nand.c:189:5-7: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index eb0b9d16e8da..45e802b63270 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -186,7 +186,7 @@ struct tegra_nand_chip {
 	u32 config;
 	u32 config_ecc;
 	u32 bch_config;
-	int cs[1];
+	DECLARE_FLEX_ARRAY(int, cs);
 };
 
 static inline struct tegra_nand_controller *
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
