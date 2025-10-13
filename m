Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8AC28DB52
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Oct 2025 12:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760359994; cv=none; b=nFIvHmbmu7Xq0AORNf7YmDsMvBqdvW1KfsX4uFKi3wsjwe0Hb76O6L62suudSDNA2I+tat3+5J05vDUSBjh2X0e8WM+i8VX5AwDs5d82xNaetlvU8FZnE88TxcNGcTyQzylaTvVyMeeXLvfApG5A35uIn7SZnyNVbBTAO+J6PUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760359994; c=relaxed/simple;
	bh=QrfJt2hUMOOD+gjf01fYxogMQriU6KiB9/iGzz3A5eo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=N/0q0sDoZc3ncAzSSqAo8UFHFcDV7vVBvyr/JpepBAYgJAnkbrR/dhyXIFMyuZAywWSJRg9gey8yBVerXYk58o8JOE57mkLkWnEWwlQKvLICdaf79HpKCAeXJQEfKzouv7dViM/icIe7CyLgHdFZL4DsowCYEyMgi5NWcMGEO/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5G6+SKa; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5G6+SKa"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E80640891
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Oct 2025 12:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rpZBXWEf5nz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Oct 2025 12:53:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chao@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89CE640059
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89CE640059
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O5G6+SKa
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 89CE640059
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Oct 2025 12:53:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9990045312;
	Mon, 13 Oct 2025 12:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B590C4CEE7;
	Mon, 13 Oct 2025 12:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760359989;
	bh=QrfJt2hUMOOD+gjf01fYxogMQriU6KiB9/iGzz3A5eo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=O5G6+SKanFheTVhhE+NeS8tIo4vNAICs41T/v/LM0moYsBF5dCxC6lZ/k4VedORqe
	 uDuWtvh8BxrwZuEUb4qa59egVmQcTSFIarFOMePK9ZuzZT7TbWgcC+WLDnmLB3ogHl
	 LEFpkJ0bJ+JiwKQfaZI2lPxTAqf4I0YlANkFEMyu7vJ/aUfNjZJdkuZdv9SaEMDTwT
	 M3a6N7Ntf/uaCeib128QNXqJwqYo/grlDmLPo70/+QujHYLi3epUIGXJc2ZRqDN4gV
	 SygHaeJagr/v9PsqvUgV4MYUqjEjGUxUryFzO0i4qcYn2pxmAN49LdAqXcck84RIWM
	 qzBhQqxdfI8gg==
Message-ID: <9d0fef9d-4093-4a80-af3f-6dc45ffe886c@kernel.org>
Date: Mon, 13 Oct 2025 20:53:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org,
 syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Subject: Re: [PATCH] f2fs: Perform sanity check before unlinking directory
 inode
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
References: <20251003134731.470392-1-zlatistiv@gmail.com>
 <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>
 <gupgic53ouhmdwrglwdviw2mzeaqfjsvyr47u3ebu2ztayswy4@4oxvnu252rdb>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <gupgic53ouhmdwrglwdviw2mzeaqfjsvyr47u3ebu2ztayswy4@4oxvnu252rdb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/25 05:19, Nikola Z. Ivanov wrote:
> On Thu, Oct 09, 2025 at 10:54:40AM +0800, Chao Yu wrote:
>> On 10/3/2025 9:47 PM, Nikola Z. Ivanov wrote:
>>> Current i_nlink corruption check does not take into account
>>> directory inodes which have one additional i_nlink for their "." entry.
>>>
>>> Add additional check and a common corruption path.
>>>
>>> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
>>> Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
>>> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
>>> ---
>>>   fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
>>>   1 file changed, 20 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
>>> index b882771e4699..68b33e8089b0 100644
>>> --- a/fs/f2fs/namei.c
>>> +++ b/fs/f2fs/namei.c
>>> @@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>>>   		goto out;
>>>   	}
>>> -	if (inode->i_nlink == 0) {
>>> +	if (unlikely(inode->i_nlink == 0)) {
>>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>>>   			  __func__, inode->i_ino);
>>> -		err = -EFSCORRUPTED;
>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>>> -		goto out_iput;
>>> +		goto corrupted;
>>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
>>> +			  __func__, inode->i_ino);
>>> +		goto corrupted;
>>
>> Can we detect such corruption in sanity_check_inode() as well? So that if
>> f2fs internal flow calls f2fs_iget() on corrupted inode, we can set SBI_NEED_FSCK
>> flag and then triggering fsck repairment later.
>>
>> Thanks,
>>
>>>   	}
>>>   	if (IS_ENCRYPTED(dir) &&
>>> @@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>>>   	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
>>>   				ino, IS_ERR(new) ? PTR_ERR(new) : err);
>>>   	return new;
>>> +corrupted:
>>> +	err = -EFSCORRUPTED;
>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>>>   out_iput:
>>>   	iput(inode);
>>>   out:
>>> @@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>>>   	if (unlikely(inode->i_nlink == 0)) {
>>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>>>   			  __func__, inode->i_ino);
>>> -		err = -EFSCORRUPTED;
>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>>> -		f2fs_folio_put(folio, false);
>>> -		goto fail;
>>> +		goto corrupted;
>>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
>>> +			  __func__, inode->i_ino);
>>> +		goto corrupted;
>>>   	}
>>>   	f2fs_balance_fs(sbi, true);
>>> @@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>>>   	if (IS_DIRSYNC(dir))
>>>   		f2fs_sync_fs(sbi->sb, 1);
>>> +
>>> +	goto fail;
>>> +corrupted:
>>> +	err = -EFSCORRUPTED;
>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>>> +	f2fs_folio_put(folio, false);
>>>   fail:
>>>   	trace_f2fs_unlink_exit(inode, err);
>>>   	return err;
>>
> 
> Hi Chao,
> 
> Thank you for the suggestion.
> I will add this to sanity_check_inode and remove it
> from f2fs_lookup as it becomes redundant since f2fs_lookup
> obtains the inode through f2fs_iget. For f2fs_unlink I will
> move the i_nlink == 1 check to f2fs_rmdir.

Hi Nikola,

I meant we can move the i_nlink == 1 check from both f2fs_lookup() and
f2fs_unlink() to sanity_check_inode(), because before we create in-memory
inode, we will always call sanity_check_inode().

Let me know if you have other concerns.

Thanks,

> 
> I will send v2 as soon as I do some more testing.

