Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273ED30E82B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Nov 2025 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764417994; cv=none; b=jH65UHKftfJ4pwknBUMj72TJw3A7/8IUw0JY/eHTVBbsfHd8YfWaStV8Hh0UZRHJ0ulwoMjLnjtxKox6HUlF9O1f4M7HwsqnXWKYShnG02waDtjuTt46IhCsn83lTfh4Z/fre58eHDSQIcxOSO2WRr2SylSyRujn2HVLNxIPN+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764417994; c=relaxed/simple;
	bh=8N5fIIAs1wTrl4tZoQSpBPclrdySFFvO+N+LWQHrm2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVNE5sOwDCEOxQ5S3G27OXK634zaixD0g0oWmVnx1ZLx6qUUAgC061lbYhypPdjYIqOt++J8sGcNvhGl/bS1ehiMKWyZPoY2/0hz8G9P5CLI0tObDM1//wjF56aR3ibK6FXGGysEBkRotLuBL3xag/mpJAW/zmd65HT4TDrJDfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+EgaRDi; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+EgaRDi"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACD284028D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Nov 2025 12:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCz6t4iL62f1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Nov 2025 12:06:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6822940260
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6822940260
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l+EgaRDi
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6822940260
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Nov 2025 12:06:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42b54f690b0so136979f8f.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Nov 2025 04:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764417989; x=1765022789; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFdpFUjeuYya488Uw2LSyM1xV4mFxGyC/pjh5yJHqVE=;
        b=l+EgaRDiZEqmfGPm3FIeQiG2GBrw3rK4zcAqpSerpXdS60zHIdGHoPafTTgaovfVpT
         yWeC4aDyLNn9JRl/hr6tIklK/9znTq8scEkEdRq3CdBMw0hq+WTMmEbQDnoSWwCi5fVg
         a3YiE99L+BoHSqI8NAL2kKZCYPivKrPSMEy3RqKBnfZzisoybfron/2W8paU+iosNnM4
         TXn0pPE8gcU/gkbR6UHFWlwm1TCiLVPIsfEgGBGaab5+EHwmszBxSAWCT9mXCZw2ghtG
         TYcdZFDam3nozN0tVfxlx3eV8WV9pL0nJ1uWOkD5YymZYPWIMHVO4PDZxyu2bSwyzSqO
         WXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764417989; x=1765022789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFdpFUjeuYya488Uw2LSyM1xV4mFxGyC/pjh5yJHqVE=;
        b=LiB69Jw/kcN1X5OatBmwR91CsP8P//KXabrswYS1G5/OWnp2tNERUQWEIswwVK8Wk7
         QwYdPz1IEk0HvG7NH6xvjDleN7KIOHCRhEtrfNFJrAEI7VumVlaswgtygI/qMLcFeB1D
         SydLkQ62DcxcomtJiKtYxW1iHtQJP/ToRfUCMYdNErSpTYMgBhG3xupdT+Kzr5/06fv/
         BSGFZP4yhIhv3At3k0H0scnNiaoiM+xX6F4ZpD836JmrbD8Mvb1Y2CkIOR5GTLsqNE/X
         agFRn2p/MI6dmW3SuZk9G28NKqGYay+Q82F2+zZN+w+ax6/wIG+ZZVrPzs/LbXQGmrvs
         BP+A==
X-Gm-Message-State: AOJu0YzgT246gY35bK3qirz1NVWie1oWofk4C/gumYj28zXUSq33Tktg
	c+xp2Oymgkj2ElPqkljVDMDHNpPoZnfHTmnf9d8Iu4JGxmU3FIZw/sYn
