Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8233BCD19
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Sep 2026 18:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359393; cv=none; b=PQBbVJE1ZSMz6iW9Jq3CXz9iy7qpFJySflDAdOGNY9pfv4z4+gikfUxlmmbMxUC0lwYp6E6qoI69up/DtmbhIMNz/zSpg7dww6RS6DFL3G1cG4foh0NV6xqyqpf0pzDB39o/XVYDCYI5sxR1bAZ+9aiJgAAQbZgnK7WQR8nXhwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359393; c=relaxed/simple;
	bh=Ju7zhvTIV+QCh40+nZMxiWd5uKzk+g1KU9BhArseauI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ji2FzkDMOD6dua+UGa5/f/dQI3de3Ab6vhogl9U1iuM4CaOfJjwJfOPZKXH8a61A8dOl+xwwLToFyZwRitRLcNyrPqW/9vc7nMipE+NtNlI7/GhulY4BdtVwcImcWYXOeMZ4wxNqyUQ7tnXEt4pvw2+VWSHlz6Rtj0lv7KVCDvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJsMqdWF; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJsMqdWF"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f63546c5so979095f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Sep 2026 11:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359388; x=1790964188; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL9Wl8C0xRRNjJBTarQpi8R0Mck+qeYOMPSZBKJwmx0=;
        b=CJsMqdWFzOn3WCzzMNNr/9I7lBPPvI3AKyXOonoPS1xavaZu/02GBgTkZtw2ZW8C/K
         aj2cQ6LW4YlSyAzFBfqIKIKLMlD3+YwYlaXRpeSDt475R4NwawyY/b6GJ2JpWapyNy+D
         G3U42j0XpMn9tP9vl3O2BsASeeknlNpir7BmS3TkqIxP6IQqBWMDxlJsPQdliR99dQw5
         o2ygwrNbhXvGjx+xz0hLlj3xsSyevAi1i5y9nIgkqN+1xomtWmHEEekXCrTbZv5+uM6Y
         9sTVdmvln1DKAVGImkrg0dPQq9qNXA+lm4JhkbGxFgMCSIYUBJTzvnMnfuhpQiqtkCti
         Ds/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359388; x=1790964188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL9Wl8C0xRRNjJBTarQpi8R0Mck+qeYOMPSZBKJwmx0=;
        b=Yg0ZDPCbSVjeq1isOvY8/OrjAPbXwc4ydsFC4o0Q896/tetZx8Kkt567+qwkie1Bx3
         BpgqtQNPS1Onm83b/wIvvVAo+0hnHyZWjYJPT4F1YtU6XW9UYA6ULTyt6OXIvfs2VeLv
         MPxQW2ZRjQ4QF98IFYkRr95k04CBUnafNwLIJOOqxCamspMx2o6RJz2Vtrk640WbnbSQ
         dxsv3MVpSNSASZfu9/PgQDaxvrKUGluS1BZtzN6x/DJ79J5gK2xYh29N5dDWMvpUD04Y
         1Sc1UMNxBF37AzjdPyvyJO+dCxpeEXGRvnIFJtYdZv5P1nHTtDx0WdUUDNIJ0q0nwALt
         KsFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLeVrY2Lw+wazbu0T/vkJScclH5f+asWSsI8903hHdcXVf/dztMMWm9L1ijMgnycJj3Vj23TQEQP1eP5IHjwyVIiHPvg==@lists.linux.dev
X-Gm-Message-State: AFuF++moeF8EKdOs7+YzCy3S551dSLzB4m6f/m5+Dg8IRwtU5GA1MNdm
	AaKzbFKwV7TvnSGx63l2NYetRdtG4795B7S07BJcAfJxqiSFxfHaGHSj
X-Gm-Gg: AYBFou24XPuuL/9PduPxxOX5RqFFjIySaSELucRHCZxFSyldSwl3fs8+OXxOFP9CEw8
	t8ut1ArMLBVZSLoDphnOB4sGiGdCawHnN2Mn1sVIRQxTYPZvkclyN8iSDd5KO3LUp019YD7L5cf
	rnzeqRDbdrbW+fypaVbt5Sl5JtARdWIcphFP8eeJifpruftOhnJRvTGDqxBFRmoSsdDDwEyfSU/
	bIAhp8mBV2TGtTpIDzBXSBQ4VasbCaR7C8ZrumwyhydTXmtM5qM9VMRamgPA/b0aTKzj8EFy/97
	+sQw2jcy1W/oxJC9ZzAqlSO5AA8AiJuFexg6z9IS388AdGkOBxV8mxdxU0gz/c3jC4pOs0IVP2l
	5Pgdmfb8BHUSyCxSuYlCsQAvF2r4P4kAEBN+Kc4fliFsZZtP1Oi6+pwKLBb7bBDLFtwJttr5FGa
	6jsVcp+uZ4Z6vA5OsawDi/xAvJxUAsLb2i96lCs/Ml4NjFXeho2pHvC9zdptJslqlHcdeZJcMHq
	/e5eRsyvn0MfDF7nxRu5hudeGfuqI4RvGfNt8GIOM8G+hSp1eMrdQ2AYqeivi4hE/QZb+MqtzCE
	vkLtHL8o7Vrq8Q==
X-Received: by 2002:a05:6000:41d9:b0:488:834a:cbb with SMTP id ffacd0b85a97d-488834a1dd1mr3121424f8f.2.1790359387972;
        Fri, 25 Sep 2026 11:03:07 -0700 (PDT)
