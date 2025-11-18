Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1AC363C5D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 15:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763479344; cv=none; b=Ud+T0DBMDifNUADsg3Ff7gt1/4O0/SNrRu5kLxZZ4oiPh2mZcg1ZfvenmlY9FvPSJDwRqD5KD0MKhcYxRFCFpHozxOVP4i9SkzQ5XfT8AWi3vW+9pyxom7IgGhcyBH4PPjiGks4z8oF0HSTGG/S7zXO4HbTVguRSGPk+MV2v9AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763479344; c=relaxed/simple;
	bh=pIX1ASwg7OhBsi3EZ3XfrBnxCe6n/AJc03zsxsrHwP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7NIzsSkg6oa9KuX353fnabkotNlVJnlWZBl0/VeoncheK8mgqAerfSfv/t1WmfYsdDRGJ2I4xAcYsx1iAkZmw8nYk2wN4/x3XLH3D2KNqZi4XZvkYAhXTi2uDYpziPxNzl+/6WBGpV/BAV9t32TVMk/Zzj/761wKnm88M1N40c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vnw/lV3o; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vnw/lV3o"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3EDA40D5D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 15:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFG5TsfFWre1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Nov 2025 15:22:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B266240D32
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B266240D32
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vnw/lV3o
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B266240D32
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 15:22:21 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4779f9696e7so1891105e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 07:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763479339; x=1764084139; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00wCf0bwjC2Ib9qVy8nbg3pTPrjzk9HywzDkbpGaRDY=;
        b=Vnw/lV3oWCDLN6OQ1JaYb26leCYKkUkn+szxZomcROgcKFLGsQ+7u7sAx35mpzplTr
         P/bxomLMimR5JsuMArcHJ0gw6k9mT657KjqmmtpHwscrXxirF2yWvYFH2wMOUEMkbawM
         cG2R+hysm+vedOgI88tJC2dK2XoJgCiGr8/1RlPaHwaxXJ3JWJ1zxqxDRvIqjnMYJGTO
         ClMgt7e5wdHULUud/w9TrHbTXMzgTAR6XiI35qvvbReNkssO4mSiD+HSiGh+WYueb8i/
         PyIiGUn5B3arys4LsMyICBGKfquhgv6jR81mOUSbaxYhnk2xAuuyaJB8Wk2aqEZlEAOo
         k3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763479339; x=1764084139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00wCf0bwjC2Ib9qVy8nbg3pTPrjzk9HywzDkbpGaRDY=;
        b=H6NUS6eZOQHqizcauFaVJK0zi9nl/t6egzWNp67ghLMpyYzr2qaKcH15GGbq93wsN3
         dHn6vQmLCDVdG6koayFE8jf97PwRzXdFszCrdl1LL6nIk+zSajprHFl+K4I/oENVbzbo
         GJn8/kxb989lDW/FS3x4aRc0esY8teb1x74CASB7ai/KJZ7d1kf0LFW8EjpIRk0td0B4
         uaMvxxawGYBjTVd/VvauKptzltTVFMunQ/qMznljey6HRnQ/oiiFIvYm2wx8l1eIj2wb
         ed4oNLfO3gkXLULD2rbp4YSWC9wwcp55iNlhKbjB/QfV6Esza1lNdZmJC+SqFJgIMlmn
         oAbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF5Ax0/2TwwTGJZHqjo4JMrK1QJnOtgEd4eCaA9YarOA8ZSa7yCg6uUbak0WKObO/K1JAac2e2rs4B3WekG5Vmrx5PoA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzG6lf4znu8/m9B93aSiugHzM7GVoyGGy2rlMEjfuSQFfEoD4vi
	JmZYvJ9y18YcHHrb3MPfD/uYybs5f5O91nYFEDORoGclKLqxFfZL1S83
