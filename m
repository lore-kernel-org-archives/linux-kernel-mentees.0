Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4967E3B14C0
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Jul 2026 08:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227848; cv=none; b=pOAEf/+9S4E18GlL8MwhAPE7rKfVbN85dgkZyM2kzG7lRCvM2SCo0JsAoOf2Dwxb/GkTSUYAXEdKUMT1THjii0RCiwAAOmU23domcvCX+reTfokZaVC0RCzKKpPiwcUs7vmPoR2V2jrAz8ImtQ+hDlxQSfeEjZbUrqZ/DlcE62M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227848; c=relaxed/simple;
	bh=kvOziwHTfwbnIkMV33Q47vUInB20/3D0E5bjpQBS/js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mx3p4y/kh65g60YMnXB2ciSzmtYTpFW++e7LkRAmf6lwJXJex00w3Gkuw0HqEqVXIxHnCNIlk4GsRbWbmWBpkAQ48wqQ12DW3GyNkyeXP8gLAan+eoKfThAcQdXiyn/9JNzHgvYZtuOx1ZdrBGi72dYU2gRgp4qfRhAJ3N/wwPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbSDpNW4; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbSDpNW4"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38deea72eebso4101226a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Jul 2026 01:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785227846; x=1785832646; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfzWVXRZDa4gX/lhkOHjJJWDV2ss9jewQTF5vSegi9s=;
        b=UbSDpNW451raosqgchwJPbTod6L5D3DarP4u9kCCsPBwTGhJV05yfkx07j5BdNtrhR
         moVH+AD+jMwBDkQxcZk+qIulUxJhufF7gYbFwXql73NoMN/HdyrI6iyqhRFZ5W2s8skV
         EBPw3XkJG7uvpjkDUYJjtRV6HilEqyqlifrkg+bMw5wUprce8ECPS9gsn2IaPZeu9+Oq
         P4yqlC3rucfH6wWlj3v2866YsEuQkHnY2b9rLDUgS3kthRgLQJNEt0gCPj9UIF9FvHOi
         XVTKOWAj8CeCMTH5p/Dl7QVDBUE/7mDXs6Z7ASWAC6DshK+ATIMZANRMtX5zn/6VuQGQ
         R+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227846; x=1785832646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfzWVXRZDa4gX/lhkOHjJJWDV2ss9jewQTF5vSegi9s=;
        b=H3QIPZrkK0hNzm1KQtpG3hMaTVzXvWMu/ASekt8qLVTJClJ3Q0P26LS1z8eG170rl0
         +rt8dkpDTUOq3AZpHV5IwblQJruafzW2HYjg3zrYd+tw5VqOshhmKDhmTJfV875uvIaP
         mLur5G8KGaudtz2nQm6UHmlnfbcM0TOs/aQfjCtyxrC5uqOaVk9JUz8Z2N/DPW+IEoeQ
         ZMxyrB76+psXfjEnimv0ciJXDxYoNMxsSQ46J4mAc4YZ/I/46cEwKx7DLdTbkGkrb8r2
         fNcillmGgExNJfHyiMtfezo0vUXHUnJzH4+Sjm/gfQuQ/PuVbpfbnim1pv+RLT9VCf3X
         F2HA==
X-Forwarded-Encrypted: i=1; AHgh+Rpljci4zfrz30jvjC7S2bzbJmQO0nSbrkJsU6atkOvByBzyEs/xNQXv+sdmAkj6GZy/5gIZ6KcX0Q7E1uWA/7rmOsrn3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrYTXmiWrAN36CEiwaaIVF9P6hqNoRpyQlUuvy0ytoXqQL2mAZ
	L9G2S5LqSagYw9uyJSOr1C32I7WmMblBW9HT8cnZcQKWjVFv63Cpdvm1
X-Gm-Gg: AR+sD129A7t5KqOLZcGp6Ro7BVE/ktj+XXFasj0yoNcWtGEX6Y5NkG7PuBcHJ5M6DJo
	13/6aCs8Eg8f+8jPyl/GikyXxcVcoBWHefgtMWFvb9Q6zx+fGWiYbhkn/lEC6rYMYa9UhtZyIXJ
	gd56i3kAdjmxJzL3rAaMN/25O75mZkUKegfFgt2ZqvFEOGJKP9Us3mz85jT5hatCdkiEGuIfsvB
	uQhBG4Voz3JCXFHIhiLwO7BME9NvWEckeOV+B4KqVeWGtrDhqpaFcLW+9SR+uL5x253j03Cmlnv
	Ieio1b9xCu5mjOPQLadbD3VukLQqVhN1p/tvJwtYIeUj70hUs9OUHbsTF5SgjRVTTKMOOdC0Hrb
	lqbmqkjBMJ7vSgtGgWz6RhkvWuEM2Ese2uBAH4U3nTczeq8HPRXrH/oHcy0pqBQi7/GQdqPMeI/
	tJIo1QwIXktVV0lnX4C8M4HCfb/qniF232KJxsK/eQbCg/pV93TJYYT1VpQv+88q1Ay6TfMXNVQ
	LkiUbDeZF8fxuFjXYtlP1oqi+X7Wc8QXZliTsWppVEbDZlrnNlziZGGS4+rd4rMCRw1t+//0GjS
	qarDXfkesj6GHVamk4lCwth3ihXE3q0aeaEYU54=
X-Received: by 2002:a17:90b:57e4:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-38f6a4594e1mr1751973a91.16.1785227846554;
        Tue, 28 Jul 2026 01:37:26 -0700 (PDT)
Received: from [192.168.0.100] ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6412d1cdsm944553a91.10.2026.07.28.01.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:37:25 -0700 (PDT)
Message-ID: <b004a0f5-1dcd-4d40-84c7-33108eb20395@gmail.com>
Date: Tue, 28 Jul 2026 14:07:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,ns2-leds: Convert to DT
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, simon.guinot@sequanux.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, kernel test robot <lkp@intel.com>
References: <20260724162332.32291-1-ninadnaik07@gmail.com>
 <20260728-garrulous-wild-jellyfish-a6e0e4@quoll>
Content-Language: en-US
From: Ninad Naik <ninadnaik07@gmail.com>
In-Reply-To: <20260728-garrulous-wild-jellyfish-a6e0e4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 28/07/26 1:24 pm, Krzysztof Kozlowski wrote:
> On Fri, Jul 24, 2026 at 09:53:32PM +0530, Ninad Naik wrote:
>> Convert lacie,ns2-leds to DT schema.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/r/202607231542.6ovJrInT-lkp@intel.com/
> Drop both. You need to read that report again.
Sorry, I missed the line which says not to include the tags in a new 
version of the same patch. Will remove.
>
>> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
>> ---
>> Changes in v3:
>> - Add optional property num-modes to the schema.
> Missing rest of the changelog.
>
> What happened here?
>
> Rest looks good, so with dropping incorrect tags (really, please read
> the email you received):
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Should I carry over this tag in v4?
>
> Best regards,
> Krzysztof
Thanks,
Ninad Naik
