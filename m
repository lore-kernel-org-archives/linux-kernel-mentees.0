Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863B01EA7CC
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Jul 2025 07:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753515289; cv=none; b=WDoj7yl5l0gASO3L+KRVw8PnbBXdVUpnc0EfUqpsJ+PoTiDVEDnrZfa3G4m0qOLPAumTPvs8MN79wpKPvHAXnzHue6waWRT62xgAACsXzeUuTYDfBEOxwzWpAK/Oq/cKOIr0FPCGkCLxc3/6fOpWmAD5X2iBQ1Qs7okF/GT+m80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753515289; c=relaxed/simple;
	bh=FMNmStjOUWVtt7cOwV8Qlv+tumSg3tiV3l++SO5dGx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=crSJsPxcPlXHmy+l5ypvprUxpd89dGUY+hLOrvYb0tpFuGApMvEcYghPfZ4YPqNiYakAv7o0Ib/EAudWg4CbAgTM5cIy7iWq/implUrgs/jl5BJpHbTk1UCBpvs/24HyF9rR78pIZr1Rwz6teHd9nUe1WWKjAxQfp3yKfC8HSjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=SSqPmxC1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="SSqPmxC1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b77901b4d2so488993f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Jul 2025 00:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753515283; x=1754120083; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMNmStjOUWVtt7cOwV8Qlv+tumSg3tiV3l++SO5dGx4=;
        b=SSqPmxC1PReIT1vq+OTJoOTU4xiURM8jp3Nz0RrxUrsz5qzlBrM6awSmIY6HGUSvWG
         yJS62nTAOvop+kXoU8OpNsh1y6pb7QoGYaK3TGcB/JybYl6eZis4931/g+xClts3fI9r
         pRcMxL6TJZDiHp9/sbHc7zEj9WWjEmEaZbzYBSQkMwhu0t/KMFXIKWiTh5+f1PgWvIID
         acuoGj0GEvQ+e4UgUWdXGJfq1ZNQBLiNhK3Xl5woPvC8nRxDV6zVWBncOZr9bSVBsh7q
         m+lYw/FAs+7e80+nDP86LsJVNUqNJ/FiuX1CjU/b9nKqpG2XPZpS1X2v7DXrdiR/J9Eg
         ij4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753515283; x=1754120083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMNmStjOUWVtt7cOwV8Qlv+tumSg3tiV3l++SO5dGx4=;
        b=u5pGRaX5T8B2g9vnvbVFFvy3QBjS/OVlEdvG1uScCzPRPbgJEfe7cs38/KE5Hyvqgl
         44Ffm+hEpoXigkm/x+Nf9dTAZay1ZOQgg4gF3vLbKgNRDU2mjeFkVtwCHZGcu0Wy3yz1
         wW6wVme3QL2FahFCxEr3uPldP0Ef3Y/B5vA8fbiKVlf3C5z10bXCmVP7Nv5qEx+73nPn
         7HkwO7HtuoIhAfso4Rjmr9JlSX+kP5c8AnHE74McboOe434PrV8DFTNRtveYY6xdtD+A
         rmbtMzP1CV+FVO0VZIci6bg76oNzVbqCnHnVN5VMewUieA85d7hkDxLMYa4h+BGiqeXy
         3/ng==
X-Forwarded-Encrypted: i=1; AJvYcCWnSdfkYne4qAa4m/yjhp6VNAqhyq90M843VdW6eo5DD9nhoxVXpNTmvfkJmouo+tOONpRd6gZOYTIfOiETDE0tRFSQsg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNm2Xyf5P9YnP6EZcpbXCuwQ7HtnLgI0XdSUzCzqOtQqJV9Lnu
	D7/4G+4gPCB2gfNMb0Zgq+akqd3dUHDx4sXYIFa8hOVkspK7bV/La44qMicZPcLo234=
X-Gm-Gg: ASbGncs8Mu9wOtxP3Z6uEuOU+6tAkoGBpntd/yvokwnSUijLY4Tuu+keQ+VtXfAd8Kd
	IaBcy7ZXoGOHo9aIPyKigWqBgGIYyKnZghy4hsL4WV1wOUgMQL7eMCpUyhCT3sXEkQgAOHVvIwL
	Oh+MbNXsosOtckuxrW7Ztp+MCQ11HR88/mUvpoUynhgqnrdmukPiD9QGNUHU3Sa+KIgNLJgTElS
	sA5e/T+1acVHQP8kWj8sVk6mTxBG1ws3e7/+TtHX3tQby1xqmIUUOrCWwEcXHBx/zdmzNk9ZjrO
	WWEDaXVp4zRQqBrhDiia87hO/Y+I16z0V7A31tDLIA4GLOi4xFgJTk9O7D+p0cYBWpqiJbOZnqm
	Qw55Bya1xT1ZQ9okOldtCzM//z9vDvOEgq9Lmxs85t9hrLhv33gKRsfDwW2EDsedw1ZYKbbWmTn
	7O1Y3RPxqU8Ggq7CMwju9C
X-Google-Smtp-Source: AGHT+IGS1R1BLd51LhebYLPR71ELpRpxxT4MPtlRkigqh7295cnHvdHNyjtNpQNmAZYcVC1/uPyNUw==
X-Received: by 2002:a5d:588e:0:b0:3a4:d9fa:f1ed with SMTP id ffacd0b85a97d-3b776728f9dmr3020420f8f.13.1753515283332;
        Sat, 26 Jul 2025 00:34:43 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:aad:4a11:7705:31c4? ([2a02:1807:2a00:3400:aad:4a11:7705:31c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778f1e760sm1991506f8f.69.2025.07.26.00.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Jul 2025 00:34:42 -0700 (PDT)
Message-ID: <bbe1ea08-23bf-43dc-960d-bb8a214b65fa@hammernet.be>
Date: Sat, 26 Jul 2025 09:34:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checkpatch: validate commit tag ordering
To: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com,
 corbet@lwn.net, apw@canonical.com
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeff.johnson@oss.qualcomm.com,
 akiyks@gmail.com, konstantin@linuxfoundation.org, krzk@kernel.org
References: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/24/25 09:20, Hendrik Hamerlinck wrote:
> Modified the checkpatch script to ensure that commit tags (e.g.,
> Signed-off-by, Reviewed-by, Acked-by, Tested-by, etc.) appear in the
> correct order according to kernel conventions [1].
Hello all,

Thank you for the feedback. I wasn’t aware that the tag ordering
conventions used in the TIP tree are not universally followed across all
kernel subsystems.

My motivation for this change came from a recent mistake I made in a patch
submission, where I incorrectly placed a Fixes: tag after the
Signed-off-by: line. I realized that checkpatch.pl didn’t flag this, and I
thought a warning might be helpful, especially for newer contributors like
myself.

I now realize that my approach is too strict by trying to enforce an order
for all tags. However, I still believe that a targeted warning could be
useful. Another mentee I work with recently made the same mistake, so it
may be a common pitfall.

Is there a general consensus on placing the first Fixes: tag at the start
of the tag sequence? If so, a warning might be helpful for newer
contributors?

I was still using checkpatch as that was how I initially learned it. I'll
definitely look into using b4 as well.

Kind regards,
Hendrik

