Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C9E2EA470
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Nov 2025 22:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762985995; cv=none; b=KF6r8UC5EzEdxf/3o7sWfebnosbhYgiiqoJTv3RtjDt7OplQx+x7/l6qAxgR6kbpazSNzvWjq8L4cmxbA2jDrwgAVSBO0GxD5FKSfMJJ/ukhaH2Ln9LR4XkKCx+iIQ3BAz+X8+4F9sEqU57K5tch7nJuzb2JMtKm1QL/tu63aZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762985995; c=relaxed/simple;
	bh=unLPp2rzYuoxWbtv89S5pYlQJKMZKA9scZeJBdGlmIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmGJrdU1BRfTYdUwtN9L4qLyHN7MzkereguYACNWy66yjG3Xiuf+j48Dzq6qAiWyxnOE+C3QCwrSDANv3dog6Kw/ihMwz/CdsjSRMgtN4hjfS7f0/At48wNoAkvhUJ/q6uxVGBjcaNRBjQCilHFhgH489aKz77REgf6jBGN918c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=BBu3GieK; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="BBu3GieK"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso100703b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Nov 2025 14:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1762985993; x=1763590793; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4g6kCT4s+7bhT0JH0DcrOQKdbv70N4aP0FSpxYAN3OU=;
        b=BBu3GieKKSZ+0qBjpoftTwRIWmwTf40/NRs0vCWcNympUUCOQghDfbpUCuHl8/p3pL
         8reFSxBTv5omsQEWB7JG0fovJaYBTIhMQpq70lAVGo20E36I5FQzvXzyRfzB4nzSidVk
         bOyInG/csNcn+brH7c1B3xBPz9uzjMT7ImECHIuVdnlq5NVfC7P7zjVY3+pltvdUv4Xm
         brs0xxerBcvcgpDFaB4+N++4mGNhhxeRt9pTAs7OLyEkcFMAyy2p/RnWtYYrwUoI1km3
         s5YPgnzjYFOtiZOQ4sfr/i4JzMTUC6+r08AxWj+46LS8YRTHlOnemjaIulBlzj7R/uLG
         eh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762985993; x=1763590793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4g6kCT4s+7bhT0JH0DcrOQKdbv70N4aP0FSpxYAN3OU=;
        b=SdgsV6UvtB5exVcWKK9VYhsdK/Gk340plWG6KQ1/Czp/N1u8g3KS3ldWCBPSwAcXjE
         yMrZz+M6+IuC/HAQRFp0ZY5yxWDN07gBA0cgCByNgL0MQT8ZiIZmvHQNVHBOKocQ9iXc
         RH0JUbkAsnh+td21g+IjPYGCk+34hDUVuNa6dDbOcy4ULYYxTZsMdOrJtDdDM9cjwXUH
         PvA0dWqPM7RtlJ6Nxxws79oxvTYmR8bVLYhZ0/8xcpSDGskUYl2lAFbHWDtfd6T4aq9E
         ceqJQorVLldC0pdBQyQ9rofIoiDChL7GtzlWoL0A5H6T6Mrwrecs+yLcrO9dCeqletTI
         XuMw==
X-Forwarded-Encrypted: i=1; AJvYcCUTGboTnVLRMEHOM0Vz7B9YuEoSoACosCvuSai/0jLaUNcWW73qrO4ZZ58b5DhvYeAqp9eUhNzzZJ4DFPkUVdKU2dTWIw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1AYEMXYy3UwAXVIy183YdfoZtAcN6FShJti183IM6gRNEHB3i
	tBhimEnOnbzGN1EPvxjzIwMSlOLV+/JKi8eAlEzqUCR2QmJEWyx2rRjmccLpW7z848w=