X-Gm-Gg: ASbGncuki3LsSec6MD0yWdmu7U0M/4yaNC8DbOsTJNJK+x93MoKiJpK92csFox2m7mx
	chp0vSqCW/g1cJm8RojNFY2VpXT+j0ozFJjN1h82OcgvX5CfNf9E/s4jg7AwCy2FYDmdsOsNI42
	JSgYTlNEJftEe+6BWkFcwrKTKfgqCrof10PQ/0e4k6CANOAYzQ6kO+Oh7bcuuJ2KCgQT+7cKAue
	RZRxE5vpAMoD1T8GxmV+M9VM5xr8SsAdBSp9cmMnRPe+LQ6jbfPdnH06Xd5tpLmn4ft8+yqI81K
	Wh2LnbRTtPPP0yQBv67poSnnUt0fQ/7TH7Lg+BkwmOz1GIE4CX17e3CU6f1f1ppudKa894ulW3u
	wYIJ0bAtYmA0Z7hZpuVGCp1paQ01VSwq4wmAmfN/2ICgTDguEaVVgfJN6akCV5g63UNCCP7/DwF
	xcmhtpcHulWnKgEfaTb4s=
X-Google-Smtp-Source: AGHT+IE6FmLDcglT4gILuNBc5RTAP0dPVN+aT7yWU1j9JzA4iMRVSgkf9aSmY0C/KZIkLhmEkiHEHA==
X-Received: by 2002:a05:600c:1c1f:b0:477:a478:3f94 with SMTP id 5b1f17b1804b1-477a9c3c5efmr19525875e9.5.1763479339217;
        Tue, 18 Nov 2025 07:22:19 -0800 (PST)
Received: from [192.168.1.105] ([165.50.73.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779920f2cdsm228071925e9.10.2025.11.18.07.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 07:22:18 -0800 (PST)
Message-ID: <6c482108-78b8-4e09-814a-67820a5c021e@gmail.com>
Date: Tue, 18 Nov 2025 17:21:59 +0100
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
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <20251118145957.GD2441659@ZenIV>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 3:59 PM, Al Viro wrote:
> On Fri, Nov 14, 2025 at 05:52:27PM +0100, Mehdi Ben Hadj Khelifa wrote:
>> Failure in setup_bdev_super() triggers an error path where
>> fc->s_fs_info ownership has already been transferred to the superblock via
>> sget_fc() call in get_tree_bdev_flags() and calling put_fs_context() in
>> do_new_mount() to free the s_fs_info for the specific filesystem gets
>> passed in a NULL pointer.
>>
>> Pass back the ownership of the s_fs_info pointer to the filesystem context
>> once the error path has been triggered to be cleaned up gracefully in
>> put_fs_context().
>>
>> Fixes: cb50b348c71f ("convenience helpers: vfs_get_super() and sget_fc()")
>> Reported-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=ad45f827c88778ff7df6
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>> ---
>> Note:This patch might need some more testing as I only did run selftests
>> with no regression, check dmesg output for no regression, run reproducer
>> with no bug.
> 
> Almost certainly bogus; quite a few fill_super() callbacks seriously count
> upon "->kill_sb() will take care care of cleanup if we return an error".

So should I then free the allocated s_fs_info in the kill_block_super 
instead and check for the null pointer in put_fs_context to not execute 
kfree in subsequent call to hfs_free_fc()?

Because the error generated in setup_bdev_super() when returned to 
do_new_mount() (after a lot of error propagation) it doesn't get handled:	
	if (!err)
		err = do_new_mount_fc(fc, path, mnt_flags);
	put_fs_context(fc);
	return err;

Also doesn't get handled anywhere in the call stack after IIUC:

In path_mount:
	return do_new_mount(path, type_page, sb_flags, mnt_flags, dev_name,
			    data_page);

In do_mount:
	return path_mount(dev_name, &path, type_page, flags, data_page);

So what is recommended in this case ?

Best Regards,
Mehdi Ben Hadj Khelifa
