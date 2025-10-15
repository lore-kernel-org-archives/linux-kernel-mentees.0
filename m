Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A296231CA42
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Oct 2025 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760532950; cv=none; b=m6oLQz+8NONCQ9017Q4+17GoHe2y8C3GJ322Nam1iRNr9nmN1j3DV+JIj4TGYeSz3g9isMv8QfZnhE+7uit/wgaOO3EARJA/QMaczr/ot6OlSTzQdNr/sdAXrPfMDXtkCUvLAL78HzWvcyKauNBMdgOWxSXdceuqiPvqiGdAr8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760532950; c=relaxed/simple;
	bh=Uz9vn7rcmIwn6i0tqcTn5bYssbsKorpt5cvKeKxZkjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=li3Kfl9fdCXRGRoJ9CRpMx6deHvVWFmscOcODS28Ug1AWkRJI3YAv1A8im6bjXKtlog8YGDTQri1cac1DsM65cKBqe6B06Zmfaph82gp9+inEiHUCTpC8amZJovzJkg5KsqLUMiCZhQOwP1UcgcT2fZniTnq7S9wWGuYhqLWuVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcl43gbc; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcl43gbc"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8A841724
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Oct 2025 12:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XK_KCvwTKYmm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Oct 2025 12:55:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A33D416AA
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A33D416AA
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bcl43gbc
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1A33D416AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Oct 2025 12:55:45 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-63963066fb0so13564936a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Oct 2025 05:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760532944; x=1761137744; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPwsFmftjsCu1r4rEdgmSbyTSppcZYsUBCmBP/cNfX8=;
        b=bcl43gbcXBQbgFOEsiUAgBLZBG3laslIIqUH38hLPqgUJCrLyJP7louNLTrZRYzlUH
         kmSEnIiGTuuKxI+yaxfKobKQWs6hqHKHE4XRXsIVgU2SKDUbRXh9pnj4yyolHGPa4N3x
         VkyXh0bSfaVXrnvceXa4kahCpXncch3/qgsiglroCtrl/JlPDlRFd6BdwMmbgR9Ra0on
         DyZfejOiNl+fNSowSThADPQQbtorUHfQArI9lle9TRpznlodery6vdLBXVfaE49LQeTI
         6Mwers8k3Kt761ZVEs922b0pPRPElNV5humfHpKPBqo3BtsMZxvQeldkj3ofa/UDM0q5
         rTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760532944; x=1761137744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPwsFmftjsCu1r4rEdgmSbyTSppcZYsUBCmBP/cNfX8=;
        b=juYMxTchBthUBMRqvZkaULUSwtOdfIVWH/WMMWLV+QHAm/JR1/furtJlBZcvrmmxFx
         4zRxschcFP54J5ikKU64dV6i4JWNYe4AZD2cYzgC87hkhkrFlgo58tEDMnNFoiZN46Cp
         Vn/I7rzoqkFWTp8xEn8XV0gIyqDjIyCorZgr5L8wUU9/SRkOMR9/bJVnyMCJL0tFWxXN
         ZYHzKY93Spesic0skRqahsSs46UoZpdOW/jMXy9X7+yzZt8NPQIzSMc2trhcvvPXE2HJ
         JTiaiDiVumItgw+r5ZNTZZuAsmkbpzVT2SyVnByh5e6mMX7BrjHW5Bk1tgCSUf11EnGB
         osog==
X-Forwarded-Encrypted: i=1; AJvYcCWiW/YIuU+lzADvBgsPf483dGxnbh9Wq5NRAH75KP6AtcJxx9xl6JSnV1hpIC7dwzcWW6Tg2Livuny1S2uPuQYF/ZlbFA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyahTwFw+NnqcLp4nPk/OUmjmlXPXDl+lexDGTmM321StsuUiH4
	OSi2vm2WIH7rVf88X4EU16ay2KamEJ5zxuDwOnuIZjDuM9X90XHyFmMq
