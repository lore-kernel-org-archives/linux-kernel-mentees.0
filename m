Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398ABC71153
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Aug 2023 08:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B60ED81C11;
	Mon, 28 Aug 2023 08:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B60ED81C11
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Jcb7kitE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXXefFiCKGJa; Mon, 28 Aug 2023 08:07:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AA22E81BC2;
	Mon, 28 Aug 2023 08:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA22E81BC2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 735EBC0039;
	Mon, 28 Aug 2023 08:07:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 966EBC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 08:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67419415FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 08:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67419415FB
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Jcb7kitE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zgQF8axDjmK6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 08:07:17 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D4284150F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 08:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D4284150F
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68a410316a2so2055668b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 01:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693210037; x=1693814837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yix1QIvYkCVrQqH7rnPkzsKqXcnw1nS6UvJEKq5/GR4=;
 b=Jcb7kitEIxA1rzhwADOLGW6ciAuGuPi5fZ8+4lR6q37QimTtkuDb+cbceweB+2+Ovq
 dhPYJnhsrXiAg3VRpNhTLjD1w2J1sFZgPp+8eFgvzXigzHIft4yfQcT4DZzOSpTklhV4
 Nt6UGFgOlZkNsR41NlIpcqrGndM0GuYgrrGnynIxe5ov76gEYKhE4hl6iRoLlQ+tFz7r
 8k0ojwrZZx82uJXDSb9OJAczRlL5ae67YQU704yL1mpKRDy9TZ8GPpFmrlyauwNocETg
 lHEIMjilOOUwWIeymkG6/RVEWamc7PHkbEO2+8WCfzN1Wx1m69GUEi8bI2i1OFAnIPQy
 2yIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693210037; x=1693814837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yix1QIvYkCVrQqH7rnPkzsKqXcnw1nS6UvJEKq5/GR4=;
 b=hQ0Jz188VFfh/MOMVyro/TfvlYYuLN4T3PPb0xbjjk3x/mSLlyzIyMtaXbmlhjjSSF
 xA6xNtkgyueDAg0imnX683sVodAT5BHU0mY/OkvWF7TsY4NgOx6n3nF3+QyZxNNeBTTZ
 5a4P5z+FYwl1/haCTM0VXXeod+XiAVwpclXa8gNQgwwWAfWBUiSmuxlJCeXJ8N6hcsso
 rpXOMf0w7LiZepWmEAhW1+cHRuXNAF9SSnVAjwZMqltF/xLJL4rq6cUJxQVHmmxUI457
 ciFhQoPdsPRXP1IFBgh2GvnlS28TRT/2MBwEsyB4QBP/Wz4vbXXGMz4wdP5oKYxulWGI
 FnXw==
X-Gm-Message-State: AOJu0YyQgwEPcEmTLaz6Pk+7RyMjkKkpgVa/q9Xyx+686c8fMAI9homK
 swGgBYNWVdrxAtOlgva5ERQ=
X-Google-Smtp-Source: AGHT+IFfkMLCCPw0wLd/iVyqB/lRpa6XtXzGXkA0mEpPf50xM1LMkTq6yJJKL7ZXkb/hM6HSH0s1AQ==
X-Received: by 2002:a05:6a20:1615:b0:14d:f087:c0c7 with SMTP id
 l21-20020a056a20161500b0014df087c0c7mr430007pzj.58.1693210036806; 
 Mon, 28 Aug 2023 01:07:16 -0700 (PDT)
Received: from archlinux.srmu.edu.in ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170902cecc00b001bf10059251sm6585294plg.239.2023.08.28.01.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 01:07:16 -0700 (PDT)
From: Anshul <anshulusr@gmail.com>
To: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com
Subject: [PATCH] alpha/boot: fixes formatting issues in `main.c`
Date: Mon, 28 Aug 2023 13:36:59 +0530
Message-ID: <20230828080703.107031-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230828071829.64366-1-anshulusr@gmail.com>
References: <20230828071829.64366-1-anshulusr@gmail.com>
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
* [ERROR] 5 fixes are to pointer formatting
* [ERROR] Removed a trailing whitespace

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
