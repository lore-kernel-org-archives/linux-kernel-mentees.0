Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F43433EB0D
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 29 Jan 2026 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769694593; cv=none; b=JVKlfhoLfoeH7IeeZhByTmF7Vom39OeknRKKZKHcd7eRD1j5NtTGyg+OL0ymzZ0BoHQXb88XYMXDTM2+pL8OmozQnnmSxOhGr4qVz9O63utj8npA/7vK6qo6c15EOnn3f8/WD3gBm/GsbaO1sqOm4Yq9Ejs6GArAj1pQ/OTp5cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769694593; c=relaxed/simple;
	bh=2xZSRJHHmdboCugVEUKL+Afar9NGlC9UFADcCPB8rOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZPcq3j0XUPjnbsnu7rNaKU6VQyRcJAtd4cjoIrVyXJVpc0swEcHQ9RI6YqmRqImrzYOKxsWo8I99Vlowxs8E8VGpf86vpwv+7DktqrebBBlCUy/m4LXRQ20sqbJXxMoEj3wdjrbGoy68ztNQQwN137r/cOpmvlLJbn+7+Xl0cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jd0Iqbtn; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jd0Iqbtn"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81f4ba336b4so855447b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 29 Jan 2026 05:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769694591; x=1770299391; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qa6Pc/7YQxTkk1AR/CK47HEuWzh3zruMmwF2wm/H0lA=;
        b=jd0IqbtnhsqCdUP+lToC2uR3EwWG2Bw/lGKi5p+Y7dJgyoGHOzpDb7cEzLw2tG6MhV
         e94Orjf977p+ZWtlKyeVoStZL245sVT6iXzg3UzhYouECUZnuRT4+nYcUwn+tHFOH+1o
         uW7SBF3ahljw6QvPgq/9PvQ8AlG0lLg1EGKvmzYt1VwUA9XSFBrb4Tm7s0plTaU4Bpgm
         gpyibepQWjI28MebRgujP1nQVqYJDuFU7U816+yfKIKGhXDuXHHHDPny0cLGuNWf3Up7
         WGdoKF6fgu/nNcEkqvoBwRBQWQm/V8qGn8mQ+moIFMcHAxJaZ3XTSd7hdNON0cKajolA
         xIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769694591; x=1770299391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qa6Pc/7YQxTkk1AR/CK47HEuWzh3zruMmwF2wm/H0lA=;
        b=rfmb/94obhRiVN6DT6uFBzHif1afQHh+gHSGyypsg1kT+PGSejj4dDDZ/gtIYqx8Cr
         crwYnr+mknACAyDcPo77P5BSKjDhoZ93KF6ze/Pa0JJVbOffTR1Y5Z3WHu+pREG8SacE
         ADHbbbgmTZNPclmYVyXiRljoaTyVB/KAsIY0QO1yckZKeWG9RfuXUdALdblfyr/pNcUT
         H7ApLwR6s9rMwmBubJleqgmXUzQmBMLyO9QGrsXTjKY6xDniIV3b/tjTn8dA00VbKWYG
         +9FZzc989LXRek/ll8zRvCESsvWctqp8SCVETwPK7U4E4Koq0b2o7RiuXXq46995SlX0
         4GlA==
X-Forwarded-Encrypted: i=1; AJvYcCV0x2sTiP+mwYGOrZ96xCDskyrRUKo76G0GOaTsJqYE01EiUiRm3TOG3jkAz4Jm0PwFn3tcfaXzgbHwjf0d6Fs6HXwbkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9/2HAOZwk4nC/Y7rExm+3grA9Je2U6KU6Qx1qXTV0iGoitR25
	TZIcaf1ZPQIqHK4O33cy6quWGcCJHZE1iKuOy22nePDgQZNmY+Zug4bp
X-Gm-Gg: AZuq6aLDWjKUtbpC98P1Fk1MXopiZcdEkJdD2qli7e1M+INmuhDkrAvlg91PN2Tmwwq
	k/5IpeIT4639GbYvk9AMZMD/kK4pRm7nSPwOimUIJHfempjfB6pFKCh17iulf/gO8n1C7mM12x5
	LcDIP4/jJf1F+EmeFmw/2gdUvEmPlAhb00OgCbVN4YmqHiHz6LAyuhhhUcJs2idcO0KsKBxqetj
	Ktst2ZgQoMdr2n82A2/tBy3zpCdWoMsrzJC+i6Ii6r3NoI2yba7KFsPrpB/kSAfBpu3FpoJABfa
	cYPbtwZH2iA8HtlrPZAxwMc76wywBxXIWLLMii+xObdZHRz5b9eTAUjshMrCR0bNsy6O5RWnydE
	lnnhPBIRkqITvAjMJBu90dRlzrvWU8zEDuY05wn/P+650ebi3zyy3K9DNhX+oaBwM9BT0fuho3G
	jgfRhMS0Me+Mk=
