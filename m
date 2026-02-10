Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A12C3815E3
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 10 Feb 2026 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770735615; cv=none; b=RdNYYfFkX0Tqud5H08vCcu07Pcbnbhn50Cs8ZK9KQrJMiAixJwtt3oVwv2EgVIlLITXysvKGvnh2VDLRlDK3fIEreDpeL3TZi1IfZpOGa/YsHGrad2zphgbh/svkakdfhL6sx1i6YDREOzJlJmezSGBzc0rvtZxH4/ls8paKO9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770735615; c=relaxed/simple;
	bh=P5N4ABjZx124VekI186qd2AD4yXfKDQt9Vo1Fag6vHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aS3OS6kz7VJ3EfC3MSKPDcKcXWkzazsW0Q4E7qOXv/bdAY4M/8aV6qytP7otqZLLUenn32sV/Ru1ozUyQaiSBFZZzjr+q/DfWJKwIEbBPw22TbN0+IK2TYCc//4i4cvuh3yAU66LrknMaxCrhOViU9+o2FRlTIObi1/z6+0BZJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhcxivYh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhcxivYh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aae4816912so16636925ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 10 Feb 2026 07:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770735614; x=1771340414; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v436SyFigxsHrmhj471D+104SnMzTMwy4MIHa73zImY=;
        b=hhcxivYhSIwHUaaVw/2kdGnv0TJgBqt2EvsulgRyHV9cj0e6vN9cT3KZ640M1ST+34
         ft6ujThaDs0D1iipHXFmcomukj6+xrm5gtPPRXS2bIQBSoc8nPt/hVxHkRJAzhqKDor8
         fUj/liB6ryplfdZ8Vbt42Cw1Gaju4rPciKoXMmtqD64QAXN0peuZlkdPufHBtFx/JWlc
         uHZ57t9jimqLreA0z1EQAtPjZT1uoNXDhc+lrLmxBtzt+4gm77gYHYKjKN6Qg+zl3m0X
         PdCgjkp2WYQ6GjM4qCHBsTQSk4Fnu7Gg15KMREikGLjCEpetNny+UjRDCIWhPSfmxKrs
         +vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770735614; x=1771340414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v436SyFigxsHrmhj471D+104SnMzTMwy4MIHa73zImY=;
        b=XkZulSAqCIIHyAsSP9FlLFHD5PDBqM+ISoFkAScYC3J7uAL7sgAMdseLkucwmVEtY6
         t7T3fp221Pzpb2XPQsuAYvws9SsXaG1XGJYGaGVxNSbgcTMPZ0pxc2+joOkg3kM8CCTi
         yYf/UoY0NCTbdc/NfiIoJKYpQof9CSotBS9+V5u6CdK8zx4eaO0PKgPEGO/NSgS8stn5
         2N4VVF6VIGFp855x9fEDM9vE8Dq4QAoLLRR85qDL2O2v9q7GP8v1hrQIS/BP6+cxwVzO
         8vs9A79ZC5hq+G0KkBEshtg1PHBunBeFyBuSVOTiTlL3sITvzEmAOo7OAfz//DL8qzZC
         FIeA==
X-Forwarded-Encrypted: i=1; AJvYcCUJuTjCs0Sy0u+/QrfqZFLiryMea1XkSb6P7DYgLDPCrItojVXsEvotWCmJ44ifLBlGhFDqp6nQhSdSJ2/pFOs1HSk41A==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe0ZSul+tJi35Sf7xLAfEcCNTs0yK56xZ4Dtp3tL57/AAG0l3w
	ge+F0LXr7vq+api/VIdhdGSQ0b+VexMDaQAqnP6bWfXqwDHHzTNiye0l
