Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D84328B4B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 17:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764784082; cv=none; b=OQfJ8FCWjvdGBMGwpd4IydXndWrDElXl/ZJUG/VQkNAPTM9tbMUJe52IMdccZVbeLuIwxr9b31QusTF/6svPGWLZ/I1D4eRbk9oz7eKUXW9V4BIXZ8n3yqqnToMJVjFE70wCqrsVPOycNUJQg0RSNV9mdGSxZFmlyEvd35R0HSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764784082; c=relaxed/simple;
	bh=Phw0q0twGxbuE9D7QLZ8DkAenjCRLiKcNqFCJZDP0NM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XX2IeSuLYxK5TAMiW/wreX2zm1qqcQvoNxq2sIn+FwoHSli6ILX19zB64WgqAkwn4wSonL0sCsX0DoCdIjOWiVxv6MYo4oircMxVSVmA6IlS9nB7PFVLusN6IKUCQ4PhmaNxbsvFHjUdUaegrzqIoU22t4Y8dWdlaIx1bDYGNO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtKjiQ2T; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtKjiQ2T"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9C3D4112B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 17:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5c2rv1pjFYTN for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Dec 2025 17:47:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F41B8410C7
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F41B8410C7
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UtKjiQ2T
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F41B8410C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 17:47:57 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso8209790b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 09:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764784077; x=1765388877; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBzdnOPhODqt/3CBHXHo5pklFGjbEbTbq6nvpEEv6+0=;
        b=UtKjiQ2TDbYCgv9EMcyY3Cf/fvQqka6qKCf1o0ANVsRa3dXwz25cAc752p5FvA+rwV
         51j71HtTEGV62A+CLtzy6Mphc9rg/K6WhYYEdEo7GAYE28BraI/T0qk3w6MGZxgj6nu+
         ZhVCt62GzVn/pAGvOCKZ15zCSa63WeQYr8dikA1iNJfydnH7+Kffs/XfkKBneKLa59Fu
         DARcbgPXmiztg2vRGFvKmJbazJBl12WQcYofr2kLsKeOELt8nwylpa8LvU/V7E6iLbuo
         ZHTxxzTWCRpHDwy/IfBGXpj5dymOr3uTo41og1YOU8aT3Hm8WCrPnOzkip6C0p1iY4S0
         3SUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764784077; x=1765388877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBzdnOPhODqt/3CBHXHo5pklFGjbEbTbq6nvpEEv6+0=;
        b=AbCO/YTt5c8hJiIndYB9XNwBVm80nohVZ0+j6erzjySYHm11xpbcUTix3UedrdyzPJ
         PspJgO3VMzWnFD7gnU71S8eDUz0XQY92F8dq8dsqMgNxW4n2upvzxgXsUwEo6RJJFqEr
         u93Iy13IpZzl469DxfSoAaY8QgmiW8zFhOq/+dR3c2rql+Oy0jpqaIcNcPG/u9LhIecR
         NTvHffKSDg2yszveLEBDXyo5aqUNl64Dyp+tN+WeSrS7C3B/d92m/fs5ZZfRHtPbtfgg
         +T3G4Cc2mXWmrfxZsJF8GE90ZNaLJviqsywLCMHHSppjtk3lQVAd1q9cdbEfnupwp5QN
         ROeA==
X-Forwarded-Encrypted: i=1; AJvYcCXDKsqwBRmG/RYpS34qFFUs2yrSFRVh54dTdkzWY4Nj6roD1l/S8WfJH8kRvog0KVppTr3QyL9WozXpMu8ZggsxqW3jaA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzkkNzQtBJQo5ckK6T9dfbWUvgoyeg0WbFA2CihwMjPnsgatTZz
	BOFJEzxLxuhuPA0ISpyry/A4Vt30HznRZZdeXYb6mc4wDhnRtTUC3MuV
X-Gm-Gg: ASbGnctE0QDArQWrnp25QIy0xzMswd40HMQgCVWx55XEbYOnXfhJwv+Ay+LtQs/bnub
	gZ3Pp6SqfnTsuzzFSG+zlH1qeEqbBY0n3n/x5tNY/tAGHD6GCO1Llh2FTRFJ5V47hyRX0KfzMTo
	fiDSkoR8f9A3YSVC2RATabG43/q8Yw+rDDhNuClZwfgDH1+u5c0m72G1pSHjXWaBiq0BltHagfr
	ERf+oGFvE1iAo2Ds2ENzIFwJ4HWqU7owMKfxG7yhYff5VLfLp/PNMK1/Gct6eZouHIfzAqw+0ni
	j+T1uocZg1XlSPCRkxMn6qIB5qaB+tHYNqyi8boSW+6FMh44fULrOT3jy/lPdWt6jB721FZNdZ1
	vWbhrLRC9YykJX7mJAanmflQ52QdFmCdwZV8vItsReP8ox7jARBRMFx73iGdvoeG36DUktXm8Q5
	NZvVhNq4frDUhJlasKNXm7kgB9BpU12w==
X-Google-Smtp-Source: AGHT+IFwpP/3+4ac2SEDcubLgdKIyeiFbIP3ZQbgFHHqgjtz4rW82S5SSXuTgFw2d61EF8uH5ImmAQ==
X-Received: by 2002:a05:6a20:e291:b0:361:2fe5:51a3 with SMTP id adf61e73a8af0-363f5e25412mr4193674637.39.1764784077159;
        Wed, 03 Dec 2025 09:47:57 -0800 (PST)
Received: from [192.168.7.10] ([103.182.158.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1520a48b2sm20835782b3a.28.2025.12.03.09.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 09:47:56 -0800 (PST)
Message-ID: <91b0a95d-f4eb-4d68-b41d-d46abcfbe714@gmail.com>
Date: Wed, 3 Dec 2025 23:17:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: remoteproc: fix deadlink
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251203170702.42769-1-sohammetha01@gmail.com>
 <a0ae7bfa-9924-45b0-9d10-96b91eb17d0c@kernel.org>
 <a04e7622-e9a3-4088-89d4-285157321080@kernel.org>
Content-Language: en-US
From: Soham Metha <sohammetha01@gmail.com>
In-Reply-To: <a04e7622-e9a3-4088-89d4-285157321080@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/25 22:51, Krzysztof Kozlowski wrote:
> On 03/12/2025 18:21, Krzysztof Kozlowski wrote:
>> On 03/12/2025 18:07, Soham Metha wrote:
>>> The binding file 'gpio-dsp-keystone.txt' has been converted to a DT schema.
>>> The current binding is located at:
>>>
>>>     Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml
>>>
>>> This change was made in https://lore.kernel.org/all/20250714202850.3011952-1-robh@kernel.org/
>>> and merged in aff0a1701b020c8e6b172f28828fd4f3e6eed41a
>>
>> Drop this sentence and instead please use 'commit sha' syntax, see
>> checkpatch and submitting patches docs for details.
>>
>>>
>>> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
>>> ---
>>>  .../devicetree/bindings/remoteproc/ti,keystone-rproc.txt        | 2 +-
> 
> And:
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> 
> Best regards,
> Krzysztof


Thanks for the review.
I'll switch to the proper syntax and resend the patch.

--
Soham Metha

