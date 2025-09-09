Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633F13148A2
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  9 Sep 2025 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757412024; cv=none; b=gmh6b/msw9cs3x3szZO+K6rS7EydXytbQDSvFX+6Ozhg5LlCf5KFOVBvibxJfu7znPf2IEQt4qAwstb1yxQiKi4WFeHTQ4xTXVzmus7Fn+A/XH551RLMsD9cCsxyBgIH5NpdPkXQmXVXPb3+7XYZh0WRef9rbPMbUmJQNAcUiQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757412024; c=relaxed/simple;
	bh=sel26hbdubN+palGD2gZ0/eOdFAx9Akb98dFmcE1PVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnp/SGCzsadCTKy4Gl/7HW/q8Cw+usBW+jJZcDipRz1eQQiem41duO+dg/SlTi8Tusqoe17YKOcxlZXgMosAbNbUHAWRv/9TxTChV4I708atOMN8YKRqsTi/LrYyl17+j7yZ9PtGU5SCTIYfWTfJ4A5na/YuGA2gOTrktphenSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dl2IZ+dv; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dl2IZ+dv"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4c72885c8bso4417103a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 09 Sep 2025 03:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412023; x=1758016823; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jOx81+m5TMKBCfvFeUd2lc1fUQ8CVG2MRH89iHXYyPo=;
        b=Dl2IZ+dv/le2Jx2vGcHrlKiAOuco7q1V1sad+59cTtxJ0F+Zs3a/diRB/6sXlAEyLT
         CcYuIHfu4485kC2PmIIndOwKpa183kTBTcZ8XIRRhSOGowy+RI1PMn9ZFHhCvi99VQcb
         MtYE0VkSFM4350KXXXrBlw7oA6jwGPGu6/5iXumZcoKuHzVCjPpOm5ppM3lRh+8qmoT3
         k/qVoX7gp6e+IzbxlrW8zP3ChZAUpnYzeqbxTl/lkKbkrM0zLTklfJJmtFVDJ2FkVI/B
         LOnXfTTI9C8Dalf3WVK11Rs4loJTlL8jd69j3+q6zj0IJ1v1u3ei0OOwJAfTNIlNyV6b
         HZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412023; x=1758016823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jOx81+m5TMKBCfvFeUd2lc1fUQ8CVG2MRH89iHXYyPo=;
        b=fwcosa7ofxElgfn39y6iPGcSUGmDEJACFb7shrYEgzrm2MGK7Gcb50hBXHrE8gibX2
         hGJ++dpMb1zNF4pUYP5qSDhiFImH/cE55Kjjf92qa+sUzj5mpTvG860BsTswt6HM65ji
         2RvrCPRIyO0jGXRGqBP6CKi03ekARLNvS18SRPKh1grB+1qJvysST0RLXnyaRUh6yFRK
         tVhmBw1QcuhldDdf5AxoX9owZ6ydDw4N+AeQSQCaYBYjwpccdbBVrIRpxgoxOF67oclq
         p4NzGgDJyb9vM/GX7wnI8rcZt/JoQ5ZsQC3eDNEVJqqKVO8JdSg8ypxWmTb2r3G6keq9
         JgmA==
X-Forwarded-Encrypted: i=1; AJvYcCVf5bKf3kV/WX22hBQ0IQjPybTgXwPVrGXcZ37DqNg+kI4pojTUyQ0r824aqlCOSOpJC1SUneb7MaJt+X/0U9uI+P8GfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyurqrjuLvynwDmdkFN7UpH5dIYtX3sRZXeHwV83i5DY2fkH7jt
	pc8NRjjtCWZiturRFxnwq78Pr3meKKHAQnkt/4kl01A2mIXomLXLxKtF9e/alvWP
