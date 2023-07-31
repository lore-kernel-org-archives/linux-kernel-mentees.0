Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5E0C001E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 01:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B19AC4049D;
	Mon, 31 Jul 2023 01:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B19AC4049D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Q77lfKBG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHOIPMIwWrTZ; Mon, 31 Jul 2023 01:16:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AFCCC40025;
	Mon, 31 Jul 2023 01:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFCCC40025
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74F2AC0072;
	Mon, 31 Jul 2023 01:16:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE80CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 01:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9230760F9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 01:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9230760F9B
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Q77lfKBG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QBOKB0piPdTw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 01:16:44 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5041660F6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 01:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5041660F6F
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-686b643df5dso2722678b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 18:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690766203; x=1691371003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RoLht6Nj+QdoUfDoHkYrw79LiGPXCNEAvhbkzzXglIs=;
 b=Q77lfKBGO1gtg7GHeJifAa2N4OOCQsbu/8fYgxBycCuTeFosUbOVfiGeg8tUFmaXyf
 F9El/OzKqhoi/yV9hMHJiRUfFTzqJGtwcpMsMcwXJumlgOjfzD+OyLBUxS1naEVQ40YW
 +M6fX+e8GwVV1Kc8hM9yvYACfY3PDc5Aki6CJI9ZzCEM2hGLiTqVQ/MF8bm5w6bLUmA2
 d3WLWyhHIDIEVffZBbs4Ksg6mNgaOBOrK0aHQfUH1265fxJicELeUYAcNYn++wYDFeYc
 6g/1XKEocy693h1M6BjWJmaeJNr/YO48jm+P+qCOKX6c08L/+320QjbfXQSKeqjffOOX
 ZuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690766204; x=1691371004;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RoLht6Nj+QdoUfDoHkYrw79LiGPXCNEAvhbkzzXglIs=;
 b=HouTugRpUa56AsfTJsQ3x2A9paV9k3lPzNA4s6Y/fCTlQ/SuJHDlitJdlqz/2xQET9
 sbhNHViCCHDrcop9VX9/9fvlYrJv3EQ2h/PzJtH/cx/hnMpLBttxI16iyUIeaNOguTBR
 GYj8QDx6D6VOuZOOvaYYnF2BZPD05jhvLu9t9fqrhvv2QRBjGE9QLKJfK1EYQ57NNGjf
 igRGyabaowNprO/PoQ8r52i27iJGe9Mx6wBrLJd4RP6Oj7XpIOYiSjTjalcNroXOa33T
 AYC1c++/V+Fzx2R8fRhajbE/3uCrEFFvzjFZCOSbRc4LXr8TTXCIP9eZ7c4bbUQOtHC0
 cXMQ==
X-Gm-Message-State: ABy/qLZerCBzWVfpw6evHmdsut7DH4HFGe0V6MgzuO/4xZZ8IfYIezsC
 //MzwZdjB/JZrM5Z2vT1WtI=
X-Google-Smtp-Source: APBJJlGm8+7fAysmaFnTRk2gyFZmqf8NkF0LlK0YpCb6TaNVmCWjvHTM9zeqgdip0y9QNjkv8S0yfw==
X-Received: by 2002:a05:6a20:4288:b0:133:fd64:8d48 with SMTP id
 o8-20020a056a20428800b00133fd648d48mr9586468pzj.4.1690766203411; 
 Sun, 30 Jul 2023 18:16:43 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:f50b:8f24:acc4:e5c])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a170902bd9000b001bb515e6b39sm7166021pls.306.2023.07.30.18.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 18:16:43 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: aspriel@gmail.com
Subject: [PATCH] brcmfmac: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Date: Sun, 30 Jul 2023 18:16:35 -0700
Message-Id: <20230731011635.20993-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, kvalo@kernel.org,
 linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 franky.lin@broadcom.com
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

Replacing zero-length arrays with C99 flexible-array members
because they are deprecated.
Use the new DECLARE_FLEX_ARRAY() auxiliary macro instead of defining
a zero-length array.

This fixes warnings such as:
./drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:119:6-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index de8a2e27f49c..983946b146b3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -116,7 +116,7 @@ struct brcmf_dump_survey {
 struct cca_stats_n_flags {
 	u32 msrmnt_time; /* Time for Measurement (msec) */
 	u32 msrmnt_done; /* flag set when measurement complete */
-	char buf[1];
+	DECLARE_FLEX_ARRAY(char, buf);
 };
 
 struct cca_msrmnt_query {
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
