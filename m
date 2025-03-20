Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B884B1E9B1D
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Mar 2025 22:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742510210; cv=none; b=lI9djd7FaeHjjeU5FUF/cVy0sZ0MIoDrqRfRPKvgoPJA2imiBnILluvriL9sX7S+jcDdN/Cv77ZhU4h4r0YF5A1hgh2MlropGlUWBO4Cq/HW7v4KOI4dasAfGB52WVFyi+p7TiZuhDsBH2Ish6tFLWMZK8H/TXDL7HWaGmWD3OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742510210; c=relaxed/simple;
	bh=erR5s/QHhOVYcVujRx1ocpZU2Mh19m8e4WQR3kZsKj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VfS2yemQcEgp61SZE+HsohKkvxaiqL4OFMUP//q+AZD/4x+JLigirojqtslEDIkKMrQZO/Z4cVnGnADHID7kK0vOaDw1gY5q0tDjHGhfXKQyB/KUWVlJME87H2JvdfKHY/bH61eXXUWU6mK7vXMtC0Sid5AIoDsyawjkM6yIuo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=JlEIF0yr; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="JlEIF0yr"
Message-ID: <ac0b1f3e-6abe-4de2-bf5a-a4b3207a22c3@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1742510203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+c8qZOlmmvHFgj0oXWHinTIVH4usyV/Xq+r++ltUKVc=;
	b=JlEIF0yrNmRwVufB3Vvc57KKZLVUuP3amyyNrRfA1EFfAoUti/XB5XsE35cix88xmS2/8X
	sgSjd97bagnUtXBnl4Igy6LHVwnqw/doVKwQqkWjwi00HG520cn0QAmYVAyq0yiEinHx6H
	/RONssKoN4sUrU3n5Xy/ji0DC4ty/d0evqdZcCbAqv+oZQDzvao8AC6GFl0n7Wz9pYFIvx
	UkRP6otmjqSbq0nhWKl6xbUGDCPHDYFDZbiffcMaVDxq769H5pHqhgSidhORqbm06gXdLI
	wNHejrs6kp4w+JVtB/Iv7dn3mfe8C+Ze/0fVFGq0ZzkP1ofmcDv3Yzqtjy16jw==
Date: Thu, 20 Mar 2025 23:36:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] include/uapi/linux/swab.h: move default
 implementation for swab macros into asm-generic
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>,
 Zhihang Shao <zhihang.shao.iscas@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>
References: <20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com>
 <20250319-riscv-swab-v2-1-d53b6d6ab915@iencinas.com>
 <2afab9dc-e39c-4399-ac5a-87ade4da5ab0@app.fastmail.com>
 <4d45df0c-d44e-4bb6-8daa-0dba1b834bc4@iencinas.com>
 <07b8051b-9d5e-440e-b74d-1ca97402fe2a@app.fastmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
In-Reply-To: <07b8051b-9d5e-440e-b74d-1ca97402fe2a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 19/3/25 22:49, Arnd Bergmann wrote:
> On Wed, Mar 19, 2025, at 22:37, Ignacio Encinas Rubio wrote:
>> On 19/3/25 22:12, Arnd Bergmann wrote:
>>> On Wed, Mar 19, 2025, at 22:09, Ignacio Encinas wrote:
>>>> Move the default byteswap implementation into asm-generic so that it can
>>>> be included from arch code.
>>>>
>>>> This is required by RISC-V in order to have a fallback implementation
>>>> without duplicating it.
>>>>
>>>> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
>>>> ---
>>>>  include/uapi/asm-generic/swab.h | 32 ++++++++++++++++++++++++++++++++
>>>>  include/uapi/linux/swab.h       | 33 +--------------------------------
>>>>  2 files changed, 33 insertions(+), 32 deletions(-)
>>>>
>>>
>>> I think we should just remove these entirely in favor of the
>>> compiler-povided built-ins.
>>
>> Got it. I assumed they existed to explicitly avoid relying on
>> __builtin_bswap as they might not exist. However, I did a quick grep and
>> found that there are some uses in the wild.
> 
> Right, I do remember when we had a discussion about this maybe
> 15 years ago when gcc didn't have the builtins on all architectures
> yet, but those versions are long gone, and we never cleaned it up.

I just had a chance to look at this and it looks a bit more complex than
I initially thought. ___constant_swab macros are used in more places
than I expected, and {little,big}_endian.h define their own macros that
are used elsewhere, ...

It is not clear to me how to proceed here. I could:

  1) Just remove ___constant_swab macros and replace them with
  __builtin_swap everywhere

  2) Go a step further and evaluate removing __constant_htonl and
  relatives

Let me know what you think is the best option :)

I'll resend this series without this patch (and make the RISC-V use
fall back into __builtin_bswap)
 
>> I couldn't find compiler builtins for ___constant_swahb32 nor 
>> ___constant_swahw32, so I guess I'll leave them as they are.
> 
> Correct. There are also 24-bit and 48-bit swap functions
> in include/linux/unaligned.h that have no corresponding builtins.

Thanks for clarifying!
