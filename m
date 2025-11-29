Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E2330E0EB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Nov 2025 11:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764416899; cv=none; b=qXILhYLm8Bn8datUbHQ1ypPMo7W5LTNG35XmbWoHwfx+EFf/q242wn8AXhWB7YWNlYPrmhMvS4CaobrMGMnpZmv2jsBLlN8FOIx21hwTzI3SGyLN2IrL7up6EwPV5uOErpDnzdHBwS25err2yKvPdksuwlSvaHMqCK7WcKikr/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764416899; c=relaxed/simple;
	bh=h5+9iYl8VbZS+U2LlTL5YKcwmoyod1ZpymlsHJE1nGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lEcHTQtTQPIH/aJxQj7cw7+UVVg4PLPP0UU5ritwnKXoVolbQEkup3116eV2cWtjxD2hhuWuBA5Xs6T/09mgqmKwHxwE31Tmnwu7qpM2QcdyhnJecNoc7t9yIrK9NAEqysox4nO/eIOfvpQhR0tN5lspQftZ5Ol8r50iYJU+OkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCbDeTHC; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCbDeTHC"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC23640AC5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Nov 2025 11:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_Fveu9zv9qX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Nov 2025 11:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7070D40A65
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7070D40A65
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XCbDeTHC
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7070D40A65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Nov 2025 11:48:14 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4779f9696e7so832995e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Nov 2025 03:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764416892; x=1765021692; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0kqJsr+zwaIWk0dOjhvACdQK6mMb8qhb4SrPekKTBzA=;
        b=XCbDeTHCFqnyJy5yfjn709MkRuFDO3YPt7GglERUpwDG6NYYrSckhKp28L/s5BQj7+
         1mlFYEXAl6yUJbB2ZRS45Q76JqErL6muAncKNxISjl/+yN67KFT8/qV8gzW0XTe7SvDW
         aWN9UmUzSjooT67Xo07uwEhUbjaXKsDUuP6hT/kuG5pddgMXpq14334IhN+MmceO5HrI
         qP1KHpi5RnUk49smcUX9l6n4hC0/amUZ9prVisDT+LH7a1YJS2XwLe7d9V/n/nh4hIWt
         JqCpGPRx5KcVpT/g0R9D+hT2jMQIUHMBwogEzOTYiE0DwUrXvAnMv2S3mDlOmwiv932F
         aaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764416892; x=1765021692;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kqJsr+zwaIWk0dOjhvACdQK6mMb8qhb4SrPekKTBzA=;
        b=rR9fh7aaunE31HhwimKLaiJTFJXlInw17RwPUgWiJ1qxsx0/Dyv19WVfKu8pMCHFZ4
         F++0AkjkAyWO4n2AqD9mXs+d8XjAmYOYMBwYwKlE/O5tzvR8GpyaQMMq+QDNPyaNFCR4
         ZrqCrcQGYd3D8nvsXt2ZEbfTv4TwaR+5z7U4SiZjzcr/yo/6HupmbAhzm57XAOZSO3ZW
         rqexA0SJy62cKVZckPCBb5lEnGgU/fr5F1UY6yc01EvLtoEj9IUj7vb/GMWcjJLppP7q
         /VWMsUix9y43bH1xyLHcR3Zo1L5/QROmQDF9AhlNrYYQAaWQA5bOpN0I1yeFPA3iUg/q
         XwAg==
X-Forwarded-Encrypted: i=1; AJvYcCXlawvaWRm1o6TiD6Y/p+7NpIEbzS/0DkOxjp2HpqFjukKnso5t13fTf2OqVmkPVDKvnkVOyhvzsX3Exw21rt5MI+OI7Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyYOQ/KEtotHNTAE3DbVVbwe0IcU4JP2QSjIN5A4xmMfECKmIno
	U9OiScTTVOkhi46kG7BpCl+YWGYQaceWdrAJ0jpmpXp0uf/cw0tWKp9M
X-Gm-Gg: ASbGncuwOCDlILY8AoUA/iXHCXOesGdl9VDVUn0K/CAaenEPR6P6Jx5vhVEkvVxTjdl
	FaZ3AXIrmUXJuq+fPV1Vo+tDqq/k/tlq4IYnWEo3gkwpEQDyZgHU60CZnDYNjYoFuq1G99AYBex
	n3jtG/MqGhDNO/BPr//0GObP9xD+qqpiHOZfwEDFkJvtmDxWIsjrVNpq9sBylZ5pOj50OoVgHu3
	gpyl/gqQC3mSHHdmxbD43MKWSMe509pYAo+qJZ7trZSq8g3QKaSr1+26rOcbPVmA7HDd1T//eD2
	xTQ3eOQe+LpGgAPyMfu53tX4lA/OTh5D1o30mSve9MQVIVeIjHt9c7CjGepLJJCMjV8aH7MYtZ4
	p/994NY4zjGBb0no6F9WNTt1/jMp/3RsaNFZY1VgKQdJOpp4B3VL+XgEUxMr8b72yQWxaj4s/ll
	PPMAFbus5yXSoVd7oDXGrgMhRs5I/9VA==
