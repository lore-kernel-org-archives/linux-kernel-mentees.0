Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF47B254AFB
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  9 May 2025 05:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746768599; cv=none; b=Avyn8rRMV3TvNDEZrszrP5Td8Wnk60BoatRpcLeH8sJDgT7SOneBPakGNoHm8ExLuL/vhQPbcOAj8hv9DKtTu6fYvTaEPbqb75cq8qhkc/AkumAr/RsMA2WjK+q2o9PFQ/34rBdOFMPpJ4p3p9ClXELnQ7RMDGz7SFFNDeH5KaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746768599; c=relaxed/simple;
	bh=KhWQ+jRqzp9ACybx9mX/GMmftROOC+S9oSgLo0fnOBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tueSBhG/BsuK2xeU/HJ1kg4SHJhUOYKeuIU7a5A14Qrn3tUPaAaGKMv4a5DeRNeI25CUb8b0D0GCFs3SGbn+DRhR1OraBrvifikTNb1PfDBWRtuOeSsH5kdmr/H+ddUNYMozCMsSsJlyi5IgDnrA/dvBD204sn1Y5v9yO6NgN3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcxcgIDD; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcxcgIDD"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so33972406d6.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 08 May 2025 22:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746768596; x=1747373396; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3FjiY5A6s1JyFLIfKZGHNec3qZYKZdehnvSKZyBFilw=;
        b=WcxcgIDD0k4mDzUfPxMqBefby6pnYo9Ec1+uX961wszzSf2B/Tb4l8ktsiNoVKFSw7
         NdJEN1NpxvbuXB+n3yGkKTYSQ7LJdPK8p6PEVnAoXo0nOsmhnnRoY6+fm1wvKcZosomF
         pE5ypLLUWODZ7kd3A8jDR2hON7asUBhzlhF/CJNsmPZnAIllR8gWxuLlPvrhjwFNS1x0
         gLh5a8wDcS1tFgpP2jTDyh/6tCuJ/yWiEyeg3IZaneiuQccSy2mXtKInf5kG62sPCg+o
         +7lG0Meb5MHihz/IJLJTeip77f6cx5DlQP+BD1DkrEsYCWYwuoPlVtqnoUHCkJJ/496R
         1xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746768596; x=1747373396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FjiY5A6s1JyFLIfKZGHNec3qZYKZdehnvSKZyBFilw=;
        b=uIbupuhuMY8xE56PdoOSbAEya2BMIV6bgQ7uPEeVWMUlz7i08Fkm641QYKwfgq86ti
         GPPNc3c4d5TGd/DO+ide4W9wVxAZMMUrp3mcvsMCCOgSUCKAVA2Ait92vpJWICvvAuBZ
         MjmwiQqet/NZCdVg8ouglbdAUvAhNJaRQwn7NkhYOymKHoPbgIgRtHuBF1C8Lc99Tmr1
         9jbn1dfGEAOUOBhnczkGshOlfiGegpavFbxBEoquQMiE4A8BttMZHMIzpO0PRXg1QPZE
         P7vyPvcuegByuF1L9B2z/uneaGfXJDk2CqA00BVZqup8msJDThAJUG0CVKFYVFb0GPXw
         B+3g==
X-Forwarded-Encrypted: i=1; AJvYcCU9LiVQM+XUPWFFIfqQAeI5zs/mSmXl97VKTR74iJA1zq40DijQ5Z9sj0NwIyZ7DleXKuc3lrMZuYb8SNGsh6PVQ1f7iA==@lists.linux.dev
X-Gm-Message-State: AOJu0YweheI0v0L//H6HFeiV3RiTyBtt++xu+eI0HrXV6LYMMF7E6cDW
	8ZJSXExo7pgYgmT1jJpL52LREBHNcA8fMwRBPVZP6ApR2GUAdB4J
