Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB539C83F11
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Aug 2023 07:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20B9F81E6A;
	Mon, 28 Aug 2023 07:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20B9F81E6A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aJYAzMMg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x1Df441bcyzo; Mon, 28 Aug 2023 07:21:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 23F5681E60;
	Mon, 28 Aug 2023 07:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23F5681E60
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7A1EC0039;
	Mon, 28 Aug 2023 07:21:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C690C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 07:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0009460BA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 07:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0009460BA5
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=aJYAzMMg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3IANvfgP5Yq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 07:21:01 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30165607CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 07:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30165607CA
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-68a402c1fcdso1857721b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 00:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693207260; x=1693812060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yix1QIvYkCVrQqH7rnPkzsKqXcnw1nS6UvJEKq5/GR4=;
 b=aJYAzMMgyY65Hpr7rJ2lcMhc6IHd+uAt46IatMESb1+OBRo7t0vq6f5aYnaKulMPtQ
 QtkTPp7MoQdlWJ5UHq6E+v5qwO9A4238hvk1vi0jAqYiLEj0JUFHdtPODz+aBUSWtsv3
 8PrAH/d6RDzFF2BG4aOu70Jqt158DghCvyxt3eQrwX+F1PiQ1zubYpt7VB6r28XKYtzG
 QZp4ruiFMJMLa9KwBk7tKO8jCTkcLCsXunSFZsh6v+mwD7WNnpZNl7vLMBHBtY92glb/
 TsAQFh12+DU5hroXAF47nCSOVN2UouQEgeiq3Ccfz8do9AgQZcqlhVo5PL1+All5vgPB
 D/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693207260; x=1693812060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yix1QIvYkCVrQqH7rnPkzsKqXcnw1nS6UvJEKq5/GR4=;
 b=VEeW4q7ZSu8SIRpIvKrv3f7c+63QVYt/Kqs7lEOWfa+5jGmLAICowRKNqYuuRkykk8
 ufZNoJJBSX+vD6c9L9qfdzLz4B5lN706g/SYefpamFbl0Vv847KgKno4VXf+XHAP9KjX
 ovpaL5KXvXcHNJNO9OGZv9UYv8QVT3OxnS02GQdDPFkSQFAg1ba0+p9AsKBnhCUF5xY+
 pxxCoVUGBOc3nEkLR9UlVB7HNvEnIAsYIRto6QyPk2tLAfOkVPZRh2TMogrPiqaQGrXl
 wBLpCJZ06eYaqvoiPWR1W/pZ0a4yiM0jHS3gq1G5SiqgiHthmq3e4FXCkRVEHvySxYhe
 57aA==
X-Gm-Message-State: AOJu0YytAU6b/NwcWaHvbmV5e+ve4KkTxU5/6aji7akT+n59dIJKhRUb
 7whPmZWX2U0jtYpFhl+f0gk=
X-Google-Smtp-Source: AGHT+IFahU8UqJ/qhYnAqAcbiymFTVXuR2lxsWv8uOwt3RBW+bSLIGVa9RUjZWeqPaSIzROiaufbCA==
X-Received: by 2002:a05:6a20:a11f:b0:13e:b58a:e3e8 with SMTP id
 q31-20020a056a20a11f00b0013eb58ae3e8mr22451160pzk.50.1693207260411; 
 Mon, 28 Aug 2023 00:21:00 -0700 (PDT)
Received: from archlinux.srmu.edu.in ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a62e213000000b00686bef984e2sm5980184pfi.80.2023.08.28.00.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 00:20:59 -0700 (PDT)
From: Anshul <anshulusr@gmail.com>
To: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com
Subject: [PATCH] fixed formatting issues
Date: Mon, 28 Aug 2023 12:48:25 +0530
Message-ID: <20230828071829.64366-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: linux-alpha@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Anshul <anshulusr@gmail.com>
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

Fixed minor formatting issues as per `scripts/checkpatch.pl`

Six changes to the file and their severity are as follows:
* [WARNING] Removed unnecessary braces from single statement blocks
* [ERROR]   5 fixes are to pointer formatting
* [ERROR]   Removed a trailing whitespace

6 errors and 1 warning of the previously present 6 errors and 5
warnings have been fixed.

Signed-off-by: Anshul <anshulusr@gmail.com>
---
 arch/alpha/boot/main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/boot/main.c b/arch/alpha/boot/main.c
index 22a1cb026..f609c3a83 100644
--- a/arch/alpha/boot/main.c
+++ b/arch/alpha/boot/main.c
@@ -20,8 +20,9 @@
 #include "ksize.h"
 
 extern unsigned long switch_to_osf_pal(unsigned long nr,
-	struct pcb_struct * pcb_va, struct pcb_struct * pcb_pa,
-	unsigned long *vptb);
+				       struct pcb_struct *pcb_va,
+				       struct pcb_struct *pcb_pa,
+				       unsigned long *vptb);
 struct hwrpb_struct *hwrpb = INIT_HWRPB;
 static struct pcb_struct pcb_va[1];
 
@@ -42,7 +43,7 @@ find_pa(unsigned long *vptb, void *ptr)
 	result <<= 13;
 	result |= address & 0x1fff;
 	return (void *) result;
-}	
+}
 
 /*
  * This function moves into OSF/1 pal-code, and has a temporary
@@ -62,8 +63,8 @@ void
 pal_init(void)
 {
 	unsigned long i, rev;
-	struct percpu_struct * percpu;
-	struct pcb_struct * pcb_pa;
+	struct percpu_struct *percpu;
+	struct pcb_struct *pcb_pa;
 
 	/* Create the dummy PCB.  */
 	pcb_va->ksp = 0;
@@ -176,11 +177,10 @@ void start_kernel(void)
 	}
 
 	nbytes = callback_getenv(ENV_BOOTED_OSFLAGS, envval, sizeof(envval));
-	if (nbytes < 0) {
+	if (nbytes < 0)
 		nbytes = 0;
-	}
 	envval[nbytes] = '\0';
-	strcpy((char*)ZERO_PGE, envval);
+	strcpy((char *)ZERO_PGE, envval);
 
 	srm_printk(" Ok\nNow booting the kernel\n");
 	runkernel();
-- 
2.42.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
