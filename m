Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD6130BB8C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 22:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763590867; cv=none; b=fo4Ds3GT9L9fiPCAE22ECcgUO9LlOAa38Jv5U6wq8+gRfLtXu6xmxKi7LhO7Ow6I/3dWDiuc+HLsBAExmqgQYUUiSZIQHwHFFFZAISLWiCaQ7uYoE2F9iUVufblbBQ8el5ZtLwo4iX4aFr5rzasd+W79EtbGzW0CWW9AsqN+5LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763590867; c=relaxed/simple;
	bh=50Q9sBTjpmF9okPX4ahM+W4f4BYMCV2mUkt/5FtAic0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZ4hVWEjRrFLV/7tfvjvc29j3cZFO4S7+nFv000pGR3T+oikXmzxnUHeC257qMzDITro7x29Qr9KfzKWEHYkzAMRVGHvRNAHiu2X9/KSQTo+uUR/WqtQ7WY5a4jTpycL4fI47JytkY/7Kn88uSlOLDNSThYHZ4YN4v12HqGHiBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8WcJb/s; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8WcJb/s"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB0583C6D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 22:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7K3lUHyUPrS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Nov 2025 22:21:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7695E83C6A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7695E83C6A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W8WcJb/s
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7695E83C6A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 22:21:04 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-477aa91e75dso303525e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 14:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763590862; x=1764195662; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=288Dw9sswG0A+z/lBkxnm7oNArScrtV4EVd6dIg2R2Y=;
        b=W8WcJb/sOw7bwZm0RLGX7vy1GFFGc4W3AC5xr4qgdExYSt5MOvO9acPxlmhhpb0Kz6
         a6NQUbgsZ1e/rYLjI21OhVnQhIQXAIYjVXJLlETT4iRfrKmOhdVVhrzFqQmw0V72gfWC
         x8ah6Oc82JOUzP4xNGvwCVBcNUFvFHLEwh0A333RE/jVvk1T0WnEbjn7mEOiN21mkzWz
         fBBDj4fKuJ+k0wUYn6DAol1GI43KCdya61XDP896gwubg5WVxsNEEEiF5jcVdOsK0AN/
         Dw7hnCwtQWG0HjuTZ03z3o4S7vaS9V8Q02pNHY8y7vgnD4y+tezeP/Knp066HlLeT8tv
         qZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763590862; x=1764195662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=288Dw9sswG0A+z/lBkxnm7oNArScrtV4EVd6dIg2R2Y=;
        b=svcbr+oELKNdtat/3CeXHYxq5VqPJ85/Hxpk+ofex6bV0bFuugemcGHYWEsyf3Rnvx
         +Ssp2MXaDFBRPpR3lEHO66wOf6cltEuc9bgxueMzvrQirOnTj6YL4N/Bz6pMPwG16SGz
         w9UzzoCHpOBlBPT0uacqH7gt41d/mkYyKogrOoF1zdsZ22n3REj/RV+aEQiTRF2eBYJj
         RCK4ivuf8w8uUsufpBI143izZfb2cgbqhBQxrgtTeLzk6jrPGT+dXF/u15RxD/Euk7Cw
         E6ppA4s4lxKXIQPmteaaDcCz+pDNXWBlstuEgSzcm8Izq83KZHf4pF92PS9aMhp3fDiU
         rRXw==
X-Forwarded-Encrypted: i=1; AJvYcCVGU9vMPnjQcEXpwJcpdX+nsqOvqO5fWjkAJ0jmlCbpWUWJe+KVTH2EFzvlKZOc1lQ8AGEg0c5oBKr3LWO6Mhw6jWSvNQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy6s0HsEKtkyNjNMnQJDkgSpXe36VbZ/o7gtnVHZDzjWgxPttBg
	XkkkZX/m1RJ6GL+UCl0I3WeLH/9gP0iSD8WyijyPEArt/2hZ5SFuadkc
X-Gm-Gg: ASbGnct0SXDLEx9iMacuh6zot/NtdRE9GiDtoOamiB8noDHendENC0wonB4OTXRDIOU
	UExoZasorWvHj/yW80s3lbEaNma5/qK9lkr5sYAr9qWO6kInEPmkH1MMwzdZsixT1wXVQjioroQ
	8tRyN2UfiGBWAwW4G1UFDaM0PGmHJawK8v+pZt6oT8foGHi2fCALQAV7FSrb/GbyJjcxruZxwc7
	4wT/YenH8+DQjOLWl5tO7zrMnfRKC9CWc2p1nJfbGWmQ1aaF/J06CSjFvykdS5ydWrRi6lEMEPY
	nnRNYh2wtKREKOeFjYf+w7G6cmJwzqNg2RYb1erS/ZhYTJN0dkRSRl0Kf+Huo/0Nz8CKMRXnbxM
	CAxiM2EbY/+BpfY4A1nD5pXR6jEcGeJ5Qwew/2euCrY79xipGW3rrAD+MPsdxdCat1EbJhJTTbs
	uxPmLHpAM07H7nmJ0oH/sRo3ZcjBO73XCNfBaVFA==
X-Google-Smtp-Source: AGHT+IG/wJ7Aaz37mXLzcO74yWwcjdbnF8mjOxzLT81DyT1s3fbL9Pty3G5JtiVp6En9+zLPVH7muw==
X-Received: by 2002:a05:600c:4f0b:b0:477:a16e:fec5 with SMTP id 5b1f17b1804b1-477b8355ed8mr4060285e9.0.1763590862068;
        Wed, 19 Nov 2025 14:21:02 -0800 (PST)
