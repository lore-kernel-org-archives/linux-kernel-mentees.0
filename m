Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED82928725C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  3 Nov 2025 02:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762137325; cv=none; b=fpYsOUpHeRJyXIZyFZPIQrs2VQItcnGtRw4wejSw7vccvZv1rx2l3BKdBCa3pQPU0nt4+mxEwvczRmVxTJhiSHy9mJSyzh2DY+/iZ8ycn+wTzdF71XM9DhozLI/4hARbWksVkCOFphgjXQFZvvLE2s59FwGepjLCOCq0d4aBsg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762137325; c=relaxed/simple;
	bh=Po4FITX4drt+WLGHqKt44ddsd+cJ95meWgcRiywsgWI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ICbI6U/ofPgy7yB8+kMSbf+S9Mxcci0CP2b//JqyNkZpjhmXMtcHXt6RC16CuCPH4FSdDtv0sG6CqqYDRFK02ggxGlyarzL5rJ2PB5euxW8sFMtESsarftQIS66Bg8E7LxipSywW6dTHSY2Bq/Z8ankaltoMoXAkHcZ+eJYKNLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRIHBj45; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRIHBj45"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A3674132C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  3 Nov 2025 02:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXrVX4M8g8gK for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Nov 2025 02:35:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chao@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 951FF4129A
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 951FF4129A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DRIHBj45
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 951FF4129A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  3 Nov 2025 02:35:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1AC8419E6;
	Mon,  3 Nov 2025 02:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C65C4CEF7;
	Mon,  3 Nov 2025 02:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762137321;
	bh=Po4FITX4drt+WLGHqKt44ddsd+cJ95meWgcRiywsgWI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=DRIHBj45SABwSm7nwmUPGcarQCoImukTtihhrTOlN0GxOb5ugziEHQIBW08lK7/3e
	 pPmKR5koEcyIlpD/luPAhyXTUhG4Gxx60kS4TnNHQrNynJ2vmc8Y6qRaWZ7GK/wGSR
	 Tb7BkHsCqQtwne2k4McY/9c0vYiDMXvwsh6wYwulir4II4U9TlmofcKNM4x8Dzi6Uc
	 MU38ocx8yNVBXw1YAHsvHV5eF6myK0ukRKv36E9EdF1ESD2lljE6WrWz8QK8J7Ko6b
	 BePDcVrp/Lvo0JP/IcpcASn3LpIPFNL0VtBu5fcdaRJSDq3jiN7W/E/bcL0XfD8m8V
	 T+g/LSC4L3AxQ==
Message-ID: <ea38e464-a28a-4b06-8046-5b62f7172875@kernel.org>
Date: Mon, 3 Nov 2025 10:35:17 +0800
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
Subject: Re: [PATCH v2 2/2] f2fs: Add sanity checks before unlinking and
 loading inodes
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1761993022.git.zlatistiv@gmail.com>
 <55522ef8f3424e563ff18a720c709dcb065091af.1761993022.git.zlatistiv@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <55522ef8f3424e563ff18a720c709dcb065091af.1761993022.git.zlatistiv@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/1/25 20:56, Nikola Z. Ivanov wrote:
> Add check for inode->i_nlink == 1 for directories during unlink,
> as their value is decremented twice, which can trigger a warning in
> drop_nlink. In such case mark the filesystem as corrupted and return
> from the function call with the relevant failure return value.
> 
> Additionally add the 2 checks for i_nlink == 0 and i_nlink == 1 in
> sanity_check_inode in order to detect on-disk corruption early.
> 
> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> Tested-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> ---
>  fs/f2fs/inode.c | 10 ++++++++++
>  fs/f2fs/namei.c | 15 +++++++++++----
>  2 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 8c4eafe9ffac..089cbf3646f0 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -294,6 +294,16 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
>  		return false;
>  	}
>  
> +	if (unlikely(inode->i_nlink == 0)) {

This is a possible case, as an orphan inode may exist in filesystem after sudden
power-cut.

Thanks,

> +		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> +			  __func__, inode->i_ino);
> +		return false;
> +	} else if (S_ISDIR(inode->i_mode) && inode->i_nlink == 1) {
> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> +			  __func__, inode->i_ino);
> +		return false;
> +	}
> +
>  	if (f2fs_has_extra_attr(inode)) {
>  		if (!f2fs_sb_has_extra_attr(sbi)) {
>  			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 40cf80fd9d9a..d13077bad482 100644
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
> +	} else if (S_ISDIR(inode->i_mode) && inode->i_nlink == 1) {
> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
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
> +	f2fs_folio_put(folio, false);
>  out:
>  	trace_f2fs_unlink_exit(inode, err);
>  	return err;