X-Gm-Gg: ASbGnctEpuh1t1UBVwxfNQzLNt79XWPJr+TZLSSNEk2f2HejGCBiemze8zrL3wnCYMe
	L9TGYITc/s2fq8MJZ77YSMhHfHKnKEUusJei86x5q0oZRLTVDtqTbzf8S5ZzLWlFTByzx0QpdrP
	WzZxYanPO+eWL4/uFT5q/YXrWIn1XeLHVeFPYQ6W95tiGitLFvinKuzHxQPL+x8rXtm+1nb0A5+
	LsvjgynUoOUMU/e+wAOTwzpyKmAy4CkT+a0mYxIw3Ji8VQALJJhIgYY0/x9pcM1KXj1tzCZqHjU
	BEcH6stQHJTuvvwo4QWnGvUcOm/YUm8bsuf4
X-Google-Smtp-Source: AGHT+IGqKaXBDx7D+415LmvcxrCVps/+1mN6t+Zmb6KW8pkUykVEh5mmk/Wa62mfVviY4+S9vqvHsQ==
X-Received: by 2002:a05:620a:4549:b0:7ca:d9e8:d722 with SMTP id af79cd13be357-7cd010f7058mr286344485a.17.1746768596541;
        Thu, 08 May 2025 22:29:56 -0700 (PDT)
Received: from localhost ([142.186.8.171])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f98942sm91970985a.49.2025.05.08.22.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 22:29:56 -0700 (PDT)
Date: Fri, 9 May 2025 01:32:39 -0400
From: Seyediman Seyedarab <imandevel@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3] cpufreq: fix locking order in store_local_boost to
 prevent deadlock
Message-ID: <6nfpd4jvx7dmpl5hqk5nokxprxbcccah66x2mptgwxtyxmb74r@qiosxhaw3tew>
References: <20250430160943.2836-1-ImanDevel@gmail.com>
 <20250502050639.2a4mbdav4mdlhbp2@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502050639.2a4mbdav4mdlhbp2@vireshk-i7>

