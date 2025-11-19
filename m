Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C28364032
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557741; cv=none; b=KPxyflZPoN6abnmN3OO8Z4QPtTaa7QFrBoxzmzpmfislhNe7acfwCIB9zga64pLAoO5CbAyadyqvQ0aF2/OcQpC94DdPMn2rDSxZQeqR651WmzkIMBFd1lZC2pHB28nEO2Um8Az2RQBIxynKY3K0cNZaQhJXuZLmiwoXRRk2yyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557741; c=relaxed/simple;
	bh=HTFla0RytuoS9NHA5emWBBtLMkkNBBwOu1BiSS4pxwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPV/TZa3kX+m9wqZE7GVzJyJB56ZJ26FUmF17eVxkcxOuRoCStXpvt2LqTdVH8uK80FslhK08KX+wKJI5PiH9YbSOk9JCtoy2c7eWkCC/BLhD9fidLCOfBi3pmWgYyLN/HoFoXV0YRFrPLdJ46FJbVggE/jcHycQSDOjVwyQADo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vq/7y7IN; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq/7y7IN"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so5795265b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 05:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557739; x=1764162539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub7Iycd50pT3ykKqItSRTUhlcBrC3jU3CKZCM97yyEA=;
        b=Vq/7y7INFTvQgkG7Nes32ZotQl6lbPCPxAYgN7c4E/Ag7mVngMCzhJqDQ2WHNYPkpk
         mXYKHqgF7L7SSgkgp78ss5umpMd9n9XJfoko97WyaerA41zfjPeboxuv1Mr5yX3qGyad
         lDcZU49pMvpHqdjGffFVFAwsz76PA3EFKCAUA04l6iFZAovUx6BRyK32kIqVlqqfIafn
         Cp3ElsgIOO339S7SEahhAzbS6h8jwDFpEFofxHEIYw9O+jQqm+fM66TMMdYwyds5psVh
         lGDOBiq3psfYjpZIupiS+A+mYowQ8y9aIFLH1kXQ1BV00onpKLzNatZbGJPpR1QfLVoJ
         dUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557739; x=1764162539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ub7Iycd50pT3ykKqItSRTUhlcBrC3jU3CKZCM97yyEA=;
        b=dcGpNNjXLNUM5YDQU+qaNYBUBDiWAya4ICKKIZCpFSw98HFof1f3HeU80TG6Ebhsi1
         xG8ynZ+f7Q84+goB20FLcAFYj0SrXsrv29OzNApu50wWGe6VvXpsTN2Nil3AI/fyE6CH
         QEMATheLkBko07t1XSXPx8YU2MVOU6kWuqLiO1kCyHfRm40bUCf5oi6FDyamhAqpA4Qf
         DS6fYHhEodMSG7g5kkEra5ja/AWZ96VpaIoYExxnZ8hFkdJ7JRIbR732t14Ox671HNVa
         gGG7pZZB+pDPG8GTcMUOlsXLXehYmZUwEQ4NkZavTDlnj6BxABcdB1Hu/ZwGPVe97dZL
         JeHw==
X-Forwarded-Encrypted: i=1; AJvYcCVGOLZdu7nf5eMhLcXbfCbJvTJorm5Rv3pFcg1l2QuGGtwlM+A3xxoJwLLh75HKRsKN3E4xgAPRxmRFCaCQZBLGi6ep+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNXWkQ67gc9nmY1po//HF5o4q0N6tloCjlrs+rZq4CK3dEhZe7
	73sVC2MWHPf7Fwsb5LN2QsxnU5Zz7tDT4XH41dX7PIblBUb45tiG1O8z
X-Gm-Gg: ASbGnctdB7X0xSPNA2U3wZBggqs5kPiGL4hqwlDo16cNudoyiLYocE1icuGu+TRq5uS
	A6nTVgz3P2VZ4dkxHX/stKuG5QuanQ2YZkE/IMjgHBkKNqAq4NZKlfWo8sT6p5Al78oWzIk9wij
	Vk8cqzQywgBamkAXFX7DJNAMOH7QcNw7JjN80PfbZjtYj+jJljoufMc+nX2bMKOXUefMeYl2ZmU
	SdVRcKEsGxqT6rslMbLYCSg21yxtRRqFlUlsglS3qvWqwUHuGT3QyH+DKTXp/y7VLwXcTsadPf3
	bAPEzBav43Rf9Lmbc0pEsqgX8QwOHHrcMpCOxAChByhmeo3fWtPyG2mNT++vJG9KeqeXZelJ75g
	Xsgrpq7A3/uB3x76sba0+KdM7wwlcwHYKnSeZFkkCSbI614jhPFybN+APZy56HWIQ7kd6f9X1MG
	pAE2yoUlimcDs+1X0rMC4IYViVb1zWzEPxrEI8gihTJy++mQ==
X-Google-Smtp-Source: AGHT+IFBSzymvZRKa7zVQvJ0Kbgj1A87hkoMlG2vAmcdFtJqayGd4VFPcDBdtVH9byZ5m9A16dz2ow==
X-Received: by 2002:a05:6a00:148a:b0:77e:8130:fda with SMTP id d2e1a72fcca58-7ba3a6c7879mr22659126b3a.13.1763557738780;
        Wed, 19 Nov 2025 05:08:58 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:08:58 -0800 (PST)
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
Subject: [PATCH 2/8] usb: gadget: dummy_hcd: replace symbolic permissions (S_IRUGO) with octal (0444)
Date: Wed, 19 Nov 2025 18:38:34 +0530
Message-ID: <20251119130840.14309-3-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
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
index 41b7b6907..1369b9613 100644
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

