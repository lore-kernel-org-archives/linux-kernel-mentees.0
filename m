Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8029F2D24B3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 07:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762327676; cv=none; b=XNd6XMIykZ9WdnJ00rXfx6nU6OZ0guuS1/9Kt/3ebl3z9GeRzHbLiVLLEqHDmhEZRR+WoC0SlEeL5OM64jcp+7zziQ6kWO9WubnFpON9pLj2gfFPl5gV8lO+ea21QeRXL6/Xbg6+tDI6z5qmSzrch02scIQkk8OclbnU/IKouok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762327676; c=relaxed/simple;
	bh=EhjlRgr0Zz3gYIc8lUoq4HU98swwwkkjz5E00lxldWk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bV+wyBRXpnspurRpZo6XBoFS5oLJiIhIDuxWJx4kxTyeyqzP8Vnb2aUN1R1hWOxtFXYo9nJNz+Iw7sM4oisnsjwAZjnGQrnoc6JaOFtTN9Ed3z7yGfRKr35PdAtn9Lc11j7mZ6wRERs/9NMJDJNnyzffdk84klDRRN47LLzbHZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDwZRhO1; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDwZRhO1"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C99410F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 07:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jPODPTuT0mq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Nov 2025 07:27:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chao@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 50F8A41017
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50F8A41017
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EDwZRhO1
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 50F8A41017
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 07:27:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BEA5441F6;
	Wed,  5 Nov 2025 07:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4709CC4CEF8;
	Wed,  5 Nov 2025 07:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762327673;
	bh=EhjlRgr0Zz3gYIc8lUoq4HU98swwwkkjz5E00lxldWk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=EDwZRhO1fIvJOYYFu75knuac2cdZexAfjfMIpqAoj12aYTS5E121G2z5axjjFqYC4
	 I95IuKH9Af8ea9W5yVQlY8J376LJMoe8jBQ8VGRAD577bbni1QaSGZY8eq0rnirZjv
	 rxawhV8/DwUTtZLFfVlYbtlU/t3k8pso3s7NKn4eB0XNBrkM4JjN5VPYaul617iVHM
	 XalUcxnbIkEdgBTMBZP3nCmfFaJiQSTNOq0nq3UAeMTlP4KcBdM6/au/XlMfD8vPQR
	 YXRaQRnCibxr4Liy+88hZAzTNBRslXUXChgTh/3D5CWppXdWFeO8/UHVoLxn3XqRFw
	 u+2GGOzeNnYgQ==
Message-ID: <4de88613-54a2-4ef3-9b56-7963cd3e42e6@kernel.org>
Date: Wed, 5 Nov 2025 15:27:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org,
 syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 2/2] f2fs: Add sanity checks before unlinking and
 loading inodes
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1762184787.git.zlatistiv@gmail.com>
 <ef5cfc5cee26e34586e7415de41d865a360e0d98.1762184787.git.zlatistiv@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ef5cfc5cee26e34586e7415de41d865a360e0d98.1762184787.git.zlatistiv@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/25 16:46, Nikola Z. Ivanov wrote:
> Add check for inode->i_nlink == 1 for directories during unlink,
> as their value is decremented twice, which can trigger a warning in
> drop_nlink. In such case mark the filesystem as corrupted and return
> from the function call with the relevant failure return value.
> 
> Additionally add the check for i_nlink == 1 in
> sanity_check_inode in order to detect on-disk corruption early.
> 

Cc: stable@kernel.org

> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> Tested-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> ---
>  fs/f2fs/inode.c |  6 ++++++
>  fs/f2fs/namei.c | 15 +++++++++++----
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 8c4eafe9ffac..b808e1dc2ae7 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -294,6 +294,12 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
>  		return false;
>  	}
>  
> +	if (S_ISDIR(inode->i_mode) && unlikely(inode->i_nlink == 1)) {
> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",

s/F2FS_I_SB(inode)/sbi

> +			  __func__, inode->i_ino);
> +		return false;
> +	}
> +
>  	if (f2fs_has_extra_attr(inode)) {
>  		if (!f2fs_sb_has_extra_attr(sbi)) {
>  			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 40cf80fd9d9a..65af1d56a99e 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -572,10 +572,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>  	if (unlikely(inode->i_nlink == 0)) {
>  		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>  			  __func__, inode->i_ino);
> -		err = -EFSCORRUPTED;
> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> -		f2fs_folio_put(folio, false);
> -		goto out;
> +		goto corrupted;
> +	} else if (S_ISDIR(inode->i_mode) && unlikely(inode->i_nlink == 1)) {
> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",

Ditto,

> +			  __func__, inode->i_ino);
> +		goto corrupted;
>  	}
>  
>  	f2fs_balance_fs(sbi, true);
> @@ -601,6 +602,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>  
>  	if (IS_DIRSYNC(dir))
>  		f2fs_sync_fs(sbi->sb, 1);
> +
> +	goto out;
> +corrupted:
> +	err = -EFSCORRUPTED;
> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);

Ditto,

Thanks,

> +	f2fs_folio_put(folio, false);
>  out:
>  	trace_f2fs_unlink_exit(inode, err);
>  	return err;

