Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E790A25DAEA
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 15 Jan 2026 03:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768447223; cv=none; b=rdIJ24V3ZdvYKfED3oZep/715BqNJtEjmkVXQOv//zhts1sL8PRcXDCoYSu6IB3tRWlv/z9vgTcPMxckdrvWgL4msZu1HxqhPIkPxH30CsydxNgzwQjcXhrR9gD+0Y5mzKH/khBHVoFMweh3KAKTGP8fTY655k3BA3ltQ/eK3SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768447223; c=relaxed/simple;
	bh=upkeY48wkxEI/Uops1fgvv5r4MWDRauu4M3UNZQqQZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMBF9Bf3UtF4RZWXDtVU0cPaY/iJ37uZJN/ez3TE4XZVsR4D1IYF0V1yzicBOFQ4aTOD/OWWOpXSkwbxOpMYtoOA8cKSoch+GcuhXOkKnV2B6S5iknj4KOGTZsCnpVt7o4RgTZtN2337ER679nuep2duC8/HW6yHvLN0PIucKMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGBfrGWA; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGBfrGWA"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81e821c3d4eso386845b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 14 Jan 2026 19:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768447220; x=1769052020; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Trq+zKapUs2OXgXptR+lx0STbGwE8yhsbG9H7N7gDZA=;
        b=HGBfrGWADlUuxI7BH4yjSVS9EzzPUq3vBFjIUE/FNPeI4Nu0/w+hpjMO3zXmSQlF79
         MTGAjZkBdKBrAUQKu1rT/yviBTg6gSWz4VqqpEcDI3LKekStZ70SWIwwBoPyh+be9AE6
         lns+tWuE1Qt2OR3oSFoMkOwQ4WGdXEqckdxFe9X/n0zXvsmhv0oQ/WYgQPbIyWMD1fAT
         Q33NEMnL/PTYaTSYyzg1AeSSGKP4FzpfQNr84KJ2tebXoCVUP8tQB9A4KiXDQ/nyMHfG
         /t7YyiwmO0uZcklBf4fM9Ee7T+Jssni4Bo9KQw80FkYcaB3fJMOZEp30fH332uKdsEV/
         4ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768447220; x=1769052020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Trq+zKapUs2OXgXptR+lx0STbGwE8yhsbG9H7N7gDZA=;
        b=m03O0eWLYDr7C5RN4NgPTXDd2HRwLISLwHlxVF+pkbvJz76KZpjKpnYlodxh3yae/n
         aLAuJwNGcrdr+Oc6oDWldJ7yG/sMgUMltj7gmpbBCOkpoYemrPDrUjm/qbk7biaF3uCH
         XKRVkEvNvRBUNlar3sxQ3VEw854HoEHs8rlqflXKhY6N5R3Qf5d6NXTRouIdJDJUOvG8
         KNxlE01Iwor5Q6QEZh6oiEw46C0excwQE/KhDL3ojIduNKDIUu9pY+9TEgOIpJ4ipImu
         wWssB/2MvToByZvOjgyS/a6ZYFpZEIV8k7RW4IZur+2RjgIqc7zPv/RgaWW0sP9WViPO
         uOTg==
X-Forwarded-Encrypted: i=1; AJvYcCW8+oiXFAQ7tUwYxkeURGVsJzIBcuPBg/x61K/ahW+hZ9gMjqdvfysr0PU07F+nfPXTFrBwMaLrPApbgFPqSmZ+i2Z2qw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOGHc8cKR8ks6mJxcKOIygMnEpUvYxRNl5QqW9WiB18hMDBuli
	4dWAG831PvM6wDFznFnpFXt/jZGyjihR+vVglpGU4f1Gfb2SHR4Dmgtp9S4c+Q==
X-Gm-Gg: AY/fxX65vz9iKi1KdKvZSRD6UBaS2oNaVqd7uLREnNrQBIoVLaSwLv7Mq51gcXv5UpA
	iHAiGdkvr/0yKCHsbmlO/jPVCJ23gp4UeGMW4LKVGBEZlgif2H0MLlbwKK4cv7QAYypMOKTbw2m
	UgZ0OSvO4MQIG2JheAh+BeIdIn5wH+abwdNgrKnibZ+8XHKZ6RDUhc1LZ3J5Usb6OFMjX3KqYJb
	7aKIgbmCrBhWFosfdWWB2BcXLuQRa+kR+5xtktc2JCu5vFbBl/qJ3X30hajz+sUD+cRS1juXjA1
	D2kxjtJMO59NA00LjxU5q3r1nQhlhpbPDhobAtcOQcNFC3n7wx4DG5FeobvoheEjE9uHyc4F7Dc
	OTOmyTCiGBEYNJiPgs55cFXVSuvxa0T2FEtpZuaU6Fk9kh8raSNYJoC/kEGI72BlHHx3cTvImlb
	AWLZ1knsVTOWc=
X-Received: by 2002:a05:6a00:a24c:b0:81f:4063:f1ef with SMTP id d2e1a72fcca58-81f83d5e4b5mr3914019b3a.54.1768447220095;
        Wed, 14 Jan 2026 19:20:20 -0800 (PST)
Received: from inspiron ([111.125.235.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e381d7csm963637b3a.0.2026.01.14.19.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 19:20:19 -0800 (PST)
Date: Thu, 15 Jan 2026 08:50:12 +0530
From: Prithvi <activprithvi@gmail.com>
To: martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org, hch@lst.de, jlbec@evilplan.org,
	linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org,
	syzbot+f6e8174215573a84b797@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] scsi: target: Fix recursive locking in
 __configfs_open_file()
Message-ID: <20260115032012.yb5ylmumcirrmsbr@inspiron>
References: <20260108191523.303114-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108191523.303114-1-activprithvi@gmail.com>

On Fri, Jan 09, 2026 at 12:45:23AM +0530, Prithvi Tambewagh wrote:
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
> Hence ultimately, __configfs_open_file() was called, indirectly by
> target_core_item_dbroot_store(), and it also attempted to acquire
> &p->frag_sem, which was already held by the same thread, acquired earlier
> in flush_write_buffer. This poses a possibility of recursive locking,
> which triggers the lockdep warning.
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

Just a gentle ping on this thread.

Thanks, 
Prithvi
