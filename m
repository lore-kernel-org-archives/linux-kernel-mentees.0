Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F7F220F32
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 20:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753820602; cv=none; b=A/GSL2kqWpr5K38Fcng1CljcA+B5ihiXVGJjr/+K98R/RULMaQomwnOxStdxfASITTrjUTgXMulyws9fBK+uBMapjQfKSTbcNaU82UZ49pupD58qOVcG+NHq+idkO6T+HQH2Xc2ARD6jppPYji5ua0bPQ5p154RFL2QR/Bm4ruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753820602; c=relaxed/simple;
	bh=GixNGXRj4livKfq71OSDlsIDgdmvg0N6zZpSHWneGiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lVWjG70jt7+0rE+z9t2f9ZH81QNDmQRQB0pM6bsyNeeF04AdutJmd1lUXEPNFK2JbNuOFb9CS3wlz6LFxoZGUPLXoISAy9FR0B2NuiymC7mKTIY9ams/P+mlq6nCxwJXfS5JA8DXlethYvXsFvBYNN9QRGzAXuwSax8AioPQmds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1vavsmq; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1vavsmq"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748e63d4b05so3729723b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 13:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753820600; x=1754425400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=10SVXJxnwVRfhBtbYyI4DydR+X4zcFvZP8tSKUnSYsU=;
        b=U1vavsmqfXUk4BhlqLfGWQQF9P+2puXz+eJsldkC5tZCVJRfvDQdczS178WOfuPbLT
         sP8P3WxS83W2DAmhANbkaKCnSDT861Oh/TOoI6rLSHMCIEFkM/OWtdKSh/IwaaLIjgkk
         7dcQYDBVj1fSJMPfikjOyoxb3P+XXHmTcy8augOd+/SGzmjkWFDHeEKoPE7eZWrEQc3Y
         e4Ja7h/ouqXhss28EINRRJC4m+nClJgVEQOiL055FdEXyJkj8WwYZ2WGYhLcAYewe3/b
         YPPaYJNVxz89+LVPjBeG7WXQdeI+DNl4W4eUsnWipb6xpX+TYiwHBXqwGBkhqkeu+wfM
         9HjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753820600; x=1754425400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10SVXJxnwVRfhBtbYyI4DydR+X4zcFvZP8tSKUnSYsU=;
        b=fLZHt51vCO2gY757k2clIHZ2aYYjUSbfNG7OJ+btaF1uZu0XQGljvmPjopGtDUVivD
         WSVb4hdL08vmMX/5RC64ac1qG5HqPvqjGi/oTrMjo7MzQaKMhpgaoB9R//Wuq0mcI27i
         Fkv0wCNPlpQ1pxjk8nQ8yv9OHTCWaJdA2u6GUKjljokbqjGXpGO2tKaK7QurH0VvwU1L
         Zf6PVLGk+xE9YMNOr2/4oSfIXifgB1BlEAKIr3A7lZMOxN7ZM9cml3mVnbHs9t/vHPGS
         gV4GBNyUFrsSeBL+g+unwt4X4NVA+1UNF70fmYyadZIGCe7u0wiLsmn3hR8vc5+SyAHI
         cZcw==
X-Forwarded-Encrypted: i=1; AJvYcCXENWbnE00ZP53Ee+VovdXhPkOjKhNJlgo+S0VYAfyaP6NcbZh9sjrYMbRC1fIlkrm6WbGRe+bATbm56mcOnhsxpX7dxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAr7ITLZxVOlPkUz5X2sObbQeNcI3e1ymS7dR0pLSNxptPI38l
	I2GaIfx7FFbPpx2NNEkg+dypRgENVwbAIc8zMo/z1WDspsu4AwSvbe2xY4dE2LnNFQc=
X-Gm-Gg: ASbGncsaOAjZy1vL9dm4MvYVOafACgHR04RgiYMS7TGkOyJ+sE5VB/zPnLp5NjsuLcR
	aaJ84i5cJAD1BaJT1RLqZv2xRA3R0PHdTuwNQJoftuE6g7SLUDNGMTQYjR1eYSYzdMJTt38LVui
	g2qatoCud8QLbRuDSBmofH2jmeW1ZHaEqBoHyA2H4POVD79qycIfxNJ4Kng0Hf04uHBRPeevaos
	+39yZ1P4a1jF46Dp4Ji+rHP379cJpztMXNZRq2MmUAXu7Ogi7ejvFRYQS3fySeSuqs4ZvVWOSAS
	OZ8ch+34pBJSs6gGZcb/7XfK1oYLBKLLRATs5P2SJiKAYehRofGMYgdYdQiKX9dyOPwHVqDGd28
	hfK4M3+8cToE=
X-Google-Smtp-Source: AGHT+IH74R2tdtIKPkjuBMXxG5IH+go7b+x+2KT+WVJdAj3bp40X8QXULX/OKVxoRB3eDDXyhFq7wQ==
X-Received: by 2002:a05:6a20:7290:b0:21a:bdd2:c2f7 with SMTP id adf61e73a8af0-23dc0e1efa4mr1125745637.29.1753820599806;
        Tue, 29 Jul 2025 13:23:19 -0700 (PDT)
Received: from Arch ([103.87.142.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640adfbf87sm8831936b3a.71.2025.07.29.13.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 13:23:19 -0700 (PDT)
From: Ayash-Bera <ayashbera@gmail.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Cc: Ayash-Bera <ayashbera@gmail.com>
Subject: [PATCH] fixed typo in the DRM UAPI documentation.
Date: Wed, 30 Jul 2025 01:50:48 +0530
Message-ID: <20250729202123.116565-1-ayashbera@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fixed a minor typo for the drm-uapi documentation 

Signed-off-by: Ayash-Bera <ayashbera@gmail.com>
---
 Documentation/gpu/drm-uapi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 69f72e71a96e..64e002c6383c 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -518,7 +518,7 @@ ENOSPC:
 EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
-        this when called by unpriviledged clients. There's no clear
+        this when called by unprivileged clients. There's no clear
         difference between EACCES and EPERM.
 
 ENODEV:
-- 
2.50.1