X-Gm-Gg: ASbGncspmbwUz3RqIPgrGBsXzRh+2VqIJm2FYd/hpmSqwNYkrdWn+HdzVjDCu60liKP
	ypO1rNHLht3YMOOPfaPICUD7HZJ1YAvUcKmkgU02XpiRBPaCxHe+Njg28jgqj0foE+QvD+1D/bJ
	COVkCWYNIdTKeN6OcFaY3pcVYs06W/q1knZog2BHwFXHVVQjFgOy13kcewOYSpMR7DXVkhDKzxF
	926lwBd+t2lQWTvtwWSfSo/V+1pFpoXvnDunnvNnwWPSjN//QWr2Ynmlb9oZdHca6YDiAdwWpCW
	TD3IgIIJ/Qhyiuf8O0k87uDl/vYH862xR6OfRe9aEP8zbZ0TPnnf49uA5UZpj4dVe58a7jITtdp
	+MyCAyzEbOkqm1Fx/SUb1nfyBu5WAe1o5K48VgipKsvRawoD8+X1CGQdumNSccAritk5OraTRY+
	pID4p7yBqGdbXVEH3FfEI+OwFoqb+ktA==
X-Google-Smtp-Source: AGHT+IHQIe2ySkcpdD4lAHKBfpJWHfviZ9ZZRA6p1icKkcqqn5YDA3edfC96lI3JFD1h+khfTxYFGQ==
X-Received: by 2002:a05:600c:4443:b0:45f:2c33:2731 with SMTP id 5b1f17b1804b1-477c0169f1emr182523085e9.2.1764417989080;
        Sat, 29 Nov 2025 04:06:29 -0800 (PST)