X-Gm-Gg: ASbGnct9KlgCIfgGGL9LqGms7O9zIo2Xcioy44ax5m5Qy1a1GfsALPTxZvAt/qWOBjh
	09XUE7qX4wwsbA6j+nmwhK7nuYTE6KV9zLTRt7XkhYDCz//LVfe0WVaGwtyTthQeJlF0rdGa5HH
	nc4JTkznWtH2We7J4KWpf2wNAnRPZV0Ugho5LQhpIB3KMQxCpuQ/RdgpmcmyazWt6Y56SrXwv6S
	fFjb8dR2iKjczCq9O3uJiIlsJDjsE+08rRCVaq3koCEvV6Y7p+DUgNEX7KaPCTAMhgP6VH3huaw
	4l9IgXlJDy7jSbF6tp6u6a8hRJSafhmht4EaRe2NPG8GrxaSQkzfNf3XBtCvJ9Y458aDtn6Ds6K
	xAyJuzywXbxVYKgXqHIgmZbzE
X-Google-Smtp-Source: AGHT+IFODb9BV49tp09UgtdQ81xWoNMdmIOHFlia0/7sBhuTUz5mRZhUGLhapz+IyBuFX8A7Wx0f4Q==
X-Received: by 2002:a17:902:ec8e:b0:24c:d33d:418e with SMTP id d9443c01a7336-2516ef57cdfmr170678475ad.1.1757412022461;
        Tue, 09 Sep 2025 03:00:22 -0700 (PDT)
Received: from [10.101.1.72] ([140.124.249.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ca63c9e71sm161671585ad.95.2025.09.09.03.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 03:00:22 -0700 (PDT)
Message-ID: <a3d1c5ca-cdce-428d-8c1c-6a1f59e2dd76@gmail.com>
Date: Tue, 9 Sep 2025 18:00:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/net: fix unused return value warnings in ksft.h
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20250906-selftests-net-ksft-v1-1-f1577cea3f68@gmail.com>
 <20250908182018.28d9ff10@kernel.org>
Content-Language: en-US
From: "Nai-Chen(Simone) Cheng" <bleach1827@gmail.com>
In-Reply-To: <20250908182018.28d9ff10@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-09-09 09:20, Jakub Kicinski wrote:
 > Is it just a GCC warning or rather a combination of GCC and some
 > misguided glibc decorator to force check the return of read/write?
 > Naming the compiler versions and the warning flag which enables
 > this would be useful. We don't see it building with normal warning
 > level today.

Thanks for the review!

I found that the warnings occur under specific build
conditions that explain why it's not consistently seen:

The warning appears when manually cleaning and rebuilding net/lib/:
   cd tools/testing/selftests/net/lib/
   make clean && make

The warning messages are:

ksft.h: In function ‘ksft_ready’:
ksft.h:27:9: warning: ignoring return value of ‘write’ declared with 
attribute ‘warn_unused_result’ [-Wunused-result]

ksft.h: In function ‘ksft_wait’:
ksft.h:51:9: warning: ignoring return value of ‘read’ declared with 
attribute ‘warn_unused_result’ [-Wunused-result]

This is triggered by:
- GCC version: 14.2.0
- -Wall flag (which includes -Wunused-result)

During investigation of this unused result warning and following up on 
the patch by Minh-Quang Bui [1], I also discovered an issue with the 
selftests build system: running 'make clean' from 
tools/testing/selftests/ doesn't clean objects in net/lib/ because the 
clean target doesn't include $(INSTALL_DEPS_TARGET). This explains why 
net/lib compiled objects persist after cleaning and why the warning only
appears with manual cleaning of that specific directory.

 > Can you not cast the read() to void directly?

Sure. Direct casting is much cleaner. I haven't noticed it... Thanks for 
the advice.

Would it be acceptable to:
1. Send a v2 of this patch with the direct void casting approach and 
more precise commit message?
2. Send a separate patch to fix the selftests Makefile clean target to 
include $(INSTALL_DEPS_TARGET)?

[1] 
https://lore.kernel.org/all/20250601142914.13379-1-minhquangbui99@gmail.com/

Thanks,
Nai-Chen Cheng
