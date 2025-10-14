Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1085F18A956
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Oct 2025 18:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760467795; cv=none; b=M80eYKhUhWsUPoPWg/PE/hEBxOy0VeWH0ushCjs07pxklwZBL05OBczocd2Fbe0IzzUcnxrZX7yp+L1nKHoKW4ZEEVVcdbts3gNhlZke/Cm0HHp/aDZNGJtnLAbVeJGBzet5/pf4OBPsKf0D2tNvu4AxSl4PEjGGsQWiAjg2UyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760467795; c=relaxed/simple;
	bh=O8y1PCk7CyqsuON9JJ7jFfE0RrSjGfU19Q5yPhpqNjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AX3J/y4e9xXPApwJYTF0+4hKo3RFT7Mq9uA2diGccaumPdLQT+a7sNQyPhc5zWTUsvwWWDIRV5tPaiUBHAdbUDlX9+SK7yblAkTJ/0/OjZdPJhWX9Q/Vp9kpTuxRfU1rCMLv78PO6Dod3z52taArjbQYugTBqOMt+ShNb6aXAdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnh2gz/d; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnh2gz/d"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-27eed7bdfeeso2704125ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Oct 2025 11:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760467793; x=1761072593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8y1PCk7CyqsuON9JJ7jFfE0RrSjGfU19Q5yPhpqNjM=;
        b=cnh2gz/d1Rsbr3XZ5xwkhFcLWt9WJWAlJmyH/HuYUE45iFvH4HXqblCNW4ep23xbZa
         QrdJ2/pn3IjaqOETfbvZCHMW300wd9LDHTGQeooqTGU+yawhqMIZOOS68WVfJ85qiZCY
         6MmImsRou7vutPfhRgbMj9F3z2CsCLVGraX+W2jF0hVg3AUC8CPG67PV6MRqEwK1Y3e8
         k3iHtfRtvdsQKOf0PB3dntM8T4EwbWNhL947CpUjzKXHojhlQdE6p1vypRc2hPZxqRRl
         rAQVK2O216oH3JFG/yHVQI8I7svL3Gc9qhCVW92rOCMLGy9e4CncXAn3ts7OT4bqwVqn
         PD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760467793; x=1761072593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8y1PCk7CyqsuON9JJ7jFfE0RrSjGfU19Q5yPhpqNjM=;
        b=iYQixzPOTHm7hBX2mjQXNWQ0ufNn1tka2YpOEEF5inWrLaIAswgBQiT43tueQ5ih4G
         hLg3x1k4nXF3hQNhLYuBV9X/bjz1tBLvhY0KujwC6Oh60ylrp5zylbfCuUnmnRFofB7I
         6E0nTUiGQ/fWDZYJKdnIGF4WHniR8/2+ppQyJgqpt/ZeI3oiC8kvCmeMk6c19vQF5F5q
         eZ66IjQtujSAK/Ht+s16KELF463fUFMtHGnWrtFs9o3aNaNpW+Eb4F+yxgwgu5IhSKhE
         lpMgv03vij9MQZFF5NKFBDor/OQ4pp2mRDqnPhIrg362n+G9PWXXL3zY9GgyldowgMvn
         219A==
X-Forwarded-Encrypted: i=1; AJvYcCVhf8ZF0tzV+uDxQ4kT0S2ZFLzlGI9nfsMFzr/GY/0SvX68zXPXLmEjUB2Tb/RqSZzxo6zzo8NmATX9ac/bw4BdyJOpkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzA/ySInNq9qnBBZ/yrcz0wJvgfb2zT11x7MHoOTtENvd44s44d
	YjTEoa0r5SOq4r+2W9tgnWMSciRXkPaUDvDg81nUqJX9CHqEDa1a6m9s
X-Gm-Gg: ASbGncsS8ouayymRmr32vdlHard4pf1tXbVkSUNPsMuUsUgu4TLbkPZv0PgmtmQDW0D
	+2UQILu1hk8aF/2QUkrQ/C4kIT5cJpm0PBpcyrydLDZnqQHb4UuyufVu2R8iGEWhgDUuMBzrWe3
	noAhOltu/gC6nJvCBOJB0ezJEqw0hMLPnVwEm7RyHY9o1fAZyRWZTEbFW/+rupyE/gH6aR4nk0Z
	BVRNOEdHyIkCD3nsAXFt26DYfbfSGvfy8nhCxVL/E4G9CobyOmkIL2ZnIMhEVwouwJBAQfU48zF
	xAu9TAgZM1boG7secbScQJG3ZNLYf25CADMz6RU52OxQKpzSAy414Y5j4cJb2GrXaynwh7MOraa
	uv/2cVaAi1fOUoYUYV04IFzz3I9yiMHpF+3DLHT4JYf8TRbX17ttCTHZleSaMfDBHw8pFog==
X-Google-Smtp-Source: AGHT+IEH6d1IjfTea0ud2rPM+TRuMwjthPBgm8nzMRmg2/IrFgebaJBKQOOqZENx+bKdPBRqgq7kYw==
X-Received: by 2002:a17:903:38c7:b0:269:aba9:ffd7 with SMTP id d9443c01a7336-28ec9cafcc7mr327649645ad.25.1760467793106;
        Tue, 14 Oct 2025 11:49:53 -0700 (PDT)
Received: from rakuram-MSI.. ([2405:201:d027:f04e:f00a:2e90:a424:4c03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de6c70sm171560565ad.13.2025.10.14.11.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 11:49:52 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: u.kleine-koenig@baylibre.com,
	khalid@kernel.org,
	dan.carpenter@linaro.org
Cc: chenhuacai@kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	lkp@intel.com,
	rakuram.e96@gmail.com,
	skhan@linuxfoundation.org,
	ulf.hansson@linaro.org,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH] mmc: pxamci: Fix passing NULL to PTR_ERR() in pxamci_probe() 
Date: Wed, 15 Oct 2025 00:19:41 +0530
Message-ID: <20251014184946.111325-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: ed5bcdca-9a6d-4144-acd7-1c1feeaadb0f@kernel.org
References: <ed5bcdca-9a6d-4144-acd7-1c1feeaadb0f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Uwe, Khalid, Dan, and all,

Thank you all for the detailed review and clarifications.

I’ve just sent [PATCH v2] with the suggested changes — adopting devm-managed
resource handling, removing redundant NULL assignments, and improving the
error paths using dev_err_probe(), as discussed. I’ve also updated the patch
title to better reflect the nature of the change.

Appreciate everyone’s feedback and guidance!

Best Regards,
Rakuram
