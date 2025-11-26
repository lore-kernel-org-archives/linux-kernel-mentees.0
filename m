Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0569304BBF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Nov 2025 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764169622; cv=none; b=HiEruj42LRSvH6cgHXjNYT7EcjEf57xEJZ8m8uiE+6BK5WYmoxOlpXpET82fVwBx7dObM87MY5B3cKNuS95gk4nCyreJe5+6Djm2+lweb0JNHChmx/5ro2nFLLMW0jWzwRwprDLJt/BgZOcF56tiXC8cR94FFOnDJTuhaEcAMzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764169622; c=relaxed/simple;
	bh=mcPKLhMvHagy1WJT/pUQlmEU63E3rHGweCxYawVZK7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNhuyq0bGsQVd61xQKWqe3OYW/qfF7AKZ+7nbCjjZDItJxMIlryinDwsSg+pgWxXWbwygo3d/fvqdG5ee5eSeCMgv+WFTrBOt+gMP5LMdCeBRWJySLVDrvDY7CGIbvDzFm8gJY9IL1iTA33LNFNRVTIlbFAj+7PbQ3oEmqAsEFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5kQaOWR; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5kQaOWR"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A55A412CE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Nov 2025 15:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwMZbLc-etOO for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Nov 2025 15:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6BE73412CD
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BE73412CD
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=c5kQaOWR
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6BE73412CD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Nov 2025 15:06:59 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779fd615a3so5411825e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Nov 2025 07:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764169617; x=1764774417; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16S+92pxDzqHzQvEHk+W0SGiRWFobBQtwlTDSX4bj6Y=;
        b=c5kQaOWRtXTloCnS7dGrTj1srtaOUovYz2Fm7HQs/t/FS1S3ueKxdcGFu4pNkWSTPW
         h1pi50wXjZFD4g7Tq7wIu8cOmB5EMFRCoRCso7mYaX9ng6wKxNC+OcBAMmvafAWli5of
         Sc5dv6MhNE8h9WGsc1QoxnIEUOs05wvrQtGzhff+M5UyYBmfFSd8bj44jtfq/qE9HDjj
         ajj9kCIthvp+OQnu3FqkgQOEk9+zdf6gGKM0UtjLd+oGMkU/ccUUEh/vKpw2eTYCLoPB
         F7sMBJRPRVcqMjo1mhHaRmOosvbMv/v5greAMe39D/BTQHBUaaB7P1fsVP2vLke1vX7L
         JALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764169617; x=1764774417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16S+92pxDzqHzQvEHk+W0SGiRWFobBQtwlTDSX4bj6Y=;
        b=epRAbaTn0hAdp8Ix8u5nDga4tjs6opgbhEwg2NScfzHbNvQz9tEDIchp7HtMqE29qh
         sJt53F9DqG4B4t5U/3+OHqxEt2dt2KH7cBWI4nE4sgiqiimm6sCFQQYIoF5KgN+lxdcO
         8PDtPMk3nbghtfzcYTQ/pvuVS+h3seW9TjBnddxKJrOBwKVAS5mTdNZ+ktK3eiT+iyUY
         xb40QMKruVdgxcE+qNJ+rXn4WEOM5+85NWkT6TBBYFUWrwhs8YPF7+oKfpAxnoXbB9OC
         Et9SlM4CJzV3FRHElc3DAcjZ2wLBGw+Qv7F+q+4/cNSPqcLZRKzqjJbMDEMQhYi2mc1A
         C8NA==
X-Forwarded-Encrypted: i=1; AJvYcCUREYcNsxF40GH4+EMeP8/eTVvhnmQCGC+5SMvSRh8R4uqZLT8XDf/0d8FMNDGhrwJRDd0BQxMteI0IdD/e66cjc0myAg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzQfIVTbI6xWCg4CfQHaDbFuqiJhFhFXU/bsI7ni8GzLk7UecFr
	N9UWRRHPvP5HuYRaQVwFc0IPMYBd8mHxncSi4kYuqFH0nXo2Kd+bKABL
X-Gm-Gg: ASbGncvltfGj91iFa5lacGyWqxIwyZs9amd+DH46rpkla+Me5Cl/HK5ijiIMCawmBVi
	jcnbiuRa4pFEL5VxbS7jwRwCrCFkXKW0VhXCUn6iMkR97at63qK8mqnVbNYzxKYRFFMgs4ndRzP
	6Esyj+pZQKhNjwOeBiwGpp23HyHf+yeWbpoCSFbVVgZDMLw4uGF7wgf07xo8ItQgBpnAu9OatKB
	QbqkJ49nI3EdgOo3OUAoT7OBAsY1P+7R6JXGE+sCTUXDaD0dK4p4xRnrlD2mfJb05h9Ehu5hr/B
	vVc8FNow0yfO51YNicCWlP6MReENK6YIIVhn+5Ri8TWPqHnCqzkvzYR3V/LT2ZpdrNCMxOFx/BK
	A2zxNVjHBOJHFaRpL2LbCDgfUQH0/JuQi1373VHWGFjRejJxI6F3KuHz+Mn35b7ueH0mlenylBv
	7097A+YJ5AK8WLd9Rs6x66hvCyZCFjqQ==
