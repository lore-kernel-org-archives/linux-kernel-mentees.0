Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFCD221FBE
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 May 2025 17:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746896875; cv=none; b=GPvj1PpUc8SnOn593bceFaH+EqjBPEwhZE77M7b4tCrM1c/iOKFUCdrMU94rjQaQ5f3VHxEmgc9MpGvkDgHMJmSjI3dFzREhGI27jz55T1gqBVNram37Omi77JqNEQjbay6y9IsCJbsMhZC5sRem+sdzUJji66Aui+PsTFT3kK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746896875; c=relaxed/simple;
	bh=YHdZExlPi8JRaqBx4SwzcjgNQQKrlGLt+p5Cn+/Tt20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/Kh2u7lL88+ZeqJpDLxudY0rrQdpt5HmcFwO5V6TfXwR8mi2fG0pMFINsQ2yAuvqFDvcuX3+M64fZHTvxKJTNfHSLbStfZ8KmeOdmTNNWpn8NWaq9zR5pHCpeApBlsAdlmq6PLDDa4kKhxwhytAcgpwDPRRekd6OCOk2vTLs/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMx/bxJN; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMx/bxJN"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4768f90bf36so33669901cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 May 2025 10:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746896873; x=1747501673; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2yoVnhpnR5W4cCH43dm1CPgOkwqMQqiWPXQzcbBDh/w=;
        b=nMx/bxJNb9PTfY3Lt8i586ex/4awONPFjs+ngrk50dJrqNdPuGbWFef5yJA2LplgPU
         AFdkUGI+1W1XC6Q8kN7Vp9amXehRmGV+JgJXP0H4cF7ogjS/mjLLNKXlbdC67KXE0Qu8
         VOZdlgUSSKfYOGITBvReVw5mfiTvxMOTI87Hd+L+rFfWib6BHjjTCg4WKHlP6vUi9s3J
         el5arDPewN04+qMLxRJVYV0R8IS/1JOhEm5ra1AJvyfybUSWuGJ3IISMN/JgWLimihc/
         dQdmi2FDaV0A4oEl3P/bxW2Sa0flmuet3y9DITfWOsOosnorS0OyNxHJXroFtj1LqooM
         rM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746896873; x=1747501673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2yoVnhpnR5W4cCH43dm1CPgOkwqMQqiWPXQzcbBDh/w=;
        b=VDQWxc7dKWlEoqZaiR+i8zQewT8f57OG1PrtjipGorCYH88aKEQAu4ZTCJFTUY/dmj
         VtPXYO6L8NBbQo59nZyvbYnywSCnT4uEv8DRz0hJZyRb+RN90tdciPcQJaq6HeU3wT9z
         mI76+Myfsytze0K5ENC2TeLKMCizN+2QfEAuJ/1e2BqsXTVF/YuMzDKrboC1mN5agjWG
         oEbc1dK7a4ZwusA/5QxQ5wCggwwHbh/J6x/SsNk5diAMOemwBdt564YwacUMgtcK9CUp
         OAh08VuFnPW1GVJjBvwJK0pVPRrhXm0sLtB4biy5SsT+6H899GwDucksrWh8QR/VG3WT
         u3fA==
X-Forwarded-Encrypted: i=1; AJvYcCX82kuInEqK9ciaWDdZ2YJQ/DBPUcSckTWGffusVEiUy0ytTwktoLQrlSsoUA8sEP6ajo6Vm3qUfcKAIjNtPrrtifLDhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtcTwKzEvDAAEw78v+u/rNQGxwILVL2yVBytMjjcCTiZccjjw+
	G/E/m5rJZSnyAfKuP2QWUGgpg5V5jfFjvc50odCm4VSGBj5VDS+9
X-Gm-Gg: ASbGncuDTFvcFkNSkcUfHA5lOmyLzMYv/6CVlK7S+Lii6L4RXJ1pPg224Rn6zEy4XP3
	wigQzZqFx866B554qy/qg8Pkag7GIp2o/CHB4jL8rGSK730XWTXqWIlE3uC/YJuO1ahtncuVgqg
	FokzZQQzAOpU8V4HvNs1wTjFovmtp3av33xU95P3LRCLOurN2MX4rYRzK/6ZDYX0XklnWVW+Ocj
	F8m9GEs/g6Edq56D2qyz2OujZBbIzraUfHdv49EOjtmM6kLOBPOV2Uj3y2UbG9pWkqcDzbG2PXZ
	SI6KbMSLeQATJVqSfxVdKK7N7+JnVpd9ZDgja/hG61zT1kU=
X-Google-Smtp-Source: AGHT+IGCPD1owgssnN8lIRwkXhCvXQPW2XNhujCZDGyUr5ROgJzEY9lthnAog/W9wUHSg3bCTJb4mA==
X-Received: by 2002:a05:6214:5883:b0:6f6:e701:9612 with SMTP id 6a1803df08f44-6f6e7019911mr107331236d6.34.1746896872529;
        Sat, 10 May 2025 10:07:52 -0700 (PDT)
