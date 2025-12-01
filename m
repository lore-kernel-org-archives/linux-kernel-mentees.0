Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E54524677D
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Dec 2025 20:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621451; cv=none; b=tgYwaazNEMcTG3fbgpQJ26QU+QFlnSgYOnu5VN5Qk8JUY45/LwXgHk1xUvTllrYCsY+s2kusjQMFwLdgjrTSrgsrSN9vnIWe6mRUAiPJZqGTfd4WlZ0BjW/ZLPJteOQZlsmVZeWTBtFaIciC6w1N7ouBjV+5nkRq4HabEoiYKlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621451; c=relaxed/simple;
	bh=t1stNn2JIg8QY9Rz687/0JNAKdfT4fwmYs5nGW+tfxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4V/pLv1Ok13j6pjvR2ffpN4mD+Q6nJiasAA3yyhI1i+bNESkSj+RJRQQvC84z+lrsxlIONasptubb+rWIF9xdOwGada9jzHcpID2uJXqijijkXhFOtoPne4vjc1vmGAE7r2xmC3yefLKwlwS/rKbtpN83l71FLQULD7/wZsnC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6nIoFF1; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6nIoFF1"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso4049689b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 01 Dec 2025 12:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621449; x=1765226249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5EvZHP/L8HTDXW6Wdjo3Us9Wv7cX8ga9zfOaw1spm8=;
        b=N6nIoFF19QRSl8P6j3jtcIap8Fk52p/HYKkuZQc62xtn3xazByM5JWVn/NpaNs0AS8
         kGdqVraQqLqWN3oUfjOL7Ma683hRFCgtE3C0g0VBB9ZwFZH7f6V7r+tbzgpt/DdMAUwD
         KZD9ZfUIRcB3oWu+11C71642tJ9BG+HlejzRl9oUdI8wnY72JiIV2pVWXvBTnHXTS5Tt
         o6mn48hDbEkO9PmbR70/PTWmFNtNPo9h7ifd3JiUyZwGGHz6jq0UfJqYx/Anga8TQaqZ
         UccU7/akOzapa86fOxlZOt/TJvB+FnKdOEyGKcsZDrsI4yrOn1jznZut25yaYJBBW7fN
         8XYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621449; x=1765226249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T5EvZHP/L8HTDXW6Wdjo3Us9Wv7cX8ga9zfOaw1spm8=;
        b=q4Cek0suuPLOuspEWAVN6X69wcXdJYuT8MfiMMkp8IkWHsAv2UxrAIj7Zntuz8cg/U
         Oug4C6CJjex98aQxyuicDpyYLKU98KmRXFGJ7p0py/lA3addUcbVZblkZCgnRn16/A62
         aPLVU/s1ZUe2XVop+xJeAAxq2W6Zh2Q0YBGswliqb/UREcmzxQUSJqlxX2y3eEGrN7RE
         fxiEhapY38Jx2bnpB2DXQuMhAXPQk/j7UYvP9c6SF/c4WgDLuGbbYtsfHvMs4J8ulabq
         OXe+anIgK+r4NQiRMfhINAYomCnyD8HgK1RpyP3ceDKJskRR+4xQMOEipQeHSvVP9HWf
         dSfA==
X-Forwarded-Encrypted: i=1; AJvYcCV1gj6HCwnuPEVz/tUU1vSsFaL1Pd5WI3dvUwXPHVp4guyXDk4NYOpYcFd8fX6icAAL6AyjL9WVWGS+5qZos6CR5WFRjw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5fq+1rHXmA6kAsx84DHMWFLSJVItfQrHwtg11eVLr39qLG8zo
	V9/cM/fS1Hm8h4Y9o8ntnpMvSbSeBJ0QNTMMyg3T47MGEvnES7lWIQRR
X-Gm-Gg: ASbGncusIMiAMvbyp9aCLLS/hTo0c+jplx/5a+X2Rt5LpSCq/3N53LGZ/8oIyBRjrcc
	VaRa6rd+CXqQtIDJ6w9OLC+VefhiJ9J1TjcOOvOf9+cFxcn5tjCmexLeO132clMnHZoqQbGoumQ
	ekDX1i5bVch4MhBnO8/lcYm0/HA/fMrwpIvs/vGTD/oBayGf89tBtZ0CL5YACtvAjP6cIdpl9NK
	N/4GDvlI3q6QmqYbHltt9CzlTLFc9e6VMp2v+baL9oJuliQM7sTbB8dQLRZvHeatJodVJxQAkF8
	FO5xEiARU+Z/1DokFy3pNwAHLxnAO98xJpRAIrc81gySFXFX0ksNU1dX71hjrOQWNj0Ir0G0s1n
	4xh4hGL87gpDnLaDD20dQPDekWQ6QafgUCfwGczZAMFX1CTfxQfQHULIwXQWtHTEuU1FvNQKLi9
	8q7qLS+b40VtRw0cu+KRgQk+FZaVvg4uUPcuQ=
X-Google-Smtp-Source: AGHT+IGGWkNqfxSsX6EGB7T9IHuppSj4Hv0wTpEGLyZpu3BctLYgLyzqhlB5dEqW3K2Y4RA3M15dJg==
X-Received: by 2002:a05:6a20:a126:b0:350:55e0:5522 with SMTP id adf61e73a8af0-36150ef925dmr45927393637.37.1764621449336;
        Mon, 01 Dec 2025 12:37:29 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm13113892a12.3.2025.12.01.12.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:37:29 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH v2 1/6] usb: gadget: dummy_hcd: replace symbolic permissions (S_IRUGO) with octal (0444)
Date: Tue,  2 Dec 2025 02:07:10 +0530
Message-ID: <20251201203715.17768-2-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201203715.17768-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace existing symbolic permissions S_IRUGO (Read-only) with octal
permission 0444. This makes it much easier to read and and is consistent
with the kernel coding style.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 1cefca660..fadd3d0c6 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -73,11 +73,11 @@ static struct dummy_hcd_module_parameters mod_data = {
 	.is_high_speed = true,
 	.num = 1,
 };
-module_param_named(is_super_speed, mod_data.is_super_speed, bool, S_IRUGO);
+module_param_named(is_super_speed, mod_data.is_super_speed, bool, 0444);
 MODULE_PARM_DESC(is_super_speed, "true to simulate SuperSpeed connection");
-module_param_named(is_high_speed, mod_data.is_high_speed, bool, S_IRUGO);
+module_param_named(is_high_speed, mod_data.is_high_speed, bool, 0444);
 MODULE_PARM_DESC(is_high_speed, "true to simulate HighSpeed connection");
-module_param_named(num, mod_data.num, uint, S_IRUGO);
+module_param_named(num, mod_data.num, uint, 0444);
 MODULE_PARM_DESC(num, "number of emulated controllers");
 /*-------------------------------------------------------------------------*/
 
-- 
2.43.0

