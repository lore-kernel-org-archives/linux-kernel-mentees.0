Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3251465A5
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Jul 2025 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753552817; cv=none; b=BQl/b6/jTO8YgaI9Z7TBY6pqbV/q030fGdpLlWZU2fBTaM4Rm9eD5CsXeRIMW+I5U9nfIzyNyT5nIgZ1nFNnnYoZZ1JNyov324fdGapq8vCPB3FuxV1a/eoo4Yqu/SHUW+yheY0Z53a0fmRiRSbCFLjI1lFQ9w2QjNzANMfXQNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753552817; c=relaxed/simple;
	bh=yvcRHhXuYyD4nYec3hWl6gxmG7DKCLk6OOfx+dctTQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAgphfavGfkS5vH+Dty/SVjW4JW+GVC4qMgV/SwPb9404wmffTmdRFTpoNpSYIMwIRZj6eOYKQjAY9Odm/IdI2QU3a/wzPQZ+725pOSDY7xDj1qbx9S9xaRduj1i3+XCB5EaHdcISUdSqwh04n4MRSBbrQPyhAI1iSrtLmBcGFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=nT9EB+ew; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="nT9EB+ew"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45617887276so19895335e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Jul 2025 11:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753552812; x=1754157612; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yvcRHhXuYyD4nYec3hWl6gxmG7DKCLk6OOfx+dctTQc=;
        b=nT9EB+ewyUwyivzPhGmJ3URjmixZVoiPAQHF6hCFOm8RRjAVhbMP/xZzWm+tyoLqIR
         INkS5i5nnJ6AZq/wnnVAQR/QbdPFecbY1CTrvrS1gQhtYxNJUziWnylrf9Z4JTRVKu7c
         q8p/1Pcxtog6RVxr3uwF6C47Erpym0gyhbzMC6G/5W1qdBYjkVc5taX9b6XVT3txM74l
         YfxGJVGVKvqaCIbPifijXKlaHX2iZ4FgHu8901fG2J6PP3zZf2eSiuV6ON4pQO6jvr/k
         veShjM2ffvi0vsTZZ8C024tjRtlxk0IqJdVz66Rkj5WIh3DD4zt6s+caKdhpVL0PPzxK
         firw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753552812; x=1754157612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvcRHhXuYyD4nYec3hWl6gxmG7DKCLk6OOfx+dctTQc=;
        b=Tp81vliQvDoFlfJPgXgUAmPu2UoEmy+KiYrnhUC3OAt0sKwqWz1dglu5Dj4XrAaQ3T
         GOyH1bncVvmWZfajY6EcSpbPsp5sgEgbTJh5yxs/HsMts6TBg3W6Pt1I+DBwVaikW5ky
         HCr+j0+A735Dbv38zeqbShqcCjRDuW4rvwI1b9hcDfUuvE2NCu4jNIkpzEfIH/J2hg0d
         oytNFOaf4t0INm5W1/X2H/9Kz9oxpB/AsMXGX04UR4CNLIx+KHzSTPucEF+8uLXMMev0
         R2qyhQLdOtn0WstSEY+XRTnppqIyQLe6lZQGcVsfQT0J0XPDJ0MCjkmj7VUiDfaLDGq3
         aT8w==
X-Forwarded-Encrypted: i=1; AJvYcCVYZF2ViSJlecWZQoHm5eCUX3TBgBpbJM43JSzyKpmzKT1EBhYn6ftyOOxGa20/iYNkjvA5QkyOX9EimM2HdK5qhxV4qQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzvLHDwJnWvf+gVIdDLJ4kc2NXUDuHI5opcSG5vFeUDA97IGj3
	uGl3y7R4Rxl0vU8Kbc/AkGofBkwtBXdz6DuieM5WhJ3exj+UNj7CrGtNHQRI98bXEpk=
