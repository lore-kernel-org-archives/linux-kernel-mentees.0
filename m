Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D415915D1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 02:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759978485; cv=none; b=hpYNXkP5sgtsJNaABnNxfBHjpYXmwwN1QaocWyZHnUe8Zx2aAvPb6kobsP6OI+ZxY+mfQ7HjEnvMswqOqtKMw4AzO0UodE0Gj0jOK8Nwd1ZtGHxEDPIEAM76cfdY1omWBKRgZrJvQzHH0ffpT7Muk/Q4AnaYM7wW/VoCGbJBDek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759978485; c=relaxed/simple;
	bh=kU5PxDxBp1d0PsDmsVzbq+Nz2rncNHm3ujLYt76sjLY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kPGfZSWCkLT9i2hQ5Jv42jcpzDOB/QgnliJES//U2mnRu4au3rJMru91LhoBs8mjNLcr9kFQQUQ2A3Zz4myQFwcKIUTCFgNTV94gBYrNFqWmVhzv7lRtS0TVFQE68DXkJb3vQ1at6sW3Jv9Ai1eSBw9zaKPzsE99gC5AkNKdFak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2YBtp+H; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2YBtp+H"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B5C160F12
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 02:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5ZdCsV_YQFu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Oct 2025 02:54:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chao@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08BEF60F13
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08BEF60F13
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F2YBtp+H
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 08BEF60F13
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 02:54:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F360604B9;
	Thu,  9 Oct 2025 02:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C88C4CEE7;
	Thu,  9 Oct 2025 02:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759978479;
	bh=kU5PxDxBp1d0PsDmsVzbq+Nz2rncNHm3ujLYt76sjLY=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=F2YBtp+Hr7oeHB53LuWJDS2ZGtvsB+33yOPbkCZnPdlGUCr+7nl13LNGL7JLJrANq
	 /HN03mDlHraJQe0zByt9dNNuT/AhAw3P9ekE+/bTkWCXcehaHinwvM8WrS9Ys1SfRy
	 VAGQhlYRXyuSJ6xtbLxU8OYlpw56DWeIl8YR2hv8Qp5CAx6kCQih6Vm6jSUwJi+vLB
	 9Tk5fF3JLFXzHNtf1CZI8YRguU/Giyl3RSvCRHBV8LOy372zE6ZP3vTLeIfxIasnHP
	 6pXWuimXc/i41MG2V6mtvKiRlsLuj+A86EcxPoB33DDYFkOzeevSunBV3aOWIieW5t
	 X6i8b6fMugG0g==
Message-ID: <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>
Date: Thu, 9 Oct 2025 10:54:40 +0800
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
Subject: Re: [PATCH] f2fs: Perform sanity check before unlinking directory
 inode
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20251003134731.470392-1-zlatistiv@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20251003134731.470392-1-zlatistiv@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/2025 9:47 PM, Nikola Z. Ivanov wrote:
> Current i_nlink corruption check does not take into account
> directory inodes which have one additional i_nlink for their "." entry.
> 
> Add additional check and a common corruption path.
> 
> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
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

Can we detect such corruption in sanity_check_inode() as well? So that if
f2fs internal flow calls f2fs_iget() on corrupted inode, we can set SBI_NEED_FSCK
flag and then triggering fsck repairment later.

Thanks,

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

