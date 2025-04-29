Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDE326F477
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Apr 2025 05:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745904290; cv=none; b=TMUuPXvoaZztQzuVd61/QMNHYOP+eD+x2X4aCG3l/6voJ3e7zx7LOFko8iXqGsY3ypOmjSMOsGChl52sNKTOeKZgtEbNjVhtWgysaXHkbvpxggaqRO1lUW9jmAjiMVsvnN+lbKUp/SD3kMwmJB2M/cM3VZeELqLvUm1UWenpieE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745904290; c=relaxed/simple;
	bh=/KC233azgY3A1MOqq8JrlK5M7xo9FxTg7CclfxXZFos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3W44FdTkxyVk1xNZKG2t+EpGywTD7hWBokhrTisGt+F/FYQTGIRqqb3LD6XARtFwY3vF6ue1yeEKZJX7gLNs1oc3RPeRxsPw+qqhrjSaOMtsuWUHclG0wH2uCA3hFAwt+EIdjbsgRTi/X7IEF0QcpZ+EtqNnjH7kRdHKs/JIKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q6aBJH0A; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q6aBJH0A"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736e52948ebso6043973b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Apr 2025 22:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745904287; x=1746509087; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AEG2jELXd9nNPULNYZssLdKsrgNlc7ll4A8WlMh6fPs=;
        b=q6aBJH0A2XYbVRG/7KmvxL4clIlUsJ0kMvDRX/FqoDBHoijfJE8EUbiftHMlMdHn1t
         qd8c3FgMYvDWXqvqwd6sKhLmACYs2N/MUoUvRRY4/M/vm6/+fMyEyX+WtiASIAIYwuXJ
         BFdro9S6Dkgmffu+V1WVb5du5aFEFs9QCGY3wZ9rmLo/jLybgz/ml/WS3spQx3fgXAsT
         aiKpt4bmA3N+G8YsFCSVTyfOupDelfoMiui7K5aCKA6PLqjVAguOmMDCXRzM1/YT0rjt
         RhGnfGnYn1/qTwh69rG22j8Wne3fmwrQUh1uj0jdtyzEw8vgmR/1bFQ5MZvIQrCdGyZY
         K5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745904287; x=1746509087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEG2jELXd9nNPULNYZssLdKsrgNlc7ll4A8WlMh6fPs=;
        b=uty9Bx9nW4lox46PQd6XIUwFUp7NWQ4T/SnCNLFZHk5jhaJvNReSuN9BcXuHrU9rTW
         cF05yjyR3mZno6i2G8UKpHkF+zCgIcH+D5kNYuyabMp1VEKW4yL1eE/5Kt5Xd3xpOzgy
         mJamRhmsStu3HENGWmgokanYXpLBCmvjpiJLZMdebBuSs6P1iXj9it8BJQgs1O6grLrn
         +6ysZ4YKTEVMtwklWWLJfyDY1AHGZcyjwm64OGBd+lNXX5iSM4nnyZwcCUXS69pVJlmh
         Nu/TwANzbpSuftFPKztAe4A2nGxzv8xId+mHt3EXC9TZXXSVjICPct8c8IXxmJwfFo+W
         dqyw==
X-Forwarded-Encrypted: i=1; AJvYcCUxUpEpq2qjmYd7vFNvgbKry07eRWmBMfykbkOOusE2GswslQ8hQ5eNescNzQt7ivmrfQ8ho4BJxSYTe+JEYhkDZua/og==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywex6s2rrkcUQ65A6g4mU2itxehqnLruP/xZrYswBFD6Ol1UL7X
	KWINqZcLP6UxbaAJC9MFmL2fj+AucDqAHTNJbR7xEvpnSa5plBO844PrDQkUzO0=
X-Gm-Gg: ASbGnctM3+7PX9swej6ooh9jhhxuSpRET62mI0GDnD3EH6G40JtHPULUEpdbz/lrYq1
	4A7IWV2updKFOrw9xFVipQjj6rdxfE4FaUqBFTIRfOEtJYk6KwdrcXj/cNNjN41Ws1fHSIoQiYa
	BnKLsXTEDPKCl4XTEPCHGwew+Z/hqHTxM5U1WpSWIdu/A3yLSZqA6kWhkjE+oLnht43KEd1Yl5U
	VQxyeVTICrCdDHC0wZFOlYpgGSXL3rn3AFdO3V66AK78Zbjs/xNTGGfBMToLSbwmunCZ+usBc3r
	cZgcGvKo/PMDpZNb0f8RqvJi2YyZtV22PIwtPFJmpw==
X-Google-Smtp-Source: AGHT+IGacVDQkA79I4oerLjfSwtP2EnSgzoWaq7vlyI+ukjcLDfb1uzKM/LBC1AotrtWGv/r4XmSrA==
X-Received: by 2002:a05:6a00:2410:b0:736:5e6f:295b with SMTP id d2e1a72fcca58-7402715dfc9mr3302755b3a.12.1745904287390;
        Mon, 28 Apr 2025 22:24:47 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6b1e7sm9311484b3a.108.2025.04.28.22.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:24:46 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:54:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Seyediman Seyedarab <imandevel@gmail.com>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] cpufreq: fix locking order in store_local_boost to
 prevent deadlock
Message-ID: <20250429052444.zfmfzjirkcaq3edh@vireshk-i7>
References: <20250428171931.1850-1-ImanDevel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428171931.1850-1-ImanDevel@gmail.com>

On 28-04-25, 13:19, Seyediman Seyedarab wrote:
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index acf19b004..5464c8487 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -653,10 +653,7 @@ static ssize_t store_local_boost(struct cpufreq_policy *policy,
>  
>  	policy->boost_enabled = enable;
>  
> -	cpus_read_lock();
>  	ret = cpufreq_driver->set_boost(policy, enable);
> -	cpus_read_unlock();
> -
>  	if (ret) {
>  		policy->boost_enabled = !policy->boost_enabled;
>  		return ret;
> @@ -1045,11 +1042,17 @@ static ssize_t store(struct kobject *kobj, struct attribute *attr,
>  	if (!fattr->store)
>  		return -EIO;
>  
> +	if (fattr == &local_boost)
> +		cpus_read_lock();
> +

Please add a comment as well to explain why this is required here.

>  	down_write(&policy->rwsem);

And please rebase over PM tree's linux-next branch, your patch won't
apply anymore due to recent changes.

>  	if (likely(!policy_is_inactive(policy)))
>  		ret = fattr->store(policy, buf, count);
>  	up_write(&policy->rwsem);
>  
> +	if (fattr == &local_boost)
> +		cpus_read_unlock();
> +
>  	return ret;
>  }

-- 
viresh
