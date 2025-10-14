Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAECD30CDA4
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Oct 2025 04:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760417737; cv=none; b=I2fZ+hchMbaHY7vbu9UpQoSOTl9ZansTAIpgkoir+P4zvMqKcX95zpA6OnKkXFSy/L1J3OygKwaN1ajacM4Zd3u80X/34fsLTMd4+mEX+jWbD/hu6avwGAwarHMx3fZB4tebxv1njJDJYg+FXuZDCqlu79Jkd8CxNxFvT85m8iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760417737; c=relaxed/simple;
	bh=tlA+e1Kuh94iAu1Xs/QKzXb6Y5z1AGjeoej9vtKEYyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIkJaprTG0XCeXVGQ5s/F1UrbpLAEWX0X/RhZ+tej3cxvjzKWYS/MYY2z8X6Y+pOqQOE8RHGIlD67zq/+zRBDVaBckYifl3xfQLANZuWDTbUg3KzMhG4B3C6aR5XXdq4gCPlYWcMiuW2lwzbxwBLieeg0u7jMpGFSTGVM1mlyCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktPQgtPp; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktPQgtPp"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-330631e534eso5279363a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Oct 2025 21:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760417735; x=1761022535; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oScUBmFOj3Oi16migjfSD/tjHiTwrVsQ/IhivTBBRXM=;
        b=ktPQgtPplz0DtCCrbJ1SfH4Yt10iz9eu9c+eqUtoYGK1jk9LaskH62ljzQ1tVE2aO8
         3td0CtJhKZPmh6AKfb2Q8lU/Y1j4UD374d/gqQmn9CsIzGmCdzqmzD7G5XzhuzGHhT7w
         Apa9wsaKgGFiSZCC8+c7PDU4yOMAfZNndRq7ztqWrwjDmM2enAnFH7cbf5WZwMb4YRWb
         ApqBrVefDhHkfYyBzWwRC4UXYl0ruLy7uTFaASrjjx8Yg6bvWQKSLpK/FfCJZqQaRNGT
         IXiVi/m9vP8k6bImKCGeJjm3gWc+ZDM0TjTFktC+uR1MnikzNbBmAr34r+/3x6AJA7Y8
         Yf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760417735; x=1761022535;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oScUBmFOj3Oi16migjfSD/tjHiTwrVsQ/IhivTBBRXM=;
        b=njU9m/TlKNnJJuwHHnuE9djn3Kwe0o6EpVbdTzQ3uZzqnLXgTaBCFvgMV1fzhNPWeA
         eHHpIVjen6EtQpUj6CwXDo4xELfPWpI65inoTY7P9C6XmruvqhoUw/nQpDhsz2D4su3C
         BZbS1BEPf0sNhhY68RZTxZceGO73xOror8Fhz+5S1h46v5nz33u+F8KVG/UJuOf/EUdF
         FOE0zdXq1nPgpsa09DgTsQQHYcrQ4IaKyxdtoLBPImiikFxy0VLtqD0T+vW3js3pRK7P
         eaikkkHyQNPxIaStYw6ltY1XBD9tFj2oHZtQlw5HyZG45DJdr4KlpDpQ7zbIoAqd8v7d
         cpnA==
X-Forwarded-Encrypted: i=1; AJvYcCXIXqRObV6+BmPVghcE2G0UQ8fl7uzfuPR4iyOflhvEOyZxnqlc3/jPBPCJv31I3j7K8ae6g63BGh85cizSfGc4UEAPSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvSVJ5jQDMO9ifGtEO8xZXRuD7GaZmp464w6EPljYFlsUGGMgE
	HKyyW337pRTNGjiD/hXW3RPDPNnzr+PHezTgp+M48gJGtx/MgTqix2y3
