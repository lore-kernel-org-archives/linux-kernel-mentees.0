Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A251F8723
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 22:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763591063; cv=none; b=tnqtkQq3k2Eqhwv7R+G8NbG3/eDUfQYenk9JZPW+e3VvnDxpsTom+ex0q2VGS1F5YcYBGn/wWWdEdwWUV0x9ewCNwPbRAhG795qb/VtSrqhpX9RLgsQ7m7fAUQeTGdCo/xij0NPRxGwbcq5uS+gPHDwthoZAfqsirRq9YFf9/8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763591063; c=relaxed/simple;
	bh=xaPyOxNT/HcBqaLOWWrNAr3jgVtnKXjwmxRR4CkbxzM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EXhRfHI8MiRV5gTRoSf+nKmiOuSPiK7FNn9XGlRmmggCZSwDmJhXjIwxKq09PV4rt+WDo3gfcHseARbwkwRAh2mSWJl+EjE9uuq6GV0LahPfocyizK8E8nvN+9dX0kh6qjJA17FGWedB7ZCdI3Q6ThGM6NiSBHTcdz8eIVlZwcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLi1rnF6; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLi1rnF6"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F88E80983
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 22:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ji8A1qGhWVPh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Nov 2025 22:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DABF807D8
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DABF807D8
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FLi1rnF6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9DABF807D8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 22:24:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47798f4059fso393035e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 14:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763591059; x=1764195859; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T7WmQOx6iAlsV0MHuZ9X9eaYiLcx+jdU4wVC787CH7Y=;
        b=FLi1rnF64Z4ShruP/Yd64o//BHz7GFeU/rTgxWB8algzeJf5Q2JgCWS91LDrjerosl
         /8T9xLSZWtm5mr1JJAZ6KrNCmBbsRxNDr8Oxz/RvZa85HdS5BHJ9wnhF3OwedA7zyLrJ
         3YEuc3+cwJ9EU08fCn5vyb1nVE7EvhdLgFnZTRCmMuikakg5Aa4KRpnvEvuqPKE1R72x
         ZqrQW4XisComH2Apl8h5HclHPy5OzV0kcjMbmvsC0lnGEBE+q2HBkMKGHjQjobUSD/ok
         hdyCIxfkAYqe8sXdQ4ciPTA12DydF0XqpfFJ5sygbO+DYuhn8fOu8rGUAqKa8a2ORrrM
         A49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763591059; x=1764195859;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T7WmQOx6iAlsV0MHuZ9X9eaYiLcx+jdU4wVC787CH7Y=;
        b=HeOSEI1Us9Wcdr0OW6gF5NLVXkElz1KUMnJUupX2W5EIwK7choazvs9ru0g7r9tt3C
         pXXtfHnErd9za19+z0cnYdOt70paOtgxBCab/aQp/olt8iKKD5W8CHrs/xu56LaaxAh8
         LX4io/LiukOeSAqLmF+Q+iDgP3hfRY0YYLurVmJ3q7KR4S8EfmLQfonlRowwB4N93wck
         gvLDU6gmV6lIHCK+9r5WB4niIlAste4DkGwG2wGWtFdbtY5HOPROBSK96YOY9bzR5iKZ
         oPdFkGA+Cs7F5v+V8HN1P2x+UN72tY6eA/0tSRIBERACmnyazUwd+OuhQfmaVCDtWhjr
         6XYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/eP/Jb3cfiXbb3AjoyMQ9TselWTArSU/vcd4plN4TAmVzmqXwiaIsNlBiPZ93E8v8haab2IyzsHRU5xORY96eLKI8vQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxYjisw5TfNSeU9EeyLgm8AN0mWKugi7dzAddgxxA2kVWzMfAB+
	0LXU7B+EtVPmr+hckxPoWuXEaprtytjPCcrbZLJ2MEzfrW+gOwgs4DaE
