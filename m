Return-Path: <SRS0=4M9n=K4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD407C47093
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Jun 2021 11:21:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59FEF613B1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Jun 2021 11:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59FEF613B1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2277D83A05;
	Wed,  2 Jun 2021 11:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hL6Inrb5oaVc; Wed,  2 Jun 2021 11:21:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3CF3839DC;
	Wed,  2 Jun 2021 11:21:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96F6FC000D;
	Wed,  2 Jun 2021 11:21:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36378C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 11:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1019940146
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 11:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESwFaPjp9N-2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 11:21:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFC1B400FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 11:21:10 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id k11so254844qkk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Jun 2021 04:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gchpafLKJ6F6uOATukxao5S0fzx1QuO5gM2w3naYObs=;
 b=RYDTY0QjdOGb7GBWzWXSIgmp3riEMTtlJ6ePjnS+zHZaqHYFqkBg61i+LUjT8vT0yX
 0aFpRQzdhdiMFqLC0g8cGKUzYmQ+6Uvp5324tCxg7MgufCsg5COzkVbUDxigOpidKyj0
 DfE61GhP1X/GTu1+yxXuVjsqsxs+5CW7o4mkpLeONuCCNft/BESAatIMWgCmnsIdnmvl
 aR9+WJswy89YDIvJ/HT1wB296lsOy7zulRpyVy1u04f604IifYk4496HUh8S5UOkGiKq
 VXJ4JzhBsS2k6HdiksLiL0UqPD8JZjTSwUNnY9Td8DpldjOrRbnm7CLOtyewUJAz7VnE
 QFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gchpafLKJ6F6uOATukxao5S0fzx1QuO5gM2w3naYObs=;
 b=gugOlVErI5hUNHHVQ7/X2HrN3FY4rkcdqElivTtOMbM8hSkrvCLF+l6jIEPfbK3E6j
 nhS/PhfAzVl/k87i/i7njVvxX2DiBwygpAXgzFuGPgnm97cyYRgRxaQVY5/4NQpEs2qp
 McoGvgsm7JFeUiKuPP+RDyIWQScmqzvCOkQZRPAYxgwX2C7LjyRk7FcXYnFdD7crVQqA
 dj+YqCJtSlZRk5PApuV1C9TL6kuznM/tWyxdiQHZG0CuY24YH8CHzZu51OnOgen+i4Fb
 4EgGlzX5W9xzCgBMxlDZriNrdiYvAWQJRu8iGbS3e7rhRplBNDZk+tYDqEUA0t1r0zDU
 arrw==
X-Gm-Message-State: AOAM530oh4+Ojz+wl1O/eJ0fAsi/4oV+IqQtGlrWD/mqcoEv+GxWwFFa
 JL0jGfooxPnefG3MHrdF9v8sHrtEuDQoh5y4vdY31g==
X-Google-Smtp-Source: ABdhPJxkQvzCyua+2YCHkeNe+i/7cmwbKWtNkqHYzH1bZ1etsu2/XFklrkSEo8/9k2tD2Ih4LDt8IMgD4M2z0xhIp6w=
X-Received: by 2002:a05:620a:15b:: with SMTP id
 e27mr19426423qkn.501.1622632869281; 
 Wed, 02 Jun 2021 04:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c98d7205ae300144@google.com>
 <0000000000003e409f05c3c5f190@google.com>
 <YLdo77SkmGLgPUBi@casper.infradead.org>
In-Reply-To: <YLdo77SkmGLgPUBi@casper.infradead.org>
Date: Wed, 2 Jun 2021 13:20:57 +0200
Message-ID: <CACT4Y+YUa41KMCO3n9WSvsbLqXo=F5nxpnoYWyiyB=AFWZ-KVA@mail.gmail.com>
Subject: Re: [syzbot] WARNING in idr_get_next
To: Matthew Wilcox <willy@infradead.org>
Cc: Eric Biggers <ebiggers@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 syzbot <syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com>,
 Eric Dumazet <eric.dumazet@gmail.com>, Jozsef Kadlecsik <kadlec@netfilter.org>,
 Eric Biggers <ebiggers@kernel.org>, coreteam@netfilter.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Necip Fazil Yildiran <necip@google.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev <netdev@vger.kernel.org>,
 dsahern@kernel.org, Florian Westphal <fw@strlen.de>,
 LKML <linux-kernel@vger.kernel.org>,
 NetFilter <netfilter-devel@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 David Miller <davem@davemloft.net>
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Jun 2, 2021 at 1:19 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> #syz fixed qrtr: Convert qrtr_ports from IDR to XArray

This would be:

#syz fix: qrtr: Convert qrtr_ports from IDR to XArray

Thanks for looking up the proper fix.


> On Wed, Jun 02, 2021 at 03:30:06AM -0700, syzbot wrote:
> > syzbot suspects this issue was fixed by commit:
> >
> > commit 43016d02cf6e46edfc4696452251d34bba0c0435
> > Author: Florian Westphal <fw@strlen.de>
> > Date:   Mon May 3 11:51:15 2021 +0000
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
