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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C79C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 15:57:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3587C20759
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 15:57:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFBEgsjk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3587C20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EA81186769;
	Wed, 30 Sep 2020 15:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3jJLszlqte0T; Wed, 30 Sep 2020 15:57:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 74599855BD;
	Wed, 30 Sep 2020 15:57:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5AC5FC0890;
	Wed, 30 Sep 2020 15:57:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C96AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 15:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1486285DE6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 15:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L6OE9D49tnyH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 15:57:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8B8B284FDE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 15:57:56 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id md22so176920pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 08:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1uLbpKRCix6ip0P860eY71YWHM0FgUim0HU08GftBtE=;
 b=TFBEgsjkFjmtckZ6OyxL24N8QLzw9DMwFHMxlrfKlT/HSfb6CTszIBTc9i8mogVqFx
 vds1WtTQA/yJPaTHPTM0DcAsOii0+UOoKGhkW1Rw9zovsQwpNO41eXDJtt8FSq5YUMFK
 5gqHc+bIQFGla9BaLzj4hylkL5+tmiLKNA6flCCToDZJ+/nkSfB6bsLFtfTBGGEc0Kmt
 GV0NZQ7SFcd21dYaIQFlQESnHTUKR9zUvPU6TT2J3P3jgEC0ix8dQV7j4b7fbaSQcoNv
 1u1G8feaXCJ0vOCtWTpAuYWsx8QhRXXv3RpY0X8RJVVaQNdpWhJlrKfBAp8gH01MmYBa
 W/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1uLbpKRCix6ip0P860eY71YWHM0FgUim0HU08GftBtE=;
 b=NCbMa5KrUr25UOIOgFIXBDTTtbPO3dC3GIa6lX4IIHpCCv3vmcJUzt9Dfrl6yb5kqo
 jVTqYUGzIGLvIN+bQjZs7U+CGnRijg/IfCAu1B9W9VymWZ4L9cN1ye/UxRewoS5ef9Co
 OtsD9jzcm+I/clI0BAMBXdK2uSWZjFpcErgr40m0zvnEpLhPYj80qTG5ImguH854wbeA
 p83zeN9+kElD2LgXptPLKuAXyAA9WFwEKT4c8tTD2DMVZaBVH7tAIL3Pv86l6iO+enWY
 PEVzLVSf6cJxq2ByvY+HWrK4aftMTB64Z4x1cv9EWNb0V4JTvzUMSedCyWf0o+VaoBJA
 htxg==
X-Gm-Message-State: AOAM5311PC5vb5eBI91Dl4GwOBBJqtaDqoM2VI5Ew2kMSuxt7nN5sqt2
 u+HPtz29gzvwytF1NP19A6pZzg+cGnwvom6qTcw=
X-Google-Smtp-Source: ABdhPJw/scf642PK2WYpd2Yq++6NiYOQ8QEpCcuGhwira58TYgFAeVyKseLr0d2vFSK+/9m8foOpGQ==
X-Received: by 2002:a17:90b:1050:: with SMTP id
 gq16mr3338024pjb.234.1601481475499; 
 Wed, 30 Sep 2020 08:57:55 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.218.220])
 by smtp.gmail.com with ESMTPSA id bt13sm2881856pjb.23.2020.09.30.08.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 08:57:54 -0700 (PDT)
To: Greg KH <greg@kroah.com>, Dmitry Vyukov <dvyukov@google.com>
References: <CAKBsNO=G_t6KrAYXcnMy07HyR8yrFELFoknd=9CnHBM-CJij=A@mail.gmail.com>
 <000000000000b8d3ef05b02efa93@google.com>
 <CACT4Y+aBTN3HzDWADsvD053T=qszSu5wGTCijM-kj9xZXDHTyg@mail.gmail.com>
 <20200926065704.GA661191@kroah.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <f7073a07-d00a-8f0e-c9b1-7878a3c065f8@gmail.com>
Date: Wed, 30 Sep 2020 21:27:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200926065704.GA661191@kroah.com>
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


On 26/09/20 12:27 pm, Greg KH wrote:
> On Sat, Sep 26, 2020 at 08:53:07AM +0200, Dmitry Vyukov via Linux-kernel-mentees wrote:
>> On Sat, Sep 26, 2020 at 5:25 AM syzbot
>> <syzbot+35c80b2190255a410f66@syzkaller.appspotmail.com> wrote:
>>> Hello,
>>>
>>> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>>>
>>> Reported-and-tested-by: syzbot+35c80b2190255a410f66@syzkaller.appspotmail.com
>>>
>>> Tested on:
>>>
>>> commit:         c5a13b33 kmsan: clang-format core
>>> git tree:       https://github.com/google/kmsan.git master
>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=41fca8ac7f9e770a
>>> dashboard link: https://syzkaller.appspot.com/bug?extid=35c80b2190255a410f66
>>> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
>>>
>>> Note: testing is done by a robot and is best-effort only.
>> Hi Anant,
>>
>> I see you are testing lots of USB bugs. USB subsystem is currently
>> broken, testing of any USB bugs will give false "no crash" results,
>> see:
>> https://lore.kernel.org/linux-kernel-mentees/CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com/
> Fixes for this USB problem are in my tree now and should show up in
> linux-next on Monday.
>
> thanks,
>
> greg k-h

Is there any chance you could identify the commit that fixes this bug?
It would help us close the bug for good. :)

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
