Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D4117B505
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 Jan 2026 17:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768067223; cv=none; b=BrEve+IaxEdGMSsj94H822RZb87eBJGLFgBlVMHOQjyfCq6ukBu7fsdj2pR2ck6zJfhYmxPL/0lvFTr184ne/PH9owWk2KykXX0vIMfRpeP1SjqqNyzrxFz1Q637sTuJVmOVCbmMeh+DMGFeDBB7/ltHmHNSITLi/z6ihEexWto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768067223; c=relaxed/simple;
	bh=iqIAwsSkH1LRn7DpHN+juv5RfTbIQFu9fzTgJJtz8f0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRH0dBoUwPJIPQ2FlOlwxjVX70QMpYdFMJ5cb59B4yHVBA6k7GZgF+DmOVocdkLzXcMeNtkUtbctFO224PzCty9pJwOjvwPG0aT9TFGyUOsAAFqaQU41XIL0ikYjOcn/PZ3FV7ucyPfgEZWZx1jbkTBmlKtf91NU5OC2zoU3yZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1DGYoF7; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1DGYoF7"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ffc5f35b54so27675111cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 Jan 2026 09:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768067220; x=1768672020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqIAwsSkH1LRn7DpHN+juv5RfTbIQFu9fzTgJJtz8f0=;
        b=c1DGYoF7FgDkOQozue2MZyzXLYdEyIW/e5EdAAs1Rixt03bOr8WvEQEKrmtQHXiHQM
         YP56hgpqZMtV/xuzP8dFeZ0mVvB/6omJfJCeWbGnD151yVRm8xChzNLlYb3SPVuCh93x
         tvD0qym2aMKWc6qo/qMjaBCpgaJZeNz8IgT0Y8qOWE9E6sRT/yHSUwcW5iHMNLqUd7/u
         gSY4KfJtaojZprGV6ON95XsBqkqvb8/4HPPqGWEQZCPZkPmq5H93tU6j/d8OCjOVYGq+
         gKCZYX2pKlQRkrhBnz+Ctl9lxk0wRlWWbOCGR9GsyLQ9LVVEHMt9gTVl5bjdzzZKOMeo
         YjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768067220; x=1768672020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iqIAwsSkH1LRn7DpHN+juv5RfTbIQFu9fzTgJJtz8f0=;
        b=c4vXacCKL9qG4IuQ9hrMuBC5+rAjIs0YBoIPP6JYLH7aETYg0w1Pdf7KQR052XB2I5
         fjlA9qFRsIn/RRa9WXYeJ72rwU9LBJ2tL5TMv6UIppUC5ffw2cBDBo8XKvE+AsHkTLUP
         GUeDbhw8CsQXh/Yq5KtKzt95ve5VntQTBZJKzhbxc/pLj1eve6ppn/YQydeBLKo7lq+H
         psC8hiC4tBpislhbM2kFApqRSQYLSO1lfpfWmJNC0bDH9rcQpyTam/t9nmc2SXZJgRUx
         ve6GGSw7wInZVBlxEYtGgxAH/92FBAWHaoxIgyKbsAevoHhhyZ1lmIx2OeJ/Cq78CEmD
         2lWA==
X-Forwarded-Encrypted: i=1; AJvYcCWT7omLYrBC9z86SaL0tnem7KKODmLCpGctsQ4rIBhJMoXqEfO0UYGofoUx72Wj7bAFIFPKSFu/fFZkZ0Ups+/iLcaR+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+oziSM9dApcYoGfhs8JEBNzM/025t/mPcviG/QZ/hVbErJBoE
	K5FOQVt53KHgSJqpbZ+EThQGmAZ730khpwcgdPcSUW7tLIuWRwKicM2o
X-Gm-Gg: AY/fxX6ukWhSmnVDyhL4E9mN8gVLDWmBZfQZx5AH1YT8rlTNaxYvfaEujx4bgee3pb6
	yGyoFocqjXyG+2JeeiXeRPVh4C48ydFczGajLDhdeVVfK/lDMpz/7m1J8sZ32wfEY+ewseyBb5o
	l4U5Rmi+vllhl/CBl4vvK2WvjK2tqHaEHca/kZwhOL5pGMSMI6WUVdfvskl719hjb7OWYYxYyZm
	+MXI+VyGBiwE62fAi9CnbiFP4U3c045FHfbMx/gvF1Y+0CLzG1XdqgzfIaDyTvB4Z7gEYxgW3Hb
	zOnT6VlvHgIeQMD3IR4EQa598JPWW/N0MqZTDDlhsnUIAC9UjUBZdXkx/Lfo9XjNFIwjJU7W1IE
	q5FqGxAVpmLg1DxNgx2LzZ07WcuKCdrnNfU4q4PFZV0z4LffbWJkdI9Ko8SY7mkFvnMB4zZlsW/
	kSyEwSou5Q7jQgbcgbMWmuvxiqQtMkiPW7cjYS+boG/9pbC7wEP8FctHYNOkIAzXQukJnVNK4uu
	mMXPxjKsA==
X-Google-Smtp-Source: AGHT+IE7ltzgQjoPiBN4Yv2Js/6C6/LS6t10HZYVZxNM27qcbS1X+Y/3pfVEOz+ccq0rpo3AXUIhkA==
X-Received: by 2002:a05:6a00:438a:b0:81f:4ce8:d641 with SMTP id d2e1a72fcca58-81f4ce8f745mr183507b3a.37.1768060842363;
        Sat, 10 Jan 2026 08:00:42 -0800 (PST)
Received: from server.. ([103.251.57.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f36f88f4bsm2513245b3a.36.2026.01.10.08.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 08:00:39 -0800 (PST)
From: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
To: jackmanb@google.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	davem@davemloft.net,
	david.shane.hunter@gmail.com,
	david@redhat.com,
	edumazet@google.com,
	gnoack@google.com,
	horms@kernel.org,
	khalid@kernel.org,
	kuba@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-security-module@vger.kernel.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	mic@digikod.net,
	ming.lei@redhat.com,
	pabeni@redhat.com,
	reddybalavignesh9979@gmail.com,
	richard.weiyang@gmail.com,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@suse.cz
Subject: Re: [PATCH v3] selftests: complete kselftest include centralization
Date: Sat, 10 Jan 2026 21:30:27 +0530
Message-ID: <20260110160027.128949-1-reddybalavignesh9979@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DFHI984SEFV3.2JL88CLHNT2SO@google.com>
References: <DFHI984SEFV3.2JL88CLHNT2SO@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey Brendan,

Thanks for the report.

This issue is caused by my change that centralized the kselftest.h
include path in lib.mk, while the x86 selftests Makefile overwrites CFLAGS
with :=, so shared include path unable to find kselftest.h. The fix is to
explicity add the selftests include directory to CFLAGS in
tools/testing/selftests/x86/Makefile.

I have already submitted this:
[PATCH] selftests/x86: Add selftests include path for kselftest.h after centralization
Link: https://lore.kernel.org/lkml/20251022062948.162852-1-reddybalavignesh9979@gmail.com/

it has been tested and confirmed working.
 Tested-by: Anders Roxell <anders.roxell@linaro.org>

Once that patch is merged, the x86 selftests build issue should be
resolved.

Thanks
Bala Vignesh
