Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF68729CB3A
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 Jan 2026 14:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769092185; cv=none; b=paXe93JKY+PfmMepH1szBgZAlzZUtWr8O2/8hbO6XBgmF7iYfDGKhYjzPfAtaeEDcDutTcD4y4RKTygJRXcoa1Q8/QIKqNKHUWtG2LVWoDIwaR1YxAOGlshy4nFH4X3NNK2pFgPNNGTAZBhfERATCrsypkRez2gBS3dDP5IgXdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769092185; c=relaxed/simple;
	bh=cz+JlD34fRs/pROTZrvc12hKh4tyzrxS8BcTZwwO9EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWII02eT+fPrGOSk4qX+LBdh6DpwWOus6ExR2i2f9ZeCVvdtMHaXfuWZ9AhQsEksdlTa75KRN1B0TwGMQU47DY4kOIPtnaEDTCNEExyYwxw9pbHZUKvMczaQ4nkxTbwqsy4Mcqolf3ZzQtdL8xWMPdmtAkWjK5T8MIMC0DT/qh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmHoPsFe; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmHoPsFe"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-823081bb15fso447523b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 Jan 2026 06:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769092183; x=1769696983; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k2bB6UcFN/QmZIeetEeQNfw5hOnI8IdcR9tXmdiu+0M=;
        b=AmHoPsFecBiWAeTviEXgGLt3sNiZEkFiZga1pO+kSa/ApDQpRyvPao8OC//aN+s/AU
         ueMIGaOrnWpYgmSCyahZqltCobWzI0CznPloS1p5vqutv4I7plcaVACI0Fmy6rLTz2J8
         9m+S/St/AcX0ppa5fup0rySrNxB/1Tg6ve96UV6fAA9pG+za6MzpRqXlu9QpzAfn73nD
         6eszXzJiBhzmspG4uT5MmP58R9V1d+3y+pFrqg+Ohp4u/6M0Y3+f33/A13h4JBDVjEd1
         aH8fsElYnu5u1kHdZkL35f6wfXaw7Blpg3UaNZFszV7CrQAVRMGopMC/zx6SwqGnHcRC
         kgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769092183; x=1769696983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2bB6UcFN/QmZIeetEeQNfw5hOnI8IdcR9tXmdiu+0M=;
        b=WEZfytcgAw/Q3Y7UUZidr9WnTZKZ1jraRijyKOSHibfpOzAJxZXia9hiJR06CBYcBX
         9omm5eCg2wr3AbAuR7TiPAVip+W47TImZSKvfAn0aMCePhWs4FiI8TaWwP8wQFVQATlm
         +foox9myFfElJp56PfrVMmox6s9nf1YKiwbWocVyslZLM52qoU5A5JCca7Iq/1HrO6nq
         WmZ3YMgxP3eLMyUVGs0BHyre7Kotfofe2ZrP2pAIOxJbE2NNDN/TiLYFRruwcFKulbms
         4XSIuRZlgJNphViDj47LJJAOd0AMCp8vrpUIqDfjZIa+azamUv6WVdfQDKgVcbclrJyK
         dEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHnA3rwBdGM10CyIPalpQkOZk/MejWUsFeV8KkGPjp5ror3hR1qe3hvKQbHW4uGzk7jE44Ln996/Ta0yuto7roQF23lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxaoVo1VtuTnYBBspMvxuEJa2fuX9K0sSjArReuTeoDef09zS6w
	wncmJd0y321CfvUmIOEqPPZ8uZbzfZNcTZHWif5nJ79Qk2QVCBNIgS92
X-Gm-Gg: AZuq6aKmaoJXGMkiQznsOi/3hrmnIKde9D0I/3xQayO6M8I7wa7VFmSvqQcTbX1G2Hk
	co0KUJdMyB2P+yX60PBR/vUPRhqWRbXJ4Si85dpT4rHpQulkq3MhCeM9uMvRua3gRfvj1OdwovF
	hvwEqxRbxSROarRUUbAEicvgDIjAgoDnM7Q7A5xVqCiubGBRRA7iFGdFAQCgZRBT5je302H3zwR
	biKlu+zKXfY7OA6QDDtSM+BoiX1ihjD8nFw0mI9DX18ijeTpSqL4rNSEURDNk+xs84/nJnQxAYv
	gX5mDdct+S8gjUiD5M4IWywxEo3n0eTSWQSkxie/zaFwR8bNbb8xchkcU/iu8uh0NB8CykDoXRs
	oDppzUbJxa2dE7WC4LYSZBUsNaxzm99yYXPvJdoSVjdFwo9Lgl2pFPNYSecxTYeHP1SXRZT2Tum
	Ii3DrgMB+7XkE=
X-Received: by 2002:a05:6a21:3984:b0:38d:eeca:b330 with SMTP id adf61e73a8af0-38e00d1557amr21189377637.40.1769092183005;
        Thu, 22 Jan 2026 06:29:43 -0800 (PST)
