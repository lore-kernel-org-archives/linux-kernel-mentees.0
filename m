Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7683923313E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760303951; cv=none; b=OswvLgeT/Ar9MYMtbsIAm7I0eiKzJm0BEH/SP7th4tYNfAdTgDo4O84OsBztd+Avi9aHkKY4sm+bMiFD3SbBwIfCdRsvCusR8g7+Rc2+vEpSiH62bQ3ymZrh2fBJPh9E+RNGlww5I5tOTvHRTwgiXm5ZicXRkq7qWv/SUgrSngY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760303951; c=relaxed/simple;
	bh=Ghk3kWF8dNB1V0k0mDvpg3iN0UslD0y9riOY5veE2rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYE3UKNx9+FX97/xv9ROfuKFWKue0NyV5/azlHLdsdim08O0SkrHHdvHfEwDWAeMY67eQTfreaxDy1XC3TE8dNdc/42AzE9K2Q5c8jUfQvP54uWAybMhLsowioGr7yIgX+MsKPb3gY7I/oWWyqNkB92QMzzbAA1cjb0a9kxMX/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6eG7ifg; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6eG7ifg"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0764A40F5F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 21:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZgdRz2SJGz8 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Oct 2025 21:19:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF36740F62
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF36740F62
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J6eG7ifg
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DF36740F62
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 21:19:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so2612248f8f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 14:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760303947; x=1760908747; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Adu93qTTKDS0Ch74HcJDA+rP49HUSyI6PQ01hbqUFWo=;
        b=J6eG7ifgZTKoDsD2EBfvDAu064aolQ5l/PbuqMJ76qGrcwhkg81qccOzZPhfF/VTxE
         I3FAW2hIi6+F5KCMhDfnacEgTBLFwplxbbUaC1qW4X4WHZyTHcxlHiQVLNeuZTvD7Vyb
         XyjrRH6A+2Aklf6EBCLLcBDuNpg3Q+RtDj36zx6/M1i8qQL9TxMyfM928gwcP1T6M3QW
         ZWOoEIifxtpm/c/e3cnnVfcf7GE1zhmzR0emKnUyu1o83K8CaYi6EdMChAQb3JS9pF4z
         cGK1qkAqThQ1u0OlBfP49RNrpoBf/kmRw/Dq8Mvo5gEHqg//31LqzLNKsk8+156diXgl
         EiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760303947; x=1760908747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Adu93qTTKDS0Ch74HcJDA+rP49HUSyI6PQ01hbqUFWo=;
        b=qKOnfcZylwh1nnRAPGr2sdlt34lHlg9XiBWvbcatSvDrtODhbyJ5SoIBfiqRfeV03q
         h45Ug7PH7glcfqF7I27LhQZzdEDlRIpqmw0YTFOSAFQTJ+uv7E4OwNxD9eQA802nkq7p
         6L3tOvYCwmDAs7Sk3qmM1W684+y2GxFsDQpqIdZdgtYXia/jxef9mKT6/l4p3NCRNMBT
         IcJqGo4srgM5DqBMGzMSlHC2zmeNou0OER2LXi3/gyLhUfvjfgWf/P7sW6T9X+r17MFG
         fMGn//DH28TD9prCPrBIr80Pq/YLzfEELf4C8lq1dDrWm6cQc5+fvWk70AM6ptO756pz
         0cAA==
X-Forwarded-Encrypted: i=1; AJvYcCUIx3bYuPCYXD2vsgOoPZh09geQwF+tN6yBDUTBF7EIv+0HYQs19MlpWO6AsCrQDBe6T+s38jVwpT0l7b8LaNCoIZ7KQg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxEogtkH5wII/09FVHuos67bC9GLPEvzOY0kkXp/cKPUZ6ZOyQa
	E4b2O30mrCeHFfSQqX8MgnYuyohU9Vv7ZdobyuTnVHLN83z05UJZLVT3
