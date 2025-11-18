Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C36E36827E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 16:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485150; cv=none; b=Otb2SogBpzhz9B24DG/DPRHFusf1wC/kINRNjZqKS2YPWvvNqaBgTMdiHV1THYqNSfY+8ZLDmRtijpRcIjSFevLWOCHs7vw9lp1PqIT8fJyM4sTLMv+UPL/OuCvWAOwTzLQZ5pjshbU07Km7mldYkC5AWCuQjmApjeRGSPuF4Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485150; c=relaxed/simple;
	bh=WLo847SDfD1QCxmTeZRltY/5VT8tCb0utDVdohvrHV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hQg6Q8z3wRhv+JG1+SoOPi1rl/woRqg4H56j7pv9iMzs8wNp5MeMyVOV9yGz8nkh4CvpL0U/zylb4giQHVRy1PwkWmMdwck0lu1nSf9qFr3LrB0F66k2BrmVnTA/2CLTslHNAMSUDa+20JO9AHqFli21TixevmlCSXc3b7B1xyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcRl9nQb; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcRl9nQb"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43A4418C6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 16:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxue7wTSxzan for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Nov 2025 16:59:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFF2341889
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFF2341889
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TcRl9nQb
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CFF2341889
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 16:59:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4779b49d724so3779915e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 08:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763485144; x=1764089944; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fH6yrr3mk2hF9MFwBpc5vjdUGcfqUWDzkCmJwfsCLRY=;
        b=TcRl9nQbWBsdBJrcd4hdCRe9mCJpWIxdxqzMSeJAoVlq0wXtVBsUOhW759BIFyjj1U
         GxunMBnLm3GGZ5DUB5FyrKnlRRB2aBf3voUctGVzQ1inEevmKArmpLEl4lVi7eZetx4f
         Bx65TdtF4k3eqGw+vzjnE2qAyy1NgOtxnOEviq+CCFESeBJ6UgKM8KiIVzyWzu3DtE6q
         uksDoejMCOxAIGI7l9j9I42/Tl32gqm2eylr+bEV3KRJxNLNHR5YlXJWbR0rN3tXeH6K
         6UMe5jO8X4nhWpTDJPUSHgn//azu/Ndy/mjC9LJ2T3asTowKbq3zklB8GDCLODq4lzOV
         9UtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763485144; x=1764089944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fH6yrr3mk2hF9MFwBpc5vjdUGcfqUWDzkCmJwfsCLRY=;
        b=DcGRQ6vksXrhDFo/P/eAG0TYmsD2r8xvGTz0Arvo3evH3OdksyWk90wE7b5DY5FkQX
         UFvwmiGKqH9OUAnJ3M9m4ydxkAweHW76/JvQzD6OgF+PG0CfYIXBC2TzjXl5Xj7PqEM4
         Tx+ycXnvEDB8jvJJqxfrNtLsS20eqhGudVH8Oe0wZeTVypBquAk3RMlVFCShuS+8Ra/H
         gqCZff/sWIrKb+nImSUMYKqmju+q1HNE+1jYPngmP3CdvsmgsoYYKdZdE3H6AFXcg/XQ
         FM59PM72nmsZbCWUROdsZ2eRuh8/qbBf1xnSbXpQowznLoy/MMD4zP9gvTWr7sqVqi99
         m4Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWv7FSUzjrpFXQvbbJY97uE+FydUNzw07W4Utyb/NURo/XVgV7wJcTrmDRJC0wHQ97/8fVKpRzMrkOA4E+7aI0OACVZtg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxRLjHOZhOFhpOM4SQJy9e1IwgFRk5QV6VEAaJNhG6Ag43hysMT
	2uJb8pLw/UayWgZgZu3ho6ZNKbh7qwkf20roC5MF32mFvhkIEAjQrwBG
X-Gm-Gg: ASbGncuKD894Er58cbtm1RqKrujVSvQx0HrNxpe5FoBb5Bk+5jH9Cb3uUNXPL8zUlpQ
	ywsehA/cSAzEmtCqqKHaPMEkVFm9/dStgIaq4TXincIPDS6EbWjs6r1UsXUYq4aXALPFiEEGztf
	I5ptp7nkPo1RrsKfAkPC3/D6QDFxndFmcK2sCoAWxFu0aV/tJGOmgLU4zY/LJt1mivSioe2tDx0
	XK9MUCseEdxQq3+X0+/ssnrCjEnc1RAzODVEKOehXXhEc1R9vk4oZlUW1yukLODqWq1KepH2gfh
	bedKOm1vXMvbX+NsUMv3ex1t7EtO4uLqMrcmsPaW8Agnvi5KxmAuYHiUk6NfmN1h2IUIkjh6Vpj
	4PCZFNM1Qa/MI/wzZu7R5kROKshz6qdWvbLnMKS73EBtOFcob5KZJ8xf1AZCSRLLtO+G2+LHO9z
	sMM0a6Rk4jKYF/A9NoWOQ=
