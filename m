Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6C7348451
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Oct 2025 19:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761246960; cv=none; b=K+AuAJu80jRVC1fiFJunjOLyrIjUgIvyxgvfJbMwZ/G0owp+JmFUS3+gvr2yjuam6+Fi3Der6y6GSs8jNm6v704+299R3LFNOkqU4iSMNH+HrvR/JGeQ447xlI1lM3QmXjhgpiEafy/0EUuLvMAYLFMg+K6MCVUFLoZWsVzRzX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761246960; c=relaxed/simple;
	bh=xDGtX73x7SGJPDCIn00jSf/iB9V1rtK1wRwkLEUHB2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LafeAbcOZAbBCqWFO59RNsRauQZt65v8KSOIQZAAO8m/O1XPEwp+uHy5LqLpv9ZdDaOI/SiZMHcuYDCE36IfBWOl9nlRhcaoKtoLf1xSsC2lqR1kfFkKVf+8QiPXfxAmIAQtnyWGeHdjnyLdjiWcwhHPENQ4LmHPiAokQPotmkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/pjuUev; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/pjuUev"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 998B084984
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Oct 2025 19:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXxMQ8-w7dXt for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Oct 2025 19:15:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49C088497B
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49C088497B
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M/pjuUev
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 49C088497B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Oct 2025 19:15:57 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b5c18993b73so215974366b.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Oct 2025 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761246955; x=1761851755; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz4tyMMkNrLPY/Q/KNDJCFpoha4YVqprZv6N7q9EjLU=;
        b=M/pjuUevXAZcmBZvdLdlG/5MVFWc3TYp9ROaYKrt42ClMvPY19ExKG4LlWmCERiHQY
         U/jqnjqUYqCBw4Yg9HLweoemkTme9csUeKnccEdjmlezb6rNrv04duQiBRSp2IrkXMmO
         5+V/Psj+5kGwNzNyxtfb0yNKZcTuHvM5ljxZ9mKcoTTlKGTLiXv3tUefHFHW4rkFgTf9
         yhaMomxQyCXA1TzYM0USE/cdgzgn3XgmXmGF/VOqfApVhup7JeWwHdIWWP0RxqNYE5DK
         elvktHlgNmyYntR/cCRXKPYgBCPZk6W8VZWD1EChBENr3fsdbXvoNeRVGqj7/t2Gztil
         Boyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761246955; x=1761851755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wz4tyMMkNrLPY/Q/KNDJCFpoha4YVqprZv6N7q9EjLU=;
        b=J7JyNNQHOWqZ+wDC9rGiutU3hW2r2T6CnAQEGgUtIg8sZhgR3YP53FRrSr2917Ryyj
         4dYeH07keqiv3yycImmCN/91f6JthBSS+F2efo1CsDWqIIAhgkJLPhS/SQ4qro2TPZq+
         y0C+Z6Vb/rpJ7t/2pqVi/3z6ivwHlpGzAfi84YsTHvZNClEXmoxm9PzB95/rj68U9kSp
         qm8YCpUGoUqmdOapkIolelDJ48pqveWIlLiaCatNeB6BYEpgVA8Nm5uhfmzOOgeccEf9
         wVN9WdX3eUbz2y3nAt7Xspx6jJkQWs5CcDxnP5SIV4QYxf8jQZAi0A9GI6lzBr7xRVjL
         tpjA==
X-Forwarded-Encrypted: i=1; AJvYcCUoxQwV5suQLtlzRR0NbUEZEWjni0Mi6qcwL4M0EwE8HIAjv0VDSEIUoMywI7sHDa7Sgurb/21Y1c2devgh0QOZIYFVQQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyK4Kj9BTu/eCnl01D5ThV7RyUS93cuO8aCcKfb6X0jwbnzohVH
	R/D63s2ia6dSbs7CR07gtQD0gx+RoFOzVSsUWSsIw89bspQ/T1Owdd1A
