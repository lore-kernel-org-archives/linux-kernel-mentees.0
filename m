Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BCD2EA147
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763938; cv=none; b=bwLmMAmGy1zgxYRGCydkQD1H/H2JHUNu/HY3HExxmUc6Lj/YszvttW998K6lP4JzRuh6LDhjev0hmD2LtIOlu/71B6OfHLsXqpfh45KCtEZyTbXZgQj0VdThmvrWVh9sPCf9mMKuo6oFCuzTk/+6QBTgaTYHNyDr0oTFquazr6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763938; c=relaxed/simple;
	bh=Ib5rwP8vabBmjTB2gHFRufvV/brLouRfcpTeVRXGdAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YywrgVS/P/FI7lSXvqlxmogvVBCXjQfoQ/bNH6am/Bk3fz+Rf0fx/N8OcnqAL7fqS8DySsXsl7cwBRX8fTknuDSkbH3eDvuzLnxeQXwP004G7tER0dN8OofbyuazFHcPaxadq0nDITngEEtJqyU54o/PaXjrrnF+vjgh/IkKhI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=rdB7mbha; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="rdB7mbha"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso1737545e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 01:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755763933; x=1756368733; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RnPqNwnRdJMIc37XxiVZSImeUH9HHnzjQda0KVcM9Yc=;
        b=rdB7mbha8Uv9crQxY/bZ714CZld3pN2AUmT9z4Xv9InMFwB0jgjHvoIDMoBubRpUl+
         /YFCXx/tPZ0s37d2JjOL8oOCwMFkac41qm1TxEGLTzDfTuFdtOLqKMD8TENChrdpYmoO
         DjIfHQBf4STzyItdnY6GoiJBNdHue52gh3hrvr8ZxXHx5KaNlbBzhj86mx4sUw2Qc/NO
         hHXx80bkaTCsaECvsu8ELtuPcf2ik1nwJyhMNp4w9erKNNpQpwnS6VUnO1bju43P5wfj
         eLCWj0s3NfLPsoaDkXIdSQckBStDW4g/67bnVA7ygFi5IKYCicpK+bf2D504rFcshnsM
         gBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763933; x=1756368733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RnPqNwnRdJMIc37XxiVZSImeUH9HHnzjQda0KVcM9Yc=;
        b=vZwb1AKQIC8GPgBZe6JNEbJiPy2MdED//SJo9oKv+wA7OkpbYCXi21RRPtchUf/5Fl
         /o1FitWFTDzE222OlgPOxiFA39ClB7JmaSlNhYPeW/wmctgb5QPN5mWD7lbFlIH/Q4CI
         Xb1+bNEERE5+sbA3pVvxVxmSMhDqOUF8887nFldhRLUaj4BbHvcS0XyPASv+nDYY1qKR
         LAVPGZaZE/sbRtOGJZ8h8UthK0KzYPEpfuDCFfPAyq2WzzIpcP08/llLEBte+hZ+BT1K
         549EJCipmOyFqMZ0ek+/3N6lAJB8cWE7IAzJlt5wlPsTn5n379TiM1sTgrt8uyVpnzx7
         7zCw==
X-Forwarded-Encrypted: i=1; AJvYcCXDm1Zqb85BoIvagnz5HAMCjrHOVR27VMqBOCdeyp6egSqrTmg4SfbSe/BthUAMZE+G71VDNScWhm5nSpEjvXJZXeKXiw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPO5o+fiIbI68lA7Q8IzC9PboXtVKbAvJKK7/KHlU9oSAsv5Rr
	Dphwb6vY2LIiNkluzRtPLHJfKmH9CBULVps2eEFN9whu6QvqZhuc1Ao30zp5Pu7Fj3g=
