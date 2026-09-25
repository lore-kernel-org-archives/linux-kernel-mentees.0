Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07BD4F55C4
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Sep 2026 21:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371184; cv=none; b=SM8uOsurqOiQ6niuqjj+8+UM6EPZ/UGigxH1XecL/Ak+qOhmtl+kXh4P/U0RcMQaj34ovix7GkmEK+WVsz0wRnjdFTdJ5g2YibJHA6rOChuV79GtZl6qffa0mQy0jd6Xv6hTqcmfejlO1vk9Uehu3rTuuPTlDngLAX2Fm2Iaotk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371184; c=relaxed/simple;
	bh=0GWPqZpmdGFUSUdNZnUFUlJDkU2OEy7Ysxs/AaAevAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCfs2GqBOkfFpucPGFZnOoZzdamSPNVmgaKJPlAndY2jdERBpooVd244K1xMEaShKfqzeLuyCs96G81Xk+UmHbm4vHyFobD2haMH7frl56GOOkGB55HTXdaye/FgJwAsILtgS+QMl7GRx9b+19FJ67tBwfWmj+oFD7saDrc7fdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4SCW/ZT; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4SCW/ZT"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so470194a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Sep 2026 14:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790371182; x=1790975982; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JB0nUqbya8/nZnbD9q59QxieeAyOe2s3ehiXTlDcKL4=;
        b=b4SCW/ZT2MocF1zZ7MT41JM0R6Fz4Z6XK+9nDIzk7Uztwx8jCon2CaujIDE9baYPhx
         SmUMIz+3a5bOjcF+mM3pKxvDFZt7tj9ruTyQTbm93OeBgl64uRQ5KVxddiE1D56686tV
         P2mZSPlvGP232DOrxIPaq94njlxD+T9EdJZB+sQMrsCYe/FlVJ9tfTxP4M6juh4W+O3+
         hEoOUpkZg4zH+mBFGaHbd/TsHCvc0ZlZ4hDLDt4B9rHKOKTlqpjlpIOOnOoAGbEXHlPO
         oQkb9pFLvsXFcDdX4cAG3ZRe3XWMKP4yz5WYRhfGUSKj/VyehLmMRT2qfyFeOuHJXIIT
         mQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371182; x=1790975982;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JB0nUqbya8/nZnbD9q59QxieeAyOe2s3ehiXTlDcKL4=;
        b=hr2NujbB3QC/KsqWVU5O+DdwoMen8IXQIDVTs4eFytbveJ20TMYemjqLHAsqqOAWtu
         tevmSBxONAyDJYXV+gtPZtfxmjiju26knh69GDWSgjOINDDrTrZJLbiMDWL4QNcsXV8U
         coZZaZvOHWEXcOq37Z+qKWos8C8N8SBu/nq/6T9xC7w2wLqypm4jX0nilckboSrNk1ML
         oz7KBoSDQMq/xDoK3vHcA6fEMaXPq8hvygbSbvnFai8xkNNrwF6fvkhEl4ST3hhGBNhm
         2A1Wo8pRcPO3o35pAzwo2X8BPF2FwQizqY40mzyr0jxH/mYyT6Ip3kdrwOqLwycs83AP
         z6GA==
X-Forwarded-Encrypted: i=1; AKwUvBzg08ul8OvwwJgHswp/jVQNy6TvkZLbjV+vQFjlKSz4ZgtzgWw1zF4h+olfIgDhHv0OvkCxX6E60brx398XI+DBZ3Q5nA==@lists.linux.dev
X-Gm-Message-State: AFuF++matyk3L+UtWY4qETxkJRW7bRvbCJOZutWqQDI6Ttt2oyeC703o
	ZHxyXV+9dSlo/QhAhO531ByEb+aK7nJ1a5cUrSaiYIWSiO+1OzaAODt+
X-Gm-Gg: AYBFou0EB/aR5hlh39brg4x+xQrZf2UjLs7vGsuBAxk3HL4Mvy6RjmDa8txuZtDJttQ
	MamehP1TMq5xD/6LfiPE5NSUX3eIR2TkpKjfMFmObYNM+0HHiCdmeNxf+JdWSrzqwHGVRBV2Mip
	bXP+3CDnPRzdN9tNz5QpGIx0UKSOhIjktOx9i3V6ISJ80wmCIm+udZLZQ11lsLnDWDp7aKfuMCI
	QJGzT5VvOK+s2R5C0ewA1U5S8eKr/Qsy7Ntm3ieI/Abk15CfysPoKEc0R5qgCp9gbZ2i+2e/o4r
	85vY/3LnQH2W5KVPnw0mjFF7ktUWTG/lcr+hA89nvE4YPlG0Q1+kxKrfVrlMPOLszsy/KHVRpnE
	nZ64e8gqRfy+KgzMkduALHYvg4qWlHtNxTSaXUS3KiR7s2yBcmnO79IAr1zQnRjQxncElNUaIko
	yZi5ylaULkSFfGUCSyRGpvllRmY2QZtDR9Lc39X6wsOHwJP5ia5LP+YwI+Jnch2I6nULAbhAye5
	tXsUC13SWJq
X-Received: by 2002:a05:6a21:748b:b0:3dd:a196:9070 with SMTP id adf61e73a8af0-3de0e9432damr6262879637.58.1790371181958;
        Fri, 25 Sep 2026 14:19:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc787943cc9sm1828969a12.21.2026.09.25.14.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:19:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 14:19:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Ridham Khurana <khurana.ridham222@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christian Lamparter <chunkeey@googlemail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
