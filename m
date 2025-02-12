Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3592A1C9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 02:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739328321; cv=none; b=Bjc85ffY9q66JEdsX6/d0KPODwzRYZaLfJhzbhPwN3+TGjXG/lcaX6Eupwq08+RS32BwC7AmQjWzVzurV5/GzjrQFnnU2IG5q8YFGQef855HnOWoEznMd9+DW6SFv+NG+RTQvrvOlxVmHgsRykix4ekk9sXuFglKVToWW/GE2jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739328321; c=relaxed/simple;
	bh=Y8uKT3lIbBeW6dunJAyCD/0/Xq038g3KxjIo/rEsy+I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IY43rQa/j49jnk+zlKIAyzMEo7mkEjOguroK/JWygNnan9i3Ss5GyDuJV86+6wDeahrKZdLhXvHzQOcOdueXCpFW6gj+/WfZ3HBvs9+yzZ2plrBc2HXSl362KcZGL/tOP/PjxBL1iFOoqmb1xkI3SI50FRhDJwlmUA+Smdk22bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxEZ692B; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxEZ692B"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A242400FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 02:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbLnxN46hlTb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2025 02:45:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=sumyahoque2012@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ADA054010F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADA054010F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MxEZ692B
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id ADA054010F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 02:45:18 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21f7f03d856so62416035ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 18:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739328318; x=1739933118; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bsn+3EJD6bOCSM+OM+29GhkwVni35otfdYHlqCC0uXk=;
        b=MxEZ692Bjvycrz4AFjwXWGqXRACvWWNmnAPkWJeESHZn8zrBayeHZmmiV5+sLyF7AK
         ZyYK+gpLX4+0tEVwLOcrkrmpY9960Pp0b78kWp53Vxe9OjSFjJs5XDYv5icRDHxV3EQM
         h862/kSFMA9ejzuY+QJE/BjPxUW+83G/ihs5vkmlA0ijSqgk9MPx5TOuPQjbpTizlPoA
         xzNwNvwTCG32LWmfAqNvAAlTU+TGOUNV1m/xPLXn75jKzpNGByMs2EGTSQEx3VrOkPO2
         P5x7eL4jGlZP6/xArq9ep9RjLMXDon+RQ2qm/+H68DiYGMVoB1SU644B5qE6e7uIi9LS
         xv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739328318; x=1739933118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsn+3EJD6bOCSM+OM+29GhkwVni35otfdYHlqCC0uXk=;
        b=uoZA2BluYIK2CPP67UlXWPZElOYK8nJWzkXiqucwAAiDIEuLULj65Bp08Fk2SEYzT4
         atKYmd36pRQ3gd5tWYNXBdyETsfmLKw6vKR8dSAr4jIhwSfS4g7VDdKaJsz673xjNiPI
         YjHdvWWCwldDeaG+jS/zxsSGZx8yxRrvR1S4AUuR0dA4/wd1//KPLinh/Ptpj+qIn2i/
         jpkZU6GxFQYaRhOesBnCelwwOhWxKkfI8VzgG7V6OHXbBtSgtr1qqmhLglGv45UbRwos
         kzDWZKEjVYmXBhDs4qkrr20IQN59pcDyIW1fH4oBR9JLbj3DrJEVGzRjn57OIPSBSusM
         9SJg==
X-Gm-Message-State: AOJu0Yy59uwxnlJspEbERvoHP5Mqg04HDT84AZJzjIfih+Ij7+F7/Ror
	5prEJwf1JdlHSUlukgHtAO3bDT+tHOJvAFO6TljGRsOct1CzSAh/
X-Gm-Gg: ASbGncswgtNYW5Xt5hvlw8dLfDkMzqjYfw88+Yv2DM+V7koSZYrRus2trAHMytg8+M2
	pejHs6z1v093YF4jWW4SdL+nKO1uUt386iP2KrREPtnOFdXdJxFRn7j/C5RV6ppaEZJKK6WToeE
	6+jZoU3FqiFg206IlJspTzpVmzokf1YQQnVi1Eb1NQSZw5cPBT6M2Yn+g9DWuIQeFW9Bb6IAnZB
	QK2pPkeA1ETy6eC12HIyAT+KTBFuHl6IqM+t75V+abE54HJl3dhdnsUfxjh2GTS/3stEKlR4U51
	weSNRPFEcP14frDna7lL/8OgSrPgJziWWWdsXUMmGGaVNn10uUEkiGv41yuBhlsXt+xY7gg5LS1
	u2g==
X-Google-Smtp-Source: AGHT+IG3fBOWoxoU38jpoAX5aIvBYz86ORMHLSDzjs2tKvz88y785qUIypl3ris7BI7psgRaw4O2gw==
X-Received: by 2002:a17:902:cec8:b0:21e:ff3a:7593 with SMTP id d9443c01a7336-220bbab3572mr19310405ad.6.1739328317618;
        Tue, 11 Feb 2025 18:45:17 -0800 (PST)
Received: from node0.suho-241396.threadtune-pg0.clemson.cloudlab.us ([130.127.133.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f90c2e03dsm46375985ad.112.2025.02.11.18.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 18:45:16 -0800 (PST)
From: Sumya Hoque <sumyahoque2012@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Sumya Hoque <sumyahoque2012@gmail.com>
Subject: [PATCH] hello module is created
Date: Wed, 12 Feb 2025 02:45:13 +0000
Message-Id: <20250212024513.7864-1-sumyahoque2012@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Sumya Hoque <sumyahoque2012@gmail.com>
---
 linux_custom_modules/Makefile |  5 +++++
 linux_custom_modules/hello.c  | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 linux_custom_modules/Makefile
 create mode 100644 linux_custom_modules/hello.c

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

