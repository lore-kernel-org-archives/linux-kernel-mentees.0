Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6682036CDF2
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  7 Jun 2026 09:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780825486; cv=none; b=mzm1GwERkg7OC5m3e/5utOAzds/buS9lmPVs4F+Y0KST/mYuXAqJrSs3wi71vjaxBakxtlXvHzoMdtVMpb0dzScE1DRd5WEq9Gi+hpvc5tjXkfuFJxDrlaXhtOBWKO8BZfx4JgWuGphMg5HePgUm40vf/XoRJbdrmKBAmr3YDaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780825486; c=relaxed/simple;
	bh=ThYMWQAfsexWY1TWhGbF6PFLMWNiIlXKMllw2X788mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yss34WFDqHjKey346rD2P4x3jRkiEI0TantF6F/ucknwXN4TN7hsCHkB2jHoKH9BDjoyGP2B2UsR7eE8mXQbFDlKOM0SpQQXkxifq6pC73VjQrNBGX2lNk8hmWB6I9S7ytdyC/RCW+4BsARxSv0GdA4WfmRsX68qEb4dRgzCOms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s0R1w6+O; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s0R1w6+O"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso1488091f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 07 Jun 2026 02:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780825483; x=1781430283; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HR/lmdk2plRsJSnfN9lqr24Fr4cHJ+9UQGnQ2BUyH4o=;
        b=s0R1w6+OeeratzpttgAPYe/Esv4UiYDx/B+AIjQEJ7zRtnVqZhl8vdNFTT/s4GMe81
         qhT5FFJSkuJwiY+Y8N2LP1LRdLT9hnKn9KknuEhHB4v+Sgv2JwCfF5cUTV97OEXSj6sD
         GZCLnqnYb9WZRBmMY/E5/OMMjq9RQnHJNPmqmTH6UOljB+ioL9IkaIV2H2Qblrk8xuXS
         hSX+JQH8ZshJn9hPCN1QR5A0GfK5cyZVESmy+/jaimK2rDyYh71Fv8z/eV1XISGUeTSr
         p8zEMX+3O2JKYSm9waPEwG0RTlwsxKcK5eEIpM/MUC2rGcrlaEJJ1XXKtGUtNsoUNc90
         f4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780825483; x=1781430283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HR/lmdk2plRsJSnfN9lqr24Fr4cHJ+9UQGnQ2BUyH4o=;
        b=YO9+p2mTOp68GPkYmotA3gBJjLXvHsfo92rEK2xDnHsxHrshr+4r8fKieRSlLv/ll4
         +4sQru/VaKkAUr8uhXa/0tpEFbITCak0hlKT/SIniOM+G1UheNYIvkTsNSpyxUjqt3cF
         L2HDeTacYBc4W06MyePo2BP1yXlLcWM5dRmgDYbfTOcWLXnJ317IQK8YBVADfG39aw1H
         Kqj26BfeE8vRlvI8hvXv1/dX7erQKm04xGhXAG7qaGpFRKY7NU+8YkPSulEoy4DCt3Ur
         nAiA08RLEkkjIX0QcXC6JiL5wRpqAS7+5pFpvjHdD9FhE2tBzLi5Xps1ynVnGWC02Zvn
         L2Tw==
X-Forwarded-Encrypted: i=1; AFNElJ8a7yvj2iJ5WLVJvRPdf7AuQHrPycVQWIXa3PkjvO1JEbbp5D8+A7WLCXQymaIrpqwsb0viyrND0EFF3+lRSYsmQIwQzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfcRZn1GtYpeY0efNYeerUS2gTjmxFQHD3fwcqKeG/XWLVdr9c
	D6oX8eS30MnHQgS6RCmZ9tlNymrfWN6Eh8f3ZDUwzbQKgJdpowo/W65z
X-Gm-Gg: Acq92OH1gNbUDtP3rZCdYRT7mTcqHG1jD1bpTHwaBHmmr+cNItKf4+TKR+drnqLVb98
	NM5+K/aeOKdf20J7mJ7fQuxTSPAwTCYM9eWAiTDQ/TPeHapJ31h1LMdHmmw1MrcnTjLMli4pdxA
	f44UGxUC2YsRp3jSxJm+Rr8snWA/0v2m2sHJoXt26Y1yJ95DnfYEYNuIwvE+c1weoAQaAp5oTK0
	jNa7R0g8gPPx6ZW/EMvOtLf0Lgdrrzs3SXE4ibNaZXNmvcqYLywrrgSF9A44oqG9/RrGlC8yPnH
	qrcrjzp6woYz9EMeXpRg8CleubSgbKJaNT87NXOkuD8+HcenWSgM1jP8sNtdqkkuyuAJLYtId8j
	l4xcrKNCe5SMA2ZPEiY7lKFeWoqsY29FmT+NMyix3QyyuyizDZPwgkOriHZMcCoStM0iw01xZAX
	I23opwKhvfmDqhN+GhromMd14IMrV1qCKWj8ZBrxd5cpqXgK+uLsjukOBLNFlLF5faFsjC/Vg32
	Jjtx1BJoA==
