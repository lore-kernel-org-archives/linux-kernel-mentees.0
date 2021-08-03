Return-Path: <SRS0=/NdJ=M2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F546C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:21:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1FD560F94
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1FD560F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8619A605EE;
	Tue,  3 Aug 2021 14:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eseYJZH_j3Ru; Tue,  3 Aug 2021 14:21:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BA92060723;
	Tue,  3 Aug 2021 14:21:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9997BC0010;
	Tue,  3 Aug 2021 14:21:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66C78C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 576B983857
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:21:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9G3mJohGeaj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:21:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5724832D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:21:46 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so4941229pjd.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=soSfWFjmSv6ufmq1IAutV7N4TNRCCFHsXUCFCqlbITs=;
 b=e5vlxY1fCNwZGCytZAkQLuiAo3kOKon7lFNv78zhYjxdA4nGZ80zG+31gHwYhfFgiB
 jHHPoa36cQVtJPtcGCnItkyJp7fB5RiAIiEsuPA1sAH6XGOkhw/feFx7j97lYVL/u/yW
 RHQWesyioRz5XxEIdYWyTN7tz/O/EyvVWEY/I2fgoxt+WZm2z7OgVaUV7LageQ8KEP/d
 6yBkRvRgYALujn8m0TlBlPq/aRtsi+MmnaWe9UR+fA+itmaV3C5Bp6RXM4s/9najWjhS
 44Nt7vyLdzp5NgpTgLshBcARYhPJ+HW1F2BNyOmqxmDbKTNlyUYoIyVQ3k321l/6bVzG
 bMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=soSfWFjmSv6ufmq1IAutV7N4TNRCCFHsXUCFCqlbITs=;
 b=BZdb87dW9QFt9UGR+WS6910xbGzJFxn/TKfkguXUERfriY0FPQPQuzS5pKt4O1qVDx
 PH5LWU/Lc3FrQn/yWqqNbPBnVxwk0+tY748EZsXKMUHxiiU4ZMW+37X6Rp2rrIom4Tgz
 8Wr62ymTy3fuuOKEAIiP09JWsFkK8dtVSV1NqE4fXl+M4vpj1aOAUY6ZSksWYSO2msxo
 ybvBJW1ST7mYKtw8a7LWdd1sui1KMRHcJQppls1h7d4ugiaOEu1qxvpkgkfovxfGyJet
 4Lib+vM8toXVtgqLzhfRaxzpJdmIPEyGR3o8VoYbNPewBQx1ZzMNTtZNzS//lSqqI70G
 5ihw==
X-Gm-Message-State: AOAM532tn1iXWIMjP7seKSVTFluYUXaT7W0w4cFBg8B76mEjTEmBrQ1U
 U/0mgMpbSEgOBHH6dLEFORbzc56n3zw=
X-Google-Smtp-Source: ABdhPJzK78qBwJwFlt+W3YnEQx0CeQaRcq6y4tI+O3QQlBmspOI3gjsdjKill+8xVr8dhWpQVX+Z9Q==
X-Received: by 2002:a65:51c9:: with SMTP id i9mr1263890pgq.102.1628000506134; 
 Tue, 03 Aug 2021 07:21:46 -0700 (PDT)
Received: from localhost.localdomain ([47.9.137.220])
 by smtp.googlemail.com with ESMTPSA id y2sm14807558pjl.6.2021.08.03.07.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:21:45 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] USB: serial: iuu_phoenix: Replace symbolic permissions by
 octal permissions
Date: Tue,  3 Aug 2021 19:51:31 +0530
Message-Id: <20210803142131.17192-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This fixed the below checkpatch issue:
WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred.
Consider using octal permissions '0644'.

Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/usb/serial/iuu_phoenix.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index 19753611e..0be3b5e1e 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -1188,20 +1188,20 @@ MODULE_AUTHOR("Alain Degreffe eczema@ecze.com");
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
 
-module_param(xmas, bool, S_IRUGO | S_IWUSR);
+module_param(xmas, bool, 0644);
 MODULE_PARM_DESC(xmas, "Xmas colors enabled or not");
 
-module_param(boost, int, S_IRUGO | S_IWUSR);
+module_param(boost, int, 0644);
 MODULE_PARM_DESC(boost, "Card overclock boost (in percent 100-500)");
 
-module_param(clockmode, int, S_IRUGO | S_IWUSR);
+module_param(clockmode, int, 0644);
 MODULE_PARM_DESC(clockmode, "Card clock mode (1=3.579 MHz, 2=3.680 MHz, "
 		"3=6 Mhz)");
 
-module_param(cdmode, int, S_IRUGO | S_IWUSR);
+module_param(cdmode, int, 0644);
 MODULE_PARM_DESC(cdmode, "Card detect mode (0=none, 1=CD, 2=!CD, 3=DSR, "
 		 "4=!DSR, 5=CTS, 6=!CTS, 7=RING, 8=!RING)");
 
-module_param(vcc_default, int, S_IRUGO | S_IWUSR);
+module_param(vcc_default, int, 0644);
 MODULE_PARM_DESC(vcc_default, "Set default VCC (either 3 for 3.3V or 5 "
 		"for 5V). Default to 5.");
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
