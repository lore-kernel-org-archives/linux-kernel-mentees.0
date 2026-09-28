Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC89D4D5963
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Sep 2026 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605073; cv=none; b=gVJIbU3HK3gceXiunzl7lXzevemVRI76rXpSbKdIDY/ATgob9xFP/0uoHNfQh8DlB2TR2QbSHqFVUGVudn3w6bmBF/lkpNBigZeR/XwP71Ej0HGI/l+yxJ0J+PT92K52p7OptdMfw43QeiibCCWIxxZpFXmbwaVHC/kaYit3kaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605073; c=relaxed/simple;
	bh=D2//y+zWUZ6eFjK/x9NzKFW0BnNMu6Nlh5/iRwYrEcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hsxmf0xEymzoSd1KR7UIcDMgFkcbrWGSucjYjPieriPKtRcwZCahmSYwXf3M59j2uukp/WRAm8u3mognNRt1Q7yDv0yiKkl6PXRnfAnpS/4zNyFkVZYpIdJ9ex2U3ly96Y1+g5rr93sqw7YWcrO+RAKWODVX1/wyJ3/N7v/uM5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8bYFKR6; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8bYFKR6"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-34ac1d291a9so36074eec.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Sep 2026 07:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790605071; x=1791209871; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n1xwnLEC8y1A7VnXJXruluUIMCpMITxsOOOYMVDzt2M=;
        b=Y8bYFKR6DNnjuASUGwfiV7rfeI/j4e6BCVeZnkRT+iv3sQCLYvklkvz2W9Lg8anJDu
         Gn/GXoE9LHGyWiqK8czu42OvYqLlMfW4IUSrrYixLeQ37RljeWouz4bHPHd1uF6sA9Yb
         BtWyko0gfE5tMEziKSA88gqpO1ZKVSCMPHCSSV51Ofb+YNlHKsBcDkp9B3Xo4s1ksutr
         B6U/F4Eot1Ndf4AhxxGXIiSQ7yFmyjqIAlWwZ6YUcYgtoS7WckadWLWQo7rR044XhvMr
         LjZz2ZBHiIu2Hbb2Hk6s+pYMtHOqy4atdZWCyfDC3HV2gPT8L1y2N1mgyHEUwy/hRpS6
         TVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605071; x=1791209871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1xwnLEC8y1A7VnXJXruluUIMCpMITxsOOOYMVDzt2M=;
        b=VriB3aTqjQHCPzbpv/SziXMsx++ZY8se6vZH8W/rinX80/ghgW+peA08bbu+xBPGkk
         ufjWSzbRhsI03z0aiy27936FG8jhtL6Ix109xBSy+CVA32SvzxREoNJf4lylrhFY27Cx
         GrcXVQPRAo1QHBpzFF5JiG73JrchJkkPs2xcqK/ZJBrVJwjo3EfLeQWWQ2OPkDhwPQfO
         3JFExerKknGV5PhBNXkNLlXtdHLw62mbk8CA8vf/RxsbTN+eTqTFaLmlzeJ/1XH7bkJd
         3hBzBNyDpDS3JAQw+uO1p7q2TbSuNlM49sSzBVHrt7qWFk+JRJYy7Yl/hcLyS0OZ2Cre
         JN+A==
X-Forwarded-Encrypted: i=1; AKwUvBz1qSNSqgu4+V4luX5Ds5FwkF2xG9moM/ZV2qns63DkkocjpTwvm/UOH+Er6dXXMuqqJkn/xJLc75Tc/yQjrAXvujVnEg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIUY6zjA0ez2BECTCh4h2GnEbB67xbu+S5xrNhr9dbB1R1zFqcr
	nqO/5RhynA/Pw/ZhCu2xE8O34VwMb673gyIoYajmgq4KKetwhxu4+T15
X-Gm-Gg: AYBFou1YnX9ZeGyyUnJYwGjEy3wImArpfD42NTuiOx6rsCsmr45ZK5qqYg8HSg6pvL4
	wpGn1FIG9KBh7a1kMgbMR7fjz8duxwkk/+j4eyhiRc3tYGB/9wt6UD/HyczRdoSzB0Ehqgj/KlQ
	ZstXjXcjql2ipfcncraAqFqDFAvImHaKQSvNRZ3+syT20tDzMEqRen4E63VBHpwIBmn3DT+JtN0
	0bjOFxvsQmsR4koNHQEg8rA5qRP9mdCyYx31NXyD2IV35yIakXe/W+YrnVXjvp/qeEvjtmPei6c
	FWEUl9Acd2ibE7m/e6m0LlziniNgAfMye6OJBcvBDjBCzDDfLwiQaOxUzH++yuMUp0k2qFoTBhE
	xmj6iwR+23hFsO84GAWdcaoSlZtnxmSr2Dl78QfiPnG9wxJt1NkIKcHfLCjd+P0j3RKT9KO8u/h
	3o6mFFp6f29K/fH+XmOeBA381kgtyzgXpkbGMpdhoLVouD+Ta6ASzBKJ3hDgsMVaB8YSHucm/p1
	bfGsVZlct07
X-Received: by 2002:a05:693c:80cf:b0:347:7d10:4c7 with SMTP id 5a478bee46e88-3477d10a211mr3099391eec.15.1790605069659;
        Mon, 28 Sep 2026 07:17:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm29107917eec.0.2026.09.28.07.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:17:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 28 Sep 2026 07:17:47 -0700
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
Message-ID: <6cde225a-3ea9-4ba1-935e-8e2b56d39f3a@roeck-us.net>
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
 <f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>
 <3334ba64-2f0b-4e66-9a3b-84f46af70212@roeck-us.net>
 <eb76f982-d29a-41b4-a5ae-61ce486f4839@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb76f982-d29a-41b4-a5ae-61ce486f4839@gmail.com>