X-Gm-Gg: ASbGncv/Lyk76cXQlKbLgvCjSy5zn44JRW7gNwwPm8gPx7TWY6Kw/qcJk+Ay8qsYSpt
	Oz2vD+4+ef3Zpo21Gh7swgRdcqca8lFa0nYScNeiOMsbEMurvFdLUEst81fe56DmPUB7yvAixzp
	jfVbszMPDsvh3vdxMwmLG0ILOAd2E2Xbl8w1WQdJd9EPzyfC/6xbLWxxSvHm5yACa8kapqMZpql
	sGzopYJq6+AWxFwY80oqIbjT8NbXxHVpVYGJjU0xWIjZKkmtGaJdR+powBcTATLcA2o+jmPJB/9
	t8Irqxbih7aYioqm8UHM7g0biGkbJzNAlw32Pt3xhPmijsISOHN/lAiOzymJCRH4ezhyg5SawBr
	5NL6t/1pVVLpuNOCcCh6tDEpqgOwhEn4TUf91Xr7raDxqP3LcJUXRJmEB8xYSCR3L7JoRE85ksn
	/1+hiw9xRfyGDYdt81ZrQ=
X-Google-Smtp-Source: AGHT+IGjHlzwxTlSwDIo8bVlsq+pwRAcXzYI1RxLsxjm8COk+bFjmzs7HwuYQVnOLc3GhJHNohSXJA==
X-Received: by 2002:a05:6000:2c11:b0:3ec:dd16:fc16 with SMTP id ffacd0b85a97d-4266e7df779mr12010154f8f.43.1760303946775;
        Sun, 12 Oct 2025 14:19:06 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0987sm14723783f8f.38.2025.10.12.14.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 14:19:06 -0700 (PDT)
Date: Mon, 13 Oct 2025 00:19:04 +0300
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org, 
	syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Subject: Re: [PATCH] f2fs: Perform sanity check before unlinking directory
 inode
Message-ID: <gupgic53ouhmdwrglwdviw2mzeaqfjsvyr47u3ebu2ztayswy4@4oxvnu252rdb>
References: <20251003134731.470392-1-zlatistiv@gmail.com>
 <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>

On Thu, Oct 09, 2025 at 10:54:40AM +0800, Chao Yu wrote:
> On 10/3/2025 9:47 PM, Nikola Z. Ivanov wrote:
> > Current i_nlink corruption check does not take into account
> > directory inodes which have one additional i_nlink for their "." entry.
> > 
> > Add additional check and a common corruption path.
> > 
> > Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> > Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
> > Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> > ---
> >   fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
> >   1 file changed, 20 insertions(+), 8 deletions(-)
> > 
> > diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> > index b882771e4699..68b33e8089b0 100644
> > --- a/fs/f2fs/namei.c
> > +++ b/fs/f2fs/namei.c
> > @@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> >   		goto out;
> >   	}
> > -	if (inode->i_nlink == 0) {
> > +	if (unlikely(inode->i_nlink == 0)) {
> >   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> >   			  __func__, inode->i_ino);
> > -		err = -EFSCORRUPTED;
> > -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > -		goto out_iput;
> > +		goto corrupted;
> > +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> > +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> > +			  __func__, inode->i_ino);
> > +		goto corrupted;
> 
> Can we detect such corruption in sanity_check_inode() as well? So that if
> f2fs internal flow calls f2fs_iget() on corrupted inode, we can set SBI_NEED_FSCK
> flag and then triggering fsck repairment later.
> 
> Thanks,
> 
> >   	}
> >   	if (IS_ENCRYPTED(dir) &&
> > @@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> >   	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
> >   				ino, IS_ERR(new) ? PTR_ERR(new) : err);
> >   	return new;
> > +corrupted:
> > +	err = -EFSCORRUPTED;
> > +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >   out_iput:
> >   	iput(inode);
> >   out:
> > @@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >   	if (unlikely(inode->i_nlink == 0)) {
> >   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> >   			  __func__, inode->i_ino);
> > -		err = -EFSCORRUPTED;
> > -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > -		f2fs_folio_put(folio, false);
> > -		goto fail;
> > +		goto corrupted;
> > +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> > +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> > +			  __func__, inode->i_ino);
> > +		goto corrupted;
> >   	}
> >   	f2fs_balance_fs(sbi, true);
> > @@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >   	if (IS_DIRSYNC(dir))
> >   		f2fs_sync_fs(sbi->sb, 1);
> > +
> > +	goto fail;
> > +corrupted:
> > +	err = -EFSCORRUPTED;
> > +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > +	f2fs_folio_put(folio, false);
> >   fail:
> >   	trace_f2fs_unlink_exit(inode, err);
> >   	return err;
> 

Hi Chao,

Thank you for the suggestion.
I will add this to sanity_check_inode and remove it
from f2fs_lookup as it becomes redundant since f2fs_lookup
obtains the inode through f2fs_iget. For f2fs_unlink I will
move the i_nlink == 1 check to f2fs_rmdir.

I will send v2 as soon as I do some more testing.
