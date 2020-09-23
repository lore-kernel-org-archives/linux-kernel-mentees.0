Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4F1C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 17:43:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ADA220665
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 17:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiEKWgzv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ADA220665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F2DE3860BE;
	Wed, 23 Sep 2020 17:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psRuzof4q26u; Wed, 23 Sep 2020 17:43:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B277854F8;
	Wed, 23 Sep 2020 17:43:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7EA50C0889;
	Wed, 23 Sep 2020 17:43:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DAB9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 17:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1C61A258A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 17:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9VyRaRCxIU2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 17:42:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 32F87237C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 17:42:58 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n10so619918qtv.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aBpMxa0AhdY+HmStqdxjmTci0X9ObGOL6bHOjSyPr3k=;
 b=AiEKWgzvXixna7WJSIbt58U4+YN4qEAfutUbDVAFzaH8NzWO0GaAy4XfTngiNlxots
 +hY/GC09oU/K/9t7X+lC4raq/rE2BJhH/77odrq1czBDmrARthwvEMu9g/wBKG8iniqP
 b+8hScE9PQOUJVRNltBF2JC961ftI9t+TYdRxnwGI19G2xY6q+AjGaTU9blkmuX/Q/18
 1NHoPGeLkSOZdNPNGGc9lLv3tXf4/7Q8l1wFGgQvtk+fWt4zs76fTc4HgTVFIh36ahu0
 dz62b76vxOtzQ1Au7PeJ4l47x4mktH3huDlggAi5r9rPANHwjV0mdVJA7n+BDvDfHiw0
 vtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aBpMxa0AhdY+HmStqdxjmTci0X9ObGOL6bHOjSyPr3k=;
 b=aUBmyCYy+KPOj2Q1q1/i+L29zWSBV1TuxmGzbRJVTUHupWXL86GyiypOg93nrQjJXk
 C6cy6gwA/vdwF1hFxPT5XXnojvUf9Poji2Nkm2cd8UUHFzHfiC1ewsOcI4v2rpai7Vhp
 6Sp5AwPfbMMFRasafYcCj+jFRbsvxXeyGkTP7R0v58yBMKzSGabLOyXTYaVXhQI1THZY
 R151bytxPtIBWTDKyLACyTRMmwvowjw0smH33MQxGEP+lkAB+HFncLlc+vaUjVqwMfZa
 VPILDvriGIB/eWJsjq3200mRaVC/NJp0P+/xadFs+8FQuIjuKfIWarJkBQegGyHmI427
 Cgow==
X-Gm-Message-State: AOAM531QdD1I+GcWuqBlrENZX8G63f7Vvk6CKqoNOEa2esHbklmOfT/U
 2dYs8J+pEOczxgH6rf6kJE4Rfe2DBovblM7G
X-Google-Smtp-Source: ABdhPJyn97zvWIdumgUMUiYGWjB9WErq6b+nOEeq4kTthLvX1DPraNJPOM7uSPTrb2gVi+wn+HEtoA==
X-Received: by 2002:ac8:3713:: with SMTP id o19mr1212075qtb.256.1600882976701; 
 Wed, 23 Sep 2020 10:42:56 -0700 (PDT)
Received: from [192.168.1.181] (pool-173-75-208-99.phlapa.fios.verizon.net.
 [173.75.208.99])
 by smtp.gmail.com with ESMTPSA id q35sm294484qtd.75.2020.09.23.10.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 10:42:55 -0700 (PDT)
To: Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <13659a4e-ad71-0cef-4bfa-3eb4b8c73f4b@gmail.com>
 <000000000000cce55c05afe0f8f0@google.com>
 <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
 <20200922072639.GA1578565@kroah.com>
 <CACT4Y+YQf8NJTy9=UUrLiZidV8won0QCYmnVBy-5DFVXumRAPQ@mail.gmail.com>
From: Brooke Basile <brookebasile@gmail.com>
Message-ID: <f66a9255-80d9-fbed-f99c-3c64ee060146@gmail.com>
Date: Wed, 23 Sep 2020 13:42:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+YQf8NJTy9=UUrLiZidV8won0QCYmnVBy-5DFVXumRAPQ@mail.gmail.com>
Content-Language: en-US
Cc: Andrey Konovalov <andreyknvl@google.com>,
 syzbot <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 USB list <linux-usb@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On 9/22/20 3:38 AM, Dmitry Vyukov wrote:
> On Tue, Sep 22, 2020 at 9:26 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Tue, Sep 22, 2020 at 08:49:39AM +0200, Dmitry Vyukov wrote:
>>> On Tue, Sep 22, 2020 at 8:21 AM syzbot
>>> <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com> wrote:
>>>>
>>>> Hello,
>>>>
>>>> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>>>>
>>>> Reported-and-tested-by: syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com
>>>>
>>>> Tested on:
>>>>
>>>> commit:         98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
>>>> git tree:       upstream
>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=2c523334171d074
>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=4d2d56175b934b9a7bf9
>>>> compiler:       gcc (GCC) 10.1.0-syz 20200507
>>>>
>>>> Note: testing is done by a robot and is best-effort only.
>>>
>>> Hi Brooke,
>>>
>>> As far as I understand, UBS is currently completely broken on upstream
>>> HEAD, so testing any USB bugs on upstream HEAD will lead to false
>>> positive results only.
>>
>> Broken in what way?  I don't see any bug reports here...
> 
> I mean this "USB driver ID matching broke":
> https://groups.google.com/g/syzkaller/c/VKfxh__m05w/m/ArzTtar-AgAJ
> syzkaller can't test usb, nor reproduce any existing bugs on the upstream tree.
> 

Hi Dmitry,

Thanks for the heads up and for the link to the thread with the information.

I recently fixed the following bug:
https://syzkaller.appspot.com/bug?id=cabffad18eb74197f84871802fd2c5117b61febf

I tested this on my local syzkaller instance before sending it in to 
syzbot and the kernel panic was resolved, however I did get "-busid- is 
not in match_busid table... skip!" in dmesg-- should this be taken as a 
false positive as well?

Best,
Brooke Basile
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
