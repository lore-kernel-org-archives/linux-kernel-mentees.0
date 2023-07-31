Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36600EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 02:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7CAD80B48;
	Mon, 31 Jul 2023 02:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7CAD80B48
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=h5K+DYPq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5DwGsdjGbAB6; Mon, 31 Jul 2023 02:18:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B11D58002D;
	Mon, 31 Jul 2023 02:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B11D58002D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89B3FC0071;
	Mon, 31 Jul 2023 02:18:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E002C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4EAE40920
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4EAE40920
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=h5K+DYPq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R34PQH2zLC5t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:18:26 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4B7540901
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4B7540901
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68730bafa6bso377762b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 19:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690769905; x=1691374705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YGe7yeLSCJNtOm6KMm1pCwSHsNpi9wZaHI6nfPlQl3c=;
 b=h5K+DYPqZFC60a4cycOBBwDw5B5aIbHbzVUDTSJ6TmYOhMYUesVIXYk0R0JFkg2WgX
 BqzQ34i+6GjiKS6oRSCiLl0ic6J9PuUs4c4QS6euPm/SL7qBhmuS6/kg/TKZzh+lNtD5
 K/cb62Lbuse0dW9UGOxZCzJrJBqDiopp9TjAJysFCOBEUGMBIf6InBjVzAcMwhwVWWjN
 OzOpHhxABYLhKR/ifh3OWwHVUjQX04a8Yf/2GsLMwiWsRj4Msd08iBqmJZ7caPgi1w9J
 rV8j/ceCuCZ1VYT+la25Uut6MLD8MoUE5y1wia1maBSuWyvnORxdF6JL1mnTNKn0/Wma
 xr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690769905; x=1691374705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YGe7yeLSCJNtOm6KMm1pCwSHsNpi9wZaHI6nfPlQl3c=;
 b=Rzv5yRMtCtMMZW9voKLyCJWtJte/O/Iq2dfmcLtBICFm2py3ckXH4IxyUdXjkeKcMu
 oQKLu3oEkkh9lgvAkQWeKB/beR869oOrNtmZtkzKiEkkLJvO0A26Ksy00sj0Kx0th9qa
 efdkrSOgfd8xtbNgxwk8uyuOVp6Ox5pbVv0hQFHc+SplJYCCeWpNCUgqU86tRjfULE4M
 8se7Le+c7CsaHBp44rHfbZWAZk05sCgUyTCvgT6FTft6ChbtxQHd5/UB+m+uKpwP/nKl
 r7wpWJkjbc6IbX+AnstMm2AWHKZleS9FD3WS1RZiIQNNexlUadjCCQ21LCp9TMCLL/dC
 5MbQ==
X-Gm-Message-State: ABy/qLYpMI/mlj5Wh5RFnO8wsaweHzPj8rPDN65m2neaP7XWg611KBDk
 FgIq9qBSRYzML+VbJKNQALg=
X-Google-Smtp-Source: APBJJlFEz/QKJPg44Ka8GKBHJeWwG0oxzm4iA/VEL0cm8A0/7em09GsIoQpzhFflx+zfO6TcGfEObQ==
X-Received: by 2002:a05:6a20:3d21:b0:10b:bf2d:71bb with SMTP id
 y33-20020a056a203d2100b0010bbf2d71bbmr9643953pzi.27.1690769905200; 
 Sun, 30 Jul 2023 19:18:25 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:f50b:8f24:acc4:e5c])
 by smtp.gmail.com with ESMTPSA id
 y1-20020aa78041000000b00686bcfb5a34sm6460022pfm.124.2023.07.30.19.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 19:18:24 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: deller@gmx.de
Subject: [PATCH] fbdev/amifb: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Date: Sun, 30 Jul 2023 19:18:08 -0700
Message-Id: <20230731021808.24997-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
because they are deprecated. Use the new DECLARE_FLEX_ARRAY()
auxiliary macro instead of defining a zero-length array.

This fixes warnings such as:
./drivers/video/fbdev/amifb.c:690:6-10: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/video/fbdev/amifb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index d88265dbebf4..f216b2c702a1 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -687,7 +687,7 @@ struct fb_var_cursorinfo {
 	__u16 height;
 	__u16 xspot;
 	__u16 yspot;
-	__u8 data[1];			/* field with [height][width]        */
+	DECLARE_FLEX_ARRAY(__u8, data);	/* field with [height][width]        */
 };
 
 struct fb_cursorstate {
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
