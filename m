Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E713B71AF
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Sep 2026 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790490680; cv=none; b=EujlNcS6+dvV8pxGAafXH4D7Zr0ayydeIDIO52y/f602Dvk1rV+L8RGGgqK/W4p1uC4Z1N1XetqVfA2yOfWGFxo8iQorBMTlIXy8ye9b1VebBJF+X2PZxfIMX1crF9cnR/LZOdo+QeV5rmCVP/mLxMP9wTZKo8l1pyeMmMX5ZM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790490680; c=relaxed/simple;
	bh=AFVICFN4chX62VI8nPVeK5uJPzcrbrWeDjC5hZXZc+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dAU8oT/dzwkvyG8q/DhUlRPWooBnKIKW0WLQ/3OyfdhAbrcKzMz+iWa2k5znZdHTxPMOJAHraoHsXBYM0Sgka/Ai57Vg6oc+w1evPSrVyKANKCM/SEoVgP9a3y626gm6V16U0zz1KP0CTUzhCDJR5rI3PW5PFMnOO9dYweDYaYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSU3n1yV; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSU3n1yV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso7292665e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Sep 2026 23:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790490677; x=1791095477; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G98IODEmjwEPHfQZb5jDWlDo2HGYU0z05SG8co7Iw9U=;
        b=TSU3n1yVa4W6oEDRIY4Ym01IWUOmimetpchYORoj8gDk/A1EaVkjxLrCHvFt1/Oi8M
         jjEGglPNqb0ko0jTuprCQ/VRN0dL76GtPsKijbkgyZOCP5RQlJ0zwY97xF/nOnGNwUBx
         SuW6fvIJqgBOjRBxDLYJREFgQur4ZZ9ng20hpZeJcCNuQDaaQjAKaIGkM/zqNdwuOgHb
         pV1npbmQkxIJ/VTCIOAj6FFp38nCqdDoBeB3BmLt03RP/ETc25SS9CsupF1jd0E5kuwj
         p9OmXOCRSRUiQTFhdM8SaURhBqi0+SUWbRL1R89jgcPcALzlpC+9M3u7r+eQS0k1fTEc
         1MzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790490677; x=1791095477;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G98IODEmjwEPHfQZb5jDWlDo2HGYU0z05SG8co7Iw9U=;
        b=H1bRFs1XNjPScfF08p+63yWfX85ZYLuDMEHzP6en3qu9kOEc4PzwYAH/qI319DVZi7
         v0ZlRHJABaoFpHJmSspUiBZK4PwkcMfbeoYrAbJdYPBLx9RbspxPopJdbfTEYWJszX8d
         75bEqt7bCekTvP7Tlyym0ailisYm/fMfQzbwQjzZm0tlSwsIgBstbrAdm6AXqaZ++254
         LrMO2l3NISXUaShnXFxt+3G0nixSOoi5rbATRDpG5qUUzySQRpptU5237zskdQ78V1dN
         yxe82FRDlFR1Irvl1eFMDegeRkz125kuehhdhKpk5i7Ry3WL9T7AkpOpy2Sr4HbHGJwt
         zlnQ==
X-Forwarded-Encrypted: i=1; AKwUvByBTBFtsHbzyZKzyU6NYLjZQtr1dh5DVtkjGcJuuyFFQxytqCEsiTxaL8bbZA9yaVzCg7Uy5dBRJyn3bX8i27zlbtATow==@lists.linux.dev
X-Gm-Message-State: AFuF++nhTlIdgvXoYjBuSpdgXZCndGoCc6ZSPDyjXa2UbvU2k0R/Dzwm
	1J8Flm9ShAFy0jkfgiW0HWMPkAp+52B4lvGCPhIDYn71zxRMF+DtW3Hc
X-Gm-Gg: AYBFou3KhgYTVghs3QoyoHSKFGsUqQcQ7v7tYuVBPdua0m4hclTxBMj//HGSHc0izxF
	DBV89KaeWvIXBb+8hDjb8T0yQDZ5S+fQpHjLr9M52ocEEIp1GajJD7C2A3bnqPMadKLzygQZi77
	XHHaROo+USvg8eaIOMkV4D4xSr/NE0qOsAXv8L5YF4vMgnP2wT3CplcQN7GrV7CSRLmiQ10GVpq
	8UrjOfFb8COemvMHQfXcmYMkv5vzGVu8HktWfccGsasDmXo8vXxG9Cpq27AIn42ZNDPqMttuiab
	QeQ0SPdX1V1vY4Eu3mF/9ICPBcGKSvjR9Pvf4JcNVb7PvAJRj7zkNoyiQfrGzYN2+iUprW4p6Pw
	BWAihjOsrKBOJNUDFYbeu/SlshsE0m9r5HBvr9D2ljhQbX5z90amHH4D6i6FOHfB6ROpNs8P4cl
	l4Epsnd1Q5d0r5rF/Xj+SxkF1HswvLrQGSGRNFIKneOYIaRYK8N/H8T/axEkGF0qtQL95ElUbyk
	4boCAp8998U52wAHavASZTFKyc8tdSLynA=
X-Received: by 2002:a05:600c:4f41:b0:49f:fe5a:522f with SMTP id 5b1f17b1804b1-49ffe5a56c9mr49760925e9.23.1790490676934;
        Sat, 26 Sep 2026 23:31:16 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef6186a6sm142933845e9.4.2026.09.26.23.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 23:31:16 -0700 (PDT)
Date: Sun, 27 Sep 2026 07:31:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Ridham Khurana <khurana.ridham222@gmail.com>, Guenter Roeck
 <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Lamparter
 <chunkeey@googlemail.com>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Nikita Shubin <nikita.shubin@maquefel.me>,
 Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, Brigham
 Campbell <me@brighamcampbell.com>, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
Message-ID: <20260927073115.15110623@pumpkin>
In-Reply-To: <f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
	<f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Sep 2026 20:03:06 +0200
Christian Lamparter <chunkeey@gmail.com> wrote:

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

A compiler will convert an unsigned divide to a shift, but can't
do so for signed divides.

But you'll also get flagged because C doesn't define right shifts
for negative values.
I think they are actually 'undefined behaviour' (UB) if clang detects
that your code is UB it silently just stops generating object code.
	(int)((val + 0x8000u) / 16u - 0x8000)
might safely generate the correct value.

David