X-Gm-Gg: ASbGncsOrO2ctjohXd8Ai48hPyPt9oWTP5tBnCOqG/uI+5Msd5nBAGUjfEyLL0MKGOP
	8JDQwgna4dWuUOWDpCnlY+bxPIK9j08B+mMp2UrlvTgL1Wp7gGN0qezKPEC5KPfv/uwWpx+stRF
	fX3yjMVNKFhvXyED6Yz842MH5WpRgrL3pvtu7wG+ke7ApQnJrjo/yAbIFbYOttECKNKGvTVEuZD
	MeKajyryGrl5TkNXudVBC6TFXoT3nDJKMFzxgf0/Ubv99ZT512Zu3hoMQPYNJXYwNOE3FOMlTj6
	TP1iYhcwCS6daOa15HIuvh5YUKUWKEiHq7pGnt+JV+eDzMwJKIhSM69YB5uP3b5sKfk3mrH4rHf
	hFSWLC+3RqMzdwv2L/DaCaFhUBkqd+sFBW/QV4avl0SGclNmcJ2MBFL2nAUno9Q885131UDUC+L
	0sAQPOTv9ZwWRBeQTaFm4=
X-Google-Smtp-Source: AGHT+IFPmVnwrdUH0AaXcNBVVpT7odSzD/MA2yjUQqiuRk8y1WRUilesmSuJ2NFLYUJFWJPhPBgpHA==
X-Received: by 2002:a05:6402:5203:b0:62e:e722:a3c7 with SMTP id 4fb4d7f45d1cf-639d5b8b60emr26613009a12.9.1760532943620;
        Wed, 15 Oct 2025 05:55:43 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63be969163csm2115271a12.13.2025.10.15.05.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 05:55:43 -0700 (PDT)
Date: Wed, 15 Oct 2025 15:55:40 +0300
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org, 
	syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Subject: Re: [PATCH] f2fs: Perform sanity check before unlinking directory
 inode
Message-ID: <wtrkydtrovhsw6azexwq576aoq36ut62y2elhzvsq3ansk477y@2rzc56l46pka>
References: <20251003134731.470392-1-zlatistiv@gmail.com>
 <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>
 <gupgic53ouhmdwrglwdviw2mzeaqfjsvyr47u3ebu2ztayswy4@4oxvnu252rdb>
 <9d0fef9d-4093-4a80-af3f-6dc45ffe886c@kernel.org>
 <zomib7dzvmnggqqy6aqlwij3zihbvzkzrnfvzhk7tcp2mdgh34@tjjugevo4q4a>
 <235adbae-cc45-4b84-b712-1ba9e5a48dce@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <235adbae-cc45-4b84-b712-1ba9e5a48dce@kernel.org>