X-Gm-Gg: ASbGncvGaUfcG2NCn2aAcx1Du5IHa3JTpKhvBll+iaJFX1Y1iv/T7gTXgelUMxyLEmg
	xPAXUKdBmrIj0frv4Sj9ylC6dvzRegU0aLVmm8V37kzFjS2V6m6C3fHjNlCdvgtoSpVd/j03m74
	1vfBivK037cGY11wvseW73rQrySXWozlOBjf4x9cR0PHI3LGvYF5PGeas+iFT5yLDTSh3L8sG+K
	PmEfmJBTXLrQ1/xQQFihhPgDRl0pKjkTLk188nU8EM0Aw/ca6kXVonTPFnedg20LlX0drU/a3ZK
	EUZVw8EhPaBorkjPuXm6Uxn0MOffaou0yYUopZVBehdEJNmkdSAPpxaGjXWfdlJ7YR7toSU5svO
	vmc4ktSFXhVkkXQ5KcFdh4qV2anGrfR5VNeLkBOwERtW0+bhcfXEuVkkFKcwpZ3OGDOwXhxbITY
	JFhZVUlRABPH+f
X-Google-Smtp-Source: AGHT+IEflhfEaAlph6QytLsmeVZzt9JsNjEPC6m2JqYaPbPelQ7eBKZoO5O6AvlWzFTa4x0V7hT1Cw==
X-Received: by 2002:a05:600c:3514:b0:456:27a4:50ad with SMTP id 5b1f17b1804b1-4587667a7b4mr43141945e9.33.1753552812037;
        Sat, 26 Jul 2025 11:00:12 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:49d0:43d5:5891:26ac? ([2a02:1807:2a00:3400:49d0:43d5:5891:26ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587ac58045sm37621935e9.22.2025.07.26.11.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Jul 2025 11:00:11 -0700 (PDT)
Message-ID: <a9acf284-d55c-4c8e-9f34-c2feb26a446b@hammernet.be>
Date: Sat, 26 Jul 2025 20:00:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: spacemit: fix resource leak in
 spacemit_ccu_reset_register
To: Alex Elder <elder@ieee.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, sboyd@kernel.org,
 dlan@gentoo.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
 <ed5fcfec-6330-46e8-a302-5cf1d8b3a9ce@wanadoo.fr>
 <d968eb77-50f2-4d28-a57a-112c87dff8bf@ieee.org>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <d968eb77-50f2-4d28-a57a-112c87dff8bf@ieee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/26/25 14:57, Alex Elder wrote:
> On 7/26/25 4:16 AM, Christophe JAILLET wrote:
>> Le 23/07/2025 à 15:25, Hendrik Hamerlinck a écrit :
>>> The function spacemit_ccu_reset_register() allocates memory for an
>>> auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
>>> these resources, resulting in leaks.
>>>
>>> Fix this by using the appropriate error handling path.
>>>
>>> Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
>>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>>> Reviewed-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>> Changes in v2:
>>> - Properly place the Fixes tip.
>>> ---
>>>   drivers/clk/spacemit/ccu-k1.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu- k1.c
>>> index 65e6de030717..5bb85e32c6cf 100644
>>> --- a/drivers/clk/spacemit/ccu-k1.c
>>> +++ b/drivers/clk/spacemit/ccu-k1.c
>>> @@ -1059,7 +1059,7 @@ static int spacemit_ccu_reset_register(struct device *dev,
>>>       ret = auxiliary_device_add(adev);
>>>       if (ret) {
>>>           auxiliary_device_uninit(adev);
>>> -        return ret;
>>> +        goto err_free_aux_id;
>>>       }
>>>       return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
>>
>>
>> Hi,
>>
>> I'm not sure this is correct.
>
> I'm sure this patch is incorrect, and the original code did
> not have the stated problem.  Thank you for calling attention
> to this Christophe.
>
> Stephen, could you please revert your commit of this patch?
>
> Thank you.
>
>                     -Alex
>
My apologies, I am terribly sorry for this mistake. I was convinced that
this was a leak but was not thorough enough in checking it.

Thank you for catching this issue in time. I will make sure to be more
careful in the future. Sorry for your troubles on this.

Kind regards,
Hendrik

