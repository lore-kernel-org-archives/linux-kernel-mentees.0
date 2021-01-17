Return-Path: <SRS0=iHz9=GU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02905C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 17 Jan 2021 16:14:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6281C22510
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 17 Jan 2021 16:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6281C22510
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 07FC785BC4;
	Sun, 17 Jan 2021 16:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 752nYiEMa8B1; Sun, 17 Jan 2021 16:14:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 269C785B78;
	Sun, 17 Jan 2021 16:14:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A2EFC088B;
	Sun, 17 Jan 2021 16:14:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9C29C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jan 2021 16:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B00D3870AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jan 2021 16:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6-YUIhbmV0ft
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jan 2021 16:14:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6876A870A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jan 2021 16:14:08 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id v7so24912978ioj.16
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jan 2021 08:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=7wRcMMariHwqlI4TwHzc8rWIHn72k7o7eSivI4COV+s=;
 b=bQnX7P7lA5coY39FfXT6vEGSwz2aTqP93KlFwnrbO6oduojGkLXwthqKzd+nKek0+r
 2xs/RjNOHyTaCTUswa+kosDo0905YdZZKhc9iCjHpTCTgQ6T9IYX4Emb5vfUrDWLz/ah
 ZWEvDOB6pVPlrpE7KEm5+0p9+3Nb5TM0LIevZ0cFlUFjb+LpsevxYwILVcOpUNXng2Ku
 Cs2+4uDC9fzAsIPfJnj+UPeJX4LHc1zQzJfF72eLOPTIMBbvnWWUfo76gu0HYnAEcUS8
 aP4miNX5unlaub76dCEc0S0lWw+1+yBytWSv25dHlPAJfWwOYU7O7BF5vVDbRei4IjsQ
 7ZRA==
X-Gm-Message-State: AOAM533R6LSXpGOnkbVKHCC82GLug0p3NdjDUvwGJ3REI6g1JN2S1zSu
 utpW31moc3fo9tK0CmsLIjyjhh7VMTASqelwsljpFPBOsApE
X-Google-Smtp-Source: ABdhPJxYKgANZp1DuXdut649JU//lEyIr6KJNP0VSqw14Skr4Rp0cfOAh8VJpIMTZzFsIgTS6ePeh8+kUYaRDfsqx8xDOZpenYGO
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1010:: with SMTP id
 n16mr17661202ilj.3.1610900047611; 
 Sun, 17 Jan 2021 08:14:07 -0800 (PST)
Date: Sun, 17 Jan 2021 08:14:07 -0800
In-Reply-To: <000000000000418c7705afcff2e1@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001b4eeb05b91ae518@google.com>
From: syzbot <syzbot+9765367bb86a19d38732@syzkaller.appspotmail.com>
To: anmol.karan123@gmail.com, dhowells@redhat.com, dwmw2@infradead.org, 
 jamie@nuviainc.com, linux-kernel-mentees@lists.linuxfoundation.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 lizhe67@huawei.com, richard@nod.at, sandeen@sandeen.net, 
 syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Subject: Re: [Linux-kernel-mentees] general protection fault in
	jffs2_parse_param
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

commit a61df3c413e49b0042f9caf774c58512d1cc71b7
Author: Jamie Iles <jamie@nuviainc.com>
Date:   Mon Oct 12 13:12:04 2020 +0000

    jffs2: Fix NULL pointer dereference in rp_size fs option parsing

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15cb91e7500000
start commit:   bf3e7628 Merge branch 'mtd/fixes' of git://git.kernel.org/..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=61033507391c77ff
dashboard link: https://syzkaller.appspot.com/bug?extid=9765367bb86a19d38732
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13d81f32500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13516852500000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: jffs2: Fix NULL pointer dereference in rp_size fs option parsing

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