X-Google-Smtp-Source: AGHT+IHLJQtnOrQIqHTS6ZGn2BqHnmibcb1tF6cwMKDudSdfcrV8sfkTLUNEh2Gbp5Vi4ArcWVva6Q==
X-Received: by 2002:a05:600c:4f51:b0:477:a977:b8a0 with SMTP id 5b1f17b1804b1-477c01ba7d6mr131441845e9.3.1764169617033;
        Wed, 26 Nov 2025 07:06:57 -0800 (PST)
Received: from [192.168.1.105] ([165.50.65.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade12cesm65565045e9.9.2025.11.26.07.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 07:06:56 -0800 (PST)
Message-ID: <04d3810e-3d1b-4af2-a39b-0459cb466838@gmail.com>
Date: Wed, 26 Nov 2025 17:06:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/hfs: fix s_fs_info leak on setup_bdev_super()
 failure
To: Christian Brauner <brauner@kernel.org>,
 Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Cc: "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
 "frank.li@vivo.com" <frank.li@vivo.com>,
 "slava@dubeyko.com" <slava@dubeyko.com>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "jack@suse.cz" <jack@suse.cz>, "khalid@kernel.org" <khalid@kernel.org>,
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
 <20251126-gebaggert-anpacken-d0d9fb10b9bc@brauner>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <20251126-gebaggert-anpacken-d0d9fb10b9bc@brauner>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/25 2:48 PM, Christian Brauner wrote:
> On Wed, Nov 19, 2025 at 07:58:21PM +0000, Viacheslav Dubeyko wrote:
>> On Wed, 2025-11-19 at 08:38 +0100, Mehdi Ben Hadj Khelifa wrote:
>>> The regression introduced by commit aca740cecbe5 ("fs: open block device
>>> after superblock creation") allows setup_bdev_super() to fail after a new
>>> superblock has been allocated by sget_fc(), but before hfs_fill_super()
>>> takes ownership of the filesystem-specific s_fs_info data.
>>>
>>> In that case, hfs_put_super() and the failure paths of hfs_fill_super()
>>> are never reached, leaving the HFS mdb structures attached to s->s_fs_info
>>> unreleased.The default kill_block_super() teardown also does not free
>>> HFS-specific resources, resulting in a memory leak on early mount failure.
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
>>> Link:https://lore.kernel.org/all/20251114165255.101361-1-mehdi.benhadjkhelifa@gmail.com/
>>>
>>> Note:This patch might need some more testing as I only did run selftests
>>> with no regression, check dmesg output for no regression, run reproducer
>>> with no bug and test it with syzbot as well.
>>
>> Have you run xfstests for the patch? Unfortunately, we have multiple xfstests
>> failures for HFS now. And you can check the list of known issues here [1]. The
>> main point of such run of xfstests is to check that maybe some issue(s) could be
>> fixed by the patch. And, more important that you don't introduce new issues. ;)
>>
>>>
>>>   fs/hfs/super.c | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/fs/hfs/super.c b/fs/hfs/super.c
>>> index 47f50fa555a4..06e1c25e47dc 100644
>>> --- a/fs/hfs/super.c
>>> +++ b/fs/hfs/super.c
>>> @@ -49,8 +49,6 @@ static void hfs_put_super(struct super_block *sb)
>>>   {
>>>   	cancel_delayed_work_sync(&HFS_SB(sb)->mdb_work);
>>>   	hfs_mdb_close(sb);
>>> -	/* release the MDB's resources */
>>> -	hfs_mdb_put(sb);
>>>   }
>>>   
>>>   static void flush_mdb(struct work_struct *work)
>>> @@ -383,7 +381,6 @@ static int hfs_fill_super(struct super_block *sb, struct fs_context *fc)
>>>   bail_no_root:
>>>   	pr_err("get root inode failed\n");
>>>   bail:
>>> -	hfs_mdb_put(sb);
>>>   	return res;
>>>   }
>>>   
>>> @@ -431,10 +428,21 @@ static int hfs_init_fs_context(struct fs_context *fc)
>>>   	return 0;
>>>   }
>>>   
>>> +static void hfs_kill_sb(struct super_block *sb)
>>> +{
>>> +	generic_shutdown_super(sb);
>>> +	hfs_mdb_put(sb);
>>> +	if (sb->s_bdev) {
>>> +		sync_blockdev(sb->s_bdev);
>>> +		bdev_fput(sb->s_bdev_file);
>>> +	}
>>> +
>>> +}
>>> +
>>>   static struct file_system_type hfs_fs_type = {
>>>   	.owner		= THIS_MODULE,
>>>   	.name		= "hfs",
>>> -	.kill_sb	= kill_block_super,
>>
>> It looks like we have the same issue for the case of HFS+ [2]. Could you please
>> double check that HFS+ should be fixed too?
> 
> There's no need to open-code this unless I'm missing something. All you
> need is the following two patches - untested. Both issues were
> introduced by the conversion to the new mount api.
Yes, I don't think open-code is needed here IIUC, also as I mentionned 
before I went by the suggestion of Al Viro in previous replies that's my 
main reason for doing it that way in the first place.

Also me and Slava are working on testing the mentionned patches, Should 
I sent them from my part to the maintainers and mailing lists once 
testing has been done?

Best Regards,
Mehdi Ben Hadj Khelifa
