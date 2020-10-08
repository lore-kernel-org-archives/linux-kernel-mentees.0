Return-Path: <SRS0=Bf+q=DP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A216C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Oct 2020 03:38:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0514920714
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Oct 2020 03:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0514920714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7096B811BB;
	Thu,  8 Oct 2020 03:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id taKcEkgdcGJN; Thu,  8 Oct 2020 03:38:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DB63D86E6C;
	Thu,  8 Oct 2020 03:38:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0156C0891;
	Thu,  8 Oct 2020 03:38:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B62DC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 03:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6E08C86E6C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 03:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfi2S8dHvLj1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 03:38:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com
 [209.85.166.77])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B3E4986E6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 03:38:09 +0000 (UTC)
Received: by mail-io1-f77.google.com with SMTP id v7so872559ioe.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 07 Oct 2020 20:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=4IhbBH7ECghcPFerwikAMQpqWj6YlBpaCR+/1lLbfIE=;
 b=Vd7wdKgLiEJcBz6VpIEC9/FywU9o2mvTRd44A2u99csz7pkhSaWBZL4DLK5zQrFEyD
 o8YMEcG6pitePweb2kgo3iQz+JtviGhot86KXHah1xLnyGZQMqowoQpCUUAlmw9kXU9i
 BMrQlp2V6qSj+cgCLxWx2wVp5xdm7i/FXXmWjgLZCK+mhNpOpW+OTkCrmdkG0hjt9DW2
 kJzmTJTJksSIb4ljaUzk+rdLYgpPT3F0FKlfLHEJz3hYAJedCUEXLAhZHUvD2N/aPCFM
 e08qxsQlBTT4AluNVVXo2rxTTkvmm+dRuKTSId0K6XrExTpfKblTQQ24/IWoPCfYr+PK
 UkgQ==
X-Gm-Message-State: AOAM531sOAsT7VBEYW/+hgpPyaICtXG2+IJkE1gTYUXrNmFViVodduJL
 lzAYgJ8Omp9+ZpI54iWU/ZHfqDyw704tiKuzhVNKsBRXgKcl
X-Google-Smtp-Source: ABdhPJynKSURyz8krzVv92HNweDLHB/5PqX1t0MirYXocBnDSftoIzE01f7AZnfI+TcgJdlhKPHkNqcCx/gg/MZ7dJ+aWSiS2SjA
MIME-Version: 1.0
X-Received: by 2002:a6b:f30a:: with SMTP id m10mr2888088ioh.164.1602128289047; 
 Wed, 07 Oct 2020 20:38:09 -0700 (PDT)
Date: Wed, 07 Oct 2020 20:38:09 -0700
In-Reply-To: <0000000000009323e705ae870d48@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008dab1205b1208fe6@google.com>
From: syzbot <syzbot+b8639c8dcb5ec4483d4f@syzkaller.appspotmail.com>
To: anant.thazhemadam@gmail.com, axboe@kernel.dk, bgolaszewski@baylibre.com, 
 dan.j.williams@intel.com, dragonjetli@gmail.com, gregkh@linuxfoundation.org,
 hch@lst.de, hl1998@protonmail.com, jack@suse.cz, jean-philippe@linaro.org, 
 johannes.thumshirn@wdc.com, jroedel@suse.de, linux-block@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
 rafael@kernel.org, saravanak@google.com, syzkaller-bugs@googlegroups.com
Subject: Re: [Linux-kernel-mentees] KASAN: use-after-free Read in
	delete_partition
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

commit 08fc1ab6d748ab1a690fd483f41e2938984ce353
Author: Christoph Hellwig <hch@lst.de>
Date:   Tue Sep 1 09:59:41 2020 +0000

    block: fix locking in bdev_del_partition

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1259b1e7900000
start commit:   f75aef39 Linux 5.9-rc3
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3c5f6ce8d5b68299
dashboard link: https://syzkaller.appspot.com/bug?extid=b8639c8dcb5ec4483d4f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15c43c79900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=173dfa1e900000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: block: fix locking in bdev_del_partition

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