Received: from [192.168.1.111] ([165.50.70.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b106a9b0sm72950165e9.11.2025.11.19.14.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 14:21:01 -0800 (PST)
Message-ID: <25434098-4bf0-4330-b7b1-527983d9c903@gmail.com>
Date: Wed, 19 Nov 2025 23:21:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/hfs: fix s_fs_info leak on setup_bdev_super()
 failure
To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
 "frank.li@vivo.com" <frank.li@vivo.com>,
 "slava@dubeyko.com" <slava@dubeyko.com>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "jack@suse.cz" <jack@suse.cz>
Cc: "khalid@kernel.org" <khalid@kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "david.hunter.linux@gmail.com" <david.hunter.linux@gmail.com>,
 "syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com"
 <syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com>
References: <20251119073845.18578-1-mehdi.benhadjkhelifa@gmail.com>
 <c19c6ebedf52f0362648a32c0eabdc823746438f.camel@ibm.com>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <c19c6ebedf52f0362648a32c0eabdc823746438f.camel@ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/25 8:58 PM, Viacheslav Dubeyko wrote:
> On Wed, 2025-11-19 at 08:38 +0100, Mehdi Ben Hadj Khelifa wrote:
>> The regression introduced by commit aca740cecbe5 ("fs: open block device
>> after superblock creation") allows setup_bdev_super() to fail after a new
>> superblock has been allocated by sget_fc(), but before hfs_fill_super()
>> takes ownership of the filesystem-specific s_fs_info data.
>>
>> In that case, hfs_put_super() and the failure paths of hfs_fill_super()
>> are never reached, leaving the HFS mdb structures attached to s->s_fs_info
>> unreleased.The default kill_block_super() teardown also does not free
>> HFS-specific resources, resulting in a memory leak on early mount failure.
>>
>> Fix this by moving all HFS-specific teardown (hfs_mdb_put()) from
>> hfs_put_super() and the hfs_fill_super() failure path into a dedicated
>> hfs_kill_sb() implementation. This ensures that both normal unmount and
>> early teardown paths (including setup_bdev_super() failure) correctly
>> release HFS metadata.
>>
>> This also preserves the intended layering: generic_shutdown_super()
>> handles VFS-side cleanup, while HFS filesystem state is fully destroyed
>> afterwards.
>>
>> Fixes: aca740cecbe5 ("fs: open block device after superblock creation")
>> Reported-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=ad45f827c88778ff7df6
>> Tested-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
>> Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>> ---
>> ChangeLog:
>>
>> Changes from v1:
>>
>> -Changed the patch direction to focus on hfs changes specifically as
>> suggested by al viro
>>
>> Link:https://lore.kernel.org/all/20251114165255.101361-1-mehdi.benhadjkhelifa@gmail.com/
>>
>> Note:This patch might need some more testing as I only did run selftests
>> with no regression, check dmesg output for no regression, run reproducer
>> with no bug and test it with syzbot as well.
> 
> Have you run xfstests for the patch? Unfortunately, we have multiple xfstests
> failures for HFS now. And you can check the list of known issues here [1]. The
> main point of such run of xfstests is to check that maybe some issue(s) could be
> fixed by the patch. And, more important that you don't introduce new issues. ;)
> 
I did not know of such tests. I will try to run them for both my patch 
and christian's patch[1] and report the results.
>>
>>   fs/hfs/super.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/hfs/super.c b/fs/hfs/super.c
>> index 47f50fa555a4..06e1c25e47dc 100644
>> --- a/fs/hfs/super.c
>> +++ b/fs/hfs/super.c
>> @@ -49,8 +49,6 @@ static void hfs_put_super(struct super_block *sb)
>>   {
>>   	cancel_delayed_work_sync(&HFS_SB(sb)->mdb_work);
>>   	hfs_mdb_close(sb);
>> -	/* release the MDB's resources */
>> -	hfs_mdb_put(sb);
>>   }
>>   
>>   static void flush_mdb(struct work_struct *work)
>> @@ -383,7 +381,6 @@ static int hfs_fill_super(struct super_block *sb, struct fs_context *fc)
>>   bail_no_root:
>>   	pr_err("get root inode failed\n");
>>   bail:
>> -	hfs_mdb_put(sb);
>>   	return res;
>>   }
>>   
>> @@ -431,10 +428,21 @@ static int hfs_init_fs_context(struct fs_context *fc)
>>   	return 0;
>>   }
>>   
>> +static void hfs_kill_sb(struct super_block *sb)
>> +{
>> +	generic_shutdown_super(sb);
>> +	hfs_mdb_put(sb);
>> +	if (sb->s_bdev) {
>> +		sync_blockdev(sb->s_bdev);
>> +		bdev_fput(sb->s_bdev_file);
>> +	}
>> +
>> +}
>> +
>>   static struct file_system_type hfs_fs_type = {
>>   	.owner		= THIS_MODULE,
>>   	.name		= "hfs",
>> -	.kill_sb	= kill_block_super,
> 
> It looks like we have the same issue for the case of HFS+ [2]. Could you please
> double check that HFS+ should be fixed too?
> 
Yes, I will check it tomorrow in addition to running xfstests and report 
my findings in response to this email. But I'm not sure if my solution 
would be the attended fix or a similar solution to what christian did is 
preferred instead for HFS+. We'll discuss it when I send a response.
> Thanks,
> Slava.
> 
Thank you for your insights Slava!

Best Regards,
Mehdi Ben Hadj Khelifa
>> +	.kill_sb	= hfs_kill_sb,
>>   	.fs_flags	= FS_REQUIRES_DEV,
>>   	.init_fs_context = hfs_init_fs_context,
>>   };
> 
> [1] https://github.com/hfs-linux-kernel/hfs-linux-kernel/issues
> [2] https://elixir.bootlin.com/linux/v6.18-rc6/source/fs/hfsplus/super.c#L694

