Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4A126281
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721911289; cv=none; b=jq4olIvfEdqmqssqo6MXBDUgsI52022q4j+VmesvVcAPT3cxmayh0jk1DfFoZIIlXOlviuECX6Ir2xCoLRogFZ13tsMkxKOxDXe1+7n5oxcdOsuqc+EGyCCbsIU7biQ5pofAznwgQMaWdaC6ugPDUupkJHscbD319kAVdpn6tDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721911289; c=relaxed/simple;
	bh=iVjwiTGWSbAPFWHvyGOwIVJDxssCDWbpNhvDA+S7C2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlCaJCPHQiIxpfxE8k4jEssJ2Es9rLXNAuUrN7iOdtR/aAr2SW8iP1U4pBfKrxNuIiFvBAarggJR0utGxU0RhnYceEN4pOOlyqFC9wKvKnKn4pd5Q7IDbpNqhvvPu3ZxKuHDalAmN+zE1k2k6B/430fsgoRNfZbZdELlsyTSxJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=c61gFEse; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EnDTF5/y; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="c61gFEse";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EnDTF5/y"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A68408EB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 12:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.802
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcLh_iAL6dPu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jul 2024 12:41:27 +0000 (UTC)
X-Greylist: delayed 535 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 25 Jul 2024 12:41:26 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BFA88406AA
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=kroah.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFA88406AA
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=c61gFEse;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EnDTF5/y
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.150; helo=fout7-smtp.messagingengine.com; envelope-from=greg@kroah.com; receiver=<UNKNOWN> 
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BFA88406AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 12:41:26 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 513C113802FF;
	Thu, 25 Jul 2024 08:32:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 25 Jul 2024 08:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1721910749;
	 x=1721997149; bh=CRDgB4Ui9tFlWvibCNae+TBH12c1svg/LRxrQQiSeGk=; b=
	c61gFEse+mV/1xOGwJVZegFhp0GRsBzCRusNHtDIhUw0AqgKCOfhovfRNyTh2EQM
	WBYnpUU7DPmuU0thaDk0uAbdGEHfHJ+g3pq9EQwQy/8AUKxvt5UCHcnblGJ35H37
	8uFUfeWv5pFnpHGrtdATxk8d46UUVEZDiab8vgKzzh8YViBbUhJp/Dj3SJ+ijzIu
	gCdvdMWT0kSFFEtaNTmziR2rKw3B+rumQ7LdOKLQ+Sc9nw5DpTthU5Ayq99hQM3Y
	XcI8PQ7MVSh5c9U4kAkd5H9AxPZ/WubGIquEZhxjhE3EsYahYXShr49Qa0lFC6wa
	9qhZZ09xBDdR3A0Fh9i5MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721910749; x=
	1721997149; bh=CRDgB4Ui9tFlWvibCNae+TBH12c1svg/LRxrQQiSeGk=; b=E
	nDTF5/yCbk6/TSk7FW+dahxPhTk7vwE4IZl2LH70snxz1SIJ/9mef25hv/ItI5oU
	1ullBW6GBHqwx3wNhAx5PtyK+bPll4Jf6uSxqxSYz0nf9Y7kOe2cW33WTW9Kba0J
	IwBlqkAJ1evSfLIEJZbEeuc/gEIFYK2xYBqivkr4wNcznjIaC4ovUcJvBO4c89x2
	erfosTIAbDK8qiWVKQAXBvkvmhUhbSVoAC+64RZmncAQDXXd1GJ+Quq3lYJmIPcV
	FWVjSstF+Mf5gC6PqK6XdRW98RK+PEyk1SQfBb7dB3OmEeWfqTXd8JPFrj9rG8Yg
	9Z3yDXngWB8ayaBa5rXCw==
X-ME-Sender: <xms:3UWiZknOjhMa0dXoC65FIIW9f637R5b2M0rMZxu1rJBzpc-twN3-uw>
    <xme:3UWiZj2HZWIPzY41j3BdUjjh89eipCXvUV6BBZ0ANiWOtRhHNde5JeaPFxgd72GJS
    XayJhyKXrs5QA>
