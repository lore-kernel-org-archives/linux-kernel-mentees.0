Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F052F28505E
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Sep 2026 11:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507437; cv=none; b=fmz8bV1qJ9I4V1/hd5RWkGcxbNZHyBDoV6OQEh+wuaKCbXK4qWM/QlIYVLdd3yY/FP4j6Fr6kfMZdGLXsZOGKgroD81QBJGPKoJtX8+rlbAXR+AF3WKdZfNtU9VJGQFT97ixPwf/qZEZCM4rlEgajaQ2qwywxhn8IeKKbGtX2Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507437; c=relaxed/simple;
	bh=Lyez7JVaJYxHxW1ImgrKFGnQCl31RuCVPGHH2ZZXIH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovwWAhAo/FL3vrWl9f6OGp/rUZeHvoZ0sWfUVwaxs2/8ighrIY3HpCO0X/tRodltxEJVIgkjMLapP3bzVgAMiCORG7L64rIMdLG0GM87HsEBewQaSpKya/XM0T2Bts3r8ggMWvwyq6pqBO9ehSyb+clFTlFykGvppi8mV3pWUas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEIwSzPO; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEIwSzPO"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a001e575afso2421365e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Sep 2026 04:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790507434; x=1791112234; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7AJ2hwe4+6QFOm6zh96W6e3NiB9GKNgjSqcd1c3qxc=;
        b=CEIwSzPOEH9n9PtZW5wOCYubb40PfGVa+DvdCsXUVlamGbSPou+2x3+JOS+m5S8pyf
         LNdYKhVTxCdd71YvVjaVDlWUF3x6Ga2SR8OWEMg0Rab0NoJ324AUuSlqa4VBqD837QWi
         4bXy0JcuRrWUjpZwd/f6/frje0ZJwY1QEtqGQarVGM7e3jy8YtDP4sdipYfOnL+H+Wtq
         qYNfdSuqdHz7doIXEl6O8eOtuXaLQNPMeYcZVrlIQotTS3y3qf17XEErnwhTbh9SalW5
         5NMivCrx4OgtA9TTCuBErrSjLnsQpA7bAUb55i00ZcmWtkJahPwHTztknrb0d1FdbOaS
         Gt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790507434; x=1791112234;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7AJ2hwe4+6QFOm6zh96W6e3NiB9GKNgjSqcd1c3qxc=;
        b=WOZ1PN8NiciAl+H2pH4j+GgniSgra5LZ8QaFpiSYetLHDl7/KvwV+CStGZD9wXz/Nh
         xfXdGTs/dnduzR1MPFPSjGjN6WDDkW1llIFHL3KjzI9qX3SDGGeBckcfGDFYUbzpLuVg
         S9V09GN+yDWc8oLiMG1Jv1eobeG7KzSJhOQVOwCNcaiHRcN86L+kRfLx4/8ojK5kQ/XH
         Sh1U9ExVFfS2HR/+LMacKl1u8Tml2P2h1ibn6nl/4+snsZiuVEUIWVZz4Ij7o1nu07LY
         WWM2m5zHJXJwHhojandqA42LkEcAyNweUz5EjbihZXKvtiVScFMP1z+p1nLhjx+wZ5+E
         giiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxFoJqFHWb5u6u+qinkHTYuzHsYXNQ+HO3p0zQ5xtTOp/aymPuUi2jpMLkF3Ni9/xkX1da9ndFd3IXylUZk18dBMHe5Q==@lists.linux.dev
X-Gm-Message-State: AFuF++mhjOzcz61uV6FuRDe5EgzZAJb4Zl9hCFiopTxARjjAOE6Hp1ik
	l0zd5RRLnEtGPZh3b627mMcYRwbypeKnlMIBKkmikCXk8/Vvm0wpIbiE