X-Gm-Gg: ASbGncugkVcNmrGCL6d04KHgFFLrcyyYZDjXXHqsRE1UJ5RruIEpIenD/gegUtKuyvB
	KGFStwp3PlkyuMdYPOaf/0iHQYr/utSxZ7YXxIJ8/ew8hNTNlytJTjmV2f+rEJAN4QCuoz6nBOg
	ld3KTUa9aG/sS82zPcC2Ro8JzTjkyIl2Gd3dnyt5IxasntgL7rPEFVGqK9ctPRTZyqTdwItaP+6
	8lPwzqOc3VkT3iq/b60aZ8N/NI5dymLDgJPOMdEbQ2R048rD0mveocP831AD7BQxmCpQxKPNzOM
	QPDW7RUt55lSSjVBqK4yAfBdi8U8K6gcfiuCRh8GJ9dwAaF5E86ZnMaTZF01XN260v2neqpvcS4
	ede6ZMeSC9M1iuAOvtuPbJIGAjoXj4jmoldO0+3NebByz+4r8IxxfWbznyLl676rk5xEkocvW7f
	vO/8vZUjC0r0U=
X-Google-Smtp-Source: AGHT+IFQ8zsmfxbVRlBQymGZwkPQggnvEm3GLl2aAuMqOaDpv1htIdjug4OIDiv0YEb5M676Erxv0A==
X-Received: by 2002:a17:907:6e87:b0:b3c:193:820e with SMTP id a640c23a62f3a-b6472c619c0mr3105635166b.13.1761246954536;
        Thu, 23 Oct 2025 12:15:54 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5147240csm285346166b.73.2025.10.23.12.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 12:15:54 -0700 (PDT)
Date: Thu, 23 Oct 2025 22:15:51 +0300
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org, 
	syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Subject: Re: [PATCH] f2fs: Perform sanity check before unlinking directory
 inode
Message-ID: <2pro6x6xdvfhaypqhddzlmitx2vo6h7ro5mcqcf5tc7ssvzdls@cge4oegdkf5t>
References: <20251003134731.470392-1-zlatistiv@gmail.com>
 <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>
 <gupgic53ouhmdwrglwdviw2mzeaqfjsvyr47u3ebu2ztayswy4@4oxvnu252rdb>
 <9d0fef9d-4093-4a80-af3f-6dc45ffe886c@kernel.org>
 <zomib7dzvmnggqqy6aqlwij3zihbvzkzrnfvzhk7tcp2mdgh34@tjjugevo4q4a>
 <235adbae-cc45-4b84-b712-1ba9e5a48dce@kernel.org>
 <wtrkydtrovhsw6azexwq576aoq36ut62y2elhzvsq3ansk477y@2rzc56l46pka>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wtrkydtrovhsw6azexwq576aoq36ut62y2elhzvsq3ansk477y@2rzc56l46pka>

