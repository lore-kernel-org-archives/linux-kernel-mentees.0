Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E2115687D
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 26 May 2025 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748267799; cv=none; b=Wlt9zDYwnOHJX4PWsFcLT97f9YS0LOuom+AApP6fDE7eUsiVWu37ShFGwvlRP4O4hUyW5DzQX0QQaK7JgLsCKQ7JZf5IFjbVLxcMIUPpjaazuzHqHR0p/4FDMbKxfwNw2NnOXIGuOcvTMmT9NeumPmUY/nyXj3B5WokIATUIY1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748267799; c=relaxed/simple;
	bh=hAq26EsJwp1YiANWFZYO6JlZ573De3v+gpFr0luZpQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tHl0WfNf+xg8efY31zdDPD89IaB91eJtOklhF/FUH7vw30HXXD7aL+vlWKXMcD3XXchgo0pl0wNPphC8xtTSHx6TSJmyAvR1HrNa++lkIvJAzsmF9eqCrEQEnZyUDMyxtLHmqwHt4/3ELR8+1WqJAKzznWg9JhZpYe4IMzHatKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLamNVB1; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLamNVB1"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso2359448b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 26 May 2025 06:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748267797; x=1748872597; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=859cJo9TYvq1IzsoVeN/+jTfHc2/ejVYnyyvhCL0W0c=;
        b=mLamNVB1sgb/MNaljXR3NwIXngDr0BbxhobrsRMk7RYbZnkkOcm2eveL2izBHxD8Of
         sXCkL454+7itz/k1pDvEdKLWrNfp9jtPn3R3lIF1qnJbAXrZ03rebQCtzxXndeg9xdKw
         RrZaT+QzdMTTrjRj+MOdjkzY+BPEMvKn9BxyBam5l3WH94qIszbv1cKSsYORbtWZg1E4
         aOp6oVwMHe6fVlf6SqlM8hC/2rVPy2Bv1jp7ArkliEB//suXq5ykQHKVX4yaX/lEKZ+v
         QclnVdG6X+cTdx1Q3719sAs6LgvLrDcIGHLRp8MfItt3U95PhkBBYglbNsCDgnprbRDN
         eR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748267797; x=1748872597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=859cJo9TYvq1IzsoVeN/+jTfHc2/ejVYnyyvhCL0W0c=;
        b=j8/mAR+njRt9zhoP5LCZIuq01zp13tgM8xi8H/WCuv1RBxrKyUQz8kzrnN9KMiHhUG
         IXWHDX1iJNOwU+pc3lxEcvtTab/iOxxQNm0xgQ8xT/FmCLsE2TWXEAmoustBuaVPAJFN
         gPCLeXkQA1oqHa+EkhknS1aLYDAsCwsRyBAO7s5psNb+/5lch0D6kePiICpPgw5QJFcj
         E6B40c+d5SgKFkSJ5DBuC+5a5kvoHIrPl+GF8HJP8Ogp5y/fJU6PKw7j8VYlNSbJKVut
         LrioHQ27jvaFH4KASOvP2LiJ+tlMKoOiAddmd+QgcvvziekQBLb4I+HCXLw/F5QgggWW
         2/6g==
X-Forwarded-Encrypted: i=1; AJvYcCWzHGqIuVQ4osAuUBeUjfEh3T3u1abcvQxT/JJA9mlWJYFWIiRUFWMDUmZAj38hoMJnr13OX05Rt0K47CXugh3EZaf2gA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywjg7BIeKPRD5xdGFvxP8lCfa0mXFP6rataL6taK0PX6MV9K6nC
	PCZYiCbpVUTYE+K5r+mmo5e2lworbnPDKf6ySnK/ZBQgp/eeVQnlFkEDt6EdSA==
X-Gm-Gg: ASbGnctT6IrRfT6MPGW7LKuc9xWjJjy+RuUqZ3qvw7mUPRyfjVL2ETwmSY85BwPNuY8
	W7N4j7wiuQfVymVJ67hLAGCnfh1l3MuQiPuTQ1mO6+Z6nONrRQLSxYqm57nVk5sLcIuSNbxT8Em
	cu++Wrf8G6B9Z8jbCi8VPYqEnQfMaddhsKrnRlfd9Gu6hIO87x9bwBvItcUBRnMnAWhgt15Csvb
	OyySIxGNgCR0lfygF49IuL6QnQLwyB1UGPb+dnjbc4K+H2XqvUqn9xmTO1RQp7yE40bv1FN8z/a
	7DBpMmHeSl0KxQAjr1wCjyiCaqQrlfojJWxHOdNnQnykDe4ekYTttoel8FNH26M+GFLiKg==
X-Google-Smtp-Source: AGHT+IGBWkRiRhCMFT1Pq44qUq2nocKyMI0en1mClBadLXgI7beC+Fngu6Pzn97BlO70EBYQ1uO4Dw==
X-Received: by 2002:a05:6a21:6d87:b0:1f5:6e71:e55 with SMTP id adf61e73a8af0-2188c1e8722mr15780731637.6.1748267797278;
        Mon, 26 May 2025 06:56:37 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e5f74sm17019095b3a.26.2025.05.26.06.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:56:36 -0700 (PDT)
Message-ID: <cb2d5cbd-d1e5-4a71-a24d-d02604c4016a@gmail.com>
Date: Mon, 26 May 2025 20:56:32 +0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] input: docs: Fix Amiga joysticks grammar & formatting
To: Jonathan Corbet <corbet@lwn.net>,
 George Anthony Vernon <contact@gvernon.com>, dmitry.torokhov@gmail.com,
 skhan@kernel.org
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20250526011443.136804-1-contact@gvernon.com>
 <20250526011443.136804-4-contact@gvernon.com> <aDPVOlBIpnqc7Tez@archie.me>
 <87a56za67l.fsf@trenco.lwn.net>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87a56za67l.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/26/25 19:48, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> 
>> On Mon, May 26, 2025 at 02:14:43AM +0100, George Anthony Vernon wrote:
>>> Make small grammar fixes to Amiga joystick documentation.
>>>
>>> Also make heading adornments compliant with the guidelines to improve
>>> organisation of the page.
>>
>> Split up these two changes into separate patches.
> 
> The word "also" in a changelog is indeed a hint that a patch is doing
> too many things.
> 
> For a simple patch like this, though, I would not force a resend just
> for that.
> 

Do you mean keeping the patch as-is?

>>> -~~~~~~~~~~~~~~~~~~~~~~~~~
>>> -Amiga joystick extensions
>>> -~~~~~~~~~~~~~~~~~~~~~~~~~
>>> +===============
>>> +Amiga joysticks
>>> +===============
>>
>> I would prefer to keep section adornments in this doc as-is, though.
> 
> ...and why...?  We have a standard progression, why not use it?
> 

I'm leaning towards following doc-specific convention (i.e. on this
doc). I could adapt to it, but some time later when I re-read the
source I might be semantically confused.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
