Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986CE280CD9
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 10 Jun 2025 08:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543862; cv=none; b=Qv3Gd4M9qhM2sjvEW5CKuq987Gk0v71wGAIBrO+DCUaFcNGho65HbwxVzU8bQV/mMcuJdDKsIjc0K3vUjaVmdtgimPFmadNOrbPRAttyYzBvRpPS7g1hcf7TvIr5/gcJDZjkEaudFnagqk+dXKXSWGpvZ1QhteK4dm1ILM+zauw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543862; c=relaxed/simple;
	bh=pAsKoCKXcR3vaJATLO0yUatret5jy2iUb6ibmnbLo24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gMKQ5KFUW3uJsLTz1uLOZbspHef7zh1fNvVc5hIeEHQNBeyFpQH3R1Qb2lLSXGCDuDgilk9AC61Ymq3YE4bmRTOvrOhUr6QDFiYWF/wRaU0cpQdiBc2d9DsSpM5l0X0keSczH6EVUyRwWbIA+AEE+hchnf5uc2rWCLR9VhvHre4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OETQyOvh; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OETQyOvh"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553331c3dc7so5075538e87.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 10 Jun 2025 01:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749543857; x=1750148657; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T9AMyxosltlXeE1Hh9H7o71Re+z6nz+UiGufyzU5brE=;
        b=OETQyOvhecd7huRLw3GkxIWc8LZrnV/EEL00XhXHhkkL85OLo3IgUqTs18NGFBspmT
         mxX8eGiFGrMkEpGTnvtnU4XQWFTCkmXUF3+sAeT+l7eQWrnHPjYJnNO+BTE7Uh/M1ESK
         g6HREnTPECMHz3vmXzCQ49rAxSsjPuohINKNXwmxnJANo5Rb4pYhOYIVVaFIw0NLrCy7
         Rvc0WaUiV3p7FDjeGhepBxNCV4Yh5mA5eASZ70V8jmT8SsOdUBx2RRTZkHL+Qie8tjsw
         RYhKCBIldsUS/tRsL34uUszofFQ8EIijjLso0GQq6uTUYwCqW85cZGWeINC5FvIwybiP
         HyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543857; x=1750148657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9AMyxosltlXeE1Hh9H7o71Re+z6nz+UiGufyzU5brE=;
        b=teAISlszTS9J97AfwsAj5NOq3YoB9JDvcL/OAOZ2GH1cTljWwUwSq33LY4UmKzuBas
         qq9Ym12RhpVRVStwhJuezNX+F/ziurlKptdLGrBZbw0/3hVZFRD88XKSjVFrNYj9p8gh
         W2tpWA8B9xPaD+M7i01FG9JeyKKxpgm2WuxGsG/miAE1tnNqu9I4nLusS4zfAiWiT9+O
         Xr4109m3sPJKXyqEByjye/BMLkoEyLUVmyaW1bWzBTjB8IN3rtBbGHRWWLF05mUTdEpP
         AtvXX4dkaysy2L54pJnRYyBmqek+ZkQ7w8F2zaXjvSbE+3Mn5rV3RUtlt/+Olx82kahQ
         TBqA==
X-Forwarded-Encrypted: i=1; AJvYcCUoo0oEJ+XiiPUw60auG6D8pu3OC1Zonoc1KEUkunPSl9xPSnQCOK1DAVukVKQushe1m+pPyRl0htlN1fpE6Wl1q6Ipkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzOcYuOf+ituwF6ZhJ6rFwQJQKaYyBcN412Kt9VClaM5JeBw3j
	yfe4PJEdOHn8p+TZ0+oxDHpJwpUQ4XylG10VzseRq3xIERbxO1Jt5YBI
X-Gm-Gg: ASbGncsQ1uZhV4SNusFci/kQtfbsRJp+7iaPDbJ+hjmI2PvkFZHfPS1pzfrYo++CHsR
	Dngw4pSLfPp1uW8I7PKcH5BeGJl3Yqz90rG49JPK6wRFDuaTLBQg+peaqonbFYGPVMNw7yNM5Wz
	+csyeMo2cLijbBVGi2n2CD+wHylCLlhSO9OWA4b2IjpvQM0OpOY+UcmrzHwEzkLg02i60O3VPzH
	pU9tTakPdYRFQrCcvEruNT3Z//qaGQXLZ8v/UM6sBHy7cEG3JHakqgXjwrAo9VWYewHWrTUrcS3
	Qd/ft0rueF787s33U4T7eqn3PYlQkjitwhPRrNiVcclIpro8jlVuStRWnYylOWx22oKIRwQ7Lej
	Vt6c1lkVYvzHHTFJjJWCdmk4wB8w5W6E+rB14kghpt411vp9y26Hyt3SPezKXc4QdHOu9Wb4RUH
	s6bVgGFpT4EemE1LTGZPFuk9k=
X-Google-Smtp-Source: AGHT+IGUqa7d/RWtxwnPy2+NvYt1LQ6wiXuu9PiIBBS0TGg/C+wR9GtyuBkitpRQ9RBLougt8hAvLw==
X-Received: by 2002:a05:6512:401e:b0:553:2a0f:d3d4 with SMTP id 2adb3069b0e04-55366c1e102mr4244672e87.49.1749543856354;
        Tue, 10 Jun 2025 01:24:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:6e:3100:dbdf:2d4a:ad23:d037? (2001-14ba-6e-3100-dbdf-2d4a-ad23-d037.rev.dnainternet.fi. [2001:14ba:6e:3100:dbdf:2d4a:ad23:d037])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d7622sm1443650e87.58.2025.06.10.01.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 01:24:14 -0700 (PDT)
Message-ID: <85f0fbb6-5574-47e4-9adf-89eb27fe9f62@gmail.com>
Date: Tue, 10 Jun 2025 11:24:13 +0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] docs: Improve grammar in Userspace API/fwctl
To: Jonathan Corbet <corbet@lwn.net>, mchehab@kernel.org,
 ribalda@chromium.org, hverkuil@xs4all.nl, sebastian.fricke@collabora.com,
 hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, W_Armin@gmx.de, mpearson-lenovo@squebb.ca,
 skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <20250522115255.137450-3-hannelotta@gmail.com>
 <878qm0aab5.fsf@trenco.lwn.net>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <878qm0aab5.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/10/25 00:12, Jonathan Corbet wrote:
> Hanne-Lotta Mäenpää <hannelotta@gmail.com> writes:
> 
>> Fix typos and improve grammar in the documentation for
>> fwctl subsystem.
>>
>> Use the word user space consistently, instead of having
>> two variants (user space vs. userspace).
>>
>> Change wording of denied behaviour to be disallowed
>> behaviour when describing the interface.
>>
>> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
>> ---
>>
>> Notes:
>>      v1 -> v2: No changes
>>
>>   Documentation/userspace-api/fwctl/fwctl.rst | 30 ++++++++++-----------
>>   1 file changed, 15 insertions(+), 15 deletions(-)
> 
> I've applied this one.
> 
> Thanks,
> 
> jon

Great, thank you!

Best regards,

Hanne-Lotta Mäenpää
