Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7BB364EBF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566071; cv=none; b=pS9Enw/eyuXjczRt0vur4JYtZIcffM+n9zZgg0dIarY2dKu8ux+kNirXNToN87M/hMQyruXHJu2OyjvZB1TZyVpNJDGoWmiZJ3voGvGLexKpCSCimYnalwTU0EnMlrdv3SFTLcUarldGnr2BcItWppvNW1kIyMU1E46y4nRj9js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566071; c=relaxed/simple;
	bh=zc0c92v94+c39p1GxVGMWNJwmp8GnlSUT+L0SN1NYIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fL0DTnr71Wx0DeDvKnw8giiPdS1CQuVXzSnXAEoIqObQWnbsTwI1oIKnxYsJHGlnl0sS+//3tNb0csKqt/4xDgAxa7OJ6h5XcrY9LPO5xDVpJ0ZBV822+uJeQYozcWCdrbxewaDRKdlDRdYkOiTIWSdiaam7iA7CnAvrnkaOCEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2W9hN1s; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2W9hN1s"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 082A084025
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 15:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZYD4e-3Aq5i for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Nov 2025 15:27:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3231284013
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3231284013
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P2W9hN1s
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3231284013
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 15:27:49 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42b2dd19681so813757f8f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 07:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763566067; x=1764170867; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8koxPyuC5jyMlaKzeByoi15oYsrGRaCW8yGrTb2Etg4=;
        b=P2W9hN1sG9hkBl1lIDNkwAsy7TY1niZhEeartJvYuHiqG/Zqm+bm3eQGajmvHVkuM+
         rWAsrxxWeJfkWjh+yHz/Ml54Lg/KENYlh8YYno4jkM9eCO4Kdlf1GSNjcLCn01ilp0BS
         NjLCDGEkt85QGZGBdtNZ9+xsEndtuEuLDwTv8PudOhdyyjAizeTVrckhmWqDcJCI+h5t
         fnA7FBtQfguRaFDv/yugtw1cRcchwM0QJX2cQFbJQXPXoZSQG+XQq7p2RgcfDSuTvByk
         2eUnDSl6m8s3wM7TITKOHFVIC5Bl1iyUsfTUiPOj7vxpQfAOYc3mzpJPjiTu/zO9LKj1
         u+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566067; x=1764170867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8koxPyuC5jyMlaKzeByoi15oYsrGRaCW8yGrTb2Etg4=;
        b=TIdO5QEY2JMc6xys3qd4bcQd5YG2jmyhC3chvrg53eb/XjowQa/hZgC8V34qB41ogc
         xnLs65JOrxzT2GH7lvm6cnG6ejRcZg6Mpbt5iFiQgznoLrueqXc3KUqsJrIB7eZzknfn
         1ch8StAO1Dde5JFo0ElWjNd/dfT+38qdNS5emjxSxu0xKK1CuEJHOLQVAPSaGYSQaJfZ
         Uff3x8v5F+guESWQ1Cj1Y1s567zk52PxlZeWUFU4Dh0AK3Cjm2ORMQuvl65nrJexFDNJ
         OnqwRAYg0qDERnMw0hd/4ESSf8Zh6xGUIB5EGAXjg9M7k4QFs1ljwTD7oQCeV2bV9Fhg
         n8hg==
X-Forwarded-Encrypted: i=1; AJvYcCV3JHAa6ysXeAkCK2K+VKMQft1xbvJ/q1Dt9SL5Qkk1n9WaJHpNbwGoKSq4KbHA2x/p4jZikNUb8nX391F3kMupLqOrkw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywt7deVkmDvS1pdRUlJ0AMmEYEwNFSM4Bxg9M35CfR9mHRvtsRd
	1h5nX0BTCvT2B73FwrOvA486unhF7y7kin9nRi4gR36jULVLRTbLJQvO