X-ME-Received: <xmr:3UWiZiq7V6agct-Fkjw0nkqSl95NGxB2LOtVvoTbkd-zT8UkySa4ZUu2ijEg2D6ba7BGQUrKn5m95dssI3ziE21KSKEO_PsnOyt6LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrieefgdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepleehhe
    duudeugeegjefgheeuudffheevueekgfekueefledtjeetieeutdekkeelnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhmpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:3UWiZgnZHeER7qMJ3nbGK_ERsDxxbCNtzTbEJx9pfo7j_0jAyhAFCA>
    <xmx:3UWiZi1DQ8mKFSaPcSIn8xkIobIu6Yk83LRxf9MPcntMtbIgEQSJYw>
    <xmx:3UWiZnukYJQhH-QZEiCaYl_73xwkcjdjp3u7k6IsluK4BXu4YG6HyA>
    <xmx:3UWiZuUb7r5vZG_ZL7dYrNCJsXeSR_H9oq8_vjBQfppRnCdNJLcrJg>
    <xmx:3UWiZoPfHIEkIhUfNrsHQmgDu5l1wQkTQmzJAdSo2asvoR2yDUm_JgyD>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Jul 2024 08:32:28 -0400 (EDT)
Date: Thu, 25 Jul 2024 14:32:26 +0200
From: Greg KH <greg@kroah.com>
To: Sergio =?iso-8859-1?Q?Gonz=E1lez?= Collado <sergio.collado@gmail.com>
Cc: stable@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
	Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
	syzbot+d0ab8746c920a592aeab@syzkaller.appspotmail.com
Subject: Re: [PATCH 6.1.y] f2fs: avoid dead loop in f2fs_issue_checkpoint()
Message-ID: <2024072519-among-surrogate-8c18@gregkh>
References: <20240725111933.77493-1-sergio.collado@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240725111933.77493-1-sergio.collado@gmail.com>

On Thu, Jul 25, 2024 at 01:19:33PM +0200, Sergio González Collado wrote:
> From: Chao Yu <chao@kernel.org>
> 
> [ Upstream commit 5079e1c0c879311668b77075de3e701869804adf ]
> 
> generic/082 reports a bug as below:
> 
> __schedule+0x332/0xf60
> schedule+0x6f/0xf0
> schedule_timeout+0x23b/0x2a0
> wait_for_completion+0x8f/0x140
> f2fs_issue_checkpoint+0xfe/0x1b0
> f2fs_sync_fs+0x9d/0xb0
> sync_filesystem+0x87/0xb0
> dquot_load_quota_sb+0x41b/0x460
> dquot_load_quota_inode+0xa5/0x130
> dquot_quota_on+0x4b/0x60
> f2fs_quota_on+0xe3/0x1b0
> do_quotactl+0x483/0x700
> __x64_sys_quotactl+0x15c/0x310
> do_syscall_64+0x3f/0x90
> entry_SYSCALL_64_after_hwframe+0x72/0xdc
> 
> The root casue is race case as below:
> 
> Thread A			Kworker			IRQ
> - write()
> : write data to quota.user file
> 
> 				- writepages
> 				 - f2fs_submit_page_write
> 				  - __is_cp_guaranteed return false
> 				  - inc_page_count(F2FS_WB_DATA)
> 				 - submit_bio
> - quotactl(Q_QUOTAON)
>  - f2fs_quota_on
>   - dquot_quota_on
>    - dquot_load_quota_inode
>     - vfs_setup_quota_inode
>     : inode->i_flags |= S_NOQUOTA
> 							- f2fs_write_end_io
> 							 - __is_cp_guaranteed return true
> 							 - dec_page_count(F2FS_WB_CP_DATA)
>     - dquot_load_quota_sb
>      - f2fs_sync_fs
>       - f2fs_issue_checkpoint
>        - do_checkpoint
>         - f2fs_wait_on_all_pages(F2FS_WB_CP_DATA)
>         : loop due to F2FS_WB_CP_DATA count is negative
> 
> Calling filemap_fdatawrite() and filemap_fdatawait() to keep all data
> clean before quota file setup.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> (cherry picked from commit 5079e1c0c879311668b77075de3e701869804adf)
> Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
> Reported-by: syzbot+d0ab8746c920a592aeab@syzkaller.appspotmail.com
> ---
>  fs/f2fs/super.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Now queued up, thanks.

greg k-h