X-Gm-Gg: ASbGncvBA5JxtAvjucETUxjt/yzbJofax6OL/+47I/F9gFdxbuq6QdlEqHx+Ken4UFU
	fIz2i4s/dKThtvbDqYJpUXRG/sJMQQ241KBgdJZ1PW6Gb46LvhIFdlNg5RSvrip7jRHuMGUdpE7
	k73qOhAJgHKz+zKYINblchAokwKoL6fN7Aph95opKaQmF71rN0rrRI4bDHhb6lw8EnuUQJi+asD
	SrA4cf4J4bi1yhwKotika1n0OBIr2M99hNJzSjIAFq0T/nSocx3O/YTYhVW6CvX5qDNqjQCGRGT
	zbAf3RWjBxgFNvUGYWYvWczRUJ2nu+i07uprzG3h3mK9oPn8dvWWcKecrG4nmb83Z86wdIor0cW
	8zv6hXf20qTRqLi/VRmFSu5YfgbDW+be8RRGbnt1uAOw3gGHq9fwTGzD+1BPrgPA6VydeizDzoR
	V7q38alcW8M48NRHV2
X-Google-Smtp-Source: AGHT+IE6foVQX3WQABdx5w0wHptoWDPG91gq36Kwb7POjd5X8udSBArlWFOGO8/fHqyfb4C8q9SNcQ==
X-Received: by 2002:a17:90b:38d0:b0:32b:c5a9:7be9 with SMTP id 98e67ed59e1d1-33b51386061mr33008837a91.25.1760417735072;
        Mon, 13 Oct 2025 21:55:35 -0700 (PDT)
Received: from ?IPV6:2405:201:8000:a149:4670:c55c:fe13:754d? ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678dcc0cd1sm10880639a12.8.2025.10.13.21.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 21:55:34 -0700 (PDT)
Message-ID: <ad39c405-bf7a-422b-9f33-248ba9d6b824@gmail.com>
Date: Tue, 14 Oct 2025 10:25:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib/xz: remove dead IA-64 (Itanium) support code
To: Lasse Collin <lasse.collin@tukaani.org>,
 Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: skhan@linuxfoundation.org, khalid@kernel.org,
 david.hunter.linux@gmail.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20251013173446.8692-1-spyjetfayed@gmail.com>
 <aO1gOckA14Ed/26F@visitorckw-System-Product-Name>
 <20251013234407.11e70f22.lasse.collin@tukaani.org>
Content-Language: en-US
From: Ankan Biswas <spyjetfayed@gmail.com>
Autocrypt: addr=spyjetfayed@gmail.com; keydata=
 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
 TRpGew2ozniUMliyaLH9UH6/e9Us
In-Reply-To: <20251013234407.11e70f22.lasse.collin@tukaani.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/25 2:14 AM, Lasse Collin wrote:
> On 2025-10-14 Kuan-Wei Chiu wrote:
>> On Mon, Oct 13, 2025 at 11:01:58PM +0530, Ankan Biswas wrote:
>>> Note that the upstream version of xz_dec_bcj.c still retains support
>>> for the IA-64 BCJ filter.
>>
>> Not sure if it's necessary to mention this, but I guess it's fine.
> 
> Information about upstream version isn't needed in Linux commit log, so
> that sentence could be omitted.
>

It felt like a good idea to put this info, but since it is not directly
related to the kernel I would remove it for v3.
>> I'm not quite sure what you changed in v2 compared to v1.
> 
> It added the second hunk to the diff of xz_private.h.
> 
>> Lasse,
>> Since this change is located under lib/, I assume it will be routed
>> through Andrew's tree?
>> If that's the case, then perhaps we should also Cc Andrew.
> 
> Yes, putting him into the To field and others as Cc should make the
> patch go forward. Sorry that I didn't notice and comment this myself
> earlier.
> 

I will add Andrew Morton for v3 in To, and the rest in Cc and add the 
changelog part.


Hi Kuan-Wei and Lasse,

Thank you for your feedback, it was very helpful.

Regards,
Ankan Biswas
