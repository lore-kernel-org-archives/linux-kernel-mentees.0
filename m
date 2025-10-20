Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD982DAFC1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760990909; cv=none; b=kCPUP0NQDNj69sRkmxPepggER5WaDUR3O7MFzQZv6GWw43hw0+RuBvKg4i9e/8ahs4jd2Sj+ayKmE8an5Z0Q4Vx1ESJKFwjeviiXOWDetNAVkkfbJoRDEdvdeb82pSldRiR2CyLHtYkN9e9DjMBMoQj4rzG8UzqkrGtinc4pWpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760990909; c=relaxed/simple;
	bh=MzwJpCI5/VDDc+7yTFM2r0t5XlU+1KoqAP4tDJhYk2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cd3VyxhjQzeUGJ8526Igb7Miu8Ma9umQ4rrAuq2JSeoO5lbHSFpLlKVe0mSsulssQM17Pof0pkpEB7QX22pmGKY1K85asaNySSaPGmrIZD+fTUgI2myp52Q+nRsLDghOZuLikJBvyEo2QE/Dz8N9nfGLv2KCPhtN9HdK9Rio8BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GckWXE83; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GckWXE83"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F143241B31
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ooie34evHddu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 20:08:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3727A41A45
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3727A41A45
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=GckWXE83
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3727A41A45
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:08:26 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-88703c873d5so185159739f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760990906; x=1761595706; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUz779fqArVsu5Mue4uYYMEeKAoqkpKvtbYqWEVcbbY=;
        b=GckWXE83hEz8awm7D1pHgCvNAOOf98GrGstcoHR6hcJrcLpE/sD/LUVdHLXnkq1NxS
         k/GOHeIPWbrBxi8g5t3N6mHgsew6GpIMlDZ4sHVeD18WWbb0hSCngN0O/pBBDosx7RP1
         Z/zEx3yUwwN8S3EqmXxXrYqRgUXViTRc3euFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760990906; x=1761595706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUz779fqArVsu5Mue4uYYMEeKAoqkpKvtbYqWEVcbbY=;
        b=HSNtPuM1bCYPaB/V12UmsW/KC+qF8Z2qNW/oLwn1F0Vw3tBnAPds1RPj3+k7cXI89F
         Xmbh/TJ8qfDXgbyvtqv77WAPIq8JU4+RQmNdYDGfKqtKua11s1gWLGaFy0g9Z8A1m7yt
         BR7TfG1aslaLt/lTrnguFQLR97ubl0meLe0iAbou5842uvnrs/6uhg7v21oqH/phJSbX
         ADIuijGI1djI4B0Acyxbsd/KDZUaeTX9XefcjhGt+uK5CyofyepHiD62Crgzq7icN1Fr
         ZAMT5W72jJGQiwbVKDNl6q6TsRXtfOt6hL/vni4c0oExC/VzGm1SuM/NEyZ/7OceVwrq
         GzrA==
X-Forwarded-Encrypted: i=1; AJvYcCXvBtddndktiQ6IWoliQTOhLIv1147R4moIabb55KOMbBkAyVdHIeArIDCdKdN6rWI2iJuElVnZIwHY9tFWUjl6KY3QsQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzt5ysJ7zJzkw3HIMs1gHSLrl50BKyqAVjEwckugah3sQrEtDnX
	JzsDbJHCtHpTMSr7JTxliRkU3kNq3SYqCRyMVEBDeVdetwdC3brVqD5gcop/wPX7HFxDuw==
X-Gm-Gg: ASbGnctUzenbdukv85QcFE3j91xpXOUEcj9vUHu+0ytRcyC8UkTMJidczWpV5Qx+3kf
	l7thNcHHIbInw37kasKKIRbygU8NhLA1zfgq/btty/gCSr8x+hdgUqC2UG+/lQ0HJxFDMSLztDE
	K+pWqD4vbpo5zwEB9V989n/odHD+pAOzXJACh0rxSGomaqSvQBWvkF13qYKKIBVOZbrG0ytW7Ri
	ruo8pGp4uR8iJ3m81UpHijqSU/RYxKLuF6mKYVFpvbnhPMgGzTLyOGKQP3bjBUJdvxH/aY7S2JO
	4wwmbNetvdQIh0dDmGVO2A/3ibSmUmHzWnkg7PHkMs4jmesnzIkwj1LZQeAxGNZdbNIvhMRNbSb
	wGIOI1aGfs+ElXzmZBGWDLplZshvY75omH1c5F0qMJvXY50CEqt9xuwmx21nTE04gMz+AXKjmf8
	CFbdw6eRFIOtHOUCg79d7IXCU=
X-Google-Smtp-Source: AGHT+IEgjC7jcUOjYQOxR34I9L+GF1YbZZpGFNn7YiUKCLnGaUh60OooaZvyBRmUy89gJ+clGAPAPQ==
X-Received: by 2002:a05:6602:2b83:b0:919:9bac:8bb0 with SMTP id ca18e2360f4ac-93e764a890cmr2449194239f.19.1760990905874;
        Mon, 20 Oct 2025 13:08:25 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e8663b5c2sm304877339f.7.2025.10.20.13.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 13:08:25 -0700 (PDT)
Message-ID: <2541f99c-1081-4253-ae58-97654694cd78@linuxfoundation.org>
Date: Mon, 20 Oct 2025 14:08:23 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/solomon: Use kmalloc_array() instead of kmalloc()
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/25 08:58, Mehdi Ben Hadj Khelifa wrote:
> Replace kmalloc() with kmalloc_array() in several places to correctly
> handle array allocations and benefit from built-in overflow checking.
> This prevents potential integer overflows[1] when computing allocation
> sizes from width, height, pitch, or page values.
> 
> [1]:https://docs.kernel.org/process/deprecated.html

Mu understanding is that this document lists deprecates APIs so people
don't keep adding new ones.

I didn't get the impression that we are supposed to go delete them from
the kernel and cause a churn.

How are you testing these changes - do you have this hardware?

> 
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
>   drivers/gpu/drm/solomon/ssd130x.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 

thanks,
-- Shuah