X-Gm-Gg: ASbGncvTrdf4fcpvaYuefFzCs4sSYtWLHN6wjFFULnfnuS8Biq88349pKUMU9Ret8R6
	guKzSnKivHntOkjSPnG5bNFxyz9wctLZHeyoIT2LTBy4jQN9Aw2rA2D7l6H2BmTdbkH5Ynfhp7P
	reWwUq2snI3owqp0m0mMaC6CaURfHeo6VHjfp69Uz3QmJOvypeQD94lftklIe4O14JuPckRa1Dm
	szKKhJWfWK+94US2kcK7Yauvs815YpipWjmae8y7IbqBssZnr/aqe33/p+Ni0jjU7gbTUWnKhXB
	KI9dWtHx6VFP5aPqkhiG4RhASW2HOzU9oohEBB9JehN3dBy4JrdWFkQ6rEuABgmtFtgZRJTHY2T
	vRDrAhrfjx1t8cejSAHz5Qxpn+7yUhlJWckVQZfAonPIzrK9k+MJnvS4ttR6gl7hxM0J2vuYm9k
	L96TQkOjL1smWMgAvN3SjVU1ljditibMvtHIQdnYHQmlLmBqfp
X-Google-Smtp-Source: AGHT+IEsHyRMQ5pcW3Ld7TQbeWKn9n9tuuRTUNEesIDP2g12lL/hprJtX1I0mMWZv0u25tvMu6LN2Q==
X-Received: by 2002:a05:600c:1c2a:b0:477:a203:66dd with SMTP id 5b1f17b1804b1-477b8579778mr5398185e9.2.1763591058508;
        Wed, 19 Nov 2025 14:24:18 -0800 (PST)
