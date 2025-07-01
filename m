Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C72283FD8
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  1 Jul 2025 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751398730; cv=none; b=BpVOekwAA9oxbMT3Ny3nqrgD4jV8f9Z2DkVewYxj5WqsC5WnBMWkmFJduVNn/o4PpT/3+2mVLiM/64239ShIEKl9b/heT8HpkwimIPlQVMu15mtjtYBMguKrV3WW+5x5uLyUuI2dK8AFX+uRWGyNPcFyrFjHv9Y3PTjDdHGRvLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751398730; c=relaxed/simple;
	bh=jdSJbsMqXjRs6rof0VNrFHkz8yb0xjXpNi8/6LiUtHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZeBCU3y6UPwGTNvTOP9+dPPyQofyghb8ZRq6o+32cEgaxqSNi53FloWldAvUsEcLQ+Ed7cX52Ew1w+13eXM/sMYH8t23CGzdC82OhKqdUSS9HHSkMp+Xroe/SV1YPoEnWhox1ocsNn7sGQl6ul13owqU/zyPfYY04EGviYg6Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TWAd6lgT; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TWAd6lgT"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3ddd68aeb4fso50254935ab.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 01 Jul 2025 12:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751398727; x=1752003527; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JlI2LusSqBKQhKAwOVjtIPc9qQuOGQmC5znI8Uy39jg=;
        b=TWAd6lgTIPUyj1vh/bXQvz45kAl3PmcwWMaekh6Lgoom/yTHZANCXAX83Q+GugAudT
         ucKADe4QZ5h0A+m7YCHnQt0O6yK9vzs+HNh4RVdMfnhKS1Jt7MWmFkMvunFZWdxuyfmJ
         0Bt6Puk9acYS6dFYPgnVYawqhDF2K6trd1lKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751398727; x=1752003527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JlI2LusSqBKQhKAwOVjtIPc9qQuOGQmC5znI8Uy39jg=;
        b=vsaCJbrH7A+9M7FbeeLk45rnFazUDzuzUjFrW4B04teew8HLKRuSwhd3AZzgeAFSvt
         nipdbkXet+bHUFN8qumGbec78GXeddFwaoikXDIQgaAPKHHaqAJzrfHxC8mBo9v4vXK4
         d+umE9xGrIkUOykCoqzrnJI28RIsiQxZfLVotME1nB7tzaFn9ihsD1RAauj8zmBnJHGW
         xx7uqSKupXLAQWxtUCeNV30xX3p0tvRI+5+65pqbCBfmInp6BUDjGb0hXSiv6JKiIbJU
         /EllzwXKGMYOkXZrdXAEOhggl7/ZFk8QKu6+E1NUKk6XlIsJAYfSReS8E8X2t5qtEAi7
         MNWw==
X-Forwarded-Encrypted: i=1; AJvYcCU6ekMajt2mt6eoWHZCitDQdvdXkODJ0u8WU0s7unHr2USf75KOz9riye1OOQNEGDGr7ObYtOEDU3TefIbpszf5dJ9DMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKqjx16ziApHv23ouf/Fq4mErCtSboUnMZHY3D9ZYeRslraSMf
	XfMa5VDi9chYUp0W7J5b630E0k8RgR4Ep8/N2IkxpzaeQVK5qY13awhh0ZXJH5ck9WHvRBfkuaT
	MRCs3
X-Gm-Gg: ASbGncvLLoZ1Bz9DSaUntTlYD65vR5bs97ACHv9uNnYBXehNKiqoA+tybnZjfNquH/F
	Li8MaL/AGH4/3SrsfdDNXKv5OQrc2xdv7bztGBR158t0rPIXv4dPKiqhwg5LkwfTOoMCZfajz2y
	3hOWUFqnBIbXo+8So/RjFrJYNZgteQleR56gjYeurax4utcVJuO5zqzCZXGnudxW0iIRebY2cZx
	ZXZuwoA/i709Z+ysKyEyzoAQ5+r63GtZA8LF+yMC4/szDoR+2uVA7hpqle68eaTQT1hPJtkWGZe
	+ErGyn0ZTLhyCQV8ngZBF7v34FQrGMhF5FnFuawNe3FCEl2zAjoILPsKMx9Th+MWaSqdbrEQUmz
	9L8HtROMD
X-Google-Smtp-Source: AGHT+IGvl85HXknFk5WCMqL3KGp3aOWaEvzVt6Rqv1FGK+Z9f2Q+2wtZthqKmGchchXpQiY+DMOzSw==
X-Received: by 2002:a05:6e02:74a:b0:3dd:b5ef:4556 with SMTP id e9e14a558f8ab-3e054a307fbmr3075225ab.18.1751398727532;
        Tue, 01 Jul 2025 12:38:47 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5020486ba41sm2570574173.28.2025.07.01.12.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:38:46 -0700 (PDT)
Message-ID: <d040e32a-3519-434f-b6ce-1e63345b23c8@linuxfoundation.org>
Date: Tue, 1 Jul 2025 13:38:46 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/msm: Remove dead code in msm_ioctl_gem_submit()
To: I Hsin Cheng <richard120310@gmail.com>, robin.clark@oss.qualcomm.com
Cc: lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250623184734.22947-1-richard120310@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250623184734.22947-1-richard120310@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/25 12:47, I Hsin Cheng wrote:
> According to the report of Coverity Scan [1], "sync_file" is going to be
> NULL when entering the "if" section after "out_post_unlock", so
> "fput(sync_file->file)" is never going to be exected in this block.
> 
> [1]: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1655089
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index d4f71bb54e84..cba1dc6fe6c6 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -904,8 +904,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   out_post_unlock:
>   	if (ret && (out_fence_fd >= 0)) {
>   		put_unused_fd(out_fence_fd);
> -		if (sync_file)
> -			fput(sync_file->file);

Are you sure you want delete these two lines? It might not make
sense to check sync_file inside if (ret && (out_fence_fd >= 0)),
but it is ncecessary to fput.

>   	}
>   
>   	if (!IS_ERR_OR_NULL(submit)) {

Check the error paths carefully to see if this is indeed the right fix.

thanks,
-- Shuah
