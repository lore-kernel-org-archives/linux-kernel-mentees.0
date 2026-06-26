Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE390369D64
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Jun 2026 12:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477513; cv=pass; b=r8D2de26oCXvxapK9YfNuNZwx/jIfRPBI4I0f+UAiLtnVsMRQFR9cVAQREOYVPsO5n2UB3khEmhO8ahunsN1va0T43k2xfgEnKBddebvle6bBQASIkRQyMasHkM+Dskf3jZn1AmW5C+WJw8L3W09UNM9aN5ZlCogfaGe8+ogu8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477513; c=relaxed/simple;
	bh=FHE24Esf7ZACzZX3hr5BkL/1ragaLXiwUjw1Use/2sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVt9Lj7VxmlvWJXQWu1+Dxz7D4xakWxtfvvDheAv8kSdndXQfrNVch78Ac5+3YSGLVcHwBbhvs665EZb0dKMq9qoGI8Oy7IJwGAkk4caV8gwUDEtRZMBZ9TkX9xz/aI+fUt6YxpmfT0yIVQrsmkpf5ULXco1nNnmB/AfGGB1pLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sob05GeE; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sob05GeE"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-922e181f199so81923285a.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Jun 2026 05:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782477512; cv=none;
        d=google.com; s=arc-20260327;
        b=Vk6RFE04sLv76hpXgIOuonMlBvI7CddM2VAi/i5VYf4b/YQfaSipGxNsPElhxREHWf
         Pi75kbBKJlL5sJebbC2T0nhmnuqsdOEvZDODsNkfBxO/r5AkWlbYGIdS/NDEpcgGcCfo
         FEHT21UwtoFHFpSCWa7EDaQjwi9EgxMcJVxFhF01ybRaF0RYygal6B0IL0Eia12k1LMh
         1o5ItP7BP4JDN5lGLA5Bo3vSniazvhg2dHXLB6ZZWTWHPMvJxv1IEbTulAHNekci1vg7
         WHsxVvO0Mg5V5cVxmHTynTLdCqrP4rcReAbhxv/M38TcwYa22/BPDQFhbhexEWiQeamp
         WxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FHE24Esf7ZACzZX3hr5BkL/1ragaLXiwUjw1Use/2sM=;
        fh=XGNY3rwT0l73avjQzCrS9j9nh56RNUaXYqp2oCzJ6ZU=;
        b=Io/1G1D9WA5rDjJp/z9OAvb0URnlGn1XzleK1HeTeb9a0hS2LFiBuGSDqymysO8NrX
         dLRJD6B8q33oXWAtGTDdIyZUCP6spj+izw0czQpjSCicbjKnl3HSSXXYkC/TxDpkGjzn
         AQfh0bwYmd2UK4mdpAL5x70I2qO3/MuUvuOYrA3QfZKnswEX6/o46S25kDFN3brV4pyI
         sStMyKDeuB+6ALRLjAiosARZQxl5MWEP8kZL03VobFtpuxnEkgnnO1rR7yuS4NFfY0+C
         x7oPpXgfrm3nfpZAqlf+FzU8M6RJWIUigOhQf10JCpe4LrtnbJC14WzYxvz50lvOOw55
         gF/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782477512; x=1783082312; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FHE24Esf7ZACzZX3hr5BkL/1ragaLXiwUjw1Use/2sM=;
        b=sob05GeE8oVcWzahFmENCCWsEi6yrX9w6/wcTWFETh+t3r8qSLhyvcVZm3CSLVZyMf
         phJ/BVBlpo2OChTV9WeqIfdUnKG8RUrxx9W4+nJ6ZVKPBb0AspC73w/tMRLs3HMiNHhN
         M1pnasziaNYkTbGdptjgnq5ZEhz+HwTZjz43FoLG94H5rZIsBY5DHJhXgGX7f7d3Fd9m
         X0iushN3xnsfOQnYrEV1sN7gNN2iisKIyOlViU4XGf3sa5m4m7/VFQr2kIzKxAb0dPbb
         R+5fpBLR7izt7gcxgoM00U0bED2h5b5nWejYR6sD86z4FYhxN9K03h86iNGFQt8wrfIT
         Gihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477512; x=1783082312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHE24Esf7ZACzZX3hr5BkL/1ragaLXiwUjw1Use/2sM=;
        b=FllH0KyR9o3I4HRiLFSqc0b8Ca5uQMLe7Yw6UgPgK7QKYengBpDZpe+PtBps0zznh9
         x6S5n/ObuG7SYRBRYZwjD+ABAQuho4UteOBeumNnZf9YFqNZdzC09dp9Wye0iy1X7DLF
         cBa8vT/sD0b72AIjEyGSO0X1usFSrtyR72qG3HMUJQAk1FtlZtx1kP3OuwVE5j7hua7Z
         Mmt/SdWHM3vQTaCr+CfgW4tbYA31BmGDt1ZVCGkN2Iaa6qV4HEoQjs6hLowedhkhm2EU
         FnaBIGPmzxZKX+a2ms3HBnxC1ria3C5NgEhAQvF2PI+hNTy9TBwpb31Nf3awcPIryvej
         q9Og==