Received: from [192.168.1.105] ([165.50.52.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052cfae0sm108457775e9.8.2025.11.29.04.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Nov 2025 04:06:28 -0800 (PST)
Message-ID: <bbb45390-58f0-4069-8b32-78d0242afdee@gmail.com>
Date: Sat, 29 Nov 2025 14:06:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/hfs: fix s_fs_info leak on setup_bdev_super()
 failure
To: David Hunter <david.hunter.linux@gmail.com>,
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
 <a3b93b9e-f0ea-428d-9a10-07f345e139a7@gmail.com>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <a3b93b9e-f0ea-428d-9a10-07f345e139a7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/25 6:45 PM, David Hunter wrote:
> On 11/25/25 17:14, Mehdi Ben Hadj Khelifa wrote:
>> On 11/22/25 12:01 AM, Viacheslav Dubeyko wrote:
>>> On Sat, 2025-11-22 at 00:36 +0100, Mehdi Ben Hadj Khelifa wrote:
>>>> On 11/21/25 11:28 PM, Viacheslav Dubeyko wrote:
>>>>> On Sat, 2025-11-22 at 00:16 +0100, Mehdi Ben Hadj Khelifa wrote:
>>>>>> On 11/21/25 11:04 PM, Viacheslav Dubeyko wrote:
>>>>>>> On Fri, 2025-11-21 at 23:48 +0100, Mehdi Ben Hadj Khelifa wrote:
>>>>>>>> On 11/21/25 10:15 PM, Viacheslav Dubeyko wrote:
>>>>>>>>> On Fri, 2025-11-21 at 20:44 +0100, Mehdi Ben Hadj Khelifa wrote:
>>>>>>>>>> On 11/19/25 8:58 PM, Viacheslav Dubeyko wrote:
>>>>>>>>>>> On Wed, 2025-11-19 at 08:38 +0100, Mehdi Ben Hadj Khelifa wrote:
>>>>>>>>>>>>
>>>
>>> <skipped>
>>>
>>>>>>>>>
>>>>>>>> IIUC, hfs_mdb_put() isn't called in the case of hfs_kill_super() in
>>>>>>>> christian's patch because fill_super() (for the each specific
>>>>>>>> filesystem) is responsible for cleaning up the superblock in case of
>>>>>>>> failure and you can reference christian's patch[1] which he
>>>>>>>> explained
>>>>>>>> the reasoning for here[2].And in the error path the we are trying to
>>>>>>>> fix, fill_super() isn't even called yet. So such pointers
>>>>>>>> shouldn't be
>>>>>>>> pointing to anything allocated yet hence only freeing the pointer
>>>>>>>> to the
>>>>>>>> sb_info here is sufficient I think.
>>>>>
>>>>> I was confused that your code with hfs_mdb_put() is still in this
>>>>> email. So,
>>>>> yes, hfs_fill_super()/hfsplus_fill_super() try to free the memory in
>>>>> the case of
>>>>> failure. It means that if something wasn't been freed, then it will
>>>>> be issue in
>>>>> these methods. Then, I don't see what should else need to be added
>>>>> here. Some
>>>>> file systems do sb->s_fs_info = NULL. But absence of this statement
>>>>> is not
>>>>> critical, from my point of view.
>>>>>
>>>> Thanks for the input. I will be sending the same mentionned patch after
>>>> doing testing for it and also after finishing my testing for the hfs
>>>> patch too.
>>>>>
>>>
>>> I am guessing... Should we consider to introduce some xfstest, self-
>>> test, or
>>> unit-test to detect this issue in all Linux's file systems family?
>>>
>> Yes, It isn't that hard either IIUC you just need to fail the
>> bdev_file_open_by_dev() function somehow to trigger this error path..
>>> Thanks,
>>> Slava.
>>
>> So I wanted to update you on my testing for the hfs patch and the
>> hfsplus patch. For the testing I used both my desktop pc and my laptop
>> pc running the same configuraitons and the same linux distribution to
>> have more accurate testing. There are three variants that I used for
>> testing : A stable kernel, 6.18-rc7 kernel with no patch, 6.18-rc7
>> kernel with hfs or hfsplus patch.
>>
>> Firstly, I couldn't run the hfs tests due to mkfs.hfs being unavailable
>> in my search for it. they all point to mkfs.hfsplus and you pointed out
>> that mkfs.hfsplus can create hfs filesystems with the -h flag but in my
>> case it doesn't. I pointed out last time that I found a tool to create
>> HFS filesystems which it does (it's called hformat) but the xfstests
>> require the availability of mkfs.hfs and fsck.hfs for them to run. More
>> help on this is needed for me to run hfs tests. I also tested ext4 as
>> you have suggested as a base to compare to. Here is my summary of testing:
>>
>> For Stable kernel 6.17.8:
>>
>> On desktop:
>> ext4 tests ran successfully.
>> hfsplus tests crash the pc around generic 631 test.
>>
>> On Laptop:
>> ext4 and hfsplus tests ran successfully.
>>
>> For 6.18-rc7 kernel:
>>
>> On desktop:
>> ext4 tests ran successfully same results as the stable kernel.
>> hfsplus crashes on testing startup.For launching any test.
>>
>> On Laptop:
>> ext4 tests ran successfully same results as the stable kernel.
>> hfsplus crashes on testing startup.For launcing any test.
>>
>>
>> For the patched 6.18-rc7 kernel.
>>
>> Same results for both desktop and laptop pcs as in the 6.18-rc7 kernel.
>>
>>
>> Should be noted that I have tried many different setups regarding the
>> devices and their creation for the 6.18-rc7 kernel and none of them
>> worked.Still I can't deduce what is causing the issue.If they work for
>> you, my only assumption is that some dependency of xfstests is not met
>> on my part even though I made sure that I do cover them all especially
>> with repeatedly failed testing...
>>
>> What could be the issue here on my end if you have any idea?
>>
>> Also should I send you the hfsplus patch in one of my earlier replies[1]
>> for you to test too and maybe add it to hfsplus?
>>
>> Best Regards,
>> Mehdi Ben Hadj Khelifa
>>
>> [1]:https://lore.kernel.org/all/3ad2e91e-2c7f-488b-
>> a119-51d62a6e95b8@gmail.com/
>>
>>
>>
>>
>>
>>
> 
> Hey everyone,
> 
> I am helping Shuah with the Linux Kernel Mentorship Program. I wanted to
> report that many mentees have also had problems with xfstests recently.
> 
> I am tracking what happens here, so I can help future developers, but I
> just wanted to let everyone know that others are also having issues with
> xfstests.
> 
> Also, Mehdi, by any chance have you used any of the configuration
> targets like "localmodconfig". I am wondering if something in your
> configuration file is missing.
> 
No I have not,Thanks for the suggestion.I have been messing with a lot 
of syzbot configurations but IIRC I always have made sure to make 
mrproper and copy my in use .config file before building for my pc.I 
still want to reproduce the same crash as I did before on my part now to 
see what caused the problem anyway but my assumption for the time being 
is that localmodconfig would fix it.

I will keep you updated on the matter too David.Thanks

> Thanks,
> David Hunter
Best Regards,
Mehdi Ben Hadj khelifa