X-Gm-Gg: ASbGncscToIMBnk1AsShEkuZNbwXWBpbLpLNpU/mnTtO+UGze1EvDsiP9qsK8RI5tVy
	/LHOA83sBx7fu9C3wOW7fERx9pqUyAHfz1+eDDEb282tOQocvHMSFtreEShZXzwAl1ilT/vbnVd
	1mMODr8YXqkIMzeRATPyYOLBaxQjHSdaHOhhswPFjiA3TpJrYzjGdtNyaLAxevtvZvOaiFnA4HO
	T4uOYLz1talHa0XfjACbqD0ZxOdUkkF6e7SBCnaeKJxc1NVzvv6irBqHolcBlqtFcnnQx46naxJ
	xEUDVotle5rAK+KeqT68/yeERmuKG0RWR85dHEzRSLAxwcp/lFb2aDsF9YUnyn2qyng14fENOrz
	Us7f3SOgwAouMoV2hITyCG5Nx/jmAnocn8tUjq+a5rOVBznWCJLQFYqAHLmy8h/BtUsBqDQdbYW
	HC4dwoqeNFSjim
X-Google-Smtp-Source: AGHT+IHdhYS0MRSPzzW3UprEmG6p659Pq++hTQXcf3C6FUIxInpMAwyfL1/KDCaz5DbATd0JncFKyA==
X-Received: by 2002:a05:6000:4283:b0:3c3:8e05:f72d with SMTP id ffacd0b85a97d-3c496da8a46mr1312520f8f.33.1755763932852;
        Thu, 21 Aug 2025 01:12:12 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:b63f:533e:fab7:5343? ([2a02:1807:2a00:3400:b63f:533e:fab7:5343])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074879fe5sm10591690f8f.2.2025.08.21.01.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 01:12:12 -0700 (PDT)
Message-ID: <b98cfa73-c6ec-4006-bf84-febbbdea8804@hammernet.be>
Date: Thu, 21 Aug 2025 10:12:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: add UART resets for Soc K1
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250807191817.157494-1-hendrik.hamerlinck@hammernet.be>
 <20250820231917-GYB1065530@gentoo>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250820231917-GYB1065530@gentoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Yixun,

On 8/21/25 01:19, Yixun Lan wrote:
> Hi Hendrik, 
>
> On 21:18 Thu 07 Aug     , Hendrik Hamerlinck wrote:
>> Add reset control entries for all UARTs in the SpaceMIT K1 SoC Device Tree.
>> UART0 was functional as it did not need a reset. But the other UARTs were
>> unable to access their registers without the reset being applied.
>>
> ..
>> Although perhaps not needed I did add the reset for UART0 as well,
>> to ensure consistency across all UARTs. With the current-speed set to
>> 112500 baud rate, it matches the factory U-Boot settings.
>> This should not give issues with early console usage. But perhaps it could
>> be a good idea to let somebody else confirm this as well.
>>
> Adding reset to UART0 is just fine, so we don't need to presume it will
> rely on bootloader to de-assert the controller
>
> please write changelogs in imperative mood, you can follow
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog
Ok, I’ll update the changelog accordingly in v2.
>
>> Tested this locally on both Orange Pi RV2 and Banana Pi BPI-F3 boards. 
>> I enabled the UART9 and was able to use it successfully.
>>
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> ---
>>  arch/riscv/boot/dts/spacemit/k1.dtsi | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> index abde8bb07c95..7a5196a98085 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -667,6 +667,8 @@ uart0: serial@d4017000 {
>>  				clocks = <&syscon_apbc CLK_UART0>,
>>  					 <&syscon_apbc CLK_UART0_BUS>;
>>  				clock-names = "core", "bus";
> ..
>> +				current-speed = <115200>;
> please drop this property, dtsi file should contain generic info for SoC,
> even in real cases, all boards use UART0 as serial output and configured
> at baudrate 115200, it still be able to alter to different frequency..
>
> besides, if you really want to set baudrate, then I'd suggest to configure
> it at board specific dts file, 
>   stdout-path = "serial0:115200n8";
Understood, I’ll drop the `current-speed` property. It works without it.

Thanks for the review.

Kind regards,
Hendrik