On Wed, Oct 15, 2025 at 02:41:53PM +0800, Chao Yu wrote:
> On 10/14/25 20:17, Nikola Z. Ivanov wrote:
> > On Mon, Oct 13, 2025 at 08:53:04PM +0800, Chao Yu wrote:
> >> On 10/13/25 05:19, Nikola Z. Ivanov wrote:
> >>> On Thu, Oct 09, 2025 at 10:54:40AM +0800, Chao Yu wrote:
> >>>> On 10/3/2025 9:47 PM, Nikola Z. Ivanov wrote:
> >>>>> Current i_nlink corruption check does not take into account
> >>>>> directory inodes which have one additional i_nlink for their "." entry.
> >>>>>
> >>>>> Add additional check and a common corruption path.
> >>>>>
> >>>>> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> >>>>> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> >>>>> Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
> >>>>> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> >>>>> ---
> >>>>>   fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
> >>>>>   1 file changed, 20 insertions(+), 8 deletions(-)
> >>>>>
> >>>>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> >>>>> index b882771e4699..68b33e8089b0 100644
> >>>>> --- a/fs/f2fs/namei.c
> >>>>> +++ b/fs/f2fs/namei.c
> >>>>> @@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> >>>>>   		goto out;
> >>>>>   	}
> >>>>> -	if (inode->i_nlink == 0) {
> >>>>> +	if (unlikely(inode->i_nlink == 0)) {
> >>>>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> >>>>>   			  __func__, inode->i_ino);
> >>>>> -		err = -EFSCORRUPTED;
> >>>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>>>> -		goto out_iput;
> >>>>> +		goto corrupted;
> >>>>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> >>>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> >>>>> +			  __func__, inode->i_ino);
> >>>>> +		goto corrupted;
> >>>>
> >>>> Can we detect such corruption in sanity_check_inode() as well? So that if
> >>>> f2fs internal flow calls f2fs_iget() on corrupted inode, we can set SBI_NEED_FSCK
> >>>> flag and then triggering fsck repairment later.
> >>>>
> >>>> Thanks,
> >>>>
> >>>>>   	}
> >>>>>   	if (IS_ENCRYPTED(dir) &&
> >>>>> @@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> >>>>>   	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
> >>>>>   				ino, IS_ERR(new) ? PTR_ERR(new) : err);
> >>>>>   	return new;
> >>>>> +corrupted:
> >>>>> +	err = -EFSCORRUPTED;
> >>>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>>>>   out_iput:
> >>>>>   	iput(inode);
> >>>>>   out:
> >>>>> @@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >>>>>   	if (unlikely(inode->i_nlink == 0)) {
> >>>>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> >>>>>   			  __func__, inode->i_ino);
> >>>>> -		err = -EFSCORRUPTED;
> >>>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>>>> -		f2fs_folio_put(folio, false);
> >>>>> -		goto fail;
> >>>>> +		goto corrupted;
> >>>>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> >>>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> >>>>> +			  __func__, inode->i_ino);
> >>>>> +		goto corrupted;
> >>>>>   	}
> >>>>>   	f2fs_balance_fs(sbi, true);
> >>>>> @@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >>>>>   	if (IS_DIRSYNC(dir))
> >>>>>   		f2fs_sync_fs(sbi->sb, 1);
> >>>>> +
> >>>>> +	goto fail;
> >>>>> +corrupted:
> >>>>> +	err = -EFSCORRUPTED;
> >>>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>>>> +	f2fs_folio_put(folio, false);
> >>>>>   fail:
> >>>>>   	trace_f2fs_unlink_exit(inode, err);
> >>>>>   	return err;
> >>>>
> >>>
> >>> Hi Chao,
> >>>
> >>> Thank you for the suggestion.
> >>> I will add this to sanity_check_inode and remove it
> >>> from f2fs_lookup as it becomes redundant since f2fs_lookup
> >>> obtains the inode through f2fs_iget. For f2fs_unlink I will
> >>> move the i_nlink == 1 check to f2fs_rmdir.
> >>
> >> Hi Nikola,
> >>
> >> I meant we can move the i_nlink == 1 check from both f2fs_lookup() and
> >> f2fs_unlink() to sanity_check_inode(), because before we create in-memory
> >> inode, we will always call sanity_check_inode().
> >>
> >> Let me know if you have other concerns.
> >>
> >> Thanks,
> >>
> > 
> > The issue here is that sanity_check_inode will be called only when 
> > we initially read the inode off disk, not when it's already in the cache
> > 
> > The syzkaller repro does something like this:
> > Creates a directory structure /dir1/dir2 where dir1 has
> > i_nlink == 2, which is one less than it should. It then does
> > rmdir(/dir1/dir2) followed by rmdir(/dir1) which leads to the warning.
> 
> Oh, I missed this case.
> 
> > 
> > In such case what would you say should happen, should the second rmdir
> > fail and report the corruption, or do we close our eyes and just drop
> > i_nlink to 0 and possibly log a message that something isn't quite right?
> 
> I agreed that we should keep i_nlink == 1 check in f2fs_unlink().
> 
> Thanks,
> 

Hi Chao,

Just to make sure we're on the same page, do you mean to keep the check 
in f2fs_unlink as well as sanity_check_inode, or only do it in f2fs_unlink?

> > 
> > Thank you,
> > 
> >>>
> >>> I will send v2 as soon as I do some more testing.
> >>
> 