X-Gm-Gg: ASbGncsDwyT13UpfnKD2B2bdTzbMmbC8uuyQgfUyH8Qv/xskSm7BIrgzuz/E/tT1cJp
	7k/qPyof7LAhFkNNV+5o0kbMyABS1RzCdcAMhB+uMhZT+fTyja6fCcwyh2E9EHGuMXEifCgl6Q4
	QUPk8K9jow3DcUbBP8C6SElVQjHjATtO6P0XvbNmwFzEdDjqcZaMIoEOwPAxYatjBZJvjfojR1/
	YkyNnTX3lxVUQVk06jiJboRI12v4PegZyXpYQmbmM350JzYYsT6HAtssaenoc8SvcOf9T9LLuL7
	ImQZkhOTPxJJ+ML2AXZyNdoOKJL3kgYmRtq2cqaXI22AcEif5huEjshUCWfLUj920fcv1+TWlrW
	D+9EtGgRPxnp8w1JTPu+OZH/Tss+KQAZwC8ww3peIS1lkW72deq8YNqDiEfpn8hJC3iqxaa+nRl
	g90Hex2PxnRqBQIlNt1TJShm/BstKUXnw=
X-Google-Smtp-Source: AGHT+IGmcs/ijfQpxwyqnmCNTQIUwm9J8y0zVTa9t7azKCtRyKlkdqKG6wKiny9IvR5MH+HFqGC4kQ==
X-Received: by 2002:a05:6000:4010:b0:42b:3ad7:fdbb with SMTP id ffacd0b85a97d-42caa05f14bmr4061111f8f.3.1763566066814;
        Wed, 19 Nov 2025 07:27:46 -0800 (PST)
Received: from [192.168.1.111] ([165.50.116.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm38958846f8f.3.2025.11.19.07.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:27:46 -0800 (PST)
Message-ID: <dc78b78d-14fc-456d-ae21-e79225b77afa@gmail.com>
Date: Wed, 19 Nov 2025 16:27:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/hfs: fix s_fs_info leak on setup_bdev_super()
 failure
To: Christian Brauner <brauner@kernel.org>
Cc: slava@dubeyko.com, glaubitz@physik.fu-berlin.de, frank.li@vivo.com,
 jack@suse.cz, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
References: <20251119073845.18578-1-mehdi.benhadjkhelifa@gmail.com>
 <20251119-delfin-bioladen-6bf291941d4f@brauner>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <20251119-delfin-bioladen-6bf291941d4f@brauner>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/25 3:14 PM, Christian Brauner wrote:
> On Wed, Nov 19, 2025 at 08:38:20AM +0100, Mehdi Ben Hadj Khelifa wrote:
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
> 
> I don't think that's correct.
> 
> The bug was introduced when hfs was converted to the new mount api as
> this was the point where sb->s_fs_info allocation was moved from
> fill_super() to init_fs_context() in ffcd06b6d13b ("hfs: convert hfs to
> use the new mount api") which was way after that commit.
Ah, That then is definitely the cause since the allocation is from 
init_fs_context() and in this error path that leaks it didn't call 
fill_super() yet where in old code would be the allocation of the 
s_fs_info struct that is being leaked... so that would be where the bug 
is introduced as you have mentionned thanks for pointing that out!

> 
> I also think this isn't the best way to do it. There's no need to
> open-code kill_block_super() at all.
> 
I did think do call kill_block_super() instead in hfs_kill_sb() instead 
of open-coding it but I went with what Al Viro has suggested...
> That whole hfs_mdb_get() calling hfs_mdb_put() is completely backwards
> and the cleanup labels make no sense - predated anything you did ofc. It
> should not call hfs_mdb_put(). It's only caller is fill_super() which
> already cleans everything up. So really hfs_kill_super() should just
> free the allocation and it should be moved out of hfs_mdb_put().
> 
I also thought of such solution to make things clearer of the 
deallocation of the memory of s_fs_info and to separate it from the 
deloading/freeing of it's contents.
> And that solution is already something I mentioned in my earlier review.
I thought you have suggested the same as what the al viro has suggested 
by your second point here:"
or add a wrapper
around kill_block_super() for hfs and free it after ->kill_sb() has run.
"

> Let me test a patch.
I just checked your patch and seems to be what I'm thinking about except 
the stuff that is in hfs_mdb_get() which I didn't know about.But since 
the hfs_kill_super() is now implemented with freeing the s_fs_info 
instead of just referring to kill_block_super(), It should fix the issue.

I did just download your patch and test it by running local repro, boot 
the kernel, run selftests before and after with no seen regression.Does 
that add the Tested-by tag?

Thanks for you insights Christian! Tell me if I should send something as 
a follow up for my patch.

Best Regards,
Mehdi Ben Hadj Khelifa