On Sat, Sep 26, 2026 at 11:22:39AM +0200, Christian Lamparter wrote:
> Hi,
> 
> On 9/25/26 11:19 PM, Guenter Roeck wrote:
> > On Fri, Sep 25, 2026 at 08:03:06PM +0200, Christian Lamparter wrote:
> > > On 9/24/26 10:53 PM, Ridham Khurana wrote:
> > > > temp1_input_show() drops the low bits of the temperature register by
> > > > dividing the raw value (raw / 32 on the LM70). These bits are not part
> > > > of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
> > > > return some of them as 1, and the TMP125 fills them with copies of the
> > > > temperature LSB. Division rounds toward zero, so a negative temperature
> > > > with any of these bits set is reported one LSB too high.
> > > > 
> > > > For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
> > > > driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
> > > > the driver reports as -24750.
> > > > 
> > > > Use an arithmetic right shift instead, which drops the low bits and
> > > > rounds down. tmp421 had a similar problem with negative values, fixed
> > > > by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
> > > > values").
> > > 
> > > For the TMP125 yes:
> > > 
> > > Reviewed-by: Christian Lamparter <chunkeey@gmail.com>
> > > 
> > > 
> > > > Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
> > > > Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
> > > > Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
> > > > Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
> > > > ----
> > > I wrote a little test program by hand (see below) and ran it on x64.
> > > No idea if different archs behave differently or if
> > > a clever unsafe math optimizing compiler flag will
> > > convert the  "/ 32" to a " >> 5" but I doubt that...
> > > 
> > > ---
> > > tmp125: raw:7ec0 tmp125_proposed: -2500 tmp125_now: -2500
> > > tmp125: raw:7eff tmp125_proposed: -2250 tmp125_now: -2000  <--- loss of percision
> > > tmp125: raw:7f00 tmp125_proposed: -2000 tmp125_now: -2000
> > > tmp125: raw:7f3f tmp125_proposed: -1750 tmp125_now: -1500  <--- more
> > > tmp125: raw:7f40 tmp125_proposed: -1500 tmp125_now: -1500
> > > tmp125: raw:7f7f tmp125_proposed: -1250 tmp125_now: -1000  <--- and this
> > > tmp125: raw:7f80 tmp125_proposed: -1000 tmp125_now: -1000
> > > tmp125: raw:7fbf tmp125_proposed:  -750 tmp125_now:  -500  <--- also bad
> > > tmp125: raw:7fc0 tmp125_proposed:  -500 tmp125_now:  -500
> > > tmp125: raw:7fff tmp125_proposed:  -250 tmp125_now:     0  <--- ouch
> > > tmp125: raw:   0 tmp125_proposed:     0 tmp125_now:     0
> > > tmp125: raw:  3f tmp125_proposed:   250 tmp125_now:   250
> > > tmp125: raw:  40 tmp125_proposed:   500 tmp125_now:   500
> > > tmp125: raw:  7f tmp125_proposed:   750 tmp125_now:   750
> > > tmp125: raw:  80 tmp125_proposed:  1000 tmp125_now:  1000
> > > tmp125: raw:  bf tmp125_proposed:  1250 tmp125_now:  1250
> > > tmp125: raw:  c0 tmp125_proposed:  1500 tmp125_now:  1500
> > > tmp125: raw:  ff tmp125_proposed:  1750 tmp125_now:  1750
> > > tmp125: raw: 100 tmp125_proposed:  2000 tmp125_now:  2000
> > > tmp125: raw: 13f tmp125_proposed:  2250 tmp125_now:  2250
> > > tmp125: raw: 140 tmp125_proposed:  2500 tmp125_now:  2500
> > > 
> > 
> > Sorry, you lost me with the above. Are you suggesting that the patch is
> > correct, that it is only correct for TMP125, or something else ?
> > 
> > Guenter
> 
> Ok, I guess the same thing happend to me now too?
> 
> Is there something specific you want to hear? My reasoning is that I wrote that
> cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
> 
> I definitely wasn't aware that / 32 screws the with the rouding result for negative
> integers and >> 5 wasn't. For unsigned compilers actually replace the divison when
> the divisor is a 2^x constant on their own. You can find so many threads/topics about
> that explaining why (basically pick your favourite).
> 
> https://softwareengineering.stackexchange.com/questions/209678/why-does-division-and-multiplication-by-2-use-the-shift-operator-rather-than-div
> https://stackoverflow.com/a/27052650
> ...
> 
> It's been too long to remember what went through my head back then, but I knew that
> replacing / 32 with >> 5 is a common optimization because the bitshift operation is
> faster than spooling up the hardware dividers. But it would have looked funny when
> all the other conversion codes (especially the LM70s. Because it's almost identical...
> except the LM70 has the sign-bit at D15 and hence the raw value can be directly cast
> to a s16 type). So definitly that >> 5 was on my mind.
> 
> Now, I was surprised to hear that / 32 and >> 5 differ for negative numbers and I wanted
> to find out and the experiment tells me: yes, it's true.
> 
> Do you get the same result? What if you replace the function with the other
> LM/TMP implementation?
> 
> But I have the suspicion, this doesn't answer your question, or does it?
> 

I asked, or tried to ask, what I thought is a simple question: Is the
patch correct or not ? You could have answered with "it is correct" or
with "it is not correct (possibly augmented with 'and this is the
reason')". I don't see either in your reply.

So, no, I don't think you answered my question. I'll just assume that
the patch is correct, to be fixed up again later if needed.

Guenter
