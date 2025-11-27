Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C15C271451
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 27 Nov 2025 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764265550; cv=none; b=M1ANGoFNa2G2k8+lIiyRGoUYxaIkY6sWKXyE8KyzztUoUqMhKDJEEM3aaeBR0HcwOa4MRgCJtoAJw3+JYk4jnsBbvLCfPkMp8k353gAmLmO8Ip8nHHYUtBnD+wkYOJv6hPrHdLnNBRc01/GRjZQQ2MQyGsP5aJH3MK2ZWlZwto8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764265550; c=relaxed/simple;
	bh=/5bTrUTo1hp6AomrEpUhj2Jso2e7C+GG+bcvscM6MvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CksZNHKGki2ep9s8npV8ILzTc/HYQSPzmdefYFI0n7raSwih/Dbiaxm0tVU04d8IruDSvi6W1M7rRl3sLSLgsDV5Gn4jMRGtoU+3GTQYpBo7sgcdNZWAQAN1eX/o5StCL9T/bX12dnpaJpNfDesZ5yiXKayoKMyBayCdAcsNEcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XALnT5uj; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XALnT5uj"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18BD740355
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 27 Nov 2025 17:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjB3NuCR7p8j for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Nov 2025 17:45:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=david.hunter.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07754401D8
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07754401D8
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XALnT5uj
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 07754401D8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 27 Nov 2025 17:45:47 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-78a6c7ac3caso11773227b3.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 27 Nov 2025 09:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764265547; x=1764870347; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dw23OvbiBexM5q44SEBjv++H4KRk+HfIKqyH0Ivsb2E=;
        b=XALnT5uj8/DVAupsCF9Wui+xOVL0ug3Mu2MUPad0Xif8a5q3C+MQroxbQi/EhbnOz+
         SzGbtMvB+JTQN6NLxnn9LM3zONlboJygnBnNhpb7surDWOFviGXtSl+DGqQw9b8eGq8T
         9aFkdEtFuNouDQWdi7+ZdtNtEQSAwilmx5+vw3jDnGm43nzO0jQujGlVlul3EllTXJHf
         WOmLMTtesgA3TnQZ2qGo+Zvx8oxGmlBnN1w9NWLnyqr+JaHP7nbfnlE/XxMjywHQNZBX
         lnHJ93M5TummPtA/uq9774VBuvuz02IZP7UyZHbIUnybaJYGXBS+BvajKr94ksLtbfo+
         RaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764265547; x=1764870347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dw23OvbiBexM5q44SEBjv++H4KRk+HfIKqyH0Ivsb2E=;
        b=e65vz/s9CXuR4Cufg/Q0cRxWSpd/Nn0ocQi2ocujS90lpjsaEIr/DfJ1MyUOXxXLXm
         P7+gn/MM84YpE6NijMmLaqq9Ub2gZ+OvuTvYcsB8Y4QreqqhONKU16sP/TIDx2S1ZRl7
         btDc4yEzGgo6HzZA7jWmpRzscBrVt2PQ7TKYowzLglJifRUzsAZ5WsA6XQHErpfoc9Bn
         a9kVzSCz3gpFgXnihMA0j4Pi0nMjfEp8tyTBA0LHtlCMXAhksdSC3oOLbsZxUuoBGq83
         L1hAKiyZYm2IeyWLMqyisRMbFQ1qbOhqNF+EiVmPfcCGbu70kik3tWXk+Rp0Resjsy16
         sLig==
X-Gm-Message-State: AOJu0YzkQWgpVal8YqN1iEAqmNAbVGbCoKRiYjx2YfC2KJMLsAYtj6nI
	qMIeH3oWUV5o2/R4zQTFNs5O2+5snb2AL5fgMUOwW9YogpDlCv7SGqT9
X-Gm-Gg: ASbGncs5rnLZe0Fh7cApJDGeDwoEkKnHE+D/QkpiUzPdXxROTKjRM/rco10TMNMCSRT
	6JOEcom9uztJLZ8NZq2igr8m6o0KVGlH23c2dBnI+bXY6y2GNYqoyvWvFCo807A8kxwOMXP6wFi
	V67VWTBukYkrL6So0J0Mw27qIkwvcKGiMY00rsuQOJEn6UiZeOcWW9yvsnim25AKGh5Qq4BjbLZ
	ZJlh5YfJLsacFzb1Ah0VoLzIXBATcZ9FkvzUfE5vp7ig1xn7X/rKZvC41yQHcgeZKQElInpxuqv
	DST/WAZPflzou1e/m/3Gmvw3oNIYNSk99aD9GwhPAzsE09G1XT+fMJZN3biBBHc6wBt+rFwVOrn
	zdPDy2of3+z3rVaa2xQ3rm/iDL8W/OfhohctriNim9UMA/t92vZX1CVzLt6M8fpnI14RI3Ga5Kj
	4Hpe63Zkvom9ICHhTenWJRxfMNy+h4pEDriW/So8pJ2IJRccHyCmZeGCOrUjWA9i+v8cfK
