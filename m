Return-Path: <SRS0=4M9n=K4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3554C4708F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Jun 2021 11:19:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C32461159
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Jun 2021 11:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C32461159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 528C24029A;
	Wed,  2 Jun 2021 11:19:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69M4p60jPt6y; Wed,  2 Jun 2021 11:19:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 556E7402A6;
	Wed,  2 Jun 2021 11:19:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42F3CC000D;
	Wed,  2 Jun 2021 11:19:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0488C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 11:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A24FF606CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 11:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UcEpcz2ewbjD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 11:19:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 661D8605A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 11:19:16 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id
 d7-20020a056e020c07b02901d77a47ab82so1266351ile.19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Jun 2021 04:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to:cc;
 bh=Ik+ck8Lh3RRt0JEN5CCsrhUxXANYahmCllH+5HG5l88=;
 b=HGqcXA31X6NZtii6aN/fUmNzKXvKf04Aa0VVTBx/UvgHTdgtCRix4Ltz64xWheFAoj
 aZqi9+ihwb8ku8zk2safISk9mvS5HxPGiRKlFMAOHaxNN2rk9WiisuKfSO+yC5MvblZJ
 IRBf/9N8CVqEhTPNBD1gZ3RGJ2Un62d7QgT0F9EHfUfqER623atTactN3+Hr8ThKzNT4
 EpxHBWOp9o4uknABiMlsiASZJTxNTLmoqDgHBoc+DgHlL5HUTsrOHU1htrb+DGpOhoPX
 2PgDdMChATY5hFbkjOvdU+5Zgqf2F756WEwITN3NFUP/SkJvHMcdkWIlr/oSNxrlDYtm
 q1yg==
X-Gm-Message-State: AOAM531Z07iN0fFOSUHUWUcwx61MwjTQs6cfpv2TMTIuL9NBxMijtq9U
 jPUsjp/28fv8JjIKbKZkJrmEJqYzVl4dc1QiWtqlzkQuyhY4
X-Google-Smtp-Source: ABdhPJzJqVr2YzcOaqu2A0rRUEiRWN4jO2zCOcyJJKUMnlEYYcW6KSke3zHcDGUZQpzoXUdx3YpvAjjRKi+XPGZ3ZP0DqITYqcT4
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:13a9:: with SMTP id
 h9mr8555710ilo.96.1622632755758; 
 Wed, 02 Jun 2021 04:19:15 -0700 (PDT)
Date: Wed, 02 Jun 2021 04:19:15 -0700
In-Reply-To: <YLdo77SkmGLgPUBi@casper.infradead.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000020d4a05c3c6a1bd@google.com>
Subject: Re: [syzbot] WARNING in idr_get_next
From: syzbot <syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: ebiggers@google.com, bjorn.andersson@linaro.org,
 manivannan.sadhasivam@linaro.org, eric.dumazet@gmail.com, willy@infradead.org,
 kadlec@netfilter.org, ebiggers@kernel.org, coreteam@netfilter.org,
 kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 pablo@netfilter.org, necip@google.com, syzkaller-bugs@googlegroups.com,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 fw@strlen.de, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, davem@davemloft.net
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

> #syz fixed qrtr: Convert qrtr_ports from IDR to XArray

unknown command "fixed"

>
> On Wed, Jun 02, 2021 at 03:30:06AM -0700, syzbot wrote:
>> syzbot suspects this issue was fixed by commit:
>> 
>> commit 43016d02cf6e46edfc4696452251d34bba0c0435
>> Author: Florian Westphal <fw@strlen.de>
>> Date:   Mon May 3 11:51:15 2021 +0000
>
> Your bisect went astray.
>
> -- 
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/YLdo77SkmGLgPUBi%40casper.infradead.org.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
