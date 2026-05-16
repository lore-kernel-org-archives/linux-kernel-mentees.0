Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F36C405C2B
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 May 2026 11:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929457; cv=none; b=pAJN6qDPeItSSrcuSFW71Mitc+Tka5s4sOgTaKTCRunNkhpM+oQNdmt+zqjwhflCO7lmFu/8fqi1wfyd6epmn4U96kJ5VnlTP4nTxJ9ckdGMYmfOOt2XfPwpmD4Xwij7BSgcri1BnkyKLVcPISes+Jo/xkKhhn2GAncCMoLZ850=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929457; c=relaxed/simple;
	bh=ShHzOwIepnoht6KiDhIktqWbm/o3Vwx6B0RA+PQohtk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZYHkZzMCMnHfGXvGLSmsgtR7fFf0OJ0KMdW0Gtc7XulkYs+oS8uACTrZgJrz5y5H2TiVnKQhf9UCzU81PrKytJ+4vrvc8+9fDGGDPY/HDUdp5wU2VFt/rmANZIEbW07qH1qZIH14yi7R5+y2pTe+B1mL2UXTY0z/nDPqqmVNTvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gD2BSvy6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gD2BSvy6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so6605835e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 May 2026 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929455; x=1779534255; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CgxlGI2RJ/TxMcYutFk4DspmNHfrDImny4KkfuqlQkY=;
        b=gD2BSvy6YdLEFjVsfgcNdDLwM6GCs0hdJCN2sUlEn/lbPdnXF9QdE8zLdyYPsgmTvN
         yEMQnzendE9EMNF8eNdqX/cPqpJfZX82/3sbIb/qDhMBkMQ356AN17BmbSnO0ixaLeW9
         tVGvTaT24A18v+iT1laCQJTpuoENcLjevIOdcUNXR5Uj4iLvXm4GgncO8ziHeJKdUoE0
         JcOg1gmj6RJ5ddGRySddql0qJ9s+EohiuKqtHwY9tuZIkW9Anon1Hh9xxCf+1P6s7P/O
         DTuahxFA5gH1EQoPqn5KQrP6HzzgyV/BJP9opvhDb8WxLxKC9pX0vWpm7Mh3QSBJcjrN
         fPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929455; x=1779534255;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CgxlGI2RJ/TxMcYutFk4DspmNHfrDImny4KkfuqlQkY=;
        b=YmNOxDLWAmW0L831ztc4HDcD9HluwMe+5xCRvoSA27gBsdyxFFq5XUBgvGPq2TPeK4
         CLNnqdCohChjBXqh4M5ofVSBd+umNufyRqoo8nZBqhrnKpl04TNkw7sPXXp22w0gUHFP
         IsU5HqL3S0b7P+2dE5eac9wIOAEDZfiiRp1J6+eS4Ow43cUDwOuHGpJxhHy22CsFZ0VF
         6YD56L00Uye6XKlwi1GkpwC3a73SjOdlvZpbWi/hUc2OETdMSHPtmLR4N26HoTyPfbtz
         zidEstC29N/9pRo3BAtyVCuyzqTvNcQX6HDwHAcZ4RnUwKTddokgdW1TQFjqJWcHE0t7
         Mvyw==
X-Forwarded-Encrypted: i=1; AFNElJ8yt36JulwrYJM3zHvwQabUBQBwY4zmv+lQrOqIFEOxkaBhzbj+Xufn9SYLDTXnTtR7Sf7n2p8lIquLMyvH9Y8177S7hw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx39qvApUvrRjYF9+ESH60aKeDLjAfxvkUXEdwqgqmF4RonFocO
	kkLuKo4aZpx29oQvHxZgcuM0O4URpKVlU5okjfGque2GDeToKvCy0Dmt
