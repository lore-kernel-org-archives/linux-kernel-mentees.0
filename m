Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E029283CAF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761470002; cv=none; b=DGbFp81CzxR4x536KfBibkCb2gTP9PU6XBd07dddvwrXQW/uapUG+ZIqUBKWH94IdBZKKntzKAQzbRpD662R2DA26CTy0OnE4yg7/nK4zjD7obTVLfT2jVCOLFxXW3aTFG+WOrboBOl1DozWJwlqJKB1OYZFKtV4RXvdxYAUSto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761470002; c=relaxed/simple;
	bh=5b5PYMxopEb8YY4FdGelcJUO0Yvn+/7BT0Giy57xNWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYi0uQ8Z8u+lXSXSHGrtfJiT+tM7Dz6qhMmL+WL3HNjcZLvmFmHoLuWAIsHYQuCsJ2jR/jnI8+Pjae3yMrJCvso6G/sHVX0Vl5j+eRmuxCW9+TjKkzlWQVyHO+PwpW2ddcVw3mvFZFVIJ7peO4gIQAOux5kiMcqUlF9DNLQd+YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WK2m16bd; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WK2m16bd"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA73540BFE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 09:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GhtJuX_Ajrx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Oct 2025 09:13:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16B8540079
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16B8540079
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WK2m16bd
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 16B8540079
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 09:13:19 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-33255011eafso3410321a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 02:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761469999; x=1762074799; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMX23+YLvbC4KKYE3owkIF/POC5qa9l7q+YDn+rGhBs=;
        b=WK2m16bd5TZ81zZPxHTw7xW5kbscUnSwPi7wB3Fbab9vn1RYuW5QI2//SirzSs6xRG
         8Ak2VdR7JYYPce3Gg4ca/SQi2d1GlsnrRnxGOvn1N8W72cjQbAFqAYWlatXr9IEBwbpb
         ryF/GOyuXppzocE+CFDyV8TrV5teYcABvRUNsMfnEUt37xsMQ4R3QlXajOzRfSZqXbgk
         tIAiamhQB2E91yo219TdPSjTEiEbYw9z7boMGiE9ob6lN/mWYm1kDrNz+vuhW/Ob9stw
         NM6JIfbDws+ttnuQ0gHWsECXw4YRH7CxOQR6gnlYoegViiEPLrXbacMbuUBdvHX9YuhO
         t4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761469999; x=1762074799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMX23+YLvbC4KKYE3owkIF/POC5qa9l7q+YDn+rGhBs=;
        b=NCgVS3vab7YZOctSoO9c/XpgYcSVZVjuK+bSsbPMOSZcOOOdVDkHj6WeipybwkN6aK
         sIsdq/kzFwYXSgvxWqP/TSFe+wBe/tjyh63IIZIqfhDoPsRkOxHvb/CeI++BTbB+JUCg
         8x4k/mcaDNPlythYKc9v93a+gkyMhi+Dmyq85TcL1TD7EF7TaYLpa9Qi73eipbGoMR2b
         mpS4nYcdKWXxOH8b+k9cjQCQgK5WRdj8HIGSk5T1jh2v/8W1HEbSbVIaAvYGZBN7URoo
         Ah5ZWgQur6Q3TzIwMDVf4BVIW1YwyrHRfnSVcXUHC3ufG/sB5MBL+cuzYznL0qZRsCJm
         yNEg==
X-Forwarded-Encrypted: i=1; AJvYcCVabpkHjb7Yo9ktoSkOAvlVt/4D87+D2qfaqawAJjxKNRKQS3YkCk7viFKbabKu/nQnKD7OJk48bUOrmCT5yl5FZoP3Og==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxN8Vlnk+Yl8ZJPOAMxwpPvT67hbNlHQ0ljWNSBWIgEUOf3wgZf
	0yq7A/nUM8R9MZ78FsiKxorwhBnr08II+4LJIx8neewkIr22Xa8bWHZF
X-Gm-Gg: ASbGnctTlZD1svzNR9IQVKiOLj+ZAi57M56FBAUii6TR8B3BviPedDasV1+8EengtJj
	ECJKEzJwus76vaxPOUSPBJOeYE5kw8WqMNevD1HAsMntAfnIj95ID7wArhj12o7nU/t+BkNb1f6
	rF6sR2Q5F6w9sgjuPM1r1WUabQ2hitOy6MD0S4+j4qYdKmSDDsUKwi5cgLhY9RzEQtZnVvCjBTY
	gvjVc2eFVcmzEO+q6U/GCj9GtFkNQGMBUUQPa7UsO4duP+Y1xjXBYB1DEhcUUjhfD+E7Q5eJCbL
	cQuHbhWonxZgtnR6Q0nWlxoS1dwru0qW7GGLFL48pYuw2ZxYkLMMxhwDr0yTygaph2/XlsQikb2
	jBu0KK661MQUSRpHvZUTKgkOE/PiRep++qDbUYrVyMmM5AJQ+EX5z6lbYBl0y8NdFdmGCjI4Y21
	NT/yyxQrFPxrDR9vj0eBrALjD2zJejz4GzRPHKJdmnBoR1+VfFXK49sN4=
X-Google-Smtp-Source: AGHT+IFQFXNUYIY4vSpSr/xv31CBewG848HOy0cOfx8lxhYhMoQ5KdF68P3/KWEwPTs9NKzCL3WWXg==
X-Received: by 2002:a17:90b:5386:b0:33b:b308:7655 with SMTP id 98e67ed59e1d1-33bcf861fc3mr44925100a91.8.1761469999250;
        Sun, 26 Oct 2025 02:13:19 -0700 (PDT)
Received: from prakrititz-UB.. ([2a09:bac1:36e0:1c0::10c:2f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a42aa5d9a6sm789558b3a.62.2025.10.26.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 02:13:18 -0700 (PDT)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Jiri Olsa <olsajiri@gmail.com>,
	sam@gentoo.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>
Subject: [PATCH v2] selftests/seccomp: fix pointer type mismatch in UPROBE test
Date: Sun, 26 Oct 2025 14:42:33 +0530
Message-ID: <20251026091232.166638-2-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aP0-k3vlEEWNUtF8@krava>
References: <aP0-k3vlEEWNUtF8@krava>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix compilation error in UPROBE_setup caused by pointer type mismatch
in the ternary expression when compiled with -fcf-protection. The
probed_uprobe function pointer has the __attribute__((nocf_check))
attribute, which causes the conditional operator to fail when combined
with the regular probed_uretprobe function pointer:

  seccomp_bpf.c:5175:74: error: pointer type mismatch in conditional
  expression [-Wincompatible-pointer-types]

Cast both function pointers to 'const void *' to match the expected
parameter type of get_uprobe_offset(), resolving the type mismatch
while preserving the function selection logic.

This error appears with compilers that enable Control Flow Integrity
(CFI) protection via -fcf-protection, such as Clang 19.1.2 (default
on Fedora).

Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 874f17763536..e13ffe18ef95 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -5172,7 +5172,8 @@ FIXTURE_SETUP(UPROBE)
 		ASSERT_GE(bit, 0);
 	}
 
-	offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
+	offset = get_uprobe_offset(variant->uretprobe ?
+		(const void *)probed_uretprobe : (const void *)probed_uprobe);
 	ASSERT_GE(offset, 0);
 
 	if (variant->uretprobe)
-- 
2.48.1