Received: from inspiron ([111.125.231.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf354b3bsm11023239a12.24.2026.01.22.06.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 06:29:42 -0800 (PST)
Date: Thu, 22 Jan 2026 19:59:33 +0530
From: Prithvi <activprithvi@gmail.com>
To: Dmitry Bogdanov <d.bogdanov@yadro.com>
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	hch@lst.de, jlbec@evilplan.org, linux-fsdevel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	syzbot+f6e8174215573a84b797@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] scsi: target: Fix recursive locking in
 __configfs_open_file()
Message-ID: <20260122142933.662srnqeqmx7eqk3@inspiron>
References: <20260108191523.303114-1-activprithvi@gmail.com>
 <20260115032012.yb5ylmumcirrmsbr@inspiron>
 <20260122095634.GA15012@yadro.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122095634.GA15012@yadro.com>

On Thu, Jan 22, 2026 at 12:56:34PM +0300, Dmitry Bogdanov wrote:
> On Thu, Jan 15, 2026 at 08:50:12AM +0530, Prithvi wrote:
> > 
> > On Fri, Jan 09, 2026 at 12:45:23AM +0530, Prithvi Tambewagh wrote:
> > > In flush_write_buffer, &p->frag_sem is acquired and then the loaded store
> > > function is called, which, here, is target_core_item_dbroot_store().
> > > This function called filp_open(), following which these functions were
> > > called (in reverse order), according to the call trace:
> > >
> > > down_read
> > > __configfs_open_file
> > > do_dentry_open
> > > vfs_open
> > > do_open
> > > path_openat
> > > do_filp_open
> > > file_open_name
> > > filp_open
> > > target_core_item_dbroot_store
> > > flush_write_buffer
> > > configfs_write_iter
> > >
> > > Hence ultimately, __configfs_open_file() was called, indirectly by
> > > target_core_item_dbroot_store(), and it also attempted to acquire
> > > &p->frag_sem, which was already held by the same thread, acquired earlier
> > > in flush_write_buffer. This poses a possibility of recursive locking,
> > > which triggers the lockdep warning.
> > >
> > > Fix this by modifying target_core_item_dbroot_store() to use kern_path()
> > > instead of filp_open() to avoid opening the file using filesystem-specific
> > > function __configfs_open_file(), and further modifying it to make this
> > > fix compatible.
> > >
> > > Reported-by: syzbot+f6e8174215573a84b797@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=f6e8174215573a84b797
> > > Tested-by: syzbot+f6e8174215573a84b797@syzkaller.appspotmail.com
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> > > ---
> > >  drivers/target/target_core_configfs.c | 13 +++++++------
> > >  1 file changed, 7 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
> > > index b19acd662726..f29052e6a87d 100644
> > > --- a/drivers/target/target_core_configfs.c
> > > +++ b/drivers/target/target_core_configfs.c
> > > @@ -108,8 +108,8 @@ static ssize_t target_core_item_dbroot_store(struct config_item *item,
> > >                                       const char *page, size_t count)
> > >  {
> > >       ssize_t read_bytes;
> > > -     struct file *fp;
> > >       ssize_t r = -EINVAL;
> > > +     struct path path = {};
> > >
> > >       mutex_lock(&target_devices_lock);
> > >       if (target_devices) {
> > > @@ -131,17 +131,18 @@ static ssize_t target_core_item_dbroot_store(struct config_item *item,
> > >               db_root_stage[read_bytes - 1] = '\0';
> > >
> > >       /* validate new db root before accepting it */
> > > -     fp = filp_open(db_root_stage, O_RDONLY, 0);
> > > -     if (IS_ERR(fp)) {
> > > +     r = kern_path(db_root_stage, LOOKUP_FOLLOW, &path);
> > > +     if (r) {
> > >               pr_err("db_root: cannot open: %s\n", db_root_stage);
> > >               goto unlock;
> > >       }
> > > -     if (!S_ISDIR(file_inode(fp)->i_mode)) {
> > > -             filp_close(fp, NULL);
> > > +     if (!d_is_dir(path.dentry)) {
> > > +             path_put(&path);
> > >               pr_err("db_root: not a directory: %s\n", db_root_stage);
> > > +             r = -ENOTDIR;
> > >               goto unlock;
> > >       }
> > > -     filp_close(fp, NULL);
> > > +     path_put(&path);
> > >
> > >       strscpy(db_root, db_root_stage);
> > >       pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
> > >
> > > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > > --
> > > 2.34.1
> > >
> 
> You missed the very significant thing in the commit message - that this
> lockdep warning is due to try to write its own filename to dbroot file:
> 
> 	db_root: not a directory: /sys/kernel/config/target/dbroot
> 
> That is why the semaphore is the same - it is of the same file.
> 
> Without that explanation nobody understands wheter it is a false positive or not.
> 
> The fix itself looks good.
> 
> Reviewed-by: Dmitry Bogdanov <d.bogdanov@yadro.com> 

Hello Dmitry,

Thanks a lot for the feedback! I missed out this curcial explanation in the
commit message. I will update the commit message and send a v2 patch for 
the same.

Best Regards,
Prithvi