X-Received: by 2002:a05:6a21:6009:b0:350:3436:68de with SMTP id adf61e73a8af0-38ec6583a23mr8026625637.53.1769694590569;
        Thu, 29 Jan 2026 05:49:50 -0800 (PST)
Received: from inspiron ([111.125.210.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eef44sm53768715ad.11.2026.01.29.05.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 05:49:50 -0800 (PST)
Date: Thu, 29 Jan 2026 19:19:42 +0530
From: Prithvi <activprithvi@gmail.com>
To: martin.petersen@oracle.com, d.bogdanov@yadro.com, bvanassche@acm.org
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org,
	syzbot+f6e8174215573a84b797@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] scsi: target: fix recursive locking in
 __configfs_open_file()
Message-ID: <20260129134942.nooyuvarh6vr32eu@inspiron>
References: <20260122154051.64132-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122154051.64132-1-activprithvi@gmail.com>

On Thu, Jan 22, 2026 at 09:10:51PM +0530, Prithvi Tambewagh wrote:
> In flush_write_buffer, &p->frag_sem is acquired and then the loaded store
> function is called, which, here, is target_core_item_dbroot_store().
> This function called filp_open(), following which these functions were
> called (in reverse order), according to the call trace:
> 
> down_read
> __configfs_open_file
> do_dentry_open
> vfs_open
> do_open
> path_openat
> do_filp_open
> file_open_name
> filp_open
> target_core_item_dbroot_store
> flush_write_buffer
> configfs_write_iter
> 
> target_core_item_dbroot_store() tries to validate the new file path by
> trying to open the file path provided to it; however, in this case,
> the bug report shows:
> 
> db_root: not a directory: /sys/kernel/config/target/dbroot
> 
> indicating that the same configfs file was tried to be opened, on which
> it is currently working on. Thus, it is trying to acquire frag_sem
> semaphore of the same file of which it already holds the semaphore obtained
> in flush_write_buffer(), leading to acquiring the semaphore in a nested
> manner and a possibility of recursive locking.
> 
> Fix this by modifying target_core_item_dbroot_store() to use kern_path()
> instead of filp_open() to avoid opening the file using filesystem-specific
> function __configfs_open_file(), and further modifying it to make this
> fix compatible.
> 
> Reported-by: syzbot+f6e8174215573a84b797@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=f6e8174215573a84b797
> Tested-by: syzbot+f6e8174215573a84b797@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> ---
> Changes since v1:
>  - Update commit message to reflect the fact that same file, which code was 
>    currently operating on, was tried to be opened again, leading to 
>    acquiring the same semaphore in nested manner & possibility of recursive
>    locking.
> 
> v1 link: https://lore.kernel.org/all/20260108191523.303114-1-activprithvi@gmail.com/T/ 
> 
>  drivers/target/target_core_configfs.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
> index b19acd662726..f29052e6a87d 100644
> --- a/drivers/target/target_core_configfs.c
> +++ b/drivers/target/target_core_configfs.c
> @@ -108,8 +108,8 @@ static ssize_t target_core_item_dbroot_store(struct config_item *item,
>  					const char *page, size_t count)
>  {
>  	ssize_t read_bytes;
> -	struct file *fp;
>  	ssize_t r = -EINVAL;
> +	struct path path = {};
>  
>  	mutex_lock(&target_devices_lock);
>  	if (target_devices) {
> @@ -131,17 +131,18 @@ static ssize_t target_core_item_dbroot_store(struct config_item *item,
>  		db_root_stage[read_bytes - 1] = '\0';
>  
>  	/* validate new db root before accepting it */
> -	fp = filp_open(db_root_stage, O_RDONLY, 0);
> -	if (IS_ERR(fp)) {
> +	r = kern_path(db_root_stage, LOOKUP_FOLLOW, &path);
> +	if (r) {
>  		pr_err("db_root: cannot open: %s\n", db_root_stage);
>  		goto unlock;
>  	}
> -	if (!S_ISDIR(file_inode(fp)->i_mode)) {
> -		filp_close(fp, NULL);
> +	if (!d_is_dir(path.dentry)) {
> +		path_put(&path);
>  		pr_err("db_root: not a directory: %s\n", db_root_stage);
> +		r = -ENOTDIR;
>  		goto unlock;
>  	}
> -	filp_close(fp, NULL);
> +	path_put(&path);
>  
>  	strscpy(db_root, db_root_stage);
>  	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
> 
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> -- 
> 2.34.1
> 

Hello all,

Just a gentle ping on this thread

Thanks,
Prithvi
