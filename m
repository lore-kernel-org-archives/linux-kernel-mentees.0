Return-Path: <SRS0=ojZq=NQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4916EC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Aug 2021 08:23:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF10E611AF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Aug 2021 08:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF10E611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AADE781DBF;
	Wed, 25 Aug 2021 08:23:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6wfavcl5G6T; Wed, 25 Aug 2021 08:23:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B24F481DA3;
	Wed, 25 Aug 2021 08:23:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82145C001A;
	Wed, 25 Aug 2021 08:23:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F86BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 08:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B9F36063C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 08:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tNXFAv7rMXHa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 08:23:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 559BB60636
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 08:23:44 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id m17so6829168plc.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 01:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Oa4AJyX+c7xAxMp5FnWylQw6KajuFaq69VONS99z7KY=;
 b=sXUcqJb/YC6LZk4mpAmfwl3iejJgdLSxDCPCsmXUtA5Ko4AoV25Q6p6455R1PzFwfs
 oAYHwBANUhqM4DwqzfCTCzK5rbCh1BHKxrvNto+MxJunRG7WGbQOsrP9p7QSaQgP5DJc
 5O43fRi/0PYCeZvNLXm5AZzL/QIi/D7YZouKIWtKn1v9TR5NgU3IH2MfKRerMm/ETAr2
 0/CdHBOAbMRgE0L5QZDApvZbDGoZ/y+xxMHqmjMBPhJlnCiR8kHjq+Qp9OiHA8RkGMvt
 tK+t4DUt7s+x1cIfYT7RuiGkW48OsAmTDZlf+Qx4JyPJncQsLOPCjYsTqV/wVVsJKCZJ
 7GsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Oa4AJyX+c7xAxMp5FnWylQw6KajuFaq69VONS99z7KY=;
 b=Xfb7ETS/wJjni4KntJCL4xa7qkGmYMbUX4KwRptSGAySr4tmmNjkWC0IDNXTcgsymd
 h2WTxFVKUemPnL7TqRgj/VP6eLHTnfgKH9tuu0eeRW2U/eDf8cbxG2CJt/Kdbq+pOWB0
 DUkGiOTMnBh07w5AtiacdC56W3xS7Fxz+sEadV0cuG9vE0cSf5DGgIHXFpaUfuMYE6PH
 nE9fVH5S3I7ZHvrky0XBzwj85GJGAVryfBCp65+LtWNO/sXedatpOL3z/AkWkpJuS1Jj
 EA4UdYDeFOJCmS43Y9ZSBBjohzJaawQ6s2v9zyiqfKarhwGlItr4jfEjEbHI120BDIlx
 cuvw==
X-Gm-Message-State: AOAM530XAqBPU+Er4IZgnbYOZeGNT6uMGYGfk6wUvoimK2Y80FhJ74D+
 /tAnFr4Wfrdi3hwmdJwAsbY=
X-Google-Smtp-Source: ABdhPJyiQZuDPOwXvIOjtSq8cVWubsJOZx+gccyo26PYZfznOesBjwGAmZ9FW+BAz/L6TPcLPj8qjw==
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr9123987pjg.202.1629879823490; 
 Wed, 25 Aug 2021 01:23:43 -0700 (PDT)
Received: from localhost.localdomain ([49.36.209.103])
 by smtp.googlemail.com with ESMTPSA id
 x207sm4702673pfc.177.2021.08.25.01.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 01:23:42 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2] USB: serial: iuu_phoenix: fix quoted string split across
 lines
Date: Wed, 25 Aug 2021 13:52:44 +0530
Message-Id: <20210825082244.2933-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMydtSce3t91s0wmD87qr005MiVeMQ15UH-HBfsVub5ABQ@mail.gmail.com>
References: <CAKXUXMydtSce3t91s0wmD87qr005MiVeMQ15UH-HBfsVub5ABQ@mail.gmail.com>
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
Although the line length increases beyond 80 characters, it makes
grepping the entire string easier.

No functional change.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
---
 drivers/usb/serial/iuu_phoenix.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index 19753611e7b0..f2c0dad911c3 100644
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