Received: from localhost ([142.186.8.171])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e39f47ecsm27622046d6.41.2025.05.10.10.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 10:07:52 -0700 (PDT)
Date: Sat, 10 May 2025 13:10:37 -0400
From: Seyediman Seyedarab <imandevel@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3] cpufreq: fix locking order in store_local_boost to
 prevent deadlock
Message-ID: <ufcvwme2iycbtssrvrbrfbxzfo7jernzeqj45qm6ig3dr2qtud@glza233zaivs>
References: <20250430160943.2836-1-ImanDevel@gmail.com>
 <20250502050639.2a4mbdav4mdlhbp2@vireshk-i7>
 <6nfpd4jvx7dmpl5hqk5nokxprxbcccah66x2mptgwxtyxmb74r@qiosxhaw3tew>
 <CAJZ5v0gf00GoUUraqY75M5G9bxPkJ5WQ30m5tnksVvA=kTnabg@mail.gmail.com>
 <CAJZ5v0hFBAi7dNhQC1DJG1Fg44LaR-j-vsxO5=G8VbDj15Kr5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0hFBAi7dNhQC1DJG1Fg44LaR-j-vsxO5=G8VbDj15Kr5Q@mail.gmail.com>

On 25/05/10 01:41PM, Rafael J. Wysocki wrote:
> On Fri, May 9, 2025 at 7:03 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Fri, May 9, 2025 at 7:29 AM Seyediman Seyedarab <imandevel@gmail.com> wrote:
> > >
> > > On 25/05/02 10:36AM, Viresh Kumar wrote:
> > > > On 30-04-25, 12:09, Seyediman Seyedarab wrote:
> > > > > Lockdep reports a possible circular locking dependency[1] when
> > > > > writing to /sys/devices/system/cpu/cpufreq/policyN/boost,
> > > > > triggered by power-profiles-daemon at boot.
> > > > >
> > > > > store_local_boost() used to acquire cpu_hotplug_lock *after*
> > > > > the policy lock had already been taken by the store() handler.
> > > > > However, the expected locking hierarchy is to acquire
> > > > > cpu_hotplug_lock before the policy guard. This inverted lock order
> > > > > creates a *theoretical* deadlock possibility.
> > > > >
> > > > > Acquire cpu_hotplug_lock in the store() handler *only* for the
> > > > > local_boost attribute, before entering the policy guard block,
> > > > > and remove the cpus_read_lock/unlock() calls from store_local_boost().
> > > > > Also switch from guard() to scoped_guard() to allow explicitly wrapping
> > > > > the policy guard inside the cpu_hotplug_lock critical section.
> > > > >
> > > > >  [1]
> > > > >  ======================================================
> > > > >  WARNING: possible circular locking dependency detected
> > > > >  6.15.0-rc4-debug #28 Not tainted
> > > > >  ------------------------------------------------------
> > > > >  power-profiles-/596 is trying to acquire lock:
> > > > >  ffffffffb147e910 (cpu_hotplug_lock){++++}-{0:0}, at: store_local_boost+0x6a/0xd0
> > > > >
> > > > >  but task is already holding lock:
> > > > >  ffff9eaa48377b80 (&policy->rwsem){++++}-{4:4}, at: store+0x37/0x90
> > > > >
> > > > >  which lock already depends on the new lock.
> > > > >
> > > > >  the existing dependency chain (in reverse order) is:
> > > > >
> > > > >  -> #2 (&policy->rwsem){++++}-{4:4}:
> > > > >         down_write+0x29/0xb0
> > > > >         cpufreq_online+0x841/0xa00
> > > > >         cpufreq_add_dev+0x71/0x80
> > > > >         subsys_interface_register+0x14b/0x170
> > > > >         cpufreq_register_driver+0x154/0x250
> > > > >         amd_pstate_register_driver+0x36/0x70
> > > > >         amd_pstate_init+0x1e7/0x270
> > > > >         do_one_initcall+0x67/0x2c0
> > > > >         kernel_init_freeable+0x230/0x270
> > > > >         kernel_init+0x15/0x130
> > > > >         ret_from_fork+0x2c/0x50
> > > > >         ret_from_fork_asm+0x11/0x20
> > > > >
> > > > >  -> #1 (subsys mutex#3){+.+.}-{4:4}:
> > > > >         __mutex_lock+0xc2/0x930
> > > > >         subsys_interface_register+0x83/0x170
> > > > >         cpufreq_register_driver+0x154/0x250
> > > > >         amd_pstate_register_driver+0x36/0x70
> > > > >         amd_pstate_init+0x1e7/0x270
> > > > >         do_one_initcall+0x67/0x2c0
> > > > >         kernel_init_freeable+0x230/0x270
> > > > >         kernel_init+0x15/0x130
> > > > >         ret_from_fork+0x2c/0x50
> > > > >         ret_from_fork_asm+0x11/0x20
> > > > >
> > > > >  -> #0 (cpu_hotplug_lock){++++}-{0:0}:
> > > > >         __lock_acquire+0x1087/0x17e0
> > > > >         lock_acquire.part.0+0x66/0x1b0
> > > > >         cpus_read_lock+0x2a/0xc0
> > > > >         store_local_boost+0x6a/0xd0
> > > > >         store+0x50/0x90
> > > > >         kernfs_fop_write_iter+0x135/0x200
> > > > >         vfs_write+0x2ab/0x540
> > > > >         ksys_write+0x6c/0xe0
> > > > >         do_syscall_64+0xbb/0x1d0
> > > > >         entry_SYSCALL_64_after_hwframe+0x56/0x5e
> > > > >
> > > > > Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
> > > > > ---
> > > > > Changes in v3:
> > > > >  - Rebased over PM tree's linux-next branch
> > > > >  - Added a comment to explain why this piece of code is required
> > > > >  - Switched from guard() to scoped_guard() to allow explicitly wrapping
> > > > >    the policy guard inside the cpu_hotplug_lock critical section.
> > > > >
> > > > > Changes in v2:
> > > > >  - Restrict cpu_hotplug_lock acquisition to only
> > > > >    the local_boost attribute in store() handler.
> > > > >
> > > > > Regards,
> > > > > Seyediman
> > > > >
> > > > >  drivers/cpufreq/cpufreq.c | 23 ++++++++++++++++-------
> > > > >  1 file changed, 16 insertions(+), 7 deletions(-)
> > > > >
> > > > > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > > > > index 21fa733a2..b349adbeb 100644
> > > > > --- a/drivers/cpufreq/cpufreq.c
> > > > > +++ b/drivers/cpufreq/cpufreq.c
> > > > > @@ -622,10 +622,7 @@ static ssize_t store_local_boost(struct cpufreq_policy *policy,
> > > > >     if (!policy->boost_supported)
> > > > >             return -EINVAL;
> > > > >
> > > > > -   cpus_read_lock();
> > > > >     ret = policy_set_boost(policy, enable);
> > > > > -   cpus_read_unlock();
> > > > > -
> > > > >     if (!ret)
> > > > >             return count;
> > > > >
> > > > > @@ -1006,16 +1003,28 @@ static ssize_t store(struct kobject *kobj, struct attribute *attr,
> > > > >  {
> > > > >     struct cpufreq_policy *policy = to_policy(kobj);
> > > > >     struct freq_attr *fattr = to_attr(attr);
> > > > > +   int ret = -EBUSY;
> > > > >
> > > > >     if (!fattr->store)
> > > > >             return -EIO;
> > > > >
> > > > > -   guard(cpufreq_policy_write)(policy);
> > > > > +   /*
> > > > > +    * store_local_boost() requires cpu_hotplug_lock to be held, and must be
> > > > > +    * called with that lock acquired *before* taking policy->rwsem to avoid
> > > > > +    * lock ordering violations.
> > > > > +    */
> > > > > +   if (fattr == &local_boost)
> > > > > +           cpus_read_lock();
> > > > >
> > > > > -   if (likely(!policy_is_inactive(policy)))
> > > > > -           return fattr->store(policy, buf, count);
> > > > > +   scoped_guard(cpufreq_policy_write, policy) {
> > > > > +           if (likely(!policy_is_inactive(policy)))
> > > > > +                   ret = fattr->store(policy, buf, count);
> > > > > +   }
> > > > >
> > > > > -   return -EBUSY;
> > > > > +   if (fattr == &local_boost)
> > > > > +           cpus_read_unlock();
> > > > > +
> > > > > +   return ret;
> > > > >  }
> > > >
> > > > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > > >
> > > > --
> > > > viresh
> > >
> > > Hi there,
> > >
> > > Just following up to see if there's anything you'd like me to
> > > change or address in the patch before it can move forward.
> > > Please let me know if any updates are needed.
> >
> > I'm kind of wondering why local_boost needs cpus_read_lock() at all.
> > Holding the policy rwsem blocks CPU online/offline already for this
> > policy.
> >
> > Is that because ->set_boost() may need to synchronize with the other policies?
> 
> IOW, what can go wrong if the cpus_read_lock() locking is dropped from
> there altogether?

I think ->set_boost() being per-policy makes cpus_read_lock()
unnecessary here. Since we already hold the policy lock, any
topology changes involving this policy should be blocked.
And because we're not iterating over all CPUs or policies to
set boost, we don't need to worry about CPU hotplug synchronization
in this case.

Regards,
Seyediman
