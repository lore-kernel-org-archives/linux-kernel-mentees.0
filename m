Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07551DF75C
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Oct 2025 15:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023675; cv=none; b=CgOKgoUcKew+eiju5AzCsCTN+diBUtvlrOX2HxWrVLjpFm0z7zeG1DHavfLmWEuoDhL2LYMW/X0ElfOvZUcx47i4xwCuLVm1sMeAwbT1+UwY+0nWFPi3WD6AKwhZ8TtcfK/xVMLs1pbfi4DtultrKYbJHZFU9h0srqErzwqQUU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023675; c=relaxed/simple;
	bh=QB6oWe69fOKYSEDFDlxnuLWplab0/kGA0E7x0ciuq1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DSd/zktdiTbz/vAn/nIo3aG0eLc65Q9UmnI+tLAe2/F98Y9nWEg+pHQwQ7cxY8QLlmMahZiG09JV/yF+JIdXbgBqehn2vdGIdAP6cbYK0TbaeeQlijngWld6VjRCXSXZMpBuXSMZ2/LZrMUhd1YY2iWGoCdxdNpLNCOv3CelnyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKd+ZA0m; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKd+ZA0m"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7800ff158d5so1047082b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 09 Oct 2025 08:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760023673; x=1760628473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ka+qOBslKvDI4viRHgphmCLFP1Bl3ToWEnGLsvWSVCc=;
        b=ZKd+ZA0mCC6QFIroofISLdKbvQBF/v0Bo5yOdx+DhbTutzYj1sX4RzbNX7SpGxb+yN
         Se6X5BbmQK1RdjhsM0+jUnYvyBPsCmUVfBwkMius5FuRq2xiMz6ofsJCWeDpWMEnvF1X
         S9Px6IJ6zOVH5MQCLJIXuSKQY17X3qzbpCkz8kXVWDIJraH5IS2m49JmaGHsMzAXJvEO
         ciQCc1s3FpJjJA0G9Wztj7Mq4jPlla7DZ0U0Laqzdw8obGuUUKhO7pZN3oYIrZlZsFkK
         ueBNrKbhKibBoylSIOUW1LcaMoUOKeY8qIRBTOEWCh9qX7p5t2CYkYVF+aEFxJEKN2Fj
         Ieow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023673; x=1760628473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ka+qOBslKvDI4viRHgphmCLFP1Bl3ToWEnGLsvWSVCc=;
        b=DWyUSwiPwjjPpB6jMbySg7jWxFOK0QUgza+rmAm6CXFMFHMJHKEbsmZPvB0FmPxgsw
         dWVjqlN1/LSH9PHHBcp3ZKZLKcgtLhvBGvkLb+8elMM/8mNcDHgxeqF5wRamUD1SeVV3
         hIhEsFP+oxnF0LWaMuHwmhj7zIGXu1YfBlNaPaFFxZKWjQM0hKVMOaSlVk8b7F0yovor
         BoKXvZ+aEc7AiGZX5WidteuFK5uyemMHNWdwY4WbK9aHkxnsaQX3lA96rzuBfubYnnS1
         vPYIA1cmTc25Cre5jCV5Mc0txOTuTqPwiuLd9dKPfbQKrciNVfhEMnQn4JNYwvHj21OV
         5Szw==
X-Forwarded-Encrypted: i=1; AJvYcCWAlJokdkhjKTQTrxCTdsp6LxNXDJntuiLsdoBB+1gbNoy3qlMnheWp0MGBQTyCdwZoBXzYeLkqZ7MH1N7smM5/T346gA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw8Q/8mI+PDH8vivUEqyNRmvUocVGMbL+q8MSnt4zo8ryYUXZt
	VzfYbZLuMfG+7WUxl+54B95NqwEc1JUaP83oClMf3XwRzT6LjV086vYq
X-Gm-Gg: ASbGnctS1j/ZoC0jXnGQHdyDPeWdXTcvNGYWw67KecititFkfWMXVLqxLlj/Gk12dDW
	QzfH51ajlsDODIUwpoEr9z83QbsEHQekd+fT9WlC24XG/qUqbdx9DHURn9bi1+2EbvK7NlDetDB
	5dOhYaWFB85ipfZYM9CgGskQHYOtd1bFNaSMSDT/Cgw4ZUXqHpKqGoVoRdaq23xQ5G8VL9djfn3
	2Z0UZ0U2VeY4y5fj27sx/A/gClP6JWY6ITFo0Ms3OKYPBDnVljdywzY1VX7gURXQHUV2KWHD/qH
	C5Qn54LuK+vZkYmcinYVGKSTdo4gBf0Pur3Hb+9c+/Jli57O13F8kogD9c8xHoy5dMZXngE1Dvp
	W5Rs0b6sAZ+H9IhZ8KcK+qzgHQZSd4AfsxgHOXeWgizW+J4zvZmUTAhhGDP4mG5OL
X-Google-Smtp-Source: AGHT+IH+FOcN8pbD0wi8HXC0v0EF21/LhGcpIRKvc4HRyNNnS8WGvyoPXtx/goBnlcHm7+kXmQPNxw==
X-Received: by 2002:a05:6a00:2443:b0:781:4f6:a409 with SMTP id d2e1a72fcca58-793858fb715mr8669431b3a.11.1760023672598;
        Thu, 09 Oct 2025 08:27:52 -0700 (PDT)
Received: from rakuram-MSI.. ([2405:201:d027:f04e:d9a7:c216:5561:b568])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b639cbcsm56141b3a.18.2025.10.09.08.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:27:52 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: u.kleine-koenig@baylibre.com
Cc: chenhuacai@kernel.org,
	dan.carpenter@linaro.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	lkp@intel.com,
	rakuram.e96@gmail.com,
	skhan@linuxfoundation.org,
	ulf.hansson@linaro.org,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH] mmc: pxamci: Fix passing NULL to PTR_ERR() in pxamci_probe() 
Date: Thu,  9 Oct 2025 20:57:38 +0530
Message-ID: <20251009152744.9734-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: pe4sz3hamkxhahvwqzdq3p3q5u3yeqpdscl5rvvoo5gdfbbrl7@joiz2oj5y4so
References: <pe4sz3hamkxhahvwqzdq3p3q5u3yeqpdscl5rvvoo5gdfbbrl7@joiz2oj5y4so>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Uwe,

Thanks a lot for the review and the clear explanation.

Your suggestion makes perfect sense — since host is devm-managed, 
explicitly assigning its members to NULL has no effect. 
I’ll remove those two redundant lines in v2 as you suggested.

I had one small clarification regarding the remaining host->dma_chan_tx = NULL;
in the TX DMA error path. Since that branch uses goto out, 
the cleanup section below may call dma_release_channel() on both RX 
and TX pointers. Setting TX to NULL there seems like a defensive step 
to avoid accidentally passing an ERR_PTR() to dma_release_channel() 
— is that understanding correct?

Also, I noticed that in the build configuration downloaded from the LKP report 
link (CONFIG_DMA_ENGINE isn’t defined), the kernel uses the stub inline 
version of dma_release_channel() from include/linux/dmaengine.h, 
which becomes a no-op. 

From what I understand, when the DMA engine framework isn’t enabled, 
these APIs compile as no-ops through their inline stubs. 
Please correct me if I’m misunderstanding how this works.

Please let me know if this reasoning aligns with what you had in mind.

Thanks again for the insightful feedback — 
I’ll send v2 with those two cleanups shortly.

Best regards,
Rakuram