X-Gm-Gg: ASbGncvVqDqQamWiuP231tE+T+TauXc100o1wN97XUvzSqGujImXg1So2zS0ClhsgfE
	jnHoxspdI8Io0VrecFAv+HOZ4B/JgRZjM1mpiwbONyB7YLp2iKaZyyKHIL/7uoFEMA8Hzm6OU/q
	cseUpGEWfoU4lciWtqWnoadUk+oaxkT3GSPGLO8EtxZMFtUMAJCzJXOSGuq2vPb6maR6wYMOGxB
	eOrJDzb0UEYYR7kcsFkxjQ5sp5TFZLyArAksZXv92+4wYjZAb+xQjy6HJtQGybSTAOpDevFNki1
	K/pAOiI88DAPOSkVXuFS/aBX7pgJxt8eDjBhNNYFw/0cbH+HbhKe5Wvok7btQlSEIjAT81ESL8/
	S7AsHSF6XrDhANXZ6ZYNU2cDv+lHvuDhgfEc5e4g1f9uRPOaH4Hg3AJB5ioENYenLDLHGYM1JFE
	CeoQTYoOYd4eyYI5fGO/S7wV8KM57gg5d7mMJjusp2ME/5lUsspWU=
X-Google-Smtp-Source: AGHT+IHAa8tCyfwo4LnzmXlglXEr2HrToLcPw7JFbhkznGZRRLapV1K3KjrEoN6EGIup6pNwE09Bkg==
X-Received: by 2002:a05:6a00:992:b0:7ab:2fd6:5d42 with SMTP id d2e1a72fcca58-7b7a48f6387mr5692995b3a.16.1762985992953;
        Wed, 12 Nov 2025 14:19:52 -0800 (PST)
Received: from dread.disaster.area (pa49-181-58-136.pa.nsw.optusnet.com.au. [49.181.58.136])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aea005sm80341b3a.3.2025.11.12.14.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 14:19:52 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1vJJBu-00000009zUN-0VHA;
	Thu, 13 Nov 2025 09:19:50 +1100
Date: Thu, 13 Nov 2025 09:19:50 +1100
From: Dave Chinner <david@fromorbit.com>
To: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
Cc: cem@kernel.org, djwong@kernel.org, chandanbabu@kernel.org,
	bfoster@redhat.com, linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com
Subject: Re: [PATCH] xfs: ensure log recovery buffer is resized to avoid OOB
Message-ID: <aRUIBj3ntHM1rcfo@dread.disaster.area>
References: <20251112141032.2000891-3-rpthibeault@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112141032.2000891-3-rpthibeault@gmail.com>

On Wed, Nov 12, 2025 at 09:10:34AM -0500, Raphael Pinsonneault-Thibeault wrote:
> In xlog_do_recovery_pass(),
> commit 45cf976008dd ("xfs: fix log recovery buffer allocation for the legacy h_size fixup")
> added a fix to take the corrected h_size (from the xfsprogs bug
> workaround) into consideration for the log recovery buffer calculation.
> Without it, we would still allocate the buffer based on the incorrect
> on-disk size.
> 
> However, in a scenario similar to 45cf976008dd, syzbot creates a fuzzed
> record where xfs_has_logv2() but the xlog_rec_header h_version !=
> XLOG_VERSION_2.

We should abort journal recovery at that point because the record
header is corrupt and we can't trust it.

i.e. A filesytem with a version 2 log will only ever set XLOG_VERSION_2
in it's headers (and v1 will only ever set V_1), so if there is a
mismatch something has gone wrong and we should stop processing the
journal immediately.

Otherwise, stuff taht assumes the version flags are coherenti like
this...

> Meaning, we skip the log recover buffer calculation
> fix and allocate the buffer based on the incorrect on-disk size. Hence,
> a KASAN: slab-out-of-bounds read in xlog_do_recovery_pass() ->
> xlog_recover_process() -> xlog_cksum().

... goes wrong.

....

> Can xfs_has_logv2() and xlog_rec_header h_version ever disagree?

No. As per above, if they differ, either the journal or the
superblock has been corrupted and we need to abort processing with a
-EFSCORRUPTED error immediately.

That's the change that needs to be made here - xlog_valid_rec_header()
should validate that the header and sb log versions match, not just
that the record header only has "known" version bits set.

If we validate this up front, then the rest of the code can then
safely assume that xfs_has_logv2() and xlog_rec_header h_version are
coherent and correct and so won't be exposed to bugs related to an
undetected mismatch of various version fields...

-Dave.
-- 
Dave Chinner
david@fromorbit.com
