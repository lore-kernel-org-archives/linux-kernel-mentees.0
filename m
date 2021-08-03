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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1F7C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 18:38:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1803760725
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 18:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1803760725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAF1E402BB;
	Tue,  3 Aug 2021 18:38:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dXw5fV0ZN6L7; Tue,  3 Aug 2021 18:38:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A3C1B40001;
	Tue,  3 Aug 2021 18:38:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E420C0010;
	Tue,  3 Aug 2021 18:38:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C778CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B61564020A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G25MRze29_pn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:38:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8587440001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:38:39 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id ca5so30795641pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 11:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=I1TkyygSjGW+kjQmqUIljrenqdNKKO3YJsNn99DlFN8=;
 b=a9XKwD3niQbdR5tPFIxtUqu/pg69uCgCBxmf0OgSXEEUcAAynAIAiw0jAMcnwnI6i+
 QncdMIZ2ZXtHajOVbqDF9/SvY3Goe+o/IoVDUsfWNyHN3TVrLtxJiseteupzWyio1tG4
 sMqW74YfKH+G6XeEchq1ObXfwXFRy8LXniiV6k2AKv0EoyxlRccGnnwozuMAWRcazlD7
 ZMgNmhSxTrSxLizAXW3pQ5dmzFwW7xhQVwdaB1F6V6OO1WhtZHq98DWx8cY73f2iSvuP
 lS9zovwcTVYkZD4bfMQnbzbU3EAGUgLeavGyhQ/DZUTPft4rEJHLl75jCLKgC8erJFa8
 X4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=I1TkyygSjGW+kjQmqUIljrenqdNKKO3YJsNn99DlFN8=;
 b=aglnr2xBcfh0FIZvvQt/RNtB2j+s2N03B7wbRovTgAPrEym3rN/5CgMg3yUa75Q3Z3
 K5gP4FWSAfwugza/MKWSj4d1zbzTcOIF9lsDrjt0feZW2Hs9iuf2nZQnblI2CSo1DKoX
 9b2bszbHfaOU7HN2vOurdosMnhyoNb1VJ9JegZlR/O8KWVvBmGVa8kv8ZeuEN7oDE2jq
 f4SEEruzARIPd65pP5wEdwxJnmLWNXUOL5K3zve/fKe14QVemueiqkBK5GAlgaEsXPVN
 NcXIm1GdPK826nOFWby1cEattPfdyHGOmSNqc5QxsO8zDKHCRYJpZa0W/VLVYftykZSZ
 Tc9w==
X-Gm-Message-State: AOAM5317Ue274xr1riln5ykwShyVBHfmsp+xiwPUAWrwHmwfnCwMAnNx
 Z2aIDC5pnMflow5lK2jotEs=
X-Google-Smtp-Source: ABdhPJxrQtm9sbjmjWUn6f1ghr7HtTazoJCZJSqrZ1aKBkt80UwQ/Y9pzneBsToPnH8g99p7HOBuGA==
X-Received: by 2002:a17:90b:3c5:: with SMTP id
 go5mr5786969pjb.56.1628015918824; 
 Tue, 03 Aug 2021 11:38:38 -0700 (PDT)
Received: from localhost.localdomain ([47.9.154.212])
 by smtp.googlemail.com with ESMTPSA id lr4sm76928pjb.1.2021.08.03.11.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 11:38:38 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2] USB: serial: iuu_phoenix: Replace symbolic permissions by
 octal permissions
Date: Wed,  4 Aug 2021 00:07:35 +0530
Message-Id: <20210803183735.2525-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMxJ9CKP1nftTWmP-UTaMMyuOtoNYz4SQYrDPP9PdaRp4A@mail.gmail.com>
References: <CAKXUXMxJ9CKP1nftTWmP-UTaMMyuOtoNYz4SQYrDPP9PdaRp4A@mail.gmail.com>
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

Fix checkpatch warnings:
WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred.
Consider using octal permissions '0644'.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
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
