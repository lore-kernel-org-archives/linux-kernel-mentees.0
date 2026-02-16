Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65F62EBBB2
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 16 Feb 2026 05:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771221281; cv=none; b=sMv6UxkjHaY2K4D++M7XPx5fx/l4Cdg9V0tWmExgEK3NtMqVsedv2fZb3LozhVZ6UxBTZ0LgTrZd3fpGwkyddyk7lG5EWVomTo/lcJ+qF8+vrRBFuyIYkDyK6aUuWzAAw2lMfVybnHlpCEKZ3QS5USYMwHyrihdwgN2Ae1GBqfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771221281; c=relaxed/simple;
	bh=SjHdNqg/sXBWS1+UD7F6sYwEnZg7Kd+rR0ZVIvXV3uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyskSAt6Z50pxhuRdiG7/sygjT6yt1Sz/DKKPt5Jvfw6cfUWKfdOgrQIUauULyDePsBRzl/5Ij0zYEhopxoKXysQExqfaEA3FhB4AEd9i1bmHdFLq6bIpdC1wBdti2lcltqrA8xf19M0YRUsrxI5DyFI8RcUURXVt4LGtO5P3M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLAYlElD; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLAYlElD"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-823081bb15fso1543912b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 15 Feb 2026 21:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771221280; x=1771826080; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qC3qOJwn2Egn3pO4hpRHwOWWG7H3KZpCaBuiI05D8gI=;
        b=cLAYlElDp46btHEObCrmwwfRGx43PSH1iLVXQsTEy/rB1bv+5yMFTN1SLjqgwUu1CU
         v+b1o/WeLcTiH4hJIqQsHVmbpYbh4bzwctdGgxOuEorMxKFIb/SGYVGGT726uSBtrCun
         g/M/k1iRTDlHjWwXZT2Ohz64a/GqHh/AAN/mIgwgSoo/f3yxNU6Uzu4jUBMKwKlcgSHH
         X1JVtYiad8T1SL2VdiKw8fGP0lOB4d0j9xRjqnYZxgrXLrrAO54IH15dQygJD/tahSfk
         XaCrEcgZqtzvQFjhQmjrXB2flgCC2nN7g7CZHH979Fm8Tyy99gLlUiRFoB3awH8CuQ+t
         hTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771221280; x=1771826080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qC3qOJwn2Egn3pO4hpRHwOWWG7H3KZpCaBuiI05D8gI=;
        b=iX0nebq/hJl5wpUzcvPYR+5GIeDi9DLWl0+q7cfjganFltWvMbd5gyrJJqpfXbx2lA
         az4eawt43LTPER26IhJr30WBLPO5IJ6SoScfbFxs8toy/K5pwKMhhs3Gigc/oqRSrqhc
         EKvdcvuRTNw3AdNRHuzC8iVi7T70vMRzZtod5KPYm05s96xvaVGh530OEHT5XswLY2vR
         qqV0P3Kt0K12gokfbh06hGiSwhoJf02DAjsZ00Nd72pScfqloQoy5uF/Y4CoulZPlcWw
         TW7afXEzBWDMyBJpWOBLxMEex54FHDEzIDK7f5ExHMjTzyaOIgyAv+EGdANRj5XG6IWz
         SjbA==
X-Forwarded-Encrypted: i=1; AJvYcCUgulCV1QFVWC+hLOtwflHgWaARc4BB9ltscs1IvICBNi9MThIu4wRMsIrUEQI9DJMjPAgWUBfrRj8GnYiv/3k0ULVXcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdKS4EFIVVTGtaOZHMRwbeyhWY+G2sr3pbMXYwqVqgSRiDkyhu
	agjP29mGWFU2hkqpg6hFbNS9UABDf/VUsstXrnsEUVjdy01FmpHKoetB
X-Gm-Gg: AZuq6aL9mtcSWtW6fQohu05cNfJRSwRUQ8HUHZAJrZXMTkrX9JzJ9MZq/xgvB9buxeC
	B6q1xJQkHoZR7hrfdhV5FBKffD+InjZQTK570QUklDfL+cMWQRdX9i+sgnJAcngx6AJsLc140qc
	NCCcyZ3PlevpinQi/GpM1ueinomEW7DahZqmwGVDZHSXRPysPYLwk8CUBysOldtPwa0/nGxo52c
	lhUdGeARIzo7TOCW/uA2LySyDYfMzvlJbgukh2LCK9yciZA0yI3Ovxx943lXXlQ/LekN+VOaM8S
	tE4lrUeIaCja+fAd+BV1bfTk61xxImpJn73dEAccI/0bSe3vNjpRBe6txruAmQqnsGQQaEYylGC
	HA/ni/w3IoOteh0RORNIhCy2Ynp/BHkYp2dcd4rrZUZPeRA29kGKXXyKCjCFaq1XvAdf0A3Q5+u
	nL+4rNfxuh7SulhKCjGOg+
