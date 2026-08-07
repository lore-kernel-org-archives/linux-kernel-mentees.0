Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5A5377AA2
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  7 Aug 2026 18:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786126505; cv=none; b=VfvUvRHHdDOzKtLLGEKEpYsrulTN8uR35skgQ2la2CmezUzVfyx9LUK9kbxwfBdN/+jpEMbhiSazm5YTfY8fboBOjpUdEVFBIP30CN24soOOMtJFyosAilt15TLIIT+2FpE84V+lAtWO2WA8kFQ2X5X31KOKmdfAbszYowxuMI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786126505; c=relaxed/simple;
	bh=s9tjNp6sYyYP4mCT3gXmsSd7L9AQpuVwD/wbCY/jEec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2yRhB72F4zQAEd5SAivlO+uiH0AGKySEmNBweUXzNJkcp8cFWdhN/dzisFY7zEvd0Z4g1xRkZi3gsB0rD0kdD5P3KZTHDSKxjW4yzU7sTTZVrLlXMpXch8NblfORgz/QaTL4A3kz/Ez/44oeofLoahC9EzTWUak+esr8zXZIvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=m9cCOGFN; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="m9cCOGFN"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7ec1e9d3359so2367712a34.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 07 Aug 2026 11:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786126501; x=1786731301; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7m1ciHkvtKCbvcubLILJiqP/goECKk0dZZNr4piEjQ=;
        b=m9cCOGFNJqx7IdmNXfBx/Va/76s2FBW1QYrF0gvZMRl94gC15+mxTUNZXINcLF7t4H
         2AlDqN7cNfaptHrVJOeezewqZnPHa1yeIE2zuaSqB0igvx6K/Q3pNzNbemcp62F4YRS1
         He/gN9L8+D3LgWE5plDtLfzE8elXiQROS1/kM2N7m1XV1xFCIX1neDBa9bE1GihBrhQu
         j81r1M3213v67Uk5JyCwj5gz+wOhgItBFQUGCqH4s8ri1RtBGN6wFwKEGoSXqIHgcTTe
         utQzXOMp6bAJiuU0Z42D4Nz+VQ7vLU/WRJMqvNXsS5FZ0eDTcHhuuXaMZ9eUcFxmQBHr
         oMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126501; x=1786731301;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7m1ciHkvtKCbvcubLILJiqP/goECKk0dZZNr4piEjQ=;
        b=SNWQJaMrWxGOrWpTdPSwSkWTrq4kqQjRiTuxKOU2Is8neMuZH82kaTnBSFudXoHLJn
         h4Jajhmms7J82Ir6i5zjRdAYQkONQqj/y5i+qhXmEQ0Ajvajo7yV72xJgSgyQcKa60Jv
         aNyP1WrCQQ0nnU/iUeDsukKCTQIsaZ+Cn9Oisg0R4u9fk8KEZ28jn3igTzeNT6RC4EIr
         pfBNFqi7pWNX8+BiY6tLARfeA6WNqCioTyDJy92MNc1KIbYb78E3tMojgK+gLdnTqGYI
         b7BYxmvho5WA6O+ftbZ1zcMIXpwUTF4hHzjm0cfo9ih/cJUvxGEDinh13JXFOm12+M5R
         IqCA==
X-Forwarded-Encrypted: i=1; AHgh+Rpj5YGcXBPXH0KXii+6vbHFjyeUt0P6wXfNv5NHB8Gt765MFQsR8CrqCTwt5X94QZYBsXyruOlzq8E/OBh6RvB6r0zE9g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yww2KNjBfA/WVZyeEwQIGKE2AQEPN1oRZ08UzkwY0ybpIs0LgLH
	/QqRw3Y0z0ZrN/aHyEccgKdn72YbyI1pgMS3rTMtU0ZZFbjBTJZrJWcZVKlw53SPVI4=
