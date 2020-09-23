Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE4CC4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 18:28:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87C262223E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 18:28:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJCOFQNI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87C262223E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9E134272F7;
	Wed, 23 Sep 2020 18:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8eCpkW3c4EXg; Wed, 23 Sep 2020 18:28:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4087A20421;
	Wed, 23 Sep 2020 18:28:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28397C0859;
	Wed, 23 Sep 2020 18:28:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62BE3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 18:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4B19086F78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 18:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5wseYpFRaBI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 18:28:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9593F86F6B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 18:28:48 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id db4so502743qvb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VGzTEKpD5CpmrbQCtNlFNBWHnx22rQ0E5sQ9NHh5iAo=;
 b=gJCOFQNIMnvHis0Dq7EgkFUPXlANNifJ/24uhguwpuHpl3lrfmsueBs0HnY+mF9LOW
 rY19qrMOX+3o0nEwkY9Ksx1kJNsisKeMWSHHLaY4gvuTwFyZLDU1vROPrlH6hjoWGP71
 oDgwnNuOYs/fGnRM1ORAN2/tPOAisJyimdFH/h1elRsjNOCdHL75BTSJ8qKI99RlVUno
 kcW5y7W15wwwBnmtEeT46Q/kIuTcQXB9K7L94GMyCUeR80AVWaoPoU01TOnwZE3gFqZg
 SiNLq3QDjx52pjdtNTxYKAnEc1/vYY7ZBwBEu0wkFizMphLKiLSXfw+mUtXbrhczOT5m
 YM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VGzTEKpD5CpmrbQCtNlFNBWHnx22rQ0E5sQ9NHh5iAo=;
 b=ZlyLeT1lhFiiMHA9uK2VHkQoYLmyuVdgB99tXxW2UEH2R6hQygCsl2o6CKzb7CnQjO
 fXT9kUU2wgy0RTttSaHrMCqj6ZXdlWBMS6ZQre/J446SUjBTgKXObvFSJi4QbHrc+YOA
 7IGjkRGQStPBmlu61/Y/7RG29ayzVXafJDku/TWxbZqQ7wH+IjbJ60m5ycqwsiUsZv25
 IgHLQNG3VeOXEtAH00BrOi36KEGo4fmH4Py9IZ/ztGHKOzbkEd3kiglqaCrGf63Vm2OL
 rRg6vNVVrSRTmn8Z8vodoqv6ThmYesV2Lc7PTQJnXb9EeiUe90B9xPcLfimqMxVLAP1V
 tUEw==
X-Gm-Message-State: AOAM531ftMG1vCVbLXWPKtDaZaiBAEH1ueVM73coqSMZ4JNnkdJK5F2A
 MExrddePznv958ugmsXc4WxEy4sGp1fvAv/q
X-Google-Smtp-Source: ABdhPJzDoFcae5HkqTmP2YXY4IfF6kNXnB2Ip52b/UEKalRKgeelTw0kHSIsvegxGwYHXV/ToYeZZQ==
X-Received: by 2002:a0c:b409:: with SMTP id u9mr1355810qve.9.1600885727146;
 Wed, 23 Sep 2020 11:28:47 -0700 (PDT)
Received: from [192.168.1.181] (pool-173-75-208-99.phlapa.fios.verizon.net.
 [173.75.208.99])
 by smtp.gmail.com with ESMTPSA id z6sm516862qkl.39.2020.09.23.11.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 11:28:46 -0700 (PDT)
To: Andrey Konovalov <andreyknvl@google.com>
References: <13659a4e-ad71-0cef-4bfa-3eb4b8c73f4b@gmail.com>
 <000000000000cce55c05afe0f8f0@google.com>
 <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
 <20200922072639.GA1578565@kroah.com>
 <CACT4Y+YQf8NJTy9=UUrLiZidV8won0QCYmnVBy-5DFVXumRAPQ@mail.gmail.com>
 <f66a9255-80d9-fbed-f99c-3c64ee060146@gmail.com>
 <CAAeHK+zwehY9a4ku56wzBUv2sArV5bfZGtKh6FPNz8a-AtQvyg@mail.gmail.com>
From: Brooke Basile <brookebasile@gmail.com>
Message-ID: <8f8706c4-090d-20fe-a4c9-40d99d3a0e1c@gmail.com>
Date: Wed, 23 Sep 2020 14:28:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAeHK+zwehY9a4ku56wzBUv2sArV5bfZGtKh6FPNz8a-AtQvyg@mail.gmail.com>
Content-Language: en-US
Cc: syzbot <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com>,
 USB list <linux-usb@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [Linux-kernel-mentees] INFO: trying to register non-static key
	in ath9k_htc_rxep
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 9/23/20 2:06 PM, Andrey Konovalov wrote:
> On Wed, Sep 23, 2020 at 7:42 PM Brooke Basile <brookebasile@gmail.com> wrote:
>>
>> On 9/22/20 3:38 AM, Dmitry Vyukov wrote:
>>> On Tue, Sep 22, 2020 at 9:26 AM Greg Kroah-Hartman
>>> <gregkh@linuxfoundation.org> wrote:
>>>>
>>>> On Tue, Sep 22, 2020 at 08:49:39AM +0200, Dmitry Vyukov wrote:
>>>>> On Tue, Sep 22, 2020 at 8:21 AM syzbot
>>>>> <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com> wrote:
>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>>>>>>
>>>>>> Reported-and-tested-by: syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com
>>>>>>
>>>>>> Tested on:
>>>>>>
>>>>>> commit:         98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
>>>>>> git tree:       upstream
>>>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=2c523334171d074
>>>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=4d2d56175b934b9a7bf9
>>>>>> compiler:       gcc (GCC) 10.1.0-syz 20200507
>>>>>>
>>>>>> Note: testing is done by a robot and is best-effort only.
>>>>>
>>>>> Hi Brooke,
>>>>>
>>>>> As far as I understand, UBS is currently completely broken on upstream
>>>>> HEAD, so testing any USB bugs on upstream HEAD will lead to false
>>>>> positive results only.
>>>>
>>>> Broken in what way?  I don't see any bug reports here...
>>>
>>> I mean this "USB driver ID matching broke":
>>> https://groups.google.com/g/syzkaller/c/VKfxh__m05w/m/ArzTtar-AgAJ
>>> syzkaller can't test usb, nor reproduce any existing bugs on the upstream tree.
>>>
>>
>> Hi Dmitry,
>>
>> Thanks for the heads up and for the link to the thread with the information.
>>
>> I recently fixed the following bug:
>> https://syzkaller.appspot.com/bug?id=cabffad18eb74197f84871802fd2c5117b61febf
>>
>> I tested this on my local syzkaller instance before sending it in to
>> syzbot and the kernel panic was resolved, however I did get "-busid- is
>> not in match_busid table... skip!" in dmesg-- should this be taken as a
>> false positive as well?
> 
> Hi Brooke,
> 
> Yes, this line means that the kernel is broken and testing USB
> programs with syzkaller is impossible.
> 
> Thanks!
> 
Gotcha, I'll hold off on working on USB bugs for now then.

The above patch has already been applied to the ath-next tree:
	https://patchwork.kernel.org/patch/11769845/

Should I have the patch reverted or is it safe to assume that any 
regressions will be caught in the -next tree?

Thank you,
Brooke Basile
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
