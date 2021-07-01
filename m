Return-Path: <SRS0=5SPK=LZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E22C11F64
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 17:03:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE316613FD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 17:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE316613FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 765CB403DC;
	Thu,  1 Jul 2021 17:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 87l5FgqrVziL; Thu,  1 Jul 2021 17:03:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 55068403CE;
	Thu,  1 Jul 2021 17:03:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33C8AC001A;
	Thu,  1 Jul 2021 17:03:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB201C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 17:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8280E403CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 17:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYU47l3nmSqp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 17:03:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E58E403A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 17:03:44 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 g13-20020a4ac4cd0000b029024c717ed8aeso1741687ooq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Jul 2021 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dubeyko-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zSv+GHdAokYpQGK8nxdK92ewIXmEkT7WAphnSIkQIV4=;
 b=P476woN2KrKArUT9PNczWqnwAR6+vGFDCD8QxZ33YkJQZACICstnYXjabV2DMCHAxj
 JwxhlEDAM3h9WprWiyoRbpEsIyd+yF88r4fZtRZXd2/3h0oN7pPgn88oda0YyX5FiMwt
 ysC5iKd7fYA7Eb4xXiA6tI0O1Pb/VjRNOJO0lnsHD4Spsq0+YActDeqPZKDGjyw7NEFV
 OQqGyZ+s9yVaTGw+hvHwZG9OS+z+RlnHq3bKeNaFZzuPsdgGB7D218WdACJgoUyLqzbe
 mQ5xv8y5jQZc+ayfh0SOOyir8wrjSwjYX0iuFMlA9KNIA+yRfd61RoiFlMeQJLWMrHuc
 +Jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zSv+GHdAokYpQGK8nxdK92ewIXmEkT7WAphnSIkQIV4=;
 b=SF0qzI94ikWvgMKEEZ9RLY++cskfLWniwdpsSzlH6G9SFcupYGgflHzHSLxQX29AC3
 uH+Sg52Jo5UD4gFgjuv/s0LYgN1/vdFfJRhA5+qi1yNcoo8CWZBqsEqHxiKMjRypE/tY
 7BRlwTM0Q36pI++Ank8eo8bx2/2lHsqHWR/kgQmiZ9vLGtFiQwV89jXWup0+gVpWsVFN
 gKeborqzwrIs3Vyk127B+2w+Im/rzfQSgK0to4bEQ+yRQ4WhaI3J+PRFlVb9GxIlLdK7
 fwD4H8YbItess9K8tGq4+tZPEqo6bB0NRXxqTbvA2nFwWHla9hVcaxuzKurYLJ4smxAo
 oZLg==
X-Gm-Message-State: AOAM532KObWr3McrARmioxYlcJvWTEQzr+a0unyAE1DcZHnXmmywPRWZ
 JAkcX+SgMqbW55W22QM0oaDENA==
X-Google-Smtp-Source: ABdhPJzafnMRTUFROSIdXg8fjyYMpDVsfCj5WHVLdk2Jh/wEhyDAnDWZODXBDVfg0toUUeB7LwozOw==
X-Received: by 2002:a4a:6c0c:: with SMTP id q12mr698931ooc.81.1625159023154;
 Thu, 01 Jul 2021 10:03:43 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:42f0:6600:4d57:e39e:c32f:13d2])
 by smtp.gmail.com with ESMTPSA id l10sm57404oti.9.2021.07.01.10.03.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Jul 2021 10:03:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v2 0/3] hfs: fix various errors
From: Viacheslav Dubeyko <slava@dubeyko.com>
In-Reply-To: <20210701030756.58760-1-desmondcheongzx@gmail.com>
Date: Thu, 1 Jul 2021 10:03:40 -0700
Message-Id: <ECFAAAB7-2FAE-4049-9B20-081F5E6613B7@dubeyko.com>
References: <20210701030756.58760-1-desmondcheongzx@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Cc: LKML <linux-kernel@vger.kernel.org>, gustavoars@kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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



> On Jun 30, 2021, at 8:07 PM, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com> wrote:
> 
> Hi,
> 
> This series ultimately aims to address a lockdep warning in hfs_find_init reported by Syzbot:
> https://syzkaller.appspot.com/bug?id=f007ef1d7a31a469e3be7aeb0fde0769b18585db
> 
> The work done for this led to the discovery of another bug, and the Syzkaller repro test also reveals an invalid memory access error after clearing the lockdep warning. Hence, this series is broken up into three patches:
> 
> 1. Add a missing call to hfs_find_exit for an error path in hfs_fill_super
> 
> 2. Fix memory mapping in hfs_bnode_read by fixing calls to kmap
> 
> 3. Add lock nesting notation to tell lockdep that the observed locking hierarchy is safe
> 
> v1 -> v2:
> Patch 1: Consolidated calls to hfs_find_exit on error paths in hfs_fill_super, as suggested by Viacheslav Dubeyko.
> Patch 2: Added safety checks, clarified code, and switched from kmap/kunmap to kmap_atomic/kunmap_atomic, as suggested by Viacheslav Dubeyko.
> 
> Desmond Cheong Zhi Xi (3):
>  hfs: add missing clean-up in hfs_fill_super
>  hfs: fix high memory mapping in hfs_bnode_read
>  hfs: add lock nesting notation to hfs_find_init
> 
> fs/hfs/bfind.c | 14 +++++++++++++-
> fs/hfs/bnode.c | 25 ++++++++++++++++++++-----
> fs/hfs/btree.h |  7 +++++++
> fs/hfs/super.c | 10 +++++-----
> 4 files changed, 45 insertions(+), 11 deletions(-)
> 
> -- 
> 2.25.1
> 

Looks good.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
