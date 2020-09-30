Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FD5C47426
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 16:21:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C6862072E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 16:21:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoKoM5hk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C6862072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 33EFE87223;
	Wed, 30 Sep 2020 16:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pM4-rIsxE2H6; Wed, 30 Sep 2020 16:21:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B585387224;
	Wed, 30 Sep 2020 16:21:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A02FAC0889;
	Wed, 30 Sep 2020 16:21:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6A3AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 16:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8ECD987224
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 16:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MXIosxK+5OM0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 16:21:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F3EAE87223
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 16:21:03 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id u24so1409358pgi.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 09:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1adC8Tkvj+zqWutRrTnpUxs4YYDIuCozInifjHCCiG4=;
 b=PoKoM5hkfHcJOUzAoToVpiuWu8svURVUi+lb9pwaOK5QDiPwjOi/8d+YhbsEUR6fth
 c7T0HRujiWA28AxgzdFwpi7jQ/kP6dF4LKU+cLRiGyxNiBRkeB8t+xs/GhHqBGkncib8
 9woS6WYIplUpEUWeL7VTd8uYq34Tx3FRKYyOkssDIOtmwL4a5cUj/w+s2QH0yYacUMzw
 qkFoRusDfmV5P5M9Dtog1LPUYjl+BUw4yoI7kGO31cHsJqeWf0ejaueZrrLD4aVWirAi
 FKikQnh1/fh/If9AgoRwizA3rrUdUI0RkPdoFCOvSY3fCTSDBrJOXOFJZ6dazPB87eXh
 yLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1adC8Tkvj+zqWutRrTnpUxs4YYDIuCozInifjHCCiG4=;
 b=D4sncyP4B8zxamiuawSHLJvIk208oFuT3La/GvfEqV4KomvM9VIkJMibxFTu724Izu
 R0azLnikLdiqD9Cd3U1dQripS6rFMVE5/NC9JeyIF6gkYgCJY5DvozJMtccB3UkE4TkG
 7hGwuZ3nPQ0vM0rKev8We+r4W/xuWiE7YVOdefNck+yjnyxi+s1vor1ZyTpQHFjxoD/W
 IoVeK77cNveYRhEFLTd2ygf5w5Dtf7e05FGMEE8gqJvYcr5HPQh87DVNqkv0noxp2LsG
 CooUTA4w1KxQiRnKbUM/YK9oAurQmF4NUcbcPX2px3y+sKZETlRimofSxlvKObbW+eR/
 ZEeA==
X-Gm-Message-State: AOAM531W4GBdqNAT5B+RqvtS8DG8DQQzgKDoYUpc8lReUC6jBVstkKFd
 iRxj+3+4gDhLQ7cAar8mWYcv1fgnUssT8NaLIVQ=
X-Google-Smtp-Source: ABdhPJwDiSkvBwIgfVIzBCzHZa3lNBxHaQf7HrK39JvOUTpQ+haZC/zzQ9ko4vBkI7QfuTGuazmB4g==
X-Received: by 2002:a05:6a00:888:b029:13f:f7eb:578c with SMTP id
 q8-20020a056a000888b029013ff7eb578cmr3220642pfj.10.1601482862889; 
 Wed, 30 Sep 2020 09:21:02 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.218.220])
 by smtp.gmail.com with ESMTPSA id w206sm3138435pfc.1.2020.09.30.09.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 09:21:02 -0700 (PDT)
To: Dmitry Vyukov <dvyukov@google.com>
References: <CAKBsNO=G_t6KrAYXcnMy07HyR8yrFELFoknd=9CnHBM-CJij=A@mail.gmail.com>
 <000000000000b8d3ef05b02efa93@google.com>
 <CACT4Y+aBTN3HzDWADsvD053T=qszSu5wGTCijM-kj9xZXDHTyg@mail.gmail.com>
 <20200926065704.GA661191@kroah.com>
 <f7073a07-d00a-8f0e-c9b1-7878a3c065f8@gmail.com>
 <CACT4Y+a3-_C3MJtyo1UC6NcwNPnU2bmhGeGKo7OPh54CVkq1CQ@mail.gmail.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <5e03840b-c090-9f30-ae19-ef4d3c2050d8@gmail.com>
Date: Wed, 30 Sep 2020 21:50:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+a3-_C3MJtyo1UC6NcwNPnU2bmhGeGKo7OPh54CVkq1CQ@mail.gmail.com>
Content-Language: en-US
Cc: Greg KH <greg@kroah.com>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 syzbot <syzbot+35c80b2190255a410f66@syzkaller.appspotmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] KMSAN: uninit-value in rt2500usb_probe_hw
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


On 30/09/20 9:46 pm, Dmitry Vyukov wrote:
> On Wed, Sep 30, 2020 at 5:57 PM Anant Thazhemadam
> <anant.thazhemadam@gmail.com> wrote:
>> On 26/09/20 12:27 pm, Greg KH wrote:
>>> On Sat, Sep 26, 2020 at 08:53:07AM +0200, Dmitry Vyukov via Linux-kernel-mentees wrote:
>>>> On Sat, Sep 26, 2020 at 5:25 AM syzbot
>>>> <syzbot+35c80b2190255a410f66@syzkaller.appspotmail.com> wrote:
>>>>> Hello,
>>>>>
>>>>> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>>>>>
>>>>> Reported-and-tested-by: syzbot+35c80b2190255a410f66@syzkaller.appspotmail.com
>>>>>
>>>>> Tested on:
>>>>>
>>>>> commit:         c5a13b33 kmsan: clang-format core
>>>>> git tree:       https://github.com/google/kmsan.git master
>>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=41fca8ac7f9e770a
>>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=35c80b2190255a410f66
>>>>> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
>>>>>
>>>>> Note: testing is done by a robot and is best-effort only.
>>>> Hi Anant,
>>>>
>>>> I see you are testing lots of USB bugs. USB subsystem is currently
>>>> broken, testing of any USB bugs will give false "no crash" results,
>>>> see:
>>>> https://lore.kernel.org/linux-kernel-mentees/CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com/
>>> Fixes for this USB problem are in my tree now and should show up in
>>> linux-next on Monday.
>>>
>>> thanks,
>>>
>>> greg k-h
>> Is there any chance you could identify the commit that fixes this bug?
>> It would help us close the bug for good. :)
> I think Greg meant the fix for the general USB brokenness, not a fix
> for this syzbot bug. This bug is not fixed to the best of syzbot
> knowledge.

Ah, okay. My bad. I was wondering why the bug wasn't closed already
if there was already a fix. Thank you for clearing that up :)

Thanks,
Anant

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
