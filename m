Return-Path: <SRS0=QfBv=DD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A153C4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 06:59:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C1F3208B6
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 06:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvSNzB5a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C1F3208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BA1B986CEC;
	Sat, 26 Sep 2020 06:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VcHEzHgBITye; Sat, 26 Sep 2020 06:59:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3CDA285CA8;
	Sat, 26 Sep 2020 06:59:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 314A1C0859;
	Sat, 26 Sep 2020 06:59:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B31F5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AEAA685CA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwHL0E7za08B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:59:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B2A7A86CEC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:59:21 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m34so4276282pgl.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 23:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=x+w8mC5uh7lhThmDKLQTnM7Vp+EwquhpIaBsAyJi/Us=;
 b=EvSNzB5aXtjrzf4t4vxjwfn6z67Db2P+sSUtOWsU/WL5YbOMA5V7xzyD15OuwUCXMa
 utL367Q2VoYCHqmCDLuQ1eZ8tGLsqNx9sUpZ40WnA8sVAZ08hh8fSbV7KEuRo+lrilCN
 UPWVuxWtzWdXyJ5zBM6okFfsUX3gIWbg9tItj3nrC+AsfHez/n0mMTFWBOqKLmL2tElt
 C1EkT21V+whWfrl0w1W0HbUCR9iukAcPBqn4FtunIcaUIQDdmpzFJP2exRBLbpbYIZzs
 DC09KIZsK6m63tutAoGI9SRoiCNfBkBHRkALHMX5cLoUaHPKdW4G9WmHIXCa0kGEVV4Z
 yH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=x+w8mC5uh7lhThmDKLQTnM7Vp+EwquhpIaBsAyJi/Us=;
 b=nz18VDgaX2WDylpt+y1hYHqYqKGL9cSRwuAUaeW14LzD1rkL7kSck6CKzxZiBQ+2zO
 OYCxhgULtUmj7klKlWpA8y2xlK+iDQsVdlxk/+ZRxy0HFYrlEa69J/0h4iX0u7J74Mtr
 NVoFxxtdmcuADhdhoEwssprui8A1aURG3j1Q8Y/mtqDAsWWhG4VXi8gRL3I26nY4Jv9Y
 L1WxzLWd1XO5tWeB4j7qsQdaTNPN5dJlz3ea9CSShDLGtS6RTr7cXYVk5U+lormgEuOe
 iQPzU9/lt6ymHN3fx8OgOTnv5XQwPbIt69t8WbV11L6K+tNpx7NyxlPGPIORNa8YJZAZ
 FpQg==
X-Gm-Message-State: AOAM532gvwScNRoNAoLGnvtVlE8HNtBQj3PFjdwhzAM/PxTvvdntkXzs
 /j23Zy8J4OCcYvOifQREBus=
X-Google-Smtp-Source: ABdhPJydWziZKnB781wBUGUPyi+qSrJHGONVRL1BJ7DKwODQ2ZsC+KMRWHife/gTBfmWSXryOpKGZA==
X-Received: by 2002:aa7:941a:0:b029:142:2501:34dc with SMTP id
 x26-20020aa7941a0000b0290142250134dcmr2621144pfo.53.1601103560937; 
 Fri, 25 Sep 2020 23:59:20 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.212.24])
 by smtp.gmail.com with ESMTPSA id w19sm4622501pfq.60.2020.09.25.23.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 23:59:20 -0700 (PDT)
To: Dmitry Vyukov <dvyukov@google.com>
References: <CAKBsNO=G_t6KrAYXcnMy07HyR8yrFELFoknd=9CnHBM-CJij=A@mail.gmail.com>
 <000000000000b8d3ef05b02efa93@google.com>
 <CACT4Y+aBTN3HzDWADsvD053T=qszSu5wGTCijM-kj9xZXDHTyg@mail.gmail.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <e1baa592-9c7f-4bc0-dbb0-d76b3afe289f@gmail.com>
Date: Sat, 26 Sep 2020 12:29:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+aBTN3HzDWADsvD053T=qszSu5wGTCijM-kj9xZXDHTyg@mail.gmail.com>
Content-Language: en-US
Cc: Andrey Konovalov <andreyknvl@google.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Alexander Potapenko <glider@google.com>,
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


On 26/09/20 12:23 pm, Dmitry Vyukov wrote:
> On Sat, Sep 26, 2020 at 5:25 AM syzbot
> <syzbot+35c80b2190255a410f66@syzkaller.appspotmail.com> wrote:
>> Hello,
>>
>> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>>
>> Reported-and-tested-by: syzbot+35c80b2190255a410f66@syzkaller.appspotmail.com
>>
>> Tested on:
>>
>> commit:         c5a13b33 kmsan: clang-format core
>> git tree:       https://github.com/google/kmsan.git master
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=41fca8ac7f9e770a
>> dashboard link: https://syzkaller.appspot.com/bug?extid=35c80b2190255a410f66
>> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
>>
>> Note: testing is done by a robot and is best-effort only.
> Hi Anant,
>
> I see you are testing lots of USB bugs. USB subsystem is currently
> broken, testing of any USB bugs will give false "no crash" results,
> see:
> https://lore.kernel.org/linux-kernel-mentees/CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com/

Oh, I see. Thank you for letting me know. I'll be sure to keep that in mind, until I hear
otherwise. :)

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
