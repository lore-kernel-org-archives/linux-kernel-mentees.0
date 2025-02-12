Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626F288B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 02:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327870; cv=none; b=L9SL1qA9aE/PFOWQdebeAKaPlXXwPJ2dqUkHoQ/KlJaDupKGEj33J2HgrTv2PCk0R09dY1rcKrmGiJ0ubc6rzFGfXAWreBa2ED5EMCuDGBJV1gM1mwmVePvm7cvf2JJ2Cm3PFIUvu8VpGBTZJCMDiEHBo1hUEcN1veo2nMYxZWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327870; c=relaxed/simple;
	bh=VjKgj7SfISGH2FETU55PE+elzrR4LL7qIQhzF26DCsk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Cksdfd86W5PbPTn3xCJfxwmQEWTV4uYaU6cfq9QycOTyq+sJ3C1oEqFNxl0/WO368O7jC4m4MeUfbkxEKPy+NYXKy+qHf+8WHMh592O0SvLIHFW3dZitYE9tsvA2UyqDazuHIaVYcx4e3jxO/eNDQ3EIfSaNLuFy5qK6v72bvj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayTmz9bc; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayTmz9bc"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B6C160A4F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 02:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jx-PoTa4llZh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2025 02:37:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=sumyahoque2012@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8FEFF6079D
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FEFF6079D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ayTmz9bc
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8FEFF6079D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 02:37:48 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2fa1c093d6eso7571984a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 18:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739327868; x=1739932668; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:signed-off-by:mime-version:message-id
         :date:subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XhNn/A+L6PrmGeUpd9A2P5colcaOH+Kok8o5u8YoNew=;
        b=ayTmz9bcA1nw9t/m35q/6pmVqEzgj3r3+1FMBPr9ebv4mmXkuXYy+HBPczFAcBxqr4
         +KPoJi9nHXFw9ZjSh3L7lk5Cvf1VBvk4CJLlH7MfrpYb4x8LXn1kdfI1GD+OKhqxAul/
         sGiUDK2XM7aFeOh06apaHfs+V9CCAQV87ytA2KGckmUvcIeYDmj1jlpJiG9nIzyziyAC
         GJCQXD20h4MtvedQ5pOgsvmHEdnlRyKAHRLCkrUHKkXuLAyYqzhum8JcxMwEIgdtYwP/
         T3TQxDS+ANVJpuUExCEstcnpAKj0Nxz/G0pqmcQ/pZ8ilzsEsUan9FjS5j5Bqipg6n/w
         fzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739327868; x=1739932668;
        h=content-transfer-encoding:signed-off-by:mime-version:message-id
         :date:subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhNn/A+L6PrmGeUpd9A2P5colcaOH+Kok8o5u8YoNew=;
        b=K30KH9O9D3MKMPFxvZ7ZVPGWqmgEsgn931CR9t3nJlfwE1RcMFyJ2+VLjnhIErbBJf
         RjNjUfnBByNLRrTWlQxWEkkktQkVeZ9hkc/EZH2PN1kdl+iJUTLcqRhHKWfUO6IJhvoe
         DS/HtfDUufTijHuqZG/0Ig96YDYucf+qLvQAjRqSS09NyOjgp3ouoFRIHHIqG1AmADub
         MPgqpfIE15ac67DeaC+giF+uMziKi5Wn6ELXM4+QNh2JZaiAWcSx7KTYNHiL6Rrx5n2q
         9hJzrecTNCLqZ6nVtlGnGm8SOf6Sw1QPy1R1bsrHeFapTBvqwoOEIvIh5Vqq5sPBMxLR
         xdeQ==
X-Gm-Message-State: AOJu0YxvbSFspwNVaR6ck9D6OLvSZ5aJpDQl3PqnDp7BlQGvpkMpFbb6
	LiKnTmM6Q30yRZejc9rCQFxNzsuFv74eme/GrnBJZWC15Ms+Lxxw
X-Gm-Gg: ASbGncv5wUXABxJFLvNtsXCAP8fH78DgNERcBpswsl+nSeK9lyM96Bsgf2v69W+Y5VV
	SCnztwMid9eBgpZ9NXkfcV9dwXtm48TcunvVi1e4M7S72atrS3WgJ7VV2M3+L3IoQb8XJT7O8v7
	KQX/7iP6JbgJCrlyKm49qaFdGmnFm+NZGr+TtC8eGq4oKoYGCNLMNHm8I5ELFzi4AHSI/2QINEc
	fiESR1EDfmSstTKG5NQ059Q0VrLx3cMgr4nOokmt3uqQ5y1js57kjA7IlxlQzbrpNkNGvc0kDGi
	788828kv+x1OHIJQRPAItYY+Cjfp+tQ2jjVo6WGzFWKuSTW4VAR3ed5B6+wIj60F4Ku1Ptyjf2R
	G+A==
X-Google-Smtp-Source: AGHT+IGU5n2pQx9TR/545sL75vRUhcUlXgIUvCsUIlDwh4l87tLN8yoQc1E8SWOYF8bmXjCDwAsHEA==
X-Received: by 2002:a17:90b:4f8b:b0:2ee:d7d3:3008 with SMTP id 98e67ed59e1d1-2fbf5bf76d7mr2905255a91.12.1739327867416;
        Tue, 11 Feb 2025 18:37:47 -0800 (PST)
Received: from node0.suho-241396.threadtune-pg0.clemson.cloudlab.us ([130.127.133.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220bf2010b1sm2183875ad.6.2025.02.11.18.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 18:37:46 -0800 (PST)
From: Sumya Hoque <sumyahoque2012@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Sumya Hoque <sumyahoque2012@gmail.com>
Subject: [PATCH] hello module is created
Date: Wed, 12 Feb 2025 02:37:31 +0000
Message-Id: <20250212023731.7777-1-sumyahoque2012@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Signed-off-by: Sumya Hoque <sumyahoque2012@gmail.com>
Content-Transfer-Encoding: 8bit

diff --git a/linux_custom_modules/Makefile b/linux_custom_modules/Makefile
new file mode 100644
index 000000000000..adc226c210d6
--- /dev/null
+++ b/linux_custom_modules/Makefile
@@ -0,0 +1,5 @@
+obj-m += hello.o
+all:
+	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
+clean:
+	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
diff --git a/linux_custom_modules/hello.c b/linux_custom_modules/hello.c
new file mode 100644
index 000000000000..a05727d605e3
--- /dev/null
+++ b/linux_custom_modules/hello.c
@@ -0,0 +1,20 @@
+#include <linux/module.h>
+#include <linux/printk.h>
+int hello(void)
+{
+        printk(KERN_INFO "Loading module... Hello World!\n");
+
+        return 0;
+}
+
+void goodbye(void)
+{
+        printk(KERN_INFO "Removing module... Goodbye World!\n");
+}
+
+module_init(hello);
+module_exit(goodbye);
+MODULE_DESCRIPTION("A basic Hello World module");
+MODULE_AUTHOR("sumya");
+MODULE_LICENSE("GPL");
+
-- 
2.34.1