X-Received: by 2002:a05:6a21:9d91:b0:38d:e87c:48b3 with SMTP id adf61e73a8af0-3948376c10emr5725741637.2.1771221280238;
        Sun, 15 Feb 2026 21:54:40 -0800 (PST)
Received: from inspiron ([114.79.136.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a713675sm75682935ad.27.2026.02.15.21.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 21:54:39 -0800 (PST)
Date: Mon, 16 Feb 2026 11:24:32 +0530
From: Prithvi <activprithvi@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: martin.petersen@oracle.com, d.bogdanov@yadro.com, bvanassche@acm.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org,
	syzbot+f6e8174215573a84b797@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] scsi: target: fix recursive locking in
 __configfs_open_file()
Message-ID: <20260216055432.lf5n4h7tbzwgugwk@inspiron>
References: <20260205162624.117957-1-activprithvi@gmail.com>
 <20260205192644.GT3183987@ZenIV>
 <20260210150003.s55mbwdpgbamjtso@inspiron>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210150003.s55mbwdpgbamjtso@inspiron>

On Tue, Feb 10, 2026 at 08:30:14PM +0530, Prithvi wrote:
> On Thu, Feb 05, 2026 at 07:26:44PM +0000, Al Viro wrote:
> > On Thu, Feb 05, 2026 at 09:56:24PM +0530, Prithvi Tambewagh wrote:
> > 
> > > +	r = kern_path(db_root_stage, LOOKUP_FOLLOW, &path);
> > > +	if (r) {
> > >  		pr_err("db_root: cannot open: %s\n", db_root_stage);
> > >  		goto unlock;
> > >  	}
> > > -	if (!S_ISDIR(file_inode(fp)->i_mode)) {
> > > -		filp_close(fp, NULL);
> > > +	if (!d_is_dir(path.dentry)) {
> > > +		path_put(&path);
> > >  		pr_err("db_root: not a directory: %s\n", db_root_stage);
> > > +		r = -ENOTDIR;
> > >  		goto unlock;
> > >  	}
> > > -	filp_close(fp, NULL);
> > > +	path_put(&path);
> > 
> > Just pass it LOOKUP_FOLLOW | LOOKUP_DIRECTORY and be done with the manual
> > "is it a directory" tests in any form...
> 
> Hello Al,
> 
> I sincerely apologise for the delayed response. I was testing the change you 
> suggested, however, whenever I tried testing my patch against the latest 
> commit where syzbot reported this bug (commit 3a8660878839faadb4f1a6dd72c3179c1df56787
> of upstream repository) it gave me a build failure immediately without any
> debug log, just the message:
> 
> syzbot tried to test the proposed patch but the build/boot failed:
> 
> failed to run ["make" "KERNELVERSION=syzkaller" "KERNELRELEASE=syzkaller" "LOCALVERSION=-syzkaller" "-j" "48" "ARCH=x86_64" "bzImage"]: exit status 2
> 
> The issue seems to occur multiple times when a patch is tested against the 
> latest commit where syzbot reported the issue while it doesn't occur on that 
> latest commit of the upstream repository.
> 
> However, testing the change on the latest commit of upstream reprository 
> (commit 72c395024dac5e215136cbff793455f065603b06) gives a positive result 
> that the reproducer doesn't trigger any issue.
> 
> Reference: https://lore.kernel.org/all/6767d8ea.050a0220.226966.0021.GAE@google.com/T/#mbf32aeb54c4cae609d3b6176ad8dcd99bfc51ad2
> 
> IIUC, since the reported failure appears to be unrelated to the change and is working
> successfully on latest commit of upstream, I wanted to confirm if v4 based on 
> these findings is acceptable.
> 
> What do you think?
> 
> Thank you,
> Prithvi 

Hello Al, 

I checked out and found that when I try to test on commit 3a8660878839faadb4f1a6dd72c3179c1df56787
syzbot uses, in its kernel config:

CONFIG_CC_VERSION_TEXT="gcc (Debian 12.2.0-14+deb12u1) 12.2.0"

Ref: https://syzkaller.appspot.com/x/.config?x=e854293d7f44b5a5

While when I do #syz test (i.e. on HEAD commit of upstream) it uses, in
its kernel config:

CONFIG_CC_VERSION_TEXT="gcc (Debian 14.2.0-19) 14.2.0"

Ref: https://syzkaller.appspot.com/x/.config?x=99ac58566e9eb044

However in both cases it uses:

gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Probably due to mismatch in compiler version which syzbot actually uses and 
whats present in kernel config, the build fails for the first case. However, 
the patch succeeds in fixing the bug in second case.

Hence, I think it would be appropriate to send v4 patch, incorporating your 
feedback for v3 patch.

Thanks,
Prithvi