X-Google-Smtp-Source: AGHT+IGDpyKVraliVE01ExVQJEk8OI7hIep8C4tPP0QdUpVLYTDCOStcQpW0M8yATHKAdJxUMJa64Q==
X-Received: by 2002:a05:600c:a03:b0:477:7a1c:9cb5 with SMTP id 5b1f17b1804b1-477c317d347mr184062665e9.7.1764416891955;
        Sat, 29 Nov 2025 03:48:11 -0800 (PST)
Received: from [192.168.1.105] ([165.50.52.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a4bbsm14469835f8f.21.2025.11.29.03.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Nov 2025 03:48:11 -0800 (PST)
Message-ID: <59b833d7-4a97-4703-86ef-c163d70b3836@gmail.com>
Date: Sat, 29 Nov 2025 13:48:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/hfs: fix s_fs_info leak on setup_bdev_super()
 failure
Content-Language: en-US
To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 "brauner@kernel.org" <brauner@kernel.org>
Cc: "jack@suse.cz" <jack@suse.cz>, "khalid@kernel.org" <khalid@kernel.org>,
 "frank.li@vivo.com" <frank.li@vivo.com>,
 "slava@dubeyko.com" <slava@dubeyko.com>,
 "david.hunter.linux@gmail.com" <david.hunter.linux@gmail.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com"
 <syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>
References: <20251119073845.18578-1-mehdi.benhadjkhelifa@gmail.com>
 <c19c6ebedf52f0362648a32c0eabdc823746438f.camel@ibm.com>
 <20251126-gebaggert-anpacken-d0d9fb10b9bc@brauner>
 <04d3810e-3d1b-4af2-a39b-0459cb466838@gmail.com>
 <56521c02f410d15a11076ebba1ce00e081951c3f.camel@ibm.com>
 <20251127-semmel-lastkraftwagen-9f2c7f6e16dd@brauner>
 <4bb136bae5c04bc07e75ddf108ada7e7480afacc.camel@ibm.com>
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <4bb136bae5c04bc07e75ddf108ada7e7480afacc.camel@ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/25 9:19 PM, Viacheslav Dubeyko wrote:
> On Thu, 2025-11-27 at 09:59 +0100, Christian Brauner wrote:
>> On Wed, Nov 26, 2025 at 10:30:30PM +0000, Viacheslav Dubeyko wrote:
>>> On Wed, 2025-11-26 at 17:06 +0100, Mehdi Ben Hadj Khelifa wrote:
>>>> On 11/26/25 2:48 PM, Christian Brauner wrote:
>>>>> On Wed, Nov 19, 2025 at 07:58:21PM +0000, Viacheslav Dubeyko wrote:
>>>>>> On Wed, 2025-11-19 at 08:38 +0100, Mehdi Ben Hadj Khelifa wrote:
>>>>>>> The regression introduced by commit aca740cecbe5 ("fs: open block device
>>>>>>> after superblock creation") allows setup_bdev_super() to fail after a new
>>>>>>> superblock has been allocated by sget_fc(), but before hfs_fill_super()
>>>>>>> takes ownership of the filesystem-specific s_fs_info data.
>>>>>>>
>>>>>>> In that case, hfs_put_super() and the failure paths of hfs_fill_super()
>>>>>>> are never reached, leaving the HFS mdb structures attached to s->s_fs_info
>>>>>>> unreleased.The default kill_block_super() teardown also does not free
>>>>>>> HFS-specific resources, resulting in a memory leak on early mount failure.
>>>>>>>
>>>>>>> Fix this by moving all HFS-specific teardown (hfs_mdb_put()) from
>>>>>>> hfs_put_super() and the hfs_fill_super() failure path into a dedicated
>>>>>>> hfs_kill_sb() implementation. This ensures that both normal unmount and
>>>>>>> early teardown paths (including setup_bdev_super() failure) correctly
>>>>>>> release HFS metadata.
>>>>>>>
>>>>>>> This also preserves the intended layering: generic_shutdown_super()
>>>>>>> handles VFS-side cleanup, while HFS filesystem state is fully destroyed
>>>>>>> afterwards.
>>>>>>>
>>>>>>> Fixes: aca740cecbe5 ("fs: open block device after superblock creation")
>>>>>>> Reported-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
>>>>>>> Closes: https://syzkaller.appspot.com/bug?extid=ad45f827c88778ff7df6
>>>>>>> Tested-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
>>>>>>> Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
>>>>>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>>>>>> ---
>>>>>>> ChangeLog:
>>>>>>>
>>>>>>> Changes from v1:
>>>>>>>
>>>>>>> -Changed the patch direction to focus on hfs changes specifically as
>>>>>>> suggested by al viro
>>>>>>>
>>>>>>> Link:https://lore.kernel.org/all/20251114165255.101361-1-mehdi.benhadjkhelifa@gmail.com/
>>>>>>>
>>>>>>> Note:This patch might need some more testing as I only did run selftests
>>>>>>> with no regression, check dmesg output for no regression, run reproducer
>>>>>>> with no bug and test it with syzbot as well.
>>>>>>
>>>>>> Have you run xfstests for the patch? Unfortunately, we have multiple xfstests
>>>>>> failures for HFS now. And you can check the list of known issues here [1]. The
>>>>>> main point of such run of xfstests is to check that maybe some issue(s) could be
>>>>>> fixed by the patch. And, more important that you don't introduce new issues. ;)
>>>>>>
>>>>>>>
>>>>>>>    fs/hfs/super.c | 16 ++++++++++++----
>>>>>>>    1 file changed, 12 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/fs/hfs/super.c b/fs/hfs/super.c
>>>>>>> index 47f50fa555a4..06e1c25e47dc 100644
>>>>>>> --- a/fs/hfs/super.c
>>>>>>> +++ b/fs/hfs/super.c
>>>>>>> @@ -49,8 +49,6 @@ static void hfs_put_super(struct super_block *sb)
>>>>>>>    {
>>>>>>>    	cancel_delayed_work_sync(&HFS_SB(sb)->mdb_work);
>>>>>>>    	hfs_mdb_close(sb);
>>>>>>> -	/* release the MDB's resources */
>>>>>>> -	hfs_mdb_put(sb);
>>>>>>>    }
>>>>>>>    
>>>>>>>    static void flush_mdb(struct work_struct *work)
>>>>>>> @@ -383,7 +381,6 @@ static int hfs_fill_super(struct super_block *sb, struct fs_context *fc)
>>>>>>>    bail_no_root:
>>>>>>>    	pr_err("get root inode failed\n");
>>>>>>>    bail:
>>>>>>> -	hfs_mdb_put(sb);
>>>>>>>    	return res;
>>>>>>>    }
>>>>>>>    
>>>>>>> @@ -431,10 +428,21 @@ static int hfs_init_fs_context(struct fs_context *fc)
>>>>>>>    	return 0;
>>>>>>>    }
>>>>>>>    
>>>>>>> +static void hfs_kill_sb(struct super_block *sb)
>>>>>>> +{
>>>>>>> +	generic_shutdown_super(sb);
>>>>>>> +	hfs_mdb_put(sb);
>>>>>>> +	if (sb->s_bdev) {
>>>>>>> +		sync_blockdev(sb->s_bdev);
>>>>>>> +		bdev_fput(sb->s_bdev_file);
>>>>>>> +	}
>>>>>>> +
>>>>>>> +}
>>>>>>> +
>>>>>>>    static struct file_system_type hfs_fs_type = {
>>>>>>>    	.owner		= THIS_MODULE,
>>>>>>>    	.name		= "hfs",
>>>>>>> -	.kill_sb	= kill_block_super,
>>>>>>
>>>>>> It looks like we have the same issue for the case of HFS+ [2]. Could you please
>>>>>> double check that HFS+ should be fixed too?
>>>>>
>>>>> There's no need to open-code this unless I'm missing something. All you
>>>>> need is the following two patches - untested. Both issues were
>>>>> introduced by the conversion to the new mount api.
>>>> Yes, I don't think open-code is needed here IIUC, also as I mentionned
>>>> before I went by the suggestion of Al Viro in previous replies that's my
>>>> main reason for doing it that way in the first place.
>>>>
>>>> Also me and Slava are working on testing the mentionned patches, Should
>>>> I sent them from my part to the maintainers and mailing lists once
>>>> testing has been done?
>>>>
>>>>
>>>
>>> I have run the xfstests on the latest kernel. Everything works as expected:
>>>
>>> sudo ./check -g auto
>>> FSTYP         -- hfsplus
>>> PLATFORM      -- Linux/x86_64 hfsplus-testing-0001 6.18.0-rc7 #97 SMP
>>> PREEMPT_DYNAMIC Tue Nov 25 15:12:42 PST 2025
>>> MKFS_OPTIONS  -- /dev/loop51
>>> MOUNT_OPTIONS -- /dev/loop51 /mnt/scratch
>>>
>>> generic/001 22s ...  53s
>>> generic/002 17s ...  43s
>>>
>>> <skipped>
>>>
>>> Failures: generic/003 generic/013 generic/020 generic/034 generic/037
>>> generic/039 generic/040 generic/041 generic/056 generic/057 generic/062
>>> generic/065 generic/066 generic/069 generic/070 generic/073 generic/074
>>> generic/079 generic/091 generic/097 generic/101 generic/104 generic/106
>>> generic/107 generic/113 generic/127 generic/241 generic/258 generic/263
>>> generic/285 generic/321 generic/322 generic/335 generic/336 generic/337
>>> generic/339 generic/341 generic/342 generic/343 generic/348 generic/363
>>> generic/376 generic/377 generic/405 generic/412 generic/418 generic/464
>>> generic/471 generic/475 generic/479 generic/480 generic/481 generic/489
>>> generic/490 generic/498 generic/502 generic/510 generic/523 generic/525
>>> generic/526 generic/527 generic/533 generic/534 generic/535 generic/547
>>> generic/551 generic/552 generic/557 generic/563 generic/564 generic/617
>>> generic/631 generic/637 generic/640 generic/642 generic/647 generic/650
>>> generic/690 generic/728 generic/729 generic/760 generic/764 generic/771
>>> generic/776
>>> Failed 84 of 767 tests
>>>
>>> Currently, failures are expected. But I don't see any serious crash, especially,
>>> on every single test.
>>>
>>> So, I can apply two patches that Christian shared and test it on my side.
>>>
>>> I had impression that Christian has taken the patch for HFS already in his tree.
>>> Am I wrong here? I can take both patches in HFS/HFS+ tree. Let me run xfstests
>>> with applied patches at first.
>>
>> Feel free to taken them.
> 
> Sounds good!
> 
> So, I have xfestests run results:
> 
> HFS without patch:
> 
> sudo ./check -g auto
> FSTYP         -- hfs
> PLATFORM      -- Linux/x86_64 hfsplus-testing-0001 6.18.0-rc7+ #98 SMP
> PREEMPT_DYNAMIC Wed Nov 26 14:37:19 PST 2025
> MKFS_OPTIONS  -- /dev/loop51
> MOUNT_OPTIONS -- /dev/loop51 /mnt/scratch
> 
> <skipped>
> 
> Failed 140 of 766 tests
> 
> HFS with patch:
> 
> sudo ./check -g auto
> FSTYP         -- hfs
> PLATFORM      -- Linux/x86_64 hfsplus-testing-0001 6.18.0-rc7+ #98 SMP
> PREEMPT_DYNAMIC Wed Nov 26 14:37:19 PST 2025
> MKFS_OPTIONS  -- /dev/loop51
> MOUNT_OPTIONS -- /dev/loop51 /mnt/scratch
> 
> <skipped>
> 
> Failed 139 of 766 tests
> 
> HFS+ without patch:
> 
> sudo ./check -g auto
> FSTYP         -- hfsplus
> PLATFORM      -- Linux/x86_64 hfsplus-testing-0001 6.18.0-rc7 #97 SMP
> PREEMPT_DYNAMIC Tue Nov 25 15:12:42 PST 2025
> MKFS_OPTIONS  -- /dev/loop51
> MOUNT_OPTIONS -- /dev/loop51 /mnt/scratch
> 
> <skipped>
> 
> Failed 84 of 767 tests
> 
> HFS+ with patch:
> 
> sudo ./check -g
> FSTYP         -- hfsplus
> PLATFORM      -- Linux/x86_64 hfsplus-testing-0001 6.18.0-rc7+ #98 SMP
> PREEMPT_DYNAMIC Wed Nov 26 14:37:19 PST 2025
> MKFS_OPTIONS  -- /dev/loop51
> MOUNT_OPTIONS -- /dev/loop51 /mnt/scratch
> 
> <skipped>
> 
> Failed 81 of 767 tests
> 
> As far as I can see, the situation is improving with the patches. I can say that
> patches have been tested and I am ready to pick up the patches into HFS/HFS+
> tree.
> 
> Mehdi, should I expect the formal patches from you? Or should I take the patches
> as it is?
> 

I can send them from my part. Should I add signed-off-by tag at the end 
appended to them?


Also, I want to give an apologies for the delayed/none reply about the 
crash of xfstests on my part. I went back testing them 3 days earlier 
and they started showing different results again and then I have broken 
my finger....Which caused me to have much slower progress.I'm still 
working on getting the same crashes as I did before where I get them 
when running any test.Because I ran quick tests and they didn't crash. 
only with auto around the 631 test for desktop and around 642 on my 
laptop for both not patched and patched kernels.I'm going to update you 
on that matter when I can have predictable behavior and cause of the 
crash/call stack.But expect slow progress from my part here for the 
reason I mentionned before.


> Thanks,
> Slava.
Best Regards,
Mehdi Ben Hadj Khelifa