X-Google-Smtp-Source: AGHT+IHheqrevn6qdnNYQ2vphQ/c4Oh/9NTKjjDZ/bfh4YOqWf8mlyCRscmyfz955g1yg1atfOYTwg==
X-Received: by 2002:a05:600c:35c3:b0:477:9c9e:ec6c with SMTP id 5b1f17b1804b1-477a9c3c61cmr18310965e9.8.1763485143511;
        Tue, 18 Nov 2025 08:59:03 -0800 (PST)
Received: from [192.168.1.105] ([165.50.73.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e91f2dsm34086949f8f.19.2025.11.18.08.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 08:59:03 -0800 (PST)
Message-ID: <a6232916-7bc5-44ac-9ac7-17ec306fe45a@gmail.com>
Date: Tue, 18 Nov 2025 18:58:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/super: fix memory leak of s_fs_info on
 setup_bdev_super failure
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: brauner@kernel.org, jack@suse.cz,
 syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com, frank.li@vivo.com,
 glaubitz@physik.fu-berlin.de, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, slava@dubeyko.com,
 syzkaller-bugs@googlegroups.com, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251114165255.101361-1-mehdi.benhadjkhelifa@gmail.com>
 <20251118145957.GD2441659@ZenIV>
 <6c482108-78b8-4e09-814a-67820a5c021e@gmail.com>
 <20251118163509.GE2441659@ZenIV>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <20251118163509.GE2441659@ZenIV>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 5:35 PM, Al Viro wrote:
> On Tue, Nov 18, 2025 at 05:21:59PM +0100, Mehdi Ben Hadj Khelifa wrote:
> 
>>> Almost certainly bogus; quite a few fill_super() callbacks seriously count
>>> upon "->kill_sb() will take care care of cleanup if we return an error".
>>
>> So should I then free the allocated s_fs_info in the kill_block_super
>> instead and check for the null pointer in put_fs_context to not execute
>> kfree in subsequent call to hfs_free_fc()?
> 
> Huh?  How the hell would kill_block_super() know what to do with ->s_fs_info
> for that particular fs type?  kill_block_super() is a convenience helper,
> no more than that...
> 
Yes, I missed that. Since i only looked at the hfs_free_fc(), I forgot 
that in kill_block_super() it handles all fs types not only hfs which 
only frees s_fs_info.

>> Because the error generated in setup_bdev_super() when returned to
>> do_new_mount() (after a lot of error propagation) it doesn't get handled:	
>> 	if (!err)
>> 		err = do_new_mount_fc(fc, path, mnt_flags);
>> 	put_fs_context(fc);
>> 	return err;
> 
> Would be hard to handle something that is already gone, wouldn't it?
> deactivate_locked_super() after the fill_super() failure is where
> the superblock is destroyed - nothing past that point could possibly
> be of any use.
> 
> I would still like the details on the problem you are seeing.

The Problem isn't produced by fill_super failure, instead it's produced 
by setup_bdev_super failure just a line before it. here is a snip from 
fs/super:

		error = setup_bdev_super(s, fc->sb_flags, fc);
		if (!error)
			error = fill_super(s, fc);
		if (error) {
			deactivate_locked_super(s);
			return error;
		}
and in the above code, fc->s_fs_info has already been transferred to sb 
as you have mentionned in the sget_fc() function before the above snip.
But subsequent calls after setup_bdev_super fail to free s_fs_info IIUC.


> 
> Normal operation (for filesystems that preallocate ->s_fs_info and hang
> it off fc) goes like this:
> 
> 	* fc->s_fs_info is allocated in ->init_fs_context()
> 	* it is modified (possibly) in ->parse_param()
> 	* eventually ->get_tree() is called and at some point it
> asks for superblock by calling sget_fc().  It may fail (in which
> case fc->s_fs_info stays where it is), if may return a preexisting
> superblock (ditto) *OR* it may create and return a new superblock.
> In that case fc->s_fs_info is no more - it's been moved over to
> sb->s_fs_info.  NULL is left behind.  From that point on the
> responsibility for that sucker is with the filesystem; nothing in
> VFS has any idea where to find it.
> 
In this case, it doesn create a new superblock which transferes the 
ownership of the pointer. But as i said the problem is that in the error 
path of setup_bdev_super(), there is no freeing of such memory and since 
the pointer has already been transfered and it's the responsibility is 
with the filesystem, put_fs_context() calling hfs_free_fc() doesn't free 
the allocated memory too.
> Again, there is no such thing as transferring it back to fc - once
> fill_super() has been called, there might be any number of additional
> things that need to be undone.
> 
As I said above, fill_super isn't even called in this case.
> For HFS I would expect that hfs_fill_super() would call hfs_mdb_put(sb)
> on all failures and have it called from subsequent ->put_super() if
> we succeed and later unmount the filesystem.  That seems to be where
> ->s_fs_info is taken out of superblock and freed.
> 
> What do you observe getting leaked and in which case does that happen?
> 
Exactly in bdev_file_open_by_dev() in the setup_bdev_super call 
mentionned above is what triggers the error path that doesn't free the 
hfs_sb_info since hfs_free_fc calls kfree on a NULL pointer..
