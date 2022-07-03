Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FAAC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 Jul 2022 08:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E9A8404D5;
	Sun,  3 Jul 2022 08:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E9A8404D5
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=niGEtNVy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zsJgecwDndG9; Sun,  3 Jul 2022 08:47:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 009214027A;
	Sun,  3 Jul 2022 08:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 009214027A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2F05C0032;
	Sun,  3 Jul 2022 08:47:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCC5FC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Jul 2022 08:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5E1C60592
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Jul 2022 08:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5E1C60592
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=niGEtNVy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xpZU83MfHkm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Jul 2022 08:47:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 149F96006A
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 149F96006A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Jul 2022 08:47:49 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id fz10so463550pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 03 Jul 2022 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tUsFz55Px30MpiSri6WdI5V/eCo3oYtyYbcL/dhllTg=;
 b=niGEtNVyxCbmjPSahF1+ZBR8MEYUD3iy5SMhHcNpaGQ2vS4SqSox9PJtXjt4ndBcOK
 vaIA6IWExgqdi7jThgg0zHrgJwpfbVNaCVJOXO9HvYCEKAym++/tMkv3HLkeM06GnPnz
 9wMg0LeJYrJRo/fMgXreTsiRPZfNqrjcUgMY8wqBFnWy+qmrHruPoN2Ngb1p6THS9393
 32ezqqbr5p5xDmBFt9k/QXPTvtPfwl3HUrB8o7dYGn2CEhjwtCOrGxLN9stkiNISWafx
 er86W4hs1FZWvaU7M5TRAYbmUf7chK+OxGRNFRIT/3OVHa2ON9RlGMaYLQgaH3m70igX
 AxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tUsFz55Px30MpiSri6WdI5V/eCo3oYtyYbcL/dhllTg=;
 b=A553JcDnINYwDf4Nn9JHp0byagQFjtHXdgoMG13v8/uh2bX+qOGHjoPT1nlSJHAHtJ
 vW5I8ONuKDmb7ZfNpq8Tl9Fno5O9TxmZ++s4ORVIIi7hB7w9bSea19YfzLYNcp8KToP9
 eBdSM71nA6z7kuk+SNRsI0Sz0MG6SzD/rMrOGD52zgW/Jut7enMwabbZjmtW9XNvv1TU
 VbiWZoyA77NEC7YCy4lMAeBISaaUFT7XfztmxhHfrYHgq2nV5zMfVTSEYsf8f1364KIx
 Ljrj/Ox4bfSXMg+ASfXukA9Wos1gAY0y656IR3wuk2f03LB+WKhSFC7s024/lh9I99gO
 E92g==
X-Gm-Message-State: AJIora/e6awStSNi1NytLx3o53zB1Vr89diq3HTGo18ROE16SDA9Dz21
 uStY4df/M95pvHfNHexdmVJMTm9AHp1jug==
X-Google-Smtp-Source: AGRyM1uxGwlkGItwao0LpzEZt1r4qM73Q1jRopcIa1PdFpWCXpTztf2Ql0ME8FJRdX6TcLjck2QDMw==
X-Received: by 2002:a17:90b:218:b0:1ef:1440:ebe1 with SMTP id
 fy24-20020a17090b021800b001ef1440ebe1mr29068126pjb.166.1656838069362; 
 Sun, 03 Jul 2022 01:47:49 -0700 (PDT)
Received: from fedora.. ([103.159.189.148]) by smtp.gmail.com with ESMTPSA id
 mt7-20020a17090b230700b001ef7bd5b711sm1262417pjb.0.2022.07.03.01.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:47:48 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] scripts/gdb: Fix gdb 'lx-symbols' command
Date: Sun,  3 Jul 2022 14:46:54 +0600
Message-Id: <20220703084654.6360-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: Pavel Skripkin <paskripkin@gmail.com>, Helge Deller <deller@gmx.de>,
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>
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

Currently the command 'lx-symbols' in gdb exits with the error`Function
"do_init_module" not defined in "kernel/module.c"`. This occurs because
the file kernel/module.c was moved to kernel/module/main.c.

Fix this breakage by changing the path to "kernel/module/main.c" in
LoadModuleBreakpoint.

Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
 scripts/gdb/linux/symbols.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
index 46f7542db08c..dc07b6d12e30 100644
--- a/scripts/gdb/linux/symbols.py
+++ b/scripts/gdb/linux/symbols.py
@@ -180,7 +180,7 @@ lx-symbols command."""
                 self.breakpoint.delete()
                 self.breakpoint = None
             self.breakpoint = LoadModuleBreakpoint(
-                "kernel/module.c:do_init_module", self)
+                "kernel/module/main.c:do_init_module", self)
         else:
             gdb.write("Note: symbol update on module loading not supported "
                       "with this gdb version\n")
-- 
2.36.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