X-Gm-Gg: AZuq6aJeROWs6O4pxP0Od+DTeD5pOs9at1Of7HsH2Y3bpnNG3zQ6tFBs9YTNlK52j9Q
	NN8jeE2xICfildrSgJPecpri0+sjNNSn/1qJol116GKVXIrE+dMPvvp5f6NP3MITcCFJp0lt+gE
	zkye6csbGDvil6ZbKbm4Tzmz8bXlmui6y++jbSi+mQYPW8Glu+OpSDrMqXTgTXvQNSgakgLsT+C
	6OICabx7WTVSAVT4ym//Dast6Qe8ktNsc7xm3xURFjxkolJOpwsY4a8tjziDEnQ1XK9OchmoN2B
	oJc7ZalQJNFhkkeZ6tBGVuL+RonZqaI9OW6k4g5Si+ZPwOJRim9uMLnMriMHZNzBb17U3mXOQ3A
	fu6i5YGQWeIdpuT04zaBn4v0Bj0QZpO180rjoFayjHUdwIegvF4zE3WZdp6yjP3WRhKabcF5Cn0
	pbSDRx0vUUkq0cbcEezkYBrW8pApAnJbEPHg==
X-Received: by 2002:a17:902:e742:b0:2a0:d629:9035 with SMTP id d9443c01a7336-2a951643629mr163927435ad.3.1770735613704;
        Tue, 10 Feb 2026 07:00:13 -0800 (PST)
Received: from inspiron ([111.125.237.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aa3ec42e2asm149045835ad.53.2026.02.10.07.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:00:13 -0800 (PST)
Date: Tue, 10 Feb 2026 20:30:03 +0530
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
Message-ID: <20260210150003.s55mbwdpgbamjtso@inspiron>
References: <20260205162624.117957-1-activprithvi@gmail.com>
 <20260205192644.GT3183987@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205192644.GT3183987@ZenIV>

On Thu, Feb 05, 2026 at 07:26:44PM +0000, Al Viro wrote:
> On Thu, Feb 05, 2026 at 09:56:24PM +0530, Prithvi Tambewagh wrote:
> 
> > +	r = kern_path(db_root_stage, LOOKUP_FOLLOW, &path);
> > +	if (r) {
> >  		pr_err("db_root: cannot open: %s\n", db_root_stage);
> >  		goto unlock;
> >  	}
> > -	if (!S_ISDIR(file_inode(fp)->i_mode)) {
> > -		filp_close(fp, NULL);
> > +	if (!d_is_dir(path.dentry)) {
> > +		path_put(&path);
> >  		pr_err("db_root: not a directory: %s\n", db_root_stage);
> > +		r = -ENOTDIR;
> >  		goto unlock;
> >  	}
> > -	filp_close(fp, NULL);
> > +	path_put(&path);
> 
> Just pass it LOOKUP_FOLLOW | LOOKUP_DIRECTORY and be done with the manual
> "is it a directory" tests in any form...

Hello Al,

I sincerely apologise for the delayed response. I was testing the change you 
suggested, however, whenever I tried testing my patch against the latest 
commit where syzbot reported this bug (commit 3a8660878839faadb4f1a6dd72c3179c1df56787
of upstream repository) it gave me a build failure immediately without any
debug log, just the message:

syzbot tried to test the proposed patch but the build/boot failed:

failed to run ["make" "KERNELVERSION=syzkaller" "KERNELRELEASE=syzkaller" "LOCALVERSION=-syzkaller" "-j" "48" "ARCH=x86_64" "bzImage"]: exit status 2

The issue seems to occur multiple times when a patch is tested against the 
latest commit where syzbot reported the issue while it doesn't occur on that 
latest commit of the upstream repository.

However, testing the change on the latest commit of upstream reprository 
(commit 72c395024dac5e215136cbff793455f065603b06) gives a positive result 
that the reproducer doesn't trigger any issue.

Reference: https://lore.kernel.org/all/6767d8ea.050a0220.226966.0021.GAE@google.com/T/#mbf32aeb54c4cae609d3b6176ad8dcd99bfc51ad2

IIUC, since the reported failure appears to be unrelated to the change and is working
successfully on latest commit of upstream, I wanted to confirm if v4 based on 
these findings is acceptable.

What do you think?

Thank you,
Prithvi 
