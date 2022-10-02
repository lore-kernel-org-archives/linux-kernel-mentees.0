Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5AEC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Oct 2022 20:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B56A140136;
	Sun,  2 Oct 2022 20:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B56A140136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VA_gMpCIhBXW; Sun,  2 Oct 2022 20:04:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BA01D400AB;
	Sun,  2 Oct 2022 20:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA01D400AB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85149C0032;
	Sun,  2 Oct 2022 20:04:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1058FC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Oct 2022 20:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D794A400AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Oct 2022 20:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D794A400AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rF0dPv7SRzHt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Oct 2022 20:04:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C8EF4048B
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C8EF4048B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Oct 2022 20:04:20 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 a9-20020a056e0208a900b002f6b21181f5so7156872ilt.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 02 Oct 2022 13:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=alt+Pnmjzew3cSMHF8D4f4jTWwNd/We9mTfqo5aLOos=;
 b=sZXcz6FOq2L9Sy33wnayCKtvUMcpKw8tn8PWABALuTFBJ9z/6S49pIXd1oov6VuIQ8
 cx/kR8QUKoofumDLh3kvyHg3r9EwTTiyPqRhQLgLnOXKMbZvY5avCW9zXwuKI6nIaoDS
 5+Gg2wUIePtIHC9YCz8RryfW9lRe2uUljoTOOJnJ7g1dVkC3kJvYR+1ldAg0c2eTvGWG
 YJaQVEU4ISsgsrTHWzGOQz6t1ksGbv+91SC/NjnfQF5eGbtxW1d1Yvy/USy9EHd4VH+H
 qA2y5azGmVpYJvnyRMaf4OX+snYC+c6sET94wEii//ZhmsIj+e49TvMNWLtXeULdPLG7
 ZV4w==
X-Gm-Message-State: ACrzQf2D8VlnJ4wOWdbkAdjWgu8ergGpnfV8PRBR5oB0E/lY4HBZlhmP
 MlLjroiK3nUv0MbQmZ1urpwA4uAY4aD9i0pTrci7J3D2T6/m
X-Google-Smtp-Source: AMsMyM6VLcxZo3tjaJFXzbN/lsdTicHGhkOT9Fp7uoyQ4GhRHFgxHmgHscdmxDLKobMFvIgDK8W1sDcVNrnUqYDMsKocGpjcH2gM
MIME-Version: 1.0
X-Received: by 2002:a05:6638:150c:b0:35a:f7a9:c3d8 with SMTP id
 b12-20020a056638150c00b0035af7a9c3d8mr9235231jat.38.1664741059255; Sun, 02
 Oct 2022 13:04:19 -0700 (PDT)
Date: Sun, 02 Oct 2022 13:04:19 -0700
In-Reply-To: <000000000000eca83705e9a72fb9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007ae43605ea12bb12@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in ntfs_trim_fs
From: syzbot <syzbot+b892240eac461e488d51@syzkaller.appspotmail.com>
To: abdun.nihaal@gmail.com, almaz.alexandrovich@paragon-software.com, 
 linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
 linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
 skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com, 
 viro@zeniv.linux.org.uk
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

syzbot has bisected this issue to:

commit 6e5be40d32fb1907285277c02e74493ed43d77fe
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Aug 13 14:21:30 2021 +0000

    fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17b6daf4880000
start commit:   f76349cf4145 Linux 6.0-rc7
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1476daf4880000
console output: https://syzkaller.appspot.com/x/log.txt?x=1076daf4880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba0d23aa7e1ffaf5
dashboard link: https://syzkaller.appspot.com/bug?extid=b892240eac461e488d51
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=133c8540880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11b74870880000

Reported-by: syzbot+b892240eac461e488d51@syzkaller.appspotmail.com
Fixes: 6e5be40d32fb ("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