X-Google-Smtp-Source: AGHT+IE0T7rmlrwqWPDjoBIJMTLXVlFNSJ6R7kQFjQxQPS/zSqCb+I/hME9ZcYQ0vif9XXMsnOulaQ==
X-Received: by 2002:a05:690c:d92:b0:787:c621:d678 with SMTP id 00721157ae682-78a8b53a7acmr205588097b3.58.1764265546562;
        Thu, 27 Nov 2025 09:45:46 -0800 (PST)
Received: from ?IPV6:2600:381:6a1e:8e2d:1d4d:5b1d:d0a8:2d05? ([2600:381:6a1e:8e2d:1d4d:5b1d:d0a8:2d05])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad102dd77sm7541487b3.47.2025.11.27.09.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 09:45:46 -0800 (PST)
Message-ID: <a3b93b9e-f0ea-428d-9a10-07f345e139a7@gmail.com>
Date: Thu, 27 Nov 2025 12:45:42 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/hfs: fix s_fs_info leak on setup_bdev_super()
 failure
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>, "jack@suse.cz" <jack@suse.cz>,
 "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
 "slava@dubeyko.com" <slava@dubeyko.com>,
 "frank.li@vivo.com" <frank.li@vivo.com>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "khalid@kernel.org" <khalid@kernel.org>,
 "syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com"
 <syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com>
References: <20251119073845.18578-1-mehdi.benhadjkhelifa@gmail.com>
 <c19c6ebedf52f0362648a32c0eabdc823746438f.camel@ibm.com>
 <3ad2e91e-2c7f-488b-a119-51d62a6e95b8@gmail.com>
 <8727342f9a168c7e8008178e165a5a14fa7f470d.camel@ibm.com>
 <15d946bd-ed55-4fcc-ba35-e84f0a3a391c@gmail.com>
 <148f1324cd2ae50059e1dcdc811cccdee667b9ae.camel@ibm.com>
 <6ddd2fd3-5f62-4181-a505-38a5d37fa793@gmail.com>
 <960f74ac4a4b67ebb0c1c4311302798c1a9afc53.camel@ibm.com>
 <28fbe625-eb1b-4c7f-925c-aec4685a6cbf@gmail.com>
 <218c654fc2cad8f6acac1530d431094abb1bffbe.camel@ibm.com>
 <b2fcff21-2b5a-486a-976f-4a5ff4337d72@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <b2fcff21-2b5a-486a-976f-4a5ff4337d72@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/25 17:14, Mehdi Ben Hadj Khelifa wrote:
