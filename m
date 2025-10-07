Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8589D246BC6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 23:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759878486; cv=none; b=PuZmQAu6Dxir1WhMqct31dj/4V86hsCjNX8+ONErhdZG34Crd5Fg0RypwR3agnLdgsUs47mEKBcppZxIIc/cGjan3BCRg3fu0NmTV8/WSGiuckXxAAiFfkaUMybZHMcVKPz/8RmzWWhKhUz1UreElXrUtG+NsZAQ+OLhiIg6I4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759878486; c=relaxed/simple;
	bh=4VN9EjJQI+s1niCEU3WXu+PksQUSryrEEQdwBD01R2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3Xyo09Z+hOyAtjynp3/nikrCAoJlcjRmu/NxIw6xEqi3+s4afSk5O3643PICj/U1HI4FYxwpiKve5EA1BGxg1MfBRI37cmdRekhBkYEswreBksoVntK3fbnVjpTNqTx0D16sw6MoWPIoAHD4FQQ9H3B+lG6qkkhW3H1MmvZ3c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WMuN154G; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WMuN154G"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00DB48134A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 23:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giw4OYTRtrHE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Oct 2025 23:08:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0384E81347
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0384E81347
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=WMuN154G
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0384E81347
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 23:08:02 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-42f6e0bdcf7so24936015ab.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Oct 2025 16:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759878482; x=1760483282; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5zlLF1sF2xA95fa6DO/8tik1XHN3dPL/MPmyceygSHI=;
        b=WMuN154GZ2IHlGok3OkoJowKlDyBEXoKaZfLqHFmdwGnk5kDY4GJQGrS9MrVa8GrVR
         ckHCw5DT9kkL950doUc+Ph3YDw0brU3wQC95dvGUoVAjRZ/W4Fhz8Hj9Tt9wcI2lw8id
         Ap1hDQA1IIPJAMouNNV6+1g8y4PmMnDdM/kLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759878482; x=1760483282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zlLF1sF2xA95fa6DO/8tik1XHN3dPL/MPmyceygSHI=;
        b=Rd33lYQiJsjgNFh8OAaCVh22b9sI/nQnPfIYQ9cQWmPQkJ6AVrxS4jWJ3P0oIQPAXd
         TfwEFKbE7j+D/1MS3rDfVxGc+WtGhhjABqhk04GqCHcAK//tEM4HZ0QaPQzzci2BjA23
         qnJ6kznBT7e1EKcpZ5hfW7y7z8wisZZW46lj0o8v88AnWUbE6fu/rM7pEx09jQFOpjiV
         9jCG/I05q5pjYG5up6RVItfBb7dx0+9fqnGLajNTjgzJh75FdmLciDY3s6TwgnO+qc6w
         WsmEF46wXh87CWEEXoPHJJzJV0+DS7mCiFMSy8+0yhgspP7WQA0kMuJfLAYI1E6yevEJ
         4LwA==
X-Forwarded-Encrypted: i=1; AJvYcCU93+gYPJcnHlnJI6Giu8aq5eGsywVZkf6uk4fgi5iwd2PGR7tOHTuzyQhVcA8spsLCNc0r8sY+HwmecZ9B6W/TTHR79g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwB1/ZI9zmuzlFrJYgkfe0aDI3d5wtiwzmXMigc69oHBAIgymKV
	O2idQM3eYxD50XjqjlimsjE6D1wmKHdTW5+YDWDawCP1SQmvmW70MWJde6ZtmpBu+/lc9A==
X-Gm-Gg: ASbGncsgmtHUv2LUJKjIP4ktspHol0mMbqHIib9vPkWsSssayPrwMJTdR/EshQ7WQch
	VykHU02S8njykrcxa/DFUTXEG1HiRadJYgvTKXAI2bNawvdvSqLdn/WM6HW4rorjnzJtp9OYG+Y
	3yH7w6kfRDPFyIKRerjjXkJJDgHwt8cm3GPMYYFaQHfYpaVTZlrGPEhc0vP4DUUidxxa5hj0OlC
	mqV+xUvArMNlEQGzG5PS9bUjWlljkLaghuFTrBTG/Z/AZkUR7Gz8dx1qKJbgnMU7+W0SS6JdHAQ
	/gHy/qo54h3MIKOhvztvDmfgw/R8z537GhdjUpBc21ivkuC2DAaH03Jq8gBHH2Gs6n90ocgi8zt
	B9ykko5Clv2T7FXroCTxgaRrX6caEA65EdEA2ea6RIiSeCbcyiA7rFzykIJM=
X-Google-Smtp-Source: AGHT+IEtLhevApkwpIKEq7+fQ8je8BxgSHsqBpZsQ2zLcnvaHNcZe5ZzCLwO2QkGpik5nYtNYr2I2A==
X-Received: by 2002:a05:6e02:2785:b0:42d:8bf8:967 with SMTP id e9e14a558f8ab-42f8735b606mr12490955ab.13.1759878481614;
        Tue, 07 Oct 2025 16:08:01 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42d8b281664sm70947345ab.25.2025.10.07.16.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 16:08:00 -0700 (PDT)
Message-ID: <efdafa7a-3d24-4a44-ae40-4057b0a8bc51@linuxfoundation.org>
Date: Tue, 7 Oct 2025 17:08:00 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] f2fs: Perform sanity check before unlinking directory
 inode
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, jaegeuk@kernel.org,
 chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org,
 syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20251003134731.470392-1-zlatistiv@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20251003134731.470392-1-zlatistiv@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/25 07:47, Nikola Z. Ivanov wrote:
> Current i_nlink corruption check does not take into account
> directory inodes which have one additional i_nlink for their "." entry.
> 
> Add additional check and a common corruption path.

How does this change fix the problem? What is common corruption
path in this context?

> 
> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>

How did you test this patch? Can add details?

> ---
>   fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
>   1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index b882771e4699..68b33e8089b0 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>   		goto out;
>   	}
>   
> -	if (inode->i_nlink == 0) {
> +	if (unlikely(inode->i_nlink == 0)) {
>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>   			  __func__, inode->i_ino);
> -		err = -EFSCORRUPTED;
> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> -		goto out_iput;
> +		goto corrupted;
> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> +			  __func__, inode->i_ino);
> +		goto corrupted;
>   	}
>   
>   	if (IS_ENCRYPTED(dir) &&
> @@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>   	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
>   				ino, IS_ERR(new) ? PTR_ERR(new) : err);
>   	return new;
> +corrupted:
> +	err = -EFSCORRUPTED;
> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>   out_iput:
>   	iput(inode);
>   out:
> @@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>   	if (unlikely(inode->i_nlink == 0)) {
>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>   			  __func__, inode->i_ino);
> -		err = -EFSCORRUPTED;
> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> -		f2fs_folio_put(folio, false);
> -		goto fail;
> +		goto corrupted;
> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> +			  __func__, inode->i_ino);
> +		goto corrupted;
>   	}
>   
>   	f2fs_balance_fs(sbi, true);
> @@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>   
>   	if (IS_DIRSYNC(dir))
>   		f2fs_sync_fs(sbi->sb, 1);
> +
> +	goto fail;
> +corrupted:
> +	err = -EFSCORRUPTED;
> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> +	f2fs_folio_put(folio, false);
>   fail:
>   	trace_f2fs_unlink_exit(inode, err);
>   	return err;