Received: from [192.168.1.111] ([165.50.70.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9d21591sm52867025e9.2.2025.11.19.14.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 14:24:18 -0800 (PST)
Message-ID: <42a9f815-fcda-4bfe-918c-8a676909c9ac@gmail.com>
Date: Wed, 19 Nov 2025 23:24:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/hfs: fix s_fs_info leak on setup_bdev_super()
 failure
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
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
 <25434098-4bf0-4330-b7b1-527983d9c903@gmail.com>
Content-Language: en-US
In-Reply-To: <25434098-4bf0-4330-b7b1-527983d9c903@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/25 11:21 PM, Mehdi Ben Hadj Khelifa wrote:
> On 11/19/25 8:58 PM, Viacheslav Dubeyko wrote:
>> On Wed, 2025-11-19 at 08:38 +0100, Mehdi Ben Hadj Khelifa wrote:
>>> The regression introduced by commit aca740cecbe5 ("fs: open block device
>>> after superblock creation") allows setup_bdev_super() to fail after a 
>>> new
>>> superblock has been allocated by sget_fc(), but before hfs_fill_super()
>>> takes ownership of the filesystem-specific s_fs_info data.
>>>
>>> In that case, hfs_put_super() and the failure paths of hfs_fill_super()
>>> are never reached, leaving the HFS mdb structures attached to s- 
>>> >s_fs_info
>>> unreleased.The default kill_block_super() teardown also does not free
>>> HFS-specific resources, resulting in a memory leak on early mount 
>>> failure.
>>>
>>> Fix this by moving all HFS-specific teardown (hfs_mdb_put()) from
>>> hfs_put_super() and the hfs_fill_super() failure path into a dedicated
>>> hfs_kill_sb() implementation. This ensures that both normal unmount and
>>> early teardown paths (including setup_bdev_super() failure) correctly
>>> release HFS metadata.
>>>
>>> This also preserves the intended layering: generic_shutdown_super()
>>> handles VFS-side cleanup, while HFS filesystem state is fully destroyed
>>> afterwards.
>>>
>>> Fixes: aca740cecbe5 ("fs: open block device after superblock creation")
>>> Reported-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?extid=ad45f827c88778ff7df6
>>> Tested-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
>>> Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>> ---
>>> ChangeLog:
>>>
>>> Changes from v1:
>>>
>>> -Changed the patch direction to focus on hfs changes specifically as
>>> suggested by al viro
>>>
>>> Link:https://lore.kernel.org/all/20251114165255.101361-1- 
>>> mehdi.benhadjkhelifa@gmail.com/
>>>
>>> Note:This patch might need some more testing as I only did run selftests
>>> with no regression, check dmesg output for no regression, run reproducer
>>> with no bug and test it with syzbot as well.
>>
>> Have you run xfstests for the patch? Unfortunately, we have multiple 
>> xfstests
>> failures for HFS now. And you can check the list of known issues here 
>> [1]. The
>> main point of such run of xfstests is to check that maybe some 
>> issue(s) could be
>> fixed by the patch. And, more important that you don't introduce new 
>> issues. ;)
>>
> I did not know of such tests. I will try to run them for both my patch 
> and christian's patch[1] and report the results.

Forgot to reference the mentioned link "[1]". Sorry for the noise.

[1]:https://github.com/brauner/linux/commit/058747cefb26196f3c192c76c631051581b29b27

>>>
>>>   fs/hfs/super.c | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/fs/hfs/super.c b/fs/hfs/super.c
>>> index 47f50fa555a4..06e1c25e47dc 100644
>>> --- a/fs/hfs/super.c
>>> +++ b/fs/hfs/super.c
>>> @@ -49,8 +49,6 @@ static void hfs_put_super(struct super_block *sb)
>>>   {
>>>       cancel_delayed_work_sync(&HFS_SB(sb)->mdb_work);
>>>       hfs_mdb_close(sb);
>>> -    /* release the MDB's resources */
>>> -    hfs_mdb_put(sb);
>>>   }
>>>   static void flush_mdb(struct work_struct *work)
>>> @@ -383,7 +381,6 @@ static int hfs_fill_super(struct super_block *sb, 
>>> struct fs_context *fc)
>>>   bail_no_root:
>>>       pr_err("get root inode failed\n");
>>>   bail:
>>> -    hfs_mdb_put(sb);
>>>       return res;
>>>   }
>>> @@ -431,10 +428,21 @@ static int hfs_init_fs_context(struct 
>>> fs_context *fc)
>>>       return 0;
>>>   }
>>> +static void hfs_kill_sb(struct super_block *sb)
>>> +{
>>> +    generic_shutdown_super(sb);
>>> +    hfs_mdb_put(sb);
>>> +    if (sb->s_bdev) {
>>> +        sync_blockdev(sb->s_bdev);
>>> +        bdev_fput(sb->s_bdev_file);
>>> +    }
>>> +
>>> +}
>>> +
>>>   static struct file_system_type hfs_fs_type = {
>>>       .owner        = THIS_MODULE,
>>>       .name        = "hfs",
>>> -    .kill_sb    = kill_block_super,
>>
>> It looks like we have the same issue for the case of HFS+ [2]. Could 
>> you please
>> double check that HFS+ should be fixed too?
>>
> Yes, I will check it tomorrow in addition to running xfstests and report 
> my findings in response to this email. But I'm not sure if my solution 
> would be the attended fix or a similar solution to what christian did is 
> preferred instead for HFS+. We'll discuss it when I send a response.
>> Thanks,
>> Slava.
>>
> Thank you for your insights Slava!
> 
> Best Regards,
> Mehdi Ben Hadj Khelifa

>>> +    .kill_sb    = hfs_kill_sb,
>>>       .fs_flags    = FS_REQUIRES_DEV,
>>>       .init_fs_context = hfs_init_fs_context,
>>>   };
>>
>> [1] https://github.com/hfs-linux-kernel/hfs-linux-kernel/issues
>> [2] https://elixir.bootlin.com/linux/v6.18-rc6/source/fs/hfsplus/ 
>> super.c#L694
> 