X-Received: by 2002:a05:6000:181a:b0:45d:817c:b8b2 with SMTP id ffacd0b85a97d-4603065b5f2mr11689633f8f.30.1780825482665;
        Sun, 07 Jun 2026 02:44:42 -0700 (PDT)
Received: from ?IPV6:2a01:e11:5402:d840:f1ee:c5d:74e4:6e19? ([2a01:e11:5402:d840:f1ee:c5d:74e4:6e19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm44922742f8f.36.2026.06.07.02.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 02:44:42 -0700 (PDT)
Message-ID: <d1c24756-3025-4ce8-9437-be3b2a4b89a4@gmail.com>
Date: Sun, 7 Jun 2026 11:44:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] iio: tcs3472: implement wait time and sampling
 frequency
To: Jonathan Cameron <jic23@kernel.org>
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 shuah@kernel.org, joshua.crofts1@gmail.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20260522123420.45495-1-aldocontelk@gmail.com>
 <20260522123420.45495-9-aldocontelk@gmail.com>
 <9c0bec93-e102-4655-8074-fd544b16d912@gmail.com>
 <8392f8a6-719e-43d9-813a-0a163f450ed8@gmail.com>
 <20260606150939.72974703@jic23-huawei>
Content-Language: en-US
From: Aldo Conte <aldocontelk@gmail.com>
In-Reply-To: <20260606150939.72974703@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/06/26 16:09, Jonathan Cameron wrote:
> On Sat, 6 Jun 2026 11:27:16 +0200
> Aldo Conte <aldocontelk@gmail.com> wrote:
> 
>> On 04/06/26 11:23, Aldo Conte wrote:
>>> On 22/05/26 14:34, Aldo Conte wrote:
>>>    
>>>>    static int tcs3472_req_data(struct tcs3472_data *data)
>>>>    {
>>>>        int tries = 50;
>>>> @@ -166,16 +214,131 @@ static int tcs3472_read_raw(struct iio_dev *indio_dev,
>>>>            *val = 0;
>>>>            *val2 = (256 - data->atime) * 2400;
>>>>            return IIO_VAL_INT_PLUS_MICRO;
>>>> +    case IIO_CHAN_INFO_SAMP_FREQ: {
>>>> +        unsigned int cycle_us = tcs3472_cycle_time_us(data);
>>>> +
>>>> +        tcs3472_cycle_to_freq(cycle_us, val, val2);
>>>> +        return IIO_VAL_INT_PLUS_MICRO;
>>>> +    }
>>>>        default:
>>>>            return -EINVAL;
>>>>        }
>>>>    }
> 
> If this races with an update can we end up with too short a dynamic timeout?
> I.e. what happens if that time changes - is the current read cycle completed
> with old timing and it only affect the next one, or is it super simple and
> the affect is immediate - maybe changing some threshold on a counter that
> is used to trigger / stop the acquisition?
> 
> I would not expect us to either be able to rely on particular behaviour or
> find it documented anywhere.  So two options.
> 1) Lock around the retry loop
> 2) Set the retry max to the worse possible case if that's not insanely long.
>     Give the polling should exist early anyway it shouldn't make a practical
>     difference and is always long enough.   I think the max is about 7 seconds? That's
>     rather long to hold a lock for, but should never apply if real timing is a
>     microseconds.  This would be my preference as it's simple.
> 
> Only remaining thing to check is there is nothing in the datasheet to imply it
> is unsafe to change the timings during a capture - as if that were the case
> stronger locking would be needed.

Hi Jonathan,

Thanks for the analysis. I checked the TCS3472 datasheet
does not document what happens when ATIME, WTIME
or WLONG change mid-capture.

The worst case is ATIME=0x00, WTIME=0x00, WLONG=1, giving
614 ms (Max Integration Time) + 2.4 ms (RGBC Init) +
7.37 s (Max Wait Time) ~ 8 s.


For v4 I went with your option (2):

static int tcs3472_req_data(struct tcs3472_data *data)
{
	/*
	 * The worst-case cycle time is reached with ATIME=0x00, WTIME=0x00
	 * and WLONG=1. So: 614 ms (Max Integration Time) + 2.4 ms (RGBC Init) +
	 * 7.37 s (Max Wait Time) = ~ 8 s (Total Max cycle time).
	 * Use that as a polling upper bound; in normal operation the loop
	 * exits as soon as AVALID is set. So the total number of tries in 8
	 * seconds considering a polling period of 20 ms is 400.
	 */
	int tries = 400;
	int ret;

	while (tries--) {
...


400 iterations × 20 ms = 8 s upper bound.

Thanks,
Aldo