X-Gm-Gg: Acq92OG7C3J13/ohqtHUjwKHgsdf9XFhmSNKtT0D9irbi2hQb/KX+NXcp7KH65ZqSQe
	5luLAjx3yJTm2sTiUeIf8FGPulFTEzwVtLIKB0BHiIpK8sRNq47XCQjMBzgO/1WG5Ug6TmQfw2m
	kB7t6ffC8B+BerRy0a8N1zJIJUQF4FqiqwQYZQSGE3tK/A8OcKvtPV2SzJONmspe/BN3B+0BLxk
	WfceLwABwRqV9lywlJdc7b7lDXM0xlHV8hUVZztikd5m0Wo0kLoFIYoq7qzpQ1Owymx8uuLFdjU
	We+eYejZ49zsCdm+6c3V5qSmTzgvMZhfUm54D5ZXatYnAEqwON8GuGL/5E1gGzSdrkQoTAkCBLw
	3xwxFZPv0cmkS4Ils6x7bhN3psZigEUO0/TaPWYvxB80WT+bTUg2797fE8Euq1zvj4jwxdBI2iG
	8KfMRAU/63sjpubymcSRc23VMWOIgV5sIO4B0dAmbt9A7z1jsb4j0wLE9RT2yOgUvzzXl8fXo=
X-Received: by 2002:a05:600c:35cc:b0:48f:fe2a:107b with SMTP id 5b1f17b1804b1-48ffe2a1125mr5855755e9.7.1778929454853;
        Sat, 16 May 2026 04:04:14 -0700 (PDT)
Received: from ?IPV6:2a01:e11:5402:d840:f1ee:c5d:74e4:6e19? ([2a01:e11:5402:d840:f1ee:c5d:74e4:6e19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm21338399f8f.20.2026.05.16.04.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 04:04:14 -0700 (PDT)
Message-ID: <1c87362a-bba8-45b8-a836-153f468815c4@gmail.com>
Date: Sat, 16 May 2026 13:04:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Aldo Conte <aldocontelk@gmail.com>
Subject: Re: [PATCH v2 5/5] iio: light: tcs3472: move standalone return to
 default case
To: Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 shuah@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20260512223215.25596-1-aldocontelk@gmail.com>
 <20260512223215.25596-6-aldocontelk@gmail.com>
 <agRfMWL9BughLT2x@ashevche-desk.local>
 <36ed59a7-8af7-4458-9e90-70ea251b389e@gmail.com>
 <agS70Dph8-zQT-e6@ashevche-desk.local> <20260515190517.70bb0ba5@jic23-huawei>
Content-Language: en-US
In-Reply-To: <20260515190517.70bb0ba5@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/05/26 20:05, Jonathan Cameron wrote:
> On Wed, 13 May 2026 20:58:40 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

...

> 
> I would add for this that, to reduce churn it's fine to add the
> struct device *dev = ... bit and use it in new devm calls. Just do the
> remainder in the follow on commit.
> 
>>
>>
> 

Hi Jonathan, Andy and all!

Thanks for your reviews! they’re teaching me so much!
If I understand correctly, I need to wait a week before submitting version v3 
such that other reviewers can comment right?

I’d like to take this opportunity to suggest two alternative lists of what 
version v3 might look like in terms of patch order:

First option does not consider the "== NULL with !" patch and so:
1. iio: tcs3472: power down chip on probe failure (NEW precursor, bug fix)
2. iio: tcs3472: sort headers alphabetically (same)
3. iio: tcs3472: convert several functions to use guard(mutex)() (modified)
4. iio: tcs3472: use devm for resource management (slimmed down)
5. iio: tcs3472: use locale struct device * for remaining cases (NEW)
6. iio: tcs3472: implement wait time and sampling frequency (revised)
7. iio: tcs3472: move standalone return to default case (same as v2)

Second version will consider it:
1. iio: tcs3472: power down chip on probe failure (NEW precursor, bug fix)
2. iio: tcs3472: sort headers alphabetically (same as v2)
3. iio: tcs3472: convert several functions to use guard(mutex)() (modified)
4. iio: tcs3472: replace == NULL with ! (NEW, optional)
5. iio: tcs3472: use devm for resource management (slimmed down)
6. iio: tcs3472: use locale struct device * for remaining cases (NEW)
7. iio: tcs3472: implement wait time and sampling frequency (revised)
8. iio: tcs3472: move standalone return to default case (same as v2)


What do you think?


Thanks,
Aldo