On 25/05/02 10:36AM, Viresh Kumar wrote:
> On 30-04-25, 12:09, Seyediman Seyedarab wrote:
> > Lockdep reports a possible circular locking dependency[1] when
> > writing to /sys/devices/system/cpu/cpufreq/policyN/boost,
> > triggered by power-profiles-daemon at boot.
> > 
> > store_local_boost() used to acquire cpu_hotplug_lock *after*
> > the policy lock had already been taken by the store() handler.
> > However, the expected locking hierarchy is to acquire
> > cpu_hotplug_lock before the policy guard. This inverted lock order
> > creates a *theoretical* deadlock possibility.
> > 
> > Acquire cpu_hotplug_lock in the store() handler *only* for the
> > local_boost attribute, before entering the policy guard block,
> > and remove the cpus_read_lock/unlock() calls from store_local_boost().
> > Also switch from guard() to scoped_guard() to allow explicitly wrapping
> > the policy guard inside the cpu_hotplug_lock critical section.
> > 
> >  [1]
> >  ======================================================
> >  WARNING: possible circular locking dependency detected
> >  6.15.0-rc4-debug #28 Not tainted
> >  ------------------------------------------------------
> >  power-profiles-/596 is trying to acquire lock:
> >  ffffffffb147e910 (cpu_hotplug_lock){++++}-{0:0}, at: store_local_boost+0x6a/0xd0
> > 
> >  but task is already holding lock:
> >  ffff9eaa48377b80 (&policy->rwsem){++++}-{4:4}, at: store+0x37/0x90
> > 
> >  which lock already depends on the new lock.
> > 
> >  the existing dependency chain (in reverse order) is:
> > 
> >  -> #2 (&policy->rwsem){++++}-{4:4}:
> >         down_write+0x29/0xb0
> >         cpufreq_online+0x841/0xa00
> >         cpufreq_add_dev+0x71/0x80
> >         subsys_interface_register+0x14b/0x170
> >         cpufreq_register_driver+0x154/0x250
> >         amd_pstate_register_driver+0x36/0x70
> >         amd_pstate_init+0x1e7/0x270
> >         do_one_initcall+0x67/0x2c0
> >         kernel_init_freeable+0x230/0x270
> >         kernel_init+0x15/0x130
> >         ret_from_fork+0x2c/0x50
> >         ret_from_fork_asm+0x11/0x20
> > 
> >  -> #1 (subsys mutex#3){+.+.}-{4:4}:
> >         __mutex_lock+0xc2/0x930
> >         subsys_interface_register+0x83/0x170
> >         cpufreq_register_driver+0x154/0x250
> >         amd_pstate_register_driver+0x36/0x70
> >         amd_pstate_init+0x1e7/0x270
> >         do_one_initcall+0x67/0x2c0
> >         kernel_init_freeable+0x230/0x270
> >         kernel_init+0x15/0x130
> >         ret_from_fork+0x2c/0x50
> >         ret_from_fork_asm+0x11/0x20
> > 
> >  -> #0 (cpu_hotplug_lock){++++}-{0:0}:
> >         __lock_acquire+0x1087/0x17e0
> >         lock_acquire.part.0+0x66/0x1b0
> >         cpus_read_lock+0x2a/0xc0
> >         store_local_boost+0x6a/0xd0
> >         store+0x50/0x90
> >         kernfs_fop_write_iter+0x135/0x200
> >         vfs_write+0x2ab/0x540
> >         ksys_write+0x6c/0xe0
> >         do_syscall_64+0xbb/0x1d0
> >         entry_SYSCALL_64_after_hwframe+0x56/0x5e
> > 
> > Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
> > ---
> > Changes in v3:
> >  - Rebased over PM tree's linux-next branch
> >  - Added a comment to explain why this piece of code is required
> >  - Switched from guard() to scoped_guard() to allow explicitly wrapping
> >    the policy guard inside the cpu_hotplug_lock critical section.
> > 
> > Changes in v2:
> >  - Restrict cpu_hotplug_lock acquisition to only
> >    the local_boost attribute in store() handler.
> > 
> > Regards,
> > Seyediman
> > 
> >  drivers/cpufreq/cpufreq.c | 23 ++++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index 21fa733a2..b349adbeb 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -622,10 +622,7 @@ static ssize_t store_local_boost(struct cpufreq_policy *policy,
> >  	if (!policy->boost_supported)
> >  		return -EINVAL;
> >  
> > -	cpus_read_lock();
> >  	ret = policy_set_boost(policy, enable);
> > -	cpus_read_unlock();
> > -
> >  	if (!ret)
> >  		return count;
> >  
> > @@ -1006,16 +1003,28 @@ static ssize_t store(struct kobject *kobj, struct attribute *attr,
> >  {
> >  	struct cpufreq_policy *policy = to_policy(kobj);
> >  	struct freq_attr *fattr = to_attr(attr);
> > +	int ret = -EBUSY;
> >  
> >  	if (!fattr->store)
> >  		return -EIO;
> >  
> > -	guard(cpufreq_policy_write)(policy);
> > +	/*
> > +	 * store_local_boost() requires cpu_hotplug_lock to be held, and must be
> > +	 * called with that lock acquired *before* taking policy->rwsem to avoid
> > +	 * lock ordering violations.
> > +	 */
> > +	if (fattr == &local_boost)
> > +		cpus_read_lock();
> >  
> > -	if (likely(!policy_is_inactive(policy)))
> > -		return fattr->store(policy, buf, count);
> > +	scoped_guard(cpufreq_policy_write, policy) {
> > +		if (likely(!policy_is_inactive(policy)))
> > +			ret = fattr->store(policy, buf, count);
> > +	}
> >  
> > -	return -EBUSY;
> > +	if (fattr == &local_boost)
> > +		cpus_read_unlock();
> > +
> > +	return ret;
> >  }
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> -- 
> viresh

Hi there,

Just following up to see if there's anything you'd like me to
change or address in the patch before it can move forward.
Please let me know if any updates are needed.

Regards,
Seyediman