X-Gm-Gg: AYBFou31rtBAqM7WLsAi2PKI5f3qgWcC4NOoxkebr5z6XRexOmgktvfqZKAAt5awOgd
	GxeM7VRVe9dMbsQ2qdCqV2E3jEoBXaAPYF2X4VUIWQ54bNncnKf+DlXlDv6Tve+sEK/0ePX9VfW
	3+HoZ59mjx+mQYHLLSrqbI/xehIhFVTFMqy+yn3lG8JB4H4Ehh6OnWjZ+XrorqSEpmgwXFpieTv
	WCeV2ELsPlzYnFHoDCSxOu+yiXAmw49xTW/XDQInGxGnCxSrHzlQv9uAlEzciLaDzzvwS2JIEII
	YrkdLOEygCxSJUkQX15TLlGwgTKhqltEq/JYxl2vY6Lk6G2jP/l1Lr+qDwGMIk9ImZUukicZ/f3
	wb3EWEai2hzxkP4p8SwB7ECCsdy4kTnUQ2B6HOkVVs4hfU3Y+95qAtlCIY776+g2qAuw25oT4Lw
	greuh1t3xP51aSAhjvpyotOLAYtc3OZlvAFxsFZi2rS3E79tiDIikp8bZQryoC+ughJwcsQ6jjB
	axaj8NqR1zIK228M9G3hDOcOPBoWWWJEXQrqn56PLLPIKoWK02KjVx60YS829esLUec
X-Received: by 2002:a05:600c:4ec8:b0:49f:dd10:3c71 with SMTP id 5b1f17b1804b1-49fe66c61c4mr189586755e9.11.1790507433948;
        Sun, 27 Sep 2026 04:10:33 -0700 (PDT)
Received: from shift (p200300d5ff3cee0050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff3c:ee00:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0016fd85fsm52932255e9.1.2026.09.27.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:10:32 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift.daheim with esmtp (Exim 4.100.1)
	(envelope-from <chunkeey@gmail.com>)
	id 1xAmkJ-000000006Ml-11Hm;
	Sun, 27 Sep 2026 13:10:30 +0200
Message-ID: <63e6e9f0-04c3-485d-8fdb-5e96a1ebd1f5@gmail.com>
Date: Sun, 27 Sep 2026 13:10:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
To: David Laight <david.laight.linux@gmail.com>
Cc: Ridham Khurana <khurana.ridham222@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Lamparter <chunkeey@googlemail.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, Shuah Khan <shuah@kernel.org>,
 Jori Koolstra <jkoolstra@xs4all.nl>,
 Brigham Campbell <me@brighamcampbell.com>,
 linux-kernel-mentees@lists.linux.dev
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
 <f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>
 <20260927073115.15110623@pumpkin>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20260927073115.15110623@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/27/26 8:31 AM, David Laight wrote:
>>
>> On 9/24/26 10:53 PM, Ridham Khurana wrote:
>>> temp1_input_show() drops the low bits of the temperature register by
>>> dividing the raw value (raw / 32 on the LM70). These bits are not part
>>> of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
>>> return some of them as 1, and the TMP125 fills them with copies of the
>>> temperature LSB. Division rounds toward zero, so a negative temperature
>>> with any of these bits set is reported one LSB too high.
>>>
>>> For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
>>> driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
>>> the driver reports as -24750.
>>>
>>> Use an arithmetic right shift instead, which drops the low bits and
>>> rounds down. tmp421 had a similar problem with negative values, fixed
>>> by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
>>> values").
>>
>> For the TMP125 yes:
>>
>> Reviewed-by: Christian Lamparter <chunkeey@gmail.com>
>>
>>
>>> Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
>>> Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
>>> Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
>>> Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
>>> ----
>> I wrote a little test program by hand (see below) and ran it on x64.
>> No idea if different archs behave differently or if
>> a clever unsafe math optimizing compiler flag will
>> convert the  "/ 32" to a " >> 5" but I doubt that...
> 
> A compiler will convert an unsigned divide to a shift, but can't
> do so for signed divides.
 > > But you'll also get flagged because C doesn't define right shifts
> for negative values.

Hmm... For at least x86, any compiler should see that the is an integer type
and use the Shift Arithmetic Right (SAR) instead of the SHR instruction. From
what I know that SAR instructions is very old, like 8086 with improvements
some major improvements on the 286... And linux started with the 386 so, this
should work even into the past. (But please correct if this is wrong).

I can't tell what clang would do, but GCC says this (second last bullet point):
<https://gcc.gnu.org/onlinedocs/gcc/Integers-implementation.html>

|Bitwise operators act on the representation of the value including both
|the sign and value bits, where the sign bit is considered immediately above
|the highest-value value bit. Signed ‘>>’ acts on negative numbers by sign extension.
|
|As an extension to the C language, GCC does not use the latitude given in C99 and
|later to treat certain aspects of signed ‘<<’ as undefined.
|However, -fsanitize=shift (and -fsanitize=undefined) will diagnose such cases.
|They are also diagnosed where constant expressions are required.

So, the << (shift left) could indeed be a problem/undefined.

Cheers,
Christian
