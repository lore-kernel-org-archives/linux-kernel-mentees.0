Return-Path: <SRS0=SEG9=BD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CC9C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 07:00:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6514C2073E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 07:00:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWiQLT2j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6514C2073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C94B8852A;
	Fri, 24 Jul 2020 07:00:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWY8M0i-u9Yf; Fri, 24 Jul 2020 07:00:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 69E5788524;
	Fri, 24 Jul 2020 07:00:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56726C004D;
	Fri, 24 Jul 2020 07:00:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8BE7C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 07:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BB19D203EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 07:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iE2z5DMDrBGN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 07:00:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 705682026D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 07:00:32 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95E6620714;
 Fri, 24 Jul 2020 07:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595574032;
 bh=c+KBsy80S2WPcnj1UgEtCm0wHBMIH4ckt7Mxhmo4jcs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lWiQLT2jUeDQj47ocXQixwBW4790vyRj+5jJfhITXhqV0GOjG1COdYzS5uyiEUWeZ
 l7XSwdgISd+nx+V0fDOQkwnjm8sm8GKz+Ungi+UmsjJ6o6tnc8mAG+nUffolVJ1wDZ
 uOLoYvgyzwF5fuZzeFzTtADgUwzXGLM6vARz5j8U=
Date: Fri, 24 Jul 2020 09:00:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: B K Karthik <bkkarthik@pesu.pes.edu>
Message-ID: <20200724070034.GG3880088@kroah.com>
References: <20200724034227.ixvbu5vrdlsvpnwq@pesu.pes.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724034227.ixvbu5vrdlsvpnwq@pesu.pes.edu>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [REQUEST] for assistance with fixing
 WARNING in pvr2_i2c_core_done
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

On Fri, Jul 24, 2020 at 09:12:27AM +0530, B K Karthik wrote:
> hi,
> 
> I've been looking at https://syzkaller.appspot.com/bug?extid=e74a998ca8f1df9cc332 for quite some time now.
> I think I will be able to fix it with a little assistance.
> 
> I was able to reproduce it, and as er suggestions I tried to unregister the device in the release handler instead of the disconnect handler.
> I tried a few things, but they triggered a general protection fault in kernfs_find_ns()
> 
> Hillf Danton <hdanton@sina.com> said the following. 
> 
> > Hello,
> >
> > syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> > general protection fault in kernfs_find_ns
> >
> > pvrusb2: Invalid write control endpoint
> > pvrusb2: Invalid write control endpoint
> > pvrusb2: Invalid write control endpoint
> > pvrusb2: Invalid write control endpoint
> > general protection fault, probably for non-canonical address 0xdffffc000000000e: 0000 [#1] SMP KASAN
> > KASAN: null-ptr-deref in range [0x0000000000000070-0x0000000000000077]
> > CPU: 0 PID: 78 Comm: pvrusb2-context Not tainted 5.7.0-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > RIP: 0010:kernfs_find_ns+0x31/0x370 fs/kernfs/dir.c:829
> > Code: 49 89 d6 41 55 41 54 55 48 89 fd 53 48 83 ec 08 e8 f4 61 af ff 48 8d 7d 70 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 1e 03 00 00 48 8d bd 98 00 00 00 48 8b 5d 70 48
> > RSP: 0018:ffff8881d419f938 EFLAGS: 00010202
> > RAX: dffffc0000000000 RBX: ffffffff863789c0 RCX: ffffffff85a79ba7
> > RDX: 000000000000000e RSI: ffffffff81901d1c RDI: 0000000000000070
> > RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff873ed1e7
> > R10: fffffbfff0e7da3c R11: 0000000000000001 R12: 0000000000000000
> > R13: 0000000000000000 R14: 0000000000000000 R15: ffffffff863790e0
> > FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00007f3a7e248000 CR3: 00000001d2224000 CR4: 00000000001406f0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  kernfs_find_and_get_ns+0x2f/0x60 fs/kernfs/dir.c:906
> >  kernfs_find_and_get include/linux/kernfs.h:548 [inline]
> >  sysfs_unmerge_group+0x5d/0x160 fs/sysfs/group.c:366
> >  dpm_sysfs_remove+0x62/0xb0 drivers/base/power/sysfs.c:790
> 
> [3]
> 
> >  device_del+0x18b/0xd20 drivers/base/core.c:2834
> >  device_unregister+0x22/0xc0 drivers/base/core.c:2889
> >  i2c_unregister_device include/linux/err.h:41 [inline]
> 
> [2]
> 
> >  i2c_client_dev_release+0x39/0x50 drivers/i2c/i2c-core-base.c:465
> >  device_release+0x71/0x200 drivers/base/core.c:1559
> 
> [1] kobject_del() goes before the release cb in kobject_cleanup() and
> kobj is removed from sysfs, see [3] above.
> 
> >  kobject_cleanup lib/kobject.c:693 [inline]
> >  kobject_release lib/kobject.c:722 [inline]
> >  kref_put include/linux/kref.h:65 [inline]
> >  kobject_put+0x245/0x540 lib/kobject.c:739
> >  put_device drivers/base/core.c:2779 [inline]
> >  device_unregister+0x34/0xc0 drivers/base/core.c:2890
> >  i2c_unregister_device+0x38/0x40 include/linux/err.h:41
> 
> Once is enough, see [2] above.
> 
> can you give me a suggestion as to how I am supposed to go about fixing this bug?

That is for you to determine, not for us to tell you how :)

Something is getting the reference counts of these pointers "out of
sync" and it is being freed at the wrong point in time.  The way the I2C
subsytem uses the driver model is a bit different from other subsystems
for various reasons, so it's not always easy to determine what is going
on here.

I would first try to figure out what the normal set of operations should
be (i.e. what should happen before what), and see why that is not
happening here.

good luck!

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
