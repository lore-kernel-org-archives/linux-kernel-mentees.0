Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E395254867
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Apr 2025 18:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745950756; cv=none; b=ON25sCnPrnwF2AzEt+a2BQGhq3+D+P39fvxpIzUoXKnIhnwaAKJMedJYcC/7j3nnuA7udRB3rVdjXYtLUBpt/XaHeiWc5mdOxJRku0rQVzUx04JfBOp8aHfpf0mP4Y8TW7r2RguqrvL+Jiv8ERUIoQQyRb0t/8U7O6qEDK8HZ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745950756; c=relaxed/simple;
	bh=A5+DrCAn9M6+wxz5jRD2PElzZRM4ayte0Hxt1H5mz+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bG+U3GhoCZBx2gN+Cwg81L4qXZT3qvPZa/hPI/FXHlEEYySlaUuOw5Xj+g8eX2gN6tUMoPeB6Gw1WFYIWhql/K7E5NMOkxVwzx+2FsAkWdvQL+wxGuHDtuoZ1rnpX736cjTWcXMd+r7dEzjWSdMIELKu+IY9+JxOrD8FdYrRP28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLI12DID; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLI12DID"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5e39d1e0eso722337085a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Apr 2025 11:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745950754; x=1746555554; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aqvYy3CZDC8z+XLmUbJgcn0ixQTVHuAMPBSfeUzVW+4=;
        b=dLI12DID2OgkOkrSzcJoLNGGYkqe5kfpvy689uYiGIsuBqYh9D4WwAeHb/NFQb52CS
         kJ+bYUdPBsek9qosEq4d8ZoJjH677/sg2Hm1J7uixsq1KGSczIG5lWZEcLbh/v8Jz5fK
         ge0SrB6+HYNJFgzESh9g3yAFhknlVjwV1UnFWjYi2UKCvbOpUEDLYyACxMFX1zBxnL92
         BkD0xKNOO/JVVjreQYGMXT8sntWP0V0EdpYsl1x04VWvGjToWn5UR/mU2q7MrC9EmYDG
         p0p6Hqj+6X1niKwUbKRN7zTQbuXc6Zqjq+68OSKq7WdegXLNAmMV8TSV81IkzciG4Dce
         I/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745950754; x=1746555554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqvYy3CZDC8z+XLmUbJgcn0ixQTVHuAMPBSfeUzVW+4=;
        b=VjX9Y3xLQmrxtiuzsqzhy/E+jq5GONSceXQaSH+hKsWhDENFyPmhdlTpA1vDtn5qFB
         0W5LzPSK4yDkguzIhZGVoJK5ShtY+Dit7F9ywjlqrWHyXi7zFCNA3isYletOhDe5nslm
         ZkHqcuAxj0sZKCGSSghdbTMv7N9Wne7GJwnPeMmu74tv2j4MmP4XHiFl++UKdQipYlWb
         n3qPtM/ZvOSePkaD55JYu2J2MdWXZSTO5ygy72QXcfan+YNp7ornm37aCoQfYjwFnfnl
         1DkHoLzjvO8OzjkolyNuTgeXMYG0+GxIF9E4YlrbwIO3XI+eAHWv8XEG+tut7WsXyszo
         aGgw==
X-Forwarded-Encrypted: i=1; AJvYcCW0X9rFXa5T9wRDLVB1gx7ZriVAM05HZAdb/AQDcoYf2p/QYh9jzhcsTBo1rQAXAvlRZm5wTHLj8+OXTg5YSqrz3td7ag==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu3U/gDycrPzx/6pw0PQZ51ZiTwj2d7txp+qxQwixkjyPjWLCL
	qbKAB1IAyxi2OGJW7oHTRS4MiKGD3U14SX93gQD7s/daCqxcjR11
X-Gm-Gg: ASbGnctHVm+ixNMB44X4NHXu9U3I2PMgw4RPtZaaBU6/QlfUUfc7hJx86XwGr/dlZRQ
	DztimPacgYMQHtIq6H/3jCSUcwuuVpZlyl6/+18kjRSv+h+4cMlXPRiUDeToDGF28lkL1ZJ0wCo
	bCzgi6fJoms3wbRV0GboLyEy3UkyFdZL2tu2W9IfIr8aV2g5HPU1KSoPuwmQ4gDaQuTP+Al8vEp
	BWMBIkDeiz5IUXkFXXFHrEDgwo3ydihd3PZ/IN57eFmyoW0ppu1CEt1F0dXqu2iPpxh9hYfsfaj
	rqWbzCn46UGyxS2Gl8ufTLnFrqojiEMMfIeitg==
X-Google-Smtp-Source: AGHT+IEho+3WjiTT4Oby8bMTkwgpHxUSpTv0GDtLD75FE2xDGA85LjxZziuggH9k6T/JSdAgycTGSw==
X-Received: by 2002:a05:6214:2523:b0:6e8:9321:87cd with SMTP id 6a1803df08f44-6f4fcfc7576mr5429086d6.40.1745950753728;
        Tue, 29 Apr 2025 11:19:13 -0700 (PDT)
Received: from localhost ([184.148.73.125])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4c0938399sm74599306d6.40.2025.04.29.11.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:19:13 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:21:29 -0400
From: Seyediman Seyedarab <imandevel@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] cpufreq: fix locking order in store_local_boost to
 prevent deadlock
Message-ID: <laqfi4de6ang3ugwwpvdgpmwffk4ice6vcw34vdwgeo6fsixly@msdle5sobc7o>
References: <20250428171931.1850-1-ImanDevel@gmail.com>
 <20250429052444.zfmfzjirkcaq3edh@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429052444.zfmfzjirkcaq3edh@vireshk-i7>

On 25/04/29 10:54AM, Viresh Kumar wrote:
> On 28-04-25, 13:19, Seyediman Seyedarab wrote:
> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index acf19b004..5464c8487 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -1045,11 +1042,17 @@ static ssize_t store(struct kobject *kobj, struct attribute *attr,
> >  	if (!fattr->store)
> >  		return -EIO;
> >  
> > +	if (fattr == &local_boost)
> > +		cpus_read_lock();
> > +
> >  	down_write(&policy->rwsem);
 
> And please rebase over PM tree's linux-next branch, your patch won't
> apply anymore due to recent changes.
 
Since the new code uses the guard() macro to lock the policy,
I see two possible ways to address this:
 1. Switch to scoped_guard() and manually wrap the local boost case
    in an if block, calling cpus_read_lock() and cpus_read_unlock()
    around the scoped_guard(cpufreq_policy_write, policy) block.

 2. Use DEFINE_GUARD() to create a cpu_hotplug_read guard, but this
    requires introducing an empty struct to satisfy the macro. Feels
    semantically awkward, since there's no actual object being guarded.

Option 1 looks more reasonable to me, because it's more direct and avoids
misusing the guard pattern for something that's not resource-based.

Let me know if you'd prefer the second approach for consistency.

Regards,
Seyediman
