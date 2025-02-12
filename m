Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9341F2367
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 04:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739335241; cv=none; b=dveIjNBsJTxvZn6Lae9W02B8QAE9ebjlu72gsRuDIoCtwllbKmACvL/YHUhZh92G46TVjOanpxkT4Z5vPpX5b8WxI6XLfRmnD0g60DOLT3BB0vp5tlhH2mAW9++LuigehSPb/rntSUV8pSUMJerWcAOQ9cxiE5yQg+La3XxE1gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739335241; c=relaxed/simple;
	bh=GQqdzZPIAIggUWpGCgCKzfH4Hotinb9akcUZvY2UlkM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Bu64bFK4pk/dCVD+DcNNJbydPM+w/yFZpSBfiSU35lOBZKoF8IauzedgVRu9pbz3J51Pw1/1mhwSBjKciaX4XB4B371orbYqFW1e/CAGTgs35TJrtL0gRH1LIP8cRxEmbAU4TLyJWfq7gIvlXFz2anIbT9jDGlkQedF+DXAw6io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eY4txLRg; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eY4txLRg"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9EAB4028F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 04:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMtzqp4OEIpR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2025 04:40:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=sumyahoque2012@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA4C340268
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA4C340268
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eY4txLRg
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CA4C340268
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 04:40:38 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7c060568959so264257785a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 20:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739335237; x=1739940037; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ynyicsENVsenHjQkFCw7feB6xdFiDYdCSiUZecZY8ag=;
        b=eY4txLRgdH90ZCxbRP+rDbU1SfvwWQfab6y+GxoU8IYm335TBGHn8iaCtb9F4N3g3F
         9/N7TIlv9PYTVcak7itykImm01KiomftPD3I0NsDqklQJuT5VegiDLb1VmbzfsWtmutv
         OcS/qzAhs8NWhbNWomGjBPmckqnbytm5+oD1+WdAQ9aruEJI4RNHWZfqHmzw87eqHjRP
         lRyFhh8SiQ5I+DuuDMBc/9v0xSEu2iDqWYkgOabyEEhWGsV3UgzxQS/k2Sl2AwM8juND
         opMc05OpmxU2x61O9zGwVZH6GlLtMXZVQLIBc84uKeGDSh+uhlNANlX2xCxlyPkBP0tF
         3YpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739335237; x=1739940037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynyicsENVsenHjQkFCw7feB6xdFiDYdCSiUZecZY8ag=;
        b=htGkQGTNprvttRe7BUqMECZVvs1T4b1MpGa5kdQNLra4puvICdREjsYLaHU2k6HpPT
         NKGi9rnsNotxnn+XQMabkIAL2+tEcmrUY9vjt5kW68khvzO3hKijJgWFCMtpHw2gR3KL
         2jTtxUdiw5K3oYP+QlOY5OI+t1pFEFnavF0tX3tBgfzA7GXB+r4zgBzqo7pc2IYfa7JS
         mNCKOEvBiO+5IgbrDmROsdn7gH+1GYN8g2SItgOcR3JQYgMqtqT/J0Xh2l8o6jzIheZW
         InxmiR38VqKRtlrpzkH/5fl8FQ5nJwZ5TxP3taYPC/zBssPnvePkj17CxnZAahLwRuM+
         4gHA==
X-Gm-Message-State: AOJu0YyiatzhtwZkmRJI5oyOdfV4MtKa4dn4FMhD3nNjYgHgwg3SKyki
	NoQoYJIUfrI1QeILZeESGDkzAP9uf99RXhzKWOrEgXXRH2WCpx9o
X-Gm-Gg: ASbGncs1D2XOCQJ1FtahKXU9tODBlldD24WFdigsKgzTFubJ75hiWTtF9kx7RnZZNhe
	ctpfZD31ISyL/pX2h7/sTh4gnvfhweNM+3kCIsu27QtNc352M7bpXpTmV3e3XyIiy1Zp7jr8QWB
	jlk7Zq0PM40atyetpMevRm8aALYhoeq+a46ukHlzo8UxaMz614gvbZCDx9QCYPpJWCiK/tMIjAd
	+fCNFfi/Nx6zIQtoVcsI1VKVsgc2V5NHFYVCsC6b+kSGy18jK3X9e3y9yCzZF5VPMy9AOy87w9f
	vQe51UDSUlif57hunrBMbGevdeufE4KupDJjda+c/Wdwpddea3CY1qz3DcthARZ/oDeGQA5NjF5
	EOQ==
X-Google-Smtp-Source: AGHT+IEg+iIHMV2+E4/ZL7FCHQMKo3I2AYftjrs5Qc7IResMhLGR/AbvHvbx7gW0Sau+EeavSUxCeA==
X-Received: by 2002:a05:620a:461f:b0:7ac:bb00:cd42 with SMTP id af79cd13be357-7c06fc7f1famr334483685a.27.1739335237317;
        Tue, 11 Feb 2025 20:40:37 -0800 (PST)
Received: from node0.suho-241396.threadtune-pg0.clemson.cloudlab.us ([130.127.133.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e12360sm789386385a.53.2025.02.11.20.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 20:40:36 -0800 (PST)
From: Sumya Hoque <sumyahoque2012@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Sumya Hoque <sumyahoque2012@gmail.com>
Subject: [PATCH] Added module parameters to the hello modlue
Date: Wed, 12 Feb 2025 04:40:20 +0000
Message-Id: <20250212044020.9095-1-sumyahoque2012@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I’ve followed these steps to add module parameters and capture the dmesg output:

I included the module.h header and used the module_param() macro to take the argument value as input from the command line. At runtime, insmod will take the input for the "name" variable. The default value is "World" if no input is provided.

Dmesg Output: 

[27901.755598] Removing module... Goodbye World!
[27978.985148] Loading module... Hello Sumya

Signed-off-by: Sumya Hoque <sumyahoque2012@gmail.com>
---
 linux_custom_modules/hello.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux_custom_modules/hello.c b/linux_custom_modules/hello.c
index a05727d605e3..178b717e1de1 100644
--- a/linux_custom_modules/hello.c
+++ b/linux_custom_modules/hello.c
@@ -1,8 +1,11 @@
 #include <linux/module.h>
 #include <linux/printk.h>
+#include <linux/kernel.h>
+char *name = "World";
+module_param(name, charp, 0000);
 int hello(void)
 {
-        printk(KERN_INFO "Loading module... Hello World!\n");
+        printk(KERN_INFO "Loading module... Hello %s\n", name);
 
         return 0;
 }
-- 
2.34.1

