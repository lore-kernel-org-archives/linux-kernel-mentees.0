Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C344E648
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Sep 2026 23:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790292261; cv=none; b=Hbcx4+2OpaeIJ+0JA26ksZ/qxEDph0RpcrmFkehPHx/eKAGbgdcASqS+pOPs1m9UZCGQuZO6LNhqBFkHrxjqS+XY2CnD06Ltzd8aC1GU0T1/IRQ6XdgsTazzOcA4JN4NcsRiGyUnfECH7n5Jan+1EAlYaAhT6zgOB+ELR8c3xPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790292261; c=relaxed/simple;
	bh=ANWbgstbKgAnuoPyayvM9wa2364fXfZxo85nyhIjrUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdQWFuOuZ2519M0eTNJtjluJndvHeE9nFI9O21uhcGiib8G6ITozR/Np0EruJGhcJFzT1R3mg7ym3/iwvAwAPxGwhpDSlEnSzCNOb64ai60p0SupUwrpJIv/7dedZ+0FBVtbP5IdGnEjZcV4NRTUqqjnUEhvzmEz9rQoCbEVkRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tOMolaN5; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOMolaN5"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso305071a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Sep 2026 16:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790292259; x=1790897059; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gLPcQvE2dfwkDZEgsOlXfyVstlU3w3zVvbEySQw3EHk=;
        b=tOMolaN57XHAQ6+1IvSY9IWNXzL9avgqzc9JYSGj9E051aNl3WPoAz1pQ3z+EJqo1y
         a9z6sxojFn1mv30EkImlFt6F8bTNNx5xUKKNdH19nyi97SWLY//jk8caOEwyvPq3sKmc
         DSM0+KbFeMTvryCk0eXWrExEy2FuP/tgbrm0PJ2oj7/gAvUqLfugds+PF2bfcAyRhNs2
         3fbkE7QYLtHIf6RS57/oZs20oS9xwYHZYVpwJTBBPlUR0Uk/1kc+0RYWz312prDd3qr7
         Zkhme5EnUpJtIZe380RRpWtniOYDtWDxa8Oo7ZvHtN3XC3kZv4ayn+fiywREC7EliHqG
         QuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790292259; x=1790897059;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLPcQvE2dfwkDZEgsOlXfyVstlU3w3zVvbEySQw3EHk=;
        b=ew6WlGtHUcj3Y0W5NuMJmtavfuazcHOi8mG5H1htgjrQjTv4oo+8Iqb0E6H2y/I4mM
         m/4JseZbQcEeF6Wclvvi6TFFMwP45xcSG3doQ/mcaN6uJTdtqt96p8Kn0WQdJk9vMBJm
         Q7eavHcxHUIHW8ooHKJAIZyimG472K1plrHkuKDfbbJwavQeTqw48gKPmdcCxUDG6/I9
         zewB5RHr4IOgxCz74fvXZ0+osn/F7pjSDPvbfewB/SnDfDtAxGCBDyAjZvq55H68a4Hp
         9ms5iGwKkE4LBr9UqB9Vb38D6cHNBcBhnqVQkfPD95PDdNyHcGI/86sFlOacqm4shUBl
         VQ5A==
X-Forwarded-Encrypted: i=1; AKwUvBw+oxf0go3w0U/B36xv0JIOPFRi26/gwYyWJkp93icxrIZecoi88wTpZpyVwJYio8wdgAntCEwt0qFPNKxJPyxmjuN/dg==@lists.linux.dev
X-Gm-Message-State: AFuF++nWcHOt0T8tIFcRFB6FZ6hFiC63xooIDfLXcHfFndiFdGGJ36eO
	w8kSDmcVLV6+oigRMZInXFrOPgZE22Bqp2mqdZTZFyPo3qeZeB4y2ji2
X-Gm-Gg: AYBFou3M//gnUk8lG973kfeRi4euzLBTBpLZzeS/W8ksW5FELUPHokVJULUG+CA0ICt
	fZ6jtt1oxeyzcoIrJ5Yg7hjBmER3cxalBvS5G0jA2knM3Dy/GlSuyk2HrHO8iFq3Fy4DjfkiDwZ
	4yWL1SHRSsB04qjjt579RxL//afLeegM8+7ZhYXOX6if02YOuPKYiOfaU0FcRT3tFchw/jl/wkl
	RNHbB02PTKkF2QuO2HwfcrB61P8rae8IBCnZP/v6pKuw/DuNy6APaCj8XFh7f5hrfwBxfJbXImI
	h3n1lFBqrh5HCigKr4DR4p9GqBimPhCWGeNaS6zGDq6MQ7eqMlfZ4qxFxaUJUMYn98qfNYJTdrV
	8HARsciZqKHJwFvfbMrQqCCsMqNVicKhTNz3VaYqHfqlrq4opOeZEbYdQcu/LhK39G82XP7o2Ux
	+10staQA2yoCay0cuODLUkANjVayoND+u5h1DgI3VqV3qIZUw2oelFGVahamtSBI+gAL00a4Laq
	QOsjVq1QwDj6rQ6yHcrZcc=
X-Received: by 2002:a17:90b:4a01:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-3a0bb552fdemr350944a91.14.1790292258956;
        Thu, 24 Sep 2026 16:24:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b2235811sm1694959a91.7.2026.09.24.16.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:24:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 16:24:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ridham Khurana <khurana.ridham222@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christian Lamparter <chunkeey@googlemail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
Message-ID: <0f077b82-5e81-4c43-8008-8baa3f6df9ed@roeck-us.net>
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924205326.1739229-1-khurana.ridham222@gmail.com>

On Thu, Sep 24, 2026 at 08:53:23PM +0000, Ridham Khurana wrote:
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

Please stop providing those "had a similar problem" messages (or tell your
AI to do it). This is irrelevant for this fix.

> 
> Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
> Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
> Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
> Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>

Applied.

Thanks,
Guenter
