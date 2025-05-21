Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4575570825
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 May 2025 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840664; cv=none; b=Tws6TlvrA5xRi0Op2XqAodsZRrNvpx9tdp9uT801e6xwLI3ts3XHs9JDfQxDreQqRwZChNpoZtqTCZj+uLvdIC3OjcvcWODPLrm3GdcMd9gt6z0QeKmK+v2ybBEi+YZd4eLV8D5+R5eq0MLAHHz1VNxUvoFYUNG/MMw3dyGwo64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840664; c=relaxed/simple;
	bh=kUCnnPeOSrm8mt4CfbncjKmyFQkFlkZd5zL0vOVsP5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/A4gdAFn/oASsJ5LaWE3qD6VQMXqO2fWotiNyJChCFElM1Bt75euQvfcNuYeSCaG1/+vKl80GtBe52/2Rf26oZLDxBdQGrvoB/wEOEeN263dtn/ne2tUIzwJaJuA8RJpFhT76WySwj5V1XhQCeRn5kaFqlztMC6TD1hRiArxo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcAMa4L9; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcAMa4L9"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-550e2b9084dso7910709e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 May 2025 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747840659; x=1748445459; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bY5S7Wfb5ySyKh5UvVG0WBqudaowOyoDQxB/bdCEle4=;
        b=bcAMa4L9BQgdg9dI/Q+s2xnVlXdzs1yJo2fENnA3Ylz1Mp4Idljj5uAV5asgX+HRui
         G1iJLLGu7ZzodYeLQCAKCj7lyd8nutYrxEqTOTvmTP2GOjvz0xoZtNGToQ0XF0UTkLCY
         DLJl98urAj3IzxAaisc2mDBKRzZfDTelQef9wMsJ3lKvjC/riUOHzYDRJMIYVo0ZxEy9
         vY2NltCI1REd1ai/zeqR5079kIYX5a89g6Zp+e/1Zf5n9qYgy0xpgsix6v6a9rVdNPaV
         u6q6ELfRCTBRpCEgmZZTtAly0IMzrU8e8rGwH/xOO25IwlkIYVsSbsbCFrKglRQ3UfTH
         NGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747840659; x=1748445459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bY5S7Wfb5ySyKh5UvVG0WBqudaowOyoDQxB/bdCEle4=;
        b=nz635nrQDeb9raPiCUdL7LxRWEowSuDx1mRHaEyx5UPA3e32/2N/vK3ILtX4UiDpVD
         mFpPtEX6+9l3fma75+F1SW01/ukaWI3D/Wtfk3IW0WdO48tWoItWUmFbGjmp4/yBbsyC
         p9U6iXFbxeSER3I1xzUzPq6g1okw7rSUWakp5j6v5qzgo6wT2k4IPzQA9ORSkOZC1LF4
         Zpp5MYe2D9byR8hqxXRfQECB0IesJ3wjQEo1tnyWx6QZZdqm9qeFlrGGWYl5yPvVc0y8
         xnadsizk0TzgElRQ2GGPizM1CVSepXoXYw9V3OmoPKkJpMu5JLKRp+XD0IUcMsXbqxv8
         FpUA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ESSwmQkgPoc3yF2ovF4uEdMwVhRw4FkPM09TtvIGliI5NHfmtLKVEVmHewJKlNpiX1guHmoYYYrrj3zjidOpJlhmdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxaY9NbVRldvw5xYIfVtm1cTXwZD5amH1Sb2peVsg46VAAZ0Yg
	PfyjLsrhMEFeNrC43hphYoC9JillaQm1qSGZuVcsgJmXIAv12Z2mD3gg
X-Gm-Gg: ASbGnctoHfiuPONaZ3NOBFTPKfd3ptBffNQiE53B5+Mp7GB6jsXoa2fjgCjbdCbd2WK
	LK5C06FG2lw2db+OU+GgmbnyYVEQMEWjFbvpW7O4hInCZADOIMP2+fTHnQBuNd4Yz+qwjpwmzPg
	iDGlTZ2qLTL/2aDCGC08zg8wJuzdtxrsFC35eXnoqW2sKI1eREdSbhmnS4R1wRDs1sbBUAXQ+yV
	d5HrkepX+XYdoeswGKAVdaSC8SJAMLXSNYoOOA/qCZMgxoFPxS2KIb45BueGGszpLPB3xRxjuGF
	TxJFy0xIMxpdz3O1DUQz1r3HwmRn/xUv4KjERuiSGksZz6r7VTT2wc1JRmfrQ6Lbh1oMpuACLSZ
	nGRJ2+C4UQ44KmZdSBwzVk6VP3XKTrRzJzXNz7P9CdfAHPEoHVCf2KmSJiY2nPCOuBVwaC6MQ5V
	jPIEWzMIMFmCceOzC39ziSoqg=
X-Google-Smtp-Source: AGHT+IEpTliLMqbAZ45KCj30NQTnQIbtnS7k2akX1eclggrk0SecoLdw9WewNGAj/w+Zp405OJOV5Q==
X-Received: by 2002:a05:6512:3d05:b0:54f:c184:9de with SMTP id 2adb3069b0e04-550e98fbfdbmr7135214e87.35.1747840658971;
        Wed, 21 May 2025 08:17:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:53:1500:e8f4:97c2:d311:5b15? (2001-14ba-53-1500-e8f4-97c2-d311-5b15.rev.dnainternet.fi. [2001:14ba:53:1500:e8f4:97c2:d311:5b15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d476esm986067e87.203.2025.05.21.08.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 08:17:38 -0700 (PDT)
Message-ID: <b6954169-63d9-4cac-aabd-2df1642f98af@gmail.com>
Date: Wed, 21 May 2025 18:17:37 +0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] docs: Improve grammar, formatting in Video4Linux
To: Bagas Sanjaya <bagasdotme@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
 hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, W_Armin@gmx.de, mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-2-hannelotta@gmail.com>
 <871psml4t7.fsf@trenco.lwn.net> <aCqIAkoVr2yvDJbN@archie.me>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <aCqIAkoVr2yvDJbN@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 5/19/25 04:23, Bagas Sanjaya wrote:
> On Sun, May 18, 2025 at 02:08:04AM -0600, Jonathan Corbet wrote:
>>>       description of the correct character encoding for Programme Service
>>>       name strings. Also from RDS specification, PS is usually a single
>>>       eight character text. However, it is also possible to find receivers
>>> -    which can scroll strings sized as 8 x N characters. So, this control
>>> +    which can scroll strings sized as 8 x N characters. Therefore this control
>>
>> This kind of change just seems like churn that isn't really improving
>> the content?
> 
> I prefer the original as both so and therefore have the same meaning.>
>>>   ``V4L2_CID_RDS_TX_ALT_FREQS (__u32 array)``
>>>       The alternate frequencies in kHz units. The RDS standard allows for
>>> -    up to 25 frequencies to be defined. Drivers may support fewer
>>> -    frequencies so check the array size.
>>> +    up to 25 frequencies to be defined. Because drivers may support fewer
>>> +    frequencies, check the array size.
>>
>> Here too, I'm not sure I see the value in this kind of change.
> 
> Again I'm agree.
> 
> Thanks.
> 

Alright, that is two opinions in favor of not changing this. I can send 
a version 2 of this patch series without these.

Thank you for reviewing!

Best regards,

Hanne-Lotta Mäenpää