X-Forwarded-Encrypted: i=1; AFNElJ/Nke9coMxE4/w0xUmckx/oDjOGNFq1QNwzitmo+lztnbYQGKkEKRcAEipv/mypRQdp0agAH3Q82fIlDNV+79MBtmpIlw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4NfMmnnLK6UG+B+Y+MK1hq+v+jO2WZopVjmf8w1lJwpaCohBx
	OHPSiULs42DT9Vg+bIembEWfYGhcXcCuy1aVUxwttyu/fEbnEWBqhq9Wsz0T/ClijWPcQ00Q2SY
	8hKX3ZZI1CgH5Mw7Aq4U+urjlYiOijR8=
X-Gm-Gg: AfdE7clB9ODmzcPOZQbCfQXn8bzeUNS0jWSP1PW4OVk/7poIT7/9Ld+wUBbcsVVbJmi
	zEo3k7BPbn+ah6Mvto88fHjm+fzy0AbHjfh84Rq7HzlXyc9xqzlV7AuDV9rOYrwWkStQ/OvNPS4
	Lw3uP4SBrs2G7D/2qBhmXGY2QDp/i/s1vaYLo6y1Ejisz1L48Mp3NOgmqkmmEM6sSjjBwhsHfmT
	d5aTH5F0IRV7eXsrnxWopTyss7Wk1yRFd0Rptsxu6wPrFLjmYpNOihrdtIWbStn+xTagIZHUpOO
	eYC02jlMjvkuP1+bbErDm+Pl5ebxuAG2kJWwq2ZADGhN7+iLEPUKdS3rhllo74o=
X-Received: by 2002:a05:620a:4589:b0:915:8865:dc01 with SMTP id
 af79cd13be357-9293ddb0539mr1062831085a.46.1782477511763; Fri, 26 Jun 2026
 05:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625160228.59672-1-tharitt97@gmail.com> <178246824177.1799417.1678746966574660598@freya>
In-Reply-To: <178246824177.1799417.1678746966574660598@freya>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Fri, 26 Jun 2026 19:38:20 +0700
X-Gm-Features: AVVi8CcFyQoU98IjgiX9d9v5xaZ8339Wm9OfGaHdAcfegTSWA-faGgeYzWknwZs
Message-ID: <CACak8wPuBaGCBbBrpoPQ5ftQRtqwijvN_VJoRGs7FzYBGck-iA@mail.gmail.com>
Subject: Re: [PATCH] media: imx219: fix test pattern ordering and add patterns
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Jai,

Thanks for the review

> Do you have a strong reason to switch this to the datasheet values?

I must say there is no strong reason. I'm totally new here and come from
the perspective of someone studying how to write a camera sensor driver.
The datasheet says that writing 0x1 to reg 0x0601 will set the mode to solid
color test pattern. So it is "natural" to expect that I should set
test_pattern=1 to do so via v4l2-ctl.

> I ask because this might break what userspace applications expect
> (libcamera) and also automated capture tests (that compare md5sums of the
> test pattern) in vendor board-farms.

This was totally oblivious to me when I made the change.
I agree with you on this point. Breaking userspace does not sound like
a good idea.

I'm open to making a v3 patch and only introduce new test patterns to
the driver.

Best,
Tharit
