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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B04FC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:21:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B756960EE9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B756960EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D10A40270;
	Tue,  3 Aug 2021 14:21:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtHFDjLyxC4g; Tue,  3 Aug 2021 14:21:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 66E71400F2;
	Tue,  3 Aug 2021 14:21:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50E54C0010;
	Tue,  3 Aug 2021 14:21:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65965C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 494EB832D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j08KRF4GxOUm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:21:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD71582BC0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:21:21 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so4049105pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 07:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jSlB4oEqnQ7Myorpw9Y/jJnKSUgpSJzWclspxllfCO4=;
 b=p+CyW5cusB5ysFiqW5K4knDjfKACGkekne81Ercw8rWN3PcxkGCKVhNDSmWNZOfjmE
 obuqnP1ZJPPs9AtP22VGAytcTVlG3ZCeim3veQEUsa/BllLsVtg8LuOmZW5PAVo2SfFy
 41FQN52Te1KXu8G9B7Eb9zZ2DNG6CAgRJWsqvyDYJfnwg6z3/S7Hf21yy/QT6XE1CH49
 adbNuEDxIqGcmmQ0a3vUFX7+rVOl8+bTCim57rvJknb3lbzeOwaGBS8NFsDSvp8aPtIG
 qiFuzi8Jn8Z3qn6hqcMY3R89oFV8BM6tjgzuTgxfP/QgA9Pgi11y1bhS0PjUjEnPZc8H
 dqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jSlB4oEqnQ7Myorpw9Y/jJnKSUgpSJzWclspxllfCO4=;
 b=ADfifQwjPm0MY8leO0JLNKenXwSuiRk8HYAzc2xsbaRuaHmW1Xe67YABqSiRYE3xNd
 PRP+enqM0dXvWVDzd98foVrXYag6XgLdcWggzPzcyl9xOtaK36tklpjN6Z4pOEwxjXgP
 ocT7NkLeOopSO7EiivxuYbVtRTiab3SZo8HJXJB02r0SkJZ++GQeZegE6IQ7rz+CGtCY
 eElG4UMj79t4eeCVC0cm6TCpgv/lYkW3g1LEX7p9pXfzdO+82VfJHOQ9FFiY8lD1exuf
 cLWhKEwEWwaQ+42gxoT9xbpK6i0gTLeTw/JGgqczGOu+y8W1DAHqpwxYxSOiY11sstT8
 KXng==
X-Gm-Message-State: AOAM532Wy0HnEswsMigIdPE02gB57sCaHd9lFl9wjKyX64ybHFkjMEGE
 OTPgijjKVTeTPngWUJ5EmcM=
X-Google-Smtp-Source: ABdhPJym9Eg0StVfFVUGZy0Uks9fR8DyVfKtL/Jq/oXeMnUcc8IkrLiBDlSERpbocH1Q2a1I0aGrVg==
X-Received: by 2002:a17:90a:ab0f:: with SMTP id
 m15mr23342119pjq.154.1628000481183; 
 Tue, 03 Aug 2021 07:21:21 -0700 (PDT)
Received: from localhost.localdomain ([47.9.137.220])
 by smtp.googlemail.com with ESMTPSA id j13sm3675842pjl.1.2021.08.03.07.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:21:20 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] USB: serial: iuu_phoenix: fix quoted string split across lines
Date: Tue,  3 Aug 2021 19:51:09 +0530
Message-Id: <20210803142109.17137-1-utkarshverma294@gmail.com>
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

Fix checkpatch warning "quoted string split across lines".

Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/usb/serial/iuu_phoenix.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index 19753611e..f2c0dad91 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -1195,13 +1195,10 @@ module_param(boost, int, S_IRUGO | S_IWUSR);
 MODULE_PARM_DESC(boost, "Card overclock boost (in percent 100-500)");
 
 module_param(clockmode, int, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(clockmode, "Card clock mode (1=3.579 MHz, 2=3.680 MHz, "
-		"3=6 Mhz)");
+MODULE_PARM_DESC(clockmode, "Card clock mode (1=3.579 MHz, 2=3.680 MHz, 3=6 Mhz)");
 
 module_param(cdmode, int, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(cdmode, "Card detect mode (0=none, 1=CD, 2=!CD, 3=DSR, "
-		 "4=!DSR, 5=CTS, 6=!CTS, 7=RING, 8=!RING)");
+MODULE_PARM_DESC(cdmode, "Card detect mode (0=none, 1=CD, 2=!CD, 3=DSR, 4=!DSR, 5=CTS, 6=!CTS, 7=RING, 8=!RING)");
 
 module_param(vcc_default, int, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(vcc_default, "Set default VCC (either 3 for 3.3V or 5 "
-		"for 5V). Default to 5.");
+MODULE_PARM_DESC(vcc_default, "Set default VCC (either 3 for 3.3V or 5 for 5V). Default to 5.");
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