On Wed, Oct 15, 2025 at 03:55:40PM +0300, Nikola Z. Ivanov wrote:
> On Wed, Oct 15, 2025 at 02:41:53PM +0800, Chao Yu wrote:
> > On 10/14/25 20:17, Nikola Z. Ivanov wrote:
> > > On Mon, Oct 13, 2025 at 08:53:04PM +0800, Chao Yu wrote:
> > >> On 10/13/25 05:19, Nikola Z. Ivanov wrote:
> > >>> On Thu, Oct 09, 2025 at 10:54:40AM +0800, Chao Yu wrote:
> > >>>> On 10/3/2025 9:47 PM, Nikola Z. Ivanov wrote:
> > >>>>> Current i_nlink corruption check does not take into account
> > >>>>> directory inodes which have one additional i_nlink for their "." entry.
> > >>>>>
> > >>>>> Add additional check and a common corruption path.
> > >>>>>
> > >>>>> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> > >>>>> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> > >>>>> Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
> > >>>>> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> > >>>>> ---
> > >>>>>   fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
> > >>>>>   1 file changed, 20 insertions(+), 8 deletions(-)
> > >>>>>
> > >>>>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> > >>>>> index b882771e4699..68b33e8089b0 100644
> > >>>>> --- a/fs/f2fs/namei.c
> > >>>>> +++ b/fs/f2fs/namei.c
> > >>>>> @@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> > >>>>>   		goto out;
> > >>>>>   	}
> > >>>>> -	if (inode->i_nlink == 0) {
> > >>>>> +	if (unlikely(inode->i_nlink == 0)) {
> > >>>>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> > >>>>>   			  __func__, inode->i_ino);
> > >>>>> -		err = -EFSCORRUPTED;
> > >>>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > >>>>> -		goto out_iput;
> > >>>>> +		goto corrupted;
> > >>>>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> > >>>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> > >>>>> +			  __func__, inode->i_ino);
> > >>>>> +		goto corrupted;
> > >>>>
> > >>>> Can we detect such corruption in sanity_check_inode() as well? So that if
> > >>>> f2fs internal flow calls f2fs_iget() on corrupted inode, we can set SBI_NEED_FSCK
> > >>>> flag and then triggering fsck repairment later.
> > >>>>
> > >>>> Thanks,
> > >>>>
> > >>>>>   	}
> > >>>>>   	if (IS_ENCRYPTED(dir) &&
> > >>>>> @@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> > >>>>>   	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
> > >>>>>   				ino, IS_ERR(new) ? PTR_ERR(new) : err);
> > >>>>>   	return new;
> > >>>>> +corrupted:
> > >>>>> +	err = -EFSCORRUPTED;
> > >>>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > >>>>>   out_iput:
> > >>>>>   	iput(inode);
> > >>>>>   out:
> > >>>>> @@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> > >>>>>   	if (unlikely(inode->i_nlink == 0)) {
> > >>>>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> > >>>>>   			  __func__, inode->i_ino);
> > >>>>> -		err = -EFSCORRUPTED;
> > >>>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > >>>>> -		f2fs_folio_put(folio, false);
> > >>>>> -		goto fail;
> > >>>>> +		goto corrupted;
> > >>>>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> > >>>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> > >>>>> +			  __func__, inode->i_ino);
> > >>>>> +		goto corrupted;
> > >>>>>   	}
> > >>>>>   	f2fs_balance_fs(sbi, true);
> > >>>>> @@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> > >>>>>   	if (IS_DIRSYNC(dir))
> > >>>>>   		f2fs_sync_fs(sbi->sb, 1);
> > >>>>> +
> > >>>>> +	goto fail;
> > >>>>> +corrupted:
> > >>>>> +	err = -EFSCORRUPTED;
> > >>>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > >>>>> +	f2fs_folio_put(folio, false);
> > >>>>>   fail:
> > >>>>>   	trace_f2fs_unlink_exit(inode, err);
> > >>>>>   	return err;
> > >>>>
> > >>>
> > >>> Hi Chao,
> > >>>
> > >>> Thank you for the suggestion.
> > >>> I will add this to sanity_check_inode and remove it
> > >>> from f2fs_lookup as it becomes redundant since f2fs_lookup
> > >>> obtains the inode through f2fs_iget. For f2fs_unlink I will
> > >>> move the i_nlink == 1 check to f2fs_rmdir.
> > >>
> > >> Hi Nikola,
> > >>
> > >> I meant we can move the i_nlink == 1 check from both f2fs_lookup() and
> > >> f2fs_unlink() to sanity_check_inode(), because before we create in-memory
> > >> inode, we will always call sanity_check_inode().
> > >>
> > >> Let me know if you have other concerns.
> > >>
> > >> Thanks,
> > >>
> > > 
> > > The issue here is that sanity_check_inode will be called only when 
> > > we initially read the inode off disk, not when it's already in the cache
> > > 
> > > The syzkaller repro does something like this:
> > > Creates a directory structure /dir1/dir2 where dir1 has
> > > i_nlink == 2, which is one less than it should. It then does
> > > rmdir(/dir1/dir2) followed by rmdir(/dir1) which leads to the warning.
> > 
> > Oh, I missed this case.
> > 
> > > 
> > > In such case what would you say should happen, should the second rmdir
> > > fail and report the corruption, or do we close our eyes and just drop
> > > i_nlink to 0 and possibly log a message that something isn't quite right?
> > 
> > I agreed that we should keep i_nlink == 1 check in f2fs_unlink().
> > 
> > Thanks,
> > 
> 
> Hi Chao,
> 
> Just to make sure we're on the same page, do you mean to keep the check 
> in f2fs_unlink as well as sanity_check_inode, or only do it in f2fs_unlink?
> 

Hello,

Kindly sending a reminder here, could you please
provide input when you have the chance?

Thank you!

> > > 
> > > Thank you,
> > > 
> > >>>
> > >>> I will send v2 as soon as I do some more testing.
> > >>
> > 
