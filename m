Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A145E1F8937
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 05:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739338512; cv=none; b=SAiSowlkrZUq0zbvSpX9o+HI7hxPqNY5DdhokC0lJ4mOambv37/7QZaivRk7X1jpMRVu5CKSnIMekXZ9Ngg3rx+bx0GGsRTB7ZoE1rmZKVsRuXSQwGA3Vojjbi37V+0AjxZjVYLUX1YBwCv7BNwrJKsvtOGhv3Yodna20EexK+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739338512; c=relaxed/simple;
	bh=JWxkMF5uKdeZramVrEzHDjnAZYjZBGYqNV5louLjLKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ndLsKx8h/ueKliGXhq5t8Yr4QE994XZGzaHXLN2I5pG38teAgNyajsz2c/R4/R7T0gjOjWJF6hhXrmqbRPiuwXxNNeuC0EP89ZxT9smOEHocK03SLuyYPJvyoZQFQClUVrO1m3h5tWiRU0zFCt7OpCjVLPSvuYO8rUy/tgS2eQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFmQfLEt; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFmQfLEt"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B80541284
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 05:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwvBSo0Vkrtc for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2025 05:35:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=sumyahoque2012@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C6E54126F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C6E54126F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fFmQfLEt
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0C6E54126F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 05:35:09 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c05c22d32aso516574785a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 21:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739338508; x=1739943308; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GmxR29FTafR07WbMVaxmVGbNDXWyjgasBB4hMlHpvOU=;
        b=fFmQfLEt8bTtgUkASpMYpoeR0LNltOpyYOZferaFQtBjdz67e8sWWxAMWj6J6bxR3S
         3TgWi4jmlxb1juZW9v23pqQKDmosBgE1o5RXLGbIFhmUJcQAKJ2Wjsvew6civZ0lXKEn
         0nvLGbRvcdJMbI5+qXUqFjGcq07hV6dAgpkq8/8EAGZL+9rmprP264vhBloM7nUN78gE
         QL85DuNbPBImiRoDxdllxFjUjVpIcsi5AzbCaov6It+LEaRfDDA5teIrJ0rfnFu403ug
         JJhVPFqs5UZ7sYtQKsUr646lWAEI3LYtPWaN5VdytXlV8EZ6ugBcN83BasXJdncbGqhO
         f1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739338508; x=1739943308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmxR29FTafR07WbMVaxmVGbNDXWyjgasBB4hMlHpvOU=;
        b=sniPUKCQK1vXNxBMg+VHDMB63Y6Qwj+qk/CJjyF5RA1zFBFwL8wLRhvXG6+7hJyycQ
         TrGFziGnd7LyA0x1PTGysQFmHVWy8wWdcCVD0OJ0H2p/oUVvQsywLTk2dF3URGHnAL/d
         yRNGdp0TcRBUBcLHiIGFycrkjlswXNg1AM8IT8PpbygXfNmvt22IetJHQJbiM8clIy3j
         99PSEUUfBSnq++GaoPCFXkyhNjeGrMjE4fniWbyylIHx0PLDnFF6Z9AGX2rfW1/tEoZ7
         Lzq49xO9RwwFoqiRDTbsuVUhqH/lxreY6LazwX0CfJ1fXF7QfK+/KLsiWY4sDwg4Cw4v
         N6ng==
X-Gm-Message-State: AOJu0YxPP0tU80BsRxw9lUTGOnQmcopVhjktGCZUMbWs1b2L/T+Vm3rU
	yK2Q9oBT6kVr5osDLWAXJV7rYYY4OhXeGeUX42byxdPy3hqHyt56
X-Gm-Gg: ASbGncv95pD4S5PWKdw9+NnBfC+U0axqvNsTktyP6euJpKOepRl9dT7F7cl+/+cU7hu
	oPT1sTWboEotracHRzeqnqL0T4IemOLjDxn1DAb0VMxtmdUvdkRGfogGCTh8xeDdxyeQv5YRxmc
	nR4K19byiwbKwbaJIPH8my65y0aVqHZwlBptwvJOEDhutYcWfJAPLplLwc8XVvRmvhnXjnNMK0k
	wyyIMGG9ZH1kW7GRJ2VbDGuUiR6dNUeAA/3aIVNbAewzA2KNyiWC1EVOy/VbRlIoqPWJ4piWqP1
	a3LX6z2Vqj/cr6djSdx58jeCeUWSkWXObGI49uZeLtAg7IiYt37iTDUuqjQ7ETL2JUxpm7jVL6i
	5LQ==
X-Google-Smtp-Source: AGHT+IHOguQHnwx9qRRn8SqH9W59P+pc2fxLf5QDOh3gxWqJF7SAc4r+eJi2te1tq4g0teZ2k9Vrnw==
X-Received: by 2002:a05:620a:2b44:b0:7c0:67f3:de70 with SMTP id af79cd13be357-7c06fc4dc74mr355866785a.7.1739338508595;
        Tue, 11 Feb 2025 21:35:08 -0800 (PST)
Received: from node0.suho-241396.threadtune-pg0.clemson.cloudlab.us ([130.127.133.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041ded0dcsm804365285a.9.2025.02.11.21.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 21:35:07 -0800 (PST)
From: Sumya Hoque <sumyahoque2012@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Sumya Hoque <sumyahoque2012@gmail.com>
Subject: [PATCH] Added module params and fixed checkpath errors
Date: Wed, 12 Feb 2025 05:35:05 +0000
Message-Id: <20250212053505.10129-1-sumyahoque2012@gmail.com>
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

[32002.988222] Removing module... Goodbye World!
[32026.041939] Loading module... Hello Sumya

Signed-off-by: Sumya Hoque <sumyahoque2012@gmail.com>
---
 linux_custom_modules/hello.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/linux_custom_modules/hello.c b/linux_custom_modules/hello.c
index 178b717e1de1..b60c7b5f6ee9 100644
--- a/linux_custom_modules/hello.c
+++ b/linux_custom_modules/hello.c
@@ -1,18 +1,17 @@
 #include <linux/module.h>
 #include <linux/printk.h>
 #include <linux/kernel.h>
-char *name = "World";
-module_param(name, charp, 0000);
+char *my_name = "World";
+module_param(my_name, charp, 0000);
 int hello(void)
 {
-        printk(KERN_INFO "Loading module... Hello %s\n", name);
-
-        return 0;
+	printk(KERN_INFO "Loading module... Hello %s\n", my_name);
+	return 0;
 }
 
 void goodbye(void)
 {
-        printk(KERN_INFO "Removing module... Goodbye World!\n");
+	printk(KERN_INFO "Removing module... Goodbye World!\n");
 }
 
 module_init(hello);
@@ -20,4 +19,3 @@ module_exit(goodbye);
 MODULE_DESCRIPTION("A basic Hello World module");
 MODULE_AUTHOR("sumya");
 MODULE_LICENSE("GPL");
-
-- 
2.34.1

