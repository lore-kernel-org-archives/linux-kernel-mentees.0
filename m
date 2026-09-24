Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCF33F4822
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Sep 2026 16:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268501; cv=none; b=g5F0UE0wHREgJpM5TZMezWQkCHmNkVNQgnihZLgbV4HU1ct4xvLAbNiRlZj57flOdYIkIG/llzCMXVpG0mTbvhLQkS/aPZsJhURTuSlix/LcAjHXXBtd46kvU6ug2WEalvp/+OuO+JwUCz/c/c3fzvle8AwYpD6Cj5MrgAzAbKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268501; c=relaxed/simple;
	bh=09gWLrxV9B2YL08j33NGm5uI7VMhjtGXOM0U4bCV5Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jp3yOBtiAG0QvPY6n6GyKhjNZeoIxdeMrfOA9BRo4HCtPf19+52zGBn3JmCol6imO/15AMjTwENI2Inp4/qIRySe9UWhud2/JEfPeEQ8FFKRbUejSixcVPDGSYQ0Lm2Bc1o49TOSUaC+d9fJkZxoet0+OkQsvzBXr/jJGl++lAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlXkpQpx; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlXkpQpx"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so89337a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Sep 2026 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790268500; x=1790873300; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vcbua5mIvOolDP5npCwiYAbITQjIUK3wgIKLBNoELyk=;
        b=HlXkpQpxXh3rwgNhuY1BgnGNjCuDq/IoNSbqV7M2zqmzER1oT6dAFp2GPH1C6MLo0p
         vFXW/xTo7GNpy8qbxtuQ2wbrjT/IEN20ogdLICts5mU1vih4O/eLUhdupygOraatGNk/
         dbp85xCplR/CVviU4HiyRXxJBCSo2Vs66+kpNYaTLNrRqBDuBqOAkb2iDTYjDBoYWsn9
         ZP0ruy6G0u8S/DRcnxqxWDs3OQvGCw6HVSuTSemmnSKHxvBkRHR/SEe84pXFcJZ2Zwgc
         FloYc3EvN97K83LYJR5/mR8Px7Uc2ZBTOklwphVMg9dkCUwMfW+tuC4MDOUb2qngZVr5
         v6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268500; x=1790873300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcbua5mIvOolDP5npCwiYAbITQjIUK3wgIKLBNoELyk=;
        b=U9SUf1NdMY9Xf3C1FgFij4RHuoFGawvIm5epjoa0MPj166db2Q+izWxf+HqQkWavwv
         TNaCBaTuIVWzod2500k1chi/m3j157vAqacNocVJmEEc47cQ8JZ1bchZP0boNPftwihQ
         UH8mPSm2wnLpOwKgzmBHb4WSJC7+GPViJCnjGhschG3dzz6lEpC9MGtEsejKLrXZ/ctk
         Df1B1/xoJje7T8iIkdMAZmG+MAsuyE5L2wV+ZMwYls5quV/yGyc4cZtZn8Yv+PYDveFk
         iAtzOWNeBIcIXPTr//vc2ABu8YlRk3IxNcDrWeiiJAkdoieHzgVmPg36d+7TOFN7ru/U
         gqYg==
X-Forwarded-Encrypted: i=1; AKwUvBx+Z3DA2PLrkSRa9sdOQBr+R4j6wesZNrORSrup38taGWq73qso6JNJEsX/WjISc1wBH7Cnd55onKj+baIsSHTVx/kxLA==@lists.linux.dev
X-Gm-Message-State: AFuF++ky6JVm04CkHAD3X1Qq/kleOOhrW9fvVngj2OWGPb6jPfM/ctoU
	ly4Zpuz2ZS5D1WAMF4evGQ35Tf9Wg0wn4+ExpRhnJNbu/sGoFOe3SCPG
X-Gm-Gg: AYBFou1S7IWUQztGHcFZJmEKpG150OVau8xiGSjMGzDcb35GO76GQV3yjEBij3jdL86
	4uEZVXt0DPkA+VN/zt5DU1TIMzi8g3rQ9i0ySpr4p2W121w2uAUpLSy/NBkGEARXy2qodr3pdqE
	joD/V2aWwd/RS5mxMNnnPl5j7rKU4JRkAw4b0NU9IEDacKvteV9FQKWrcpip1zkU7X5vVtUBYDu
	7Hvy6LNNOwEKtKHWaYs7kQ6buprKY5IKicFjUqby1JhszL27y0MJYAvbhT2OrT6aVc0FKE3d4ZO
	FozAvKEPJb3XAdJHKJU8VQC5Twycltc5+OQLt++1clSS6bwo3O32F9m2yAqLCgiYrWMq2Z/KtWC
	oixYD0UHmIWciIPHAxHP4ETFSK9Dm14z4ZB8WumzF9RrXcPrqFgGsD5vBxNk4pNMnhb3W2mLkYY
	NCYVCJhysKIk4OepUOD3X+KZk1zXChxYMshwxZ9A0RbBjwJm5v3mtqmO7fY9L75NfxaIJLEXciw
	alK/pe4mCIz
X-Received: by 2002:a17:90a:1108:b0:3a0:9ed5:5420 with SMTP id 98e67ed59e1d1-3a09ed559a0mr1484080a91.44.1790268499752;
        Thu, 24 Sep 2026 09:48:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09733f48fsm5863409a91.11.2026.09.24.09.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:48:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 09:48:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ridham Khurana <khurana.ridham222@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm95245) Fix negative temperature conversion
Message-ID: <0d7f2c30-a775-43ce-a74b-a2019558e5a6@roeck-us.net>
References: <20260923172551.1593798-1-khurana.ridham222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923172551.1593798-1-khurana.ridham222@gmail.com>

On Wed, Sep 23, 2026 at 05:25:48PM +0000, Ridham Khurana wrote:
> temp_from_reg_signed() uses only the high byte when the sign bit is set
> and drops the fractional bits in the low byte. Writing -500 to
> temp2_offset stores 0xff80 (-0.5 degrees C) in the offset registers,
> but reading temp2_offset back returns -1000.
> 
> Negative temp1_input and temp2_input values are rounded down to the
> next whole degree the same way. The chip reports -0.125 degrees C as
> 0xffe0, which the driver returns as -1000.
> 
> Treat the register pair as a single 16-bit two's complement value.
> lm95241 had the same conversion fixed in commit 0c2a40e2fe4f
> ("hwmon: (lm95241) Fix negative temperature results").
> 
> Fixes: fffd80ccc1e6 ("hwmon: LM95245 driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>

Applied.

Thanks,
Guenter
