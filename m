Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA6A21ABDC
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Jun 2025 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751008477; cv=none; b=TnlOyw1nd2Fd4nHF2B+Gin0MeH2ezR4J9ynPEmr0iJb/lB+fZSinv9iu/i2/RQ1nJ4qrOp6WHIScUkkDE+nvGsBUUpwtBJirOHeGnehALgQk0CzoFPhK8y4pomeSaQ0RCxHNOUE3FKYAMv8D6Bh22nV1201Xe+wlVgdOi946NAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751008477; c=relaxed/simple;
	bh=wx0LqKlXVv8c72e871dc4Fp+9Lt/Vb3P1h0YRmNbohI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0iQzmJ9mZu5vEAVAtjy6QfTop3kiYp+2MaSsFCA6JoEg1PKT/rZYrx+i6QunqxSZ5Iz/wjOP6xeZfDfZCfdd9cBYHoMwYh0jJml3+5DwVafNaAlg8tLtYIT6tR1j6RjD+CfVNYjiXXRpCFXX/KcFfMTHpWKbe+mykGIzKvOq/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cRusUafQ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cRusUafQ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3122a63201bso1495050a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Jun 2025 00:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751008476; x=1751613276; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AQQGZP8E3Mk3yAfl5AsQy1iQwJzm3BFEFB1Lc1DUr9w=;
        b=cRusUafQ7O6aABU6prnbVVVafL+uLvZawBjiQnNL8Sw53N2UJAI+a1f8xUkgROsbgf
         mhjBPunfDPyhPplaa57+xRaFgA7zAhNBCWGxysMc91TgdkyUOq6B0UAfEWoRPtRIDcUA
         Z5+FV2+jRdi9e5VnkEBasGJNtVnSssde2wa+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751008476; x=1751613276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQQGZP8E3Mk3yAfl5AsQy1iQwJzm3BFEFB1Lc1DUr9w=;
        b=ddPYML1botjGhC/hljAyXADPI/HYsqYS8G89iNLUlTQyrqn38/LKvQSZxW71vekdW7
         ihcBug3tmpHErMJoRMlauQHen5r42fOoV8olZIIn2do5U/HYGCQ5H1EQ88vguqaK9c82
         kSgsB7XU4a2YMvuZFl1k7AiZmVcHrMt2iFZwrfDbE98Nz49FDUNoRrjUODI2MwcGv7nU
         vw5wMFxuFUKhbbveYpuJihX/bvvOCLmKArYM0JfTse82haZiRYgEBiRhf8rcD4EbJlf4
         ToyQpOp2k8T/slmXGFiu4MOjgD9vvnaxxmgrCsG7kjLMBhBn4PKZ1nl6YCnGggSwnRhv
         uc/A==
X-Forwarded-Encrypted: i=1; AJvYcCX/ulrFBNyf4errY76FOCZx+Iw4sDK0Sht6t6FI8SqgrnnEQvcTm/3RTPcMXXSf8Of5ey6mUO7T5bAXSFzR6mK2uR6HFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuLfbzfF2TDc/ZfhXvUoeCPc2TBRn5HmoaIOE4AEVmJ2Cj4/5e
	z+dBrb3JCj75wqm39L+4oLpBBrRiTV9IugJBRjPtVO2/D63W9ZEIuCpCNL8UkBjC0g==
X-Gm-Gg: ASbGncvYMg9xyfvqYJSc45KEAW0W6k/mkQoL/d0Wlhc9opZVBAu0+Isx4DDBxcoPFhT
	nzV2KSKjZej/LPhLOmhI5eknsKV1MOHDA97W2onKXhju2e1jrBQobMuOLdeZUKvVTwWtauSlkVl
	N8mnrIt2eEC22MC0hhnhveXE6hcKia/AOfLZ4fvOkFbhBZj3hkyOFjjlft+L0Y5WH1gKTDUhhtB
	uqIDbTd92sngjDih7ENBOqSjpQ8KKR0iFUGMWOopv4FAPkeLcHec3FP/ql/V2NtS5bNYVePPkYZ
	vACL/JmjoJvZXmSFVvJI5+MbvBwHanGxxuXMjv3NjNXROvj7iQPF2KJ56ak/vUsZycOVpAfU8PD
	9
X-Google-Smtp-Source: AGHT+IFEeMckAwHl2Wie4Br0EJx5o3lYirvV/GsaZHYr3pkQ1uZ7EgbwhvZytiHcoLlJBTmyb7T0Sg==
X-Received: by 2002:a17:90b:1844:b0:311:c1ec:7d0a with SMTP id 98e67ed59e1d1-318c92ee554mr2959524a91.25.1751008475565;
        Fri, 27 Jun 2025 00:14:35 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:de1c:e88f:de93:cd95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f539e69fsm6373395a91.11.2025.06.27.00.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:14:34 -0700 (PDT)
Date: Fri, 27 Jun 2025 16:14:29 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jens Axboe <axboe@kernel.dk>, Rahul Kumar <rk0006818@gmail.com>
Cc: minchan@kernel.org, senozhatsky@chromium.org, axboe@kernel.dk, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH] block: zram: replace scnprintf() with sysfs_emit() in
 *_show() functions
Message-ID: <2tckds345fhwxxxfjxsvbvktz7tdnd5mt7yvksoel7hpq4qewd@3uubp65rld3d>
References: <20250627035256.1120740-1-rk0006818@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627035256.1120740-1-rk0006818@gmail.com>

On (25/06/27 09:22), Rahul Kumar wrote:
[..]
>  static void reset_bdev(struct zram *zram)
> @@ -1292,7 +1292,7 @@ static ssize_t recomp_algorithm_show(struct device *dev,
>  		if (!zram->comp_algs[prio])
>  			continue;
>  
> -		sz += scnprintf(buf + sz, PAGE_SIZE - sz - 2, "#%d: ", prio);
> +		sz += sysfs_emit_at(buf, sz, "#%d: ", prio);
>  		sz += __comp_algorithm_show(zram, prio, buf + sz);

Actually, there is a tiny bug in zcomp.  It's unrelated to this
patch, but I'll send a fix as followup, to avoid any conflicts.