X-Gm-Gg: AR+sD12P3kf4Cg8Bje9FusfIDaEHOm9Ylmlu8X1k7q9FOXKqj6dKwNW3mS1dKQ+OnR3
	6bStAgYFt8UfO51VYxRstj+s6w0iHP9GL9eYp5HyA4O6ZhxrgBV83nM6RDxsxogOoqQlZY9YnwW
	UfqDNzZWLlF/Gk8BP4zP2PBfi1yuA9toYL0hf2EZxu4IOuf+wAs0r3DsoYA9UceC73mYtLicJwF
	G48kLsOL9Bra/zCGY2UCHpiFObvUGtnteCMBg9xBha+ovJ+6kY8wJu2tgteb2AKcXHb2MG52ZI7
	fUdylw6i2tnUMXeAqhOi4kuwx7Zt1FhDKd2kFp9aDSFPoaJ/4sZb6UwhNsIAjhChc1qWAcmPBl+
	cCN09105D/i7kO+vHNKCBAW1NV12ZYMNrixdOcaGmFmQqnNuaayKpmQJ0SPeQq7E+/zkFlgkzBF
	lPbVp9PXN2GISeLyeY8PtJ8RvDY+vq6b2+I2MwkNvK36Y7Ei+9tsZF6I1t8L9GAha1sjpHDwrOp
	A1bPqUoPjWW8Sf3vBBrHn3XfZujO49emI6p3/eOKfc1a7Zh
X-Received: by 2002:a05:6830:6685:b0:7ec:2fe:1ec0 with SMTP id 46e09a7af769-7f1e5ce9482mr16883603a34.4.1786126500710;
        Fri, 07 Aug 2026 11:15:00 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b714:88c:313d:dee2? ([2600:8803:e7e4:500:b714:88c:313d:dee2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b563978sm1826299a34.4.2026.08.07.11.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 11:15:00 -0700 (PDT)
Message-ID: <53ded669-6dec-4472-840c-91052b1afcb3@baylibre.com>
Date: Fri, 7 Aug 2026 13:14:59 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: iio: proximity: move LIDAR-Lite out of
 trivial-devices
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, jic23@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mranostay@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20260714215433.41259-1-rodrigo.gobbi.7@gmail.com>
 <7b8973fd-385d-4532-8213-bb0a811081ae@baylibre.com>
 <0ca14770-bb0c-4be7-a9b0-6e07d521550d@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <0ca14770-bb0c-4be7-a9b0-6e07d521550d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/7/26 12:10 PM, Rodrigo Gobbi wrote:
> On 7/14/26 19:44, David Lechner wrote:
>>
>> interrupts:
>>   description: 
>>     Mode control pin can be used as a status output to provide interrupt.
>>   maxItems: 1
>>
>> Mode control pin can also be clock output, so we could add:
>>
>> '#clock-cells':
>>   const: 0
>>
>> if:
>>   required:
>>     interrupts
>> then:
>>   '#clock-cells': false
>>
>> I only checked Lidar Lite v3 docs, so we should see if these are available
>> on v2 as well.
> David, quick pushback on the #clock-cells suggestion:
> 
> The oscillator-output mode, per the Garmin datasheet, page 8 reg 0x4 from [1], isn't really
> meant to supply a clock for another device's logic. As I understand it, it exists so the host
> can measure it against its own reference and compute a compensation factor for the device's
> own distance readings, since the on-chip oscillator is only rated to ~1% accuracy.
> 
> That seems like a different relationship than what #clock-cells models: a provider is
> expected to report a rate that a consumer just uses to drive its own logic. Here it's the
> opposite — the rate itself is what's untrustworthy and needs an external measurement, and
> there's no consumer that would actually want to clock anything off of it.
> 
> Given that, maybe it's better to just describe this rather than model it as a clock property,
> or leave it out of the binding entirely for now until there's an actual consumer for it? My
> point is more about whether #clock-cells is the right semantics for potential consumers here.

Yes, this sounds like one of those cases where there isn't an obvious
correct binding and we should leave it until there is an actual use
case to make sure we get it right.

> 
> Tks and regards.
> 
> [1] https://static.garmin.com/pumac/LIDAR_Lite_v3_Operation_Manual_and_Technical_Specifications.pdf

