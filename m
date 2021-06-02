Return-Path: <SRS0=4M9n=K4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA58C4708F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Jun 2021 10:30:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E43D613B4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Jun 2021 10:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E43D613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 008A2402D9;
	Wed,  2 Jun 2021 10:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MmNNVFAz4He1; Wed,  2 Jun 2021 10:30:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E6EA400FE;
	Wed,  2 Jun 2021 10:30:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6715C000E;
	Wed,  2 Jun 2021 10:30:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71D52C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 10:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58F32834F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 10:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kfaLyzo25Ob
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 10:30:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B50C082F39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 10:30:07 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id
 c2-20020a92d3c20000b02901d9fda18626so1196208ilh.14
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Jun 2021 03:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=/5Yxeay+76HnzJp/CqXkJ+ggXqViaQWyqCEQjK6m184=;
 b=adT9YYI3/zt59uvibhV/NQGLqjqySozthGr2OYl4b8NoSQblRieMjwSflnZ6A22QVf
 pnADN+2l2uIHcvrMP6SBhJLbqm1QClgZuuh1mKg2cGOLPpQPRtF/ST6NGwFJJ34CjiEA
 J6KI5LDRjKbPbtXw3S9/81AUiYyptxytYhDwqxRxybC3N5k6qllVjP7OBqeO2TpbTz/U
 fM6bmq5YxruRVsYpaSgURFv8xobCtk3wtk0NzEmQCEOsrVwUlX4XTa18UAX/nBDZj/ke
 9uNL/qSeIV3KNLRcj7dmB3k+284KSjU8Ge97pazO1pwxySe2z7cJA35QUsyMrTUZRygo
 UiZQ==
X-Gm-Message-State: AOAM532NfU7PUYWglNJPEfh49hadqZKNk5FjT3hjZdNqbPm6wHz1W+Ug
 Cul2jWr0sxOoMGnad1H08gNpBgfTc5nm43I9rDrLPPv/8IGN
X-Google-Smtp-Source: ABdhPJx4g6XX+uFaQ6ef+gub/km+nZfMcKw0yEZ80kxD960AgE53q9Q4me2ar2pMKzoHdIlLr3xuAqcMTYpF4PDEjYk9rMPzqPr8
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a4c:: with SMTP id
 u12mr25215033ilv.221.1622629806914; 
 Wed, 02 Jun 2021 03:30:06 -0700 (PDT)
Date: Wed, 02 Jun 2021 03:30:06 -0700
In-Reply-To: <000000000000c98d7205ae300144@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003e409f05c3c5f190@google.com>
Subject: Re: [syzbot] WARNING in idr_get_next
From: syzbot <syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com>
To: anmol.karan123@gmail.com, bjorn.andersson@linaro.org, 
 coreteam@netfilter.org, davem@davemloft.net, dsahern@kernel.org, 
 ebiggers@google.com, ebiggers@kernel.org, eric.dumazet@gmail.com, 
 fw@strlen.de, kadlec@netfilter.org, kuba@kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
 linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org, 
 necip@google.com, netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 pablo@netfilter.org, syzkaller-bugs@googlegroups.com, willy@infradead.org, 
 yoshfuji@linux-ipv6.org
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

syzbot suspects this issue was fixed by commit:

commit 43016d02cf6e46edfc4696452251d34bba0c0435
Author: Florian Westphal <fw@strlen.de>
Date:   Mon May 3 11:51:15 2021 +0000

    netfilter: arptables: use pernet ops struct during unregister

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11518847d00000
start commit:   4d41ead6 Merge tag 'block-5.9-2020-08-28' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=891ca5711a9f1650
dashboard link: https://syzkaller.appspot.com/bug?extid=f7204dcf3df4bb4ce42c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17a1352e900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11fdaf41900000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: netfilter: arptables: use pernet ops struct during unregister

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
