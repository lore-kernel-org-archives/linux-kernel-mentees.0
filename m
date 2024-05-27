Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A2E62171
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799263; cv=none; b=XhK9Or+ShC5DTlqW6vKl5ee00WrbDHbC6JxoyMWEdA8JEcQ87cDTcU6iLmnA6cxCCgvllNTtFPF0nrOWuD0254lVDxlkAqUJDkeXJphs//+p/C7fJVv1R3daGY4RDsxIq4Fwhc+QiUC2GPqUXJJTd7iBeJH4O86g0fYGVJYnozc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799263; c=relaxed/simple;
	bh=LnRnA2Jjmv5v1wzM1P4UEYWuVqzhiZ8cKDv1xenj3pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3eAA6b/1h8/uwkNe0eNgSZr5OzdL5OkGNLCmlP2UqgMb2geza1SlQkBQTUTvkfC5spw1UH6w7ArFf+R7/9/S24c+2uoRArxP7oKN1Iq9KfYQ8vZlDNEtOzHEyRvYJSr1HWT73wv6ycMkRyU6+X8tFdOEuQDrRhizTLozs2qZhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMEPERU4; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMEPERU4"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 622C881E99
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 08:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEBGDMZt6OvE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 May 2024 08:40:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7EF8181E07
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EF8181E07
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hMEPERU4
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7EF8181E07
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 08:40:59 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6f6a045d476so4654660b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 01:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716799258; x=1717404058; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwVuXWQUZEgL6e/tw+iGOXe1aznzrrLjd63ykG2zqqQ=;
        b=hMEPERU4VciQ+Nt/Ss65RPWJtk+6v05uxdiMwRlxJ+8hrtGvlEdPrtZhzqAOOn64cw
         XERG9zdGoU287gdAViEgJ93/hAErmSAVhvrjdebUzP9kRdjGJUG86k0cm4uzo8byqvHe
         qz3IPvGiuKI92l3EWTqVawz2KLggO1vxw4YjnEpIwwFHJx1Kokvfu83W8Sp/2UQsQuw9
         tVKE8mwMfisOOabQhKGOu58wLsLcXURsFHmr2QYlrOWFopZgopltWzCiSQ2OJTdh1gfo
         YDg+hk7qig8K6oWNraK9drMbBNbk/9GqVBO8snZaXQaIbSEjFB6/IE3KSLkHTIFHzG0L
         q4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799258; x=1717404058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwVuXWQUZEgL6e/tw+iGOXe1aznzrrLjd63ykG2zqqQ=;
        b=FJ1n95JTRtR5Y1MYgWveoc9ERZl7G/v3oWa3vVwu6ymOgKqKPZNtsmjizbBwdIwUrU
         OsmY9mNHSVbfIPja1MmmSJgzkV39/V1TYftIr8rE6zjw+Cd+cru7dDZiL/9KfQlj2ge7
         7vgOARtNceiwt2CK97QL0GbcFt7dnWzttaIJe8ysiE93W2u6VyIu6uyoz1ZT5ra+tIoE
         G2ijK/wNVOryaPZO7Uwvojo8i3pOnctdCIHXiWPNFtvB/lEXbhA+AuOmLpR2Ea1xD+NC
         Ku4fW5Wd+cJg2Xr9i6f49nIUZNTx9dElxz1sw7NTDHWDlBsL5/YuV9UTWtSXVQYdstx0
         MSBA==
X-Forwarded-Encrypted: i=1; AJvYcCVLTsSe4UA0Cy9fm3NptAWqyHJDl5k43PzeXXRL9Wmu61IhevHsCalCYYgRP8KRO4F4XmO/OCvT3dnGnAZznhrciV5E6xqagF/c0jT8/ijATY1xuHgbfPYL58h0B/5Q
X-Gm-Message-State: AOJu0YwYI+EQwEA9lMDc+WZVrJuTSKGS0yfj20r50J0rovuW0BiMSagg
	KVJ1IkEhSgz4+pr8AGP7yRGJxBdrOYigdx/LwWw4gUxPT27IeRbe
X-Google-Smtp-Source: AGHT+IFE9T0rPP7MwtRJUQicZehQa9jFlvSRFoYunB9B4Qz+S1VqJZB9Znj1JzGeT9hBbKTDRlVOxw==
X-Received: by 2002:a05:6a20:3d88:b0:1af:b86d:b6dc with SMTP id adf61e73a8af0-1b212f63dfdmr9828343637.55.1716799258547;
        Mon, 27 May 2024 01:40:58 -0700 (PDT)
Received: from [192.168.50.95] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fcbea891sm4452567b3a.126.2024.05.27.01.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 01:40:58 -0700 (PDT)
Message-ID: <694d1a9c-4e2d-4fd1-8b04-1c753c414761@gmail.com>
Date: Mon, 27 May 2024 17:40:54 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/virtio: pipe assertion in vring_test.c
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 skhan@linuxfoundation.org, Austin Kim <austindh.kim@gmail.com>,
 shjy180909@gmail.com, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20240527071330.105268-1-yskelg@gmail.com>
 <20240527035009-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Yunseong Kim <yskelg@gmail.com>
In-Reply-To: <20240527035009-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/27/24 4:52 오후, Michael S. Tsirkin wrote:
> On Mon, May 27, 2024 at 04:13:31PM +0900, yskelg@gmail.com wrote:
>> From: Yunseong Kim <yskelg@gmail.com>
>>
>> The virtio_device need to fail checking when create the geust/host pipe.
> 
> typo

Thank you for code review Michael.

Sorry, there was a typo in my message.

I'll fix it and send you patch version 2.

>>
>> Signed-off-by: Yunseong Kim <yskelg@gmail.com>
> 
> 
> I guess ... 
> 
>> ---
>>  tools/virtio/vringh_test.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/virtio/vringh_test.c b/tools/virtio/vringh_test.c
>> index 98ff808d6f0c..b1af8807c02a 100644
>> --- a/tools/virtio/vringh_test.c
>> +++ b/tools/virtio/vringh_test.c
>> @@ -161,8 +161,8 @@ static int parallel_test(u64 features,
>>  	host_map = mmap(NULL, mapsize, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
>>  	guest_map = mmap(NULL, mapsize, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
>>  
>> -	pipe(to_guest);
>> -	pipe(to_host);
>> +	assert(pipe(to_guest) == 0);
>> +	assert(pipe(to_host) == 0);
> 
> 
> I don't like == 0, prefer ! .
> Also, calling pipe outside assert is preferable, since in theory
> assert can be compiled out.
> Not an issue here but people tend to copy/paste text.

I agree, it's uncomfortable even if I did it.

I'll fix it as you suggested and send it to patch 2.

Thank you!


Warm Regards,

Yunseong Kim


>>  	CPU_ZERO(&cpu_set);
>>  	find_cpus(&first_cpu, &last_cpu);
>> -- 
>> 2.34.1
> 