> On 11/22/25 12:01 AM, Viacheslav Dubeyko wrote:
>> On Sat, 2025-11-22 at 00:36 +0100, Mehdi Ben Hadj Khelifa wrote:
>>> On 11/21/25 11:28 PM, Viacheslav Dubeyko wrote:
>>>> On Sat, 2025-11-22 at 00:16 +0100, Mehdi Ben Hadj Khelifa wrote:
>>>>> On 11/21/25 11:04 PM, Viacheslav Dubeyko wrote:
>>>>>> On Fri, 2025-11-21 at 23:48 +0100, Mehdi Ben Hadj Khelifa wrote:
>>>>>>> On 11/21/25 10:15 PM, Viacheslav Dubeyko wrote:
>>>>>>>> On Fri, 2025-11-21 at 20:44 +0100, Mehdi Ben Hadj Khelifa wrote:
>>>>>>>>> On 11/19/25 8:58 PM, Viacheslav Dubeyko wrote:
>>>>>>>>>> On Wed, 2025-11-19 at 08:38 +0100, Mehdi Ben Hadj Khelifa wrote:
>>>>>>>>>>>
>>
>> <skipped>
>>
>>>>>>>>
>>>>>>> IIUC, hfs_mdb_put() isn't called in the case of hfs_kill_super() in
>>>>>>> christian's patch because fill_super() (for the each specific
>>>>>>> filesystem) is responsible for cleaning up the superblock in case of
>>>>>>> failure and you can reference christian's patch[1] which he
>>>>>>> explained
>>>>>>> the reasoning for here[2].And in the error path the we are trying to
>>>>>>> fix, fill_super() isn't even called yet. So such pointers
>>>>>>> shouldn't be
>>>>>>> pointing to anything allocated yet hence only freeing the pointer
>>>>>>> to the
>>>>>>> sb_info here is sufficient I think.
>>>>
>>>> I was confused that your code with hfs_mdb_put() is still in this
>>>> email. So,
>>>> yes, hfs_fill_super()/hfsplus_fill_super() try to free the memory in
>>>> the case of
>>>> failure. It means that if something wasn't been freed, then it will
>>>> be issue in
>>>> these methods. Then, I don't see what should else need to be added
>>>> here. Some
>>>> file systems do sb->s_fs_info = NULL. But absence of this statement
>>>> is not
>>>> critical, from my point of view.
>>>>
>>> Thanks for the input. I will be sending the same mentionned patch after
>>> doing testing for it and also after finishing my testing for the hfs
>>> patch too.
>>>>
>>
>> I am guessing... Should we consider to introduce some xfstest, self-
>> test, or
>> unit-test to detect this issue in all Linux's file systems family?
>>
> Yes, It isn't that hard either IIUC you just need to fail the
> bdev_file_open_by_dev() function somehow to trigger this error path..
>> Thanks,
>> Slava.
> 
> So I wanted to update you on my testing for the hfs patch and the
> hfsplus patch. For the testing I used both my desktop pc and my laptop
> pc running the same configuraitons and the same linux distribution to
> have more accurate testing. There are three variants that I used for
> testing : A stable kernel, 6.18-rc7 kernel with no patch, 6.18-rc7
> kernel with hfs or hfsplus patch.
> 
> Firstly, I couldn't run the hfs tests due to mkfs.hfs being unavailable
> in my search for it. they all point to mkfs.hfsplus and you pointed out
> that mkfs.hfsplus can create hfs filesystems with the -h flag but in my
> case it doesn't. I pointed out last time that I found a tool to create
> HFS filesystems which it does (it's called hformat) but the xfstests
> require the availability of mkfs.hfs and fsck.hfs for them to run. More
> help on this is needed for me to run hfs tests. I also tested ext4 as
> you have suggested as a base to compare to. Here is my summary of testing:
> 
> For Stable kernel 6.17.8:
> 
> On desktop:
> ext4 tests ran successfully.
> hfsplus tests crash the pc around generic 631 test.
> 
> On Laptop:
> ext4 and hfsplus tests ran successfully.
> 
> For 6.18-rc7 kernel:
> 
> On desktop:
> ext4 tests ran successfully same results as the stable kernel.
> hfsplus crashes on testing startup.For launching any test.
> 
> On Laptop:
> ext4 tests ran successfully same results as the stable kernel.
> hfsplus crashes on testing startup.For launcing any test.
> 
> 
> For the patched 6.18-rc7 kernel.
> 
> Same results for both desktop and laptop pcs as in the 6.18-rc7 kernel.
> 
> 
> Should be noted that I have tried many different setups regarding the
> devices and their creation for the 6.18-rc7 kernel and none of them
> worked.Still I can't deduce what is causing the issue.If they work for
> you, my only assumption is that some dependency of xfstests is not met
> on my part even though I made sure that I do cover them all especially
> with repeatedly failed testing...
> 
> What could be the issue here on my end if you have any idea?
> 
> Also should I send you the hfsplus patch in one of my earlier replies[1]
> for you to test too and maybe add it to hfsplus?
> 
> Best Regards,
> Mehdi Ben Hadj Khelifa
> 
> [1]:https://lore.kernel.org/all/3ad2e91e-2c7f-488b-
> a119-51d62a6e95b8@gmail.com/
> 
> 
> 
> 
> 
> 

Hey everyone,

I am helping Shuah with the Linux Kernel Mentorship Program. I wanted to
report that many mentees have also had problems with xfstests recently.

I am tracking what happens here, so I can help future developers, but I
just wanted to let everyone know that others are also having issues with
xfstests.

Also, Mehdi, by any chance have you used any of the configuration
targets like "localmodconfig". I am wondering if something in your
configuration file is missing.

Thanks,
David Hunter