Message-ID: <3334ba64-2f0b-4e66-9a3b-84f46af70212@roeck-us.net>
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
 <f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>

On Fri, Sep 25, 2026 at 08:03:06PM +0200, Christian Lamparter wrote:
> Hi,
> 
> On 9/24/26 10:53 PM, Ridham Khurana wrote:
> > temp1_input_show() drops the low bits of the temperature register by
> > dividing the raw value (raw / 32 on the LM70). These bits are not part
> > of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
> > return some of them as 1, and the TMP125 fills them with copies of the
> > temperature LSB. Division rounds toward zero, so a negative temperature
> > with any of these bits set is reported one LSB too high.
> > 
> > For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
> > driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
> > the driver reports as -24750.
> > 
> > Use an arithmetic right shift instead, which drops the low bits and
> > rounds down. tmp421 had a similar problem with negative values, fixed
> > by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
> > values").
> 
> For the TMP125 yes:
> 
> Reviewed-by: Christian Lamparter <chunkeey@gmail.com>
> 
> 
> > Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
> > Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
> > Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
> > Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
> > ----
> I wrote a little test program by hand (see below) and ran it on x64.
> No idea if different archs behave differently or if
> a clever unsafe math optimizing compiler flag will
> convert the  "/ 32" to a " >> 5" but I doubt that...
> 
> ---
> tmp125: raw:7ec0 tmp125_proposed: -2500 tmp125_now: -2500
> tmp125: raw:7eff tmp125_proposed: -2250 tmp125_now: -2000  <--- loss of percision
> tmp125: raw:7f00 tmp125_proposed: -2000 tmp125_now: -2000
> tmp125: raw:7f3f tmp125_proposed: -1750 tmp125_now: -1500  <--- more
> tmp125: raw:7f40 tmp125_proposed: -1500 tmp125_now: -1500
> tmp125: raw:7f7f tmp125_proposed: -1250 tmp125_now: -1000  <--- and this
> tmp125: raw:7f80 tmp125_proposed: -1000 tmp125_now: -1000
> tmp125: raw:7fbf tmp125_proposed:  -750 tmp125_now:  -500  <--- also bad
> tmp125: raw:7fc0 tmp125_proposed:  -500 tmp125_now:  -500
> tmp125: raw:7fff tmp125_proposed:  -250 tmp125_now:     0  <--- ouch
> tmp125: raw:   0 tmp125_proposed:     0 tmp125_now:     0
> tmp125: raw:  3f tmp125_proposed:   250 tmp125_now:   250
> tmp125: raw:  40 tmp125_proposed:   500 tmp125_now:   500
> tmp125: raw:  7f tmp125_proposed:   750 tmp125_now:   750
> tmp125: raw:  80 tmp125_proposed:  1000 tmp125_now:  1000
> tmp125: raw:  bf tmp125_proposed:  1250 tmp125_now:  1250
> tmp125: raw:  c0 tmp125_proposed:  1500 tmp125_now:  1500
> tmp125: raw:  ff tmp125_proposed:  1750 tmp125_now:  1750
> tmp125: raw: 100 tmp125_proposed:  2000 tmp125_now:  2000
> tmp125: raw: 13f tmp125_proposed:  2250 tmp125_now:  2250
> tmp125: raw: 140 tmp125_proposed:  2500 tmp125_now:  2500
> 

Sorry, you lost me with the above. Are you suggesting that the patch is
correct, that it is only correct for TMP125, or something else ?

Guenter

> (the positive values all look good.)
> 
> --- SNIP test.c program
> 
> #just name the file test.c and run make test (in a directory without any other makefile)
> #include <stdio.h>
> #include <asm-generic/int-l64.h>
> 
> static __s32 sign_extend32(__u32 value, int index)
> {
>         __u8 shift = 31 - index;
>         return (__s32)(value << shift) >> shift;
> }
> 
> static int tmp125_now(__s16 raw)
> {
>         return (sign_extend32(raw, 14) / 32) * 250;
> 
> }
> 
> static int tmp125_proposed(__s16 raw)
> {
>         return (sign_extend32(raw, 14) >> 5) * 250;
> 
> }
> 
> int main(int argc, char **args)
> {
>         for (__s16 raw = -320; raw <= 320; raw+=32) {
>                 __s16 tmp=raw & 0x7fe0 | ((raw & 32) >> 1) | ((raw & 32) >> 2) | ((raw & 32) >> 3) | ((raw & 32) >> 4) | ((raw & 32) >> 5);
>                 printf("tmp125: raw:%4x tmp125_proposed:%6d tmp125_now:%6d\n", tmp, tmp125_proposed(tmp), tmp125_now(tmp));
>         }
> 
>         return 0;
> }
> 
> --- SNAP
> 
> FYI: TMP125 datasheet says:
> "The  Temperature  Register  of  the  TMP125  is  a  16-bit, read-only register that stores
> the output of the most recentconversion. However, temperature is represented by only10-bits,
> which are in signed two’s complement format. Thefirst bit of the Temperature Register, D15,
> is a leading zero. Bits D14 and [sic] D5 are used to indicate temperature. Bits D4 to D0
> are the same as D5 (see Table 1)."
> 
> (They probably meant Bits D14 >>to<< D5 are used to indicate temperature).
> 