Received: from shift.daheim (p200300d5ff3cee0050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff3c:ee00:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6450a3sm7929304f8f.25.2026.09.25.11.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:03:07 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift with esmtp (Exim 4.100.1)
	(envelope-from <chunkeey@gmail.com>)
	id 1xAAGI-00000000LZj-2fxl;
	Fri, 25 Sep 2026 20:03:06 +0200
Message-ID: <f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>
Date: Fri, 25 Sep 2026 20:03:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
To: Ridham Khurana <khurana.ridham222@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christian Lamparter <chunkeey@googlemail.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, Shuah Khan <shuah@kernel.org>,
 Jori Koolstra <jkoolstra@xs4all.nl>,
 Brigham Campbell <me@brighamcampbell.com>,
 linux-kernel-mentees@lists.linux.dev
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 9/24/26 10:53 PM, Ridham Khurana wrote:
> temp1_input_show() drops the low bits of the temperature register by
> dividing the raw value (raw / 32 on the LM70). These bits are not part
> of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
> return some of them as 1, and the TMP125 fills them with copies of the
> temperature LSB. Division rounds toward zero, so a negative temperature
> with any of these bits set is reported one LSB too high.
> 
> For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
> driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
> the driver reports as -24750.
> 
> Use an arithmetic right shift instead, which drops the low bits and
> rounds down. tmp421 had a similar problem with negative values, fixed
> by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
> values").

For the TMP125 yes:

Reviewed-by: Christian Lamparter <chunkeey@gmail.com>


> Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
> Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
> Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
> Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
> ----
I wrote a little test program by hand (see below) and ran it on x64.
No idea if different archs behave differently or if
a clever unsafe math optimizing compiler flag will
convert the  "/ 32" to a " >> 5" but I doubt that...

---
tmp125: raw:7ec0 tmp125_proposed: -2500 tmp125_now: -2500
tmp125: raw:7eff tmp125_proposed: -2250 tmp125_now: -2000  <--- loss of percision
tmp125: raw:7f00 tmp125_proposed: -2000 tmp125_now: -2000
tmp125: raw:7f3f tmp125_proposed: -1750 tmp125_now: -1500  <--- more
tmp125: raw:7f40 tmp125_proposed: -1500 tmp125_now: -1500
tmp125: raw:7f7f tmp125_proposed: -1250 tmp125_now: -1000  <--- and this
tmp125: raw:7f80 tmp125_proposed: -1000 tmp125_now: -1000
tmp125: raw:7fbf tmp125_proposed:  -750 tmp125_now:  -500  <--- also bad
tmp125: raw:7fc0 tmp125_proposed:  -500 tmp125_now:  -500
tmp125: raw:7fff tmp125_proposed:  -250 tmp125_now:     0  <--- ouch
tmp125: raw:   0 tmp125_proposed:     0 tmp125_now:     0
tmp125: raw:  3f tmp125_proposed:   250 tmp125_now:   250
tmp125: raw:  40 tmp125_proposed:   500 tmp125_now:   500
tmp125: raw:  7f tmp125_proposed:   750 tmp125_now:   750
tmp125: raw:  80 tmp125_proposed:  1000 tmp125_now:  1000
tmp125: raw:  bf tmp125_proposed:  1250 tmp125_now:  1250
tmp125: raw:  c0 tmp125_proposed:  1500 tmp125_now:  1500
tmp125: raw:  ff tmp125_proposed:  1750 tmp125_now:  1750
tmp125: raw: 100 tmp125_proposed:  2000 tmp125_now:  2000
tmp125: raw: 13f tmp125_proposed:  2250 tmp125_now:  2250
tmp125: raw: 140 tmp125_proposed:  2500 tmp125_now:  2500

(the positive values all look good.)

--- SNIP test.c program

#just name the file test.c and run make test (in a directory without any other makefile)
#include <stdio.h>
#include <asm-generic/int-l64.h>

static __s32 sign_extend32(__u32 value, int index)
{
         __u8 shift = 31 - index;
         return (__s32)(value << shift) >> shift;
}

static int tmp125_now(__s16 raw)
{
         return (sign_extend32(raw, 14) / 32) * 250;

}

static int tmp125_proposed(__s16 raw)
{
         return (sign_extend32(raw, 14) >> 5) * 250;

}

int main(int argc, char **args)
{
         for (__s16 raw = -320; raw <= 320; raw+=32) {
                 __s16 tmp=raw & 0x7fe0 | ((raw & 32) >> 1) | ((raw & 32) >> 2) | ((raw & 32) >> 3) | ((raw & 32) >> 4) | ((raw & 32) >> 5);
                 printf("tmp125: raw:%4x tmp125_proposed:%6d tmp125_now:%6d\n", tmp, tmp125_proposed(tmp), tmp125_now(tmp));
         }

         return 0;
}

--- SNAP

FYI: TMP125 datasheet says:
"The  Temperature  Register  of  the  TMP125  is  a  16-bit, read-only register that stores
the output of the most recentconversion. However, temperature is represented by only10-bits,
which are in signed two’s complement format. Thefirst bit of the Temperature Register, D15,
is a leading zero. Bits D14 and [sic] D5 are used to indicate temperature. Bits D4 to D0
are the same as D5 (see Table 1)."

(They probably meant Bits D14 >>to<< D5 are used to indicate temperature).
