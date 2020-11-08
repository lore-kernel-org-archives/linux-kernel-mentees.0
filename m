Return-Path: <SRS0=ep41=EO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60EEC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 22:55:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 142CB206E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 22:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 142CB206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7AE61866F6;
	Sun,  8 Nov 2020 22:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uE7dFDJpLcFI; Sun,  8 Nov 2020 22:55:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 172E985B68;
	Sun,  8 Nov 2020 22:55:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F046AC0889;
	Sun,  8 Nov 2020 22:55:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CA1CC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 22:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0C799866F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 22:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKRu3VNKTW3H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 22:55:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1719985B68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 22:55:05 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id u129so5156957ilc.21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Nov 2020 14:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=Mk8JTr7hVOq3EefkDcYJtK1cseL+MNVUi7YjoZxo834=;
 b=Jm9PFcSZdgS3jfsv2xTeWH0cuU82SXGWCoQHq5bZXjSl4G29PiUjUM+DDifHia/sIL
 wQB4LA5EiSv8gaTQgkaXX+YHo9SBm9iWvJFf4wDv3er1m5xzE+l66bZqAGGsHI/Jsh+a
 7hbLhzT376z4YDU3VXdBaiSSrd4ODQxw+hlWw6bwdfDHqyxtWv0/gsvedTPl19rsbb93
 r1Y7GMkfxwShrkDK/gBoJjiNqqVmqq+A8wJAdk5Ej7yswXAFutDtGW/Sd1S9n/8AgvsE
 /568zPJtWH/REDxW95SPzxevPJtgtZ5/yTqIR7hze8oAXkgd5ugSK+3XIBZeQrvxbDsR
 mgOw==
X-Gm-Message-State: AOAM5313qLDd0BI0wHDP3zJW0kjGQ3V2ahswuqrmD/i8ggOO8Zz0PFdF
 tBdkaYKef/+zW4Vgev8q/wspAH1FgULSQzyh8YcrLZ8Sa6F9
X-Google-Smtp-Source: ABdhPJz46elvAlGQb+4iBu5GDJETkvSCwZYY3fQO4J1bsg3UipRMv59OOfwhgZstYtR/XAJyLUrU+ZktTcqi0Zw4wr4tBtTIjClC
MIME-Version: 1.0
X-Received: by 2002:a02:b1cb:: with SMTP id u11mr8883124jah.95.1604876105313; 
 Sun, 08 Nov 2020 14:55:05 -0800 (PST)
Date: Sun, 08 Nov 2020 14:55:05 -0800
In-Reply-To: <000000000000c57f2d05ac4c5b8e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002a736805b3a05697@google.com>
From: syzbot <syzbot+dd768a260f7358adbaf9@syzkaller.appspotmail.com>
To: abhishekpandit@chromium.org, coiby.xu@gmail.com, davem@davemloft.net, 
 dvyukov@google.com, gregkh@linuxfoundation.org, johan.hedberg@gmail.com, 
 kuba@kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
 marcel@holtmann.org, netdev@vger.kernel.org, rafael@kernel.org, 
 sonnysasaka@chromium.org, syzkaller-bugs@googlegroups.com
Subject: Re: [Linux-kernel-mentees] BUG: corrupted list in
	kobject_add_internal
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

commit a46b7ed4d52d09bd6c7ab53b2217d04fc2f02c65
Author: Sonny Sasaka <sonnysasaka@chromium.org>
Date:   Fri Aug 14 19:09:09 2020 +0000

    Bluetooth: Fix auto-creation of hci_conn at Conn Complete event

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13d75792500000
start commit:   d6efb3ac Merge tag 'tty-5.9-rc1' of git://git.kernel.org/p..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ff87594cecb7e666
dashboard link: https://syzkaller.appspot.com/bug?extid=dd768a260f7358adbaf9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=105054aa900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ab6976900000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: Bluetooth: Fix auto-creation of hci_conn at Conn Complete event

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
