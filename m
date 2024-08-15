Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C6A79FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 00:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723683100; cv=none; b=VZtGE/OaCoLoD3V5O9/RpRgaG4IoyKqqT2a1p8l70sAEg0KqOSX7seIrCxMgi6jYJfHiDWMywScAlIIoOOwTO50p0u7z45qOVwnhRb76lJlhbnAr4TavvAFZ8Hm1c34w1FRNzvi6HWIzg7CTtzurnCHnXmkNxAQGKHHLzuodzF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723683100; c=relaxed/simple;
	bh=pPzJvLK4QhT/YIFBLvsdlqwEKbdcS1cslS2BGsUwV1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HROqYEWXBtCwS2WYuIAHqrjUACRji130PUAAxgHCIJs6pV+3dpIUg0nV/F1tiWXIJ1lsH15XiQihX7jJ1C5y7Yi+Tp8ZDWKR4/D8D8cMFOrUSCFc2VyHktzMOa3OUYYnZJwQLmCQbk4Sw5STZnL/6EYL/ZF84M67veYGfI9bnBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KH5ey9aW; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KH5ey9aW"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A6CC605F0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 00:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqzXpxPkLGV6 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Aug 2024 00:51:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=chao@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97C36605E1
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97C36605E1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KH5ey9aW
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 97C36605E1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 00:51:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98B5E61D24;
	Thu, 15 Aug 2024 00:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5707C116B1;
	Thu, 15 Aug 2024 00:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723683096;
	bh=pPzJvLK4QhT/YIFBLvsdlqwEKbdcS1cslS2BGsUwV1s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KH5ey9aWoFgXYB82sXPybGE6NIClJr9ElHCv5l24WRTZ3YVYYy96e8VsbXGuJVtNS
	 kgiAC4qX8TDB1+h0lf3sLhR1yfCmfruXlNUKkNCZbfSdSY+9f5E8TRHIb7+IKLnAhV
	 DnzwVHtNUFGfAJsZ98IMemn/qjBDwZUu2/sufX62z+Wr9rUTJFBqAhqrzcKJpWy2OI
	 /VgSotL9jOMeLAe44KmQlRntNetVTCdLATvBFtPGmUs+5lEYqUWuZyNFVbF6n5plLu
	 Rm+TibJtiX/HkR6nrM/crWXVD3fOX0yZZE3zqbz8NEv9vBJVJIK7tnKmoo8l4lWQov
	 QfnKpZhw/2Yyg==
Message-ID: <efcc15bf-0248-4690-b4d4-11022d12cffd@kernel.org>
Date: Thu, 15 Aug 2024 08:51:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] f2fs: fix unreleased reader lock on return
To: Diogo Jahchan Koike <djahchankoike@gmail.com>, jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+733300ca0a9baca7e245@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <20240814211640.167728-1-djahchankoike@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240814211640.167728-1-djahchankoike@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/8/15 5:16, Diogo Jahchan Koike wrote:
> fix reader lock unreleased in error path.

Thank you for catching this, if you don't mind, I'd like to merge it to
original patch, since it is still in dev-test branch.

Thanks,

> 
> Fixes: 374a8881ce4c ("f2fs: atomic: fix to forbid dio in atomic_file")
> Reported-by: syzbot+733300ca0a9baca7e245@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=733300ca0a9baca7e245
> Signed-off-by: Diogo Jahchan Koike <djahchankoike@gmail.com>
> ---
>   fs/f2fs/file.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 51f6ffd5f4e2..c9eda5dbd11f 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2172,6 +2172,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>   	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
>   	if (ret) {
>   		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> +		f2fs_up_write(&fi->i_gc_rwsem[READ]);
>   		goto out;
>   	}
>   
> @@ -2181,6 +2182,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>   		pinode = f2fs_iget(inode->i_sb, fi->i_pino);
>   		if (IS_ERR(pinode)) {
>   			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> +			f2fs_up_write(&fi->i_gc_rwsem[READ]);
>   			ret = PTR_ERR(pinode);
>   			goto out;
>   		}
> @@ -2189,6 +2191,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>   		iput(pinode);
>   		if (ret) {
>   			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> +			f2fs_up_write(&fi->i_gc_rwsem[READ]);
>   			goto out;
>   		}
>   
> @@ -2202,6 +2205,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>   		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
>   		if (ret) {
>   			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> +			f2fs_up_write(&fi->i_gc_rwsem[READ]);
>   			goto out;
>   		}
>   	}

