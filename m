Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C9EC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 16:17:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 192C02072D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 16:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOmWKml4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 192C02072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E66DA881DE;
	Sat, 22 Aug 2020 16:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDjtNjuBqvKP; Sat, 22 Aug 2020 16:17:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1DFB187DCE;
	Sat, 22 Aug 2020 16:17:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19D1EC0889;
	Sat, 22 Aug 2020 16:17:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D4CEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 16:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 29AAC8809D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 16:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-4kfGVlrFqB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 16:17:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4A2F388093
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 16:17:01 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id ds1so2144642pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 09:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J3cCf84pRGt6l3COYzuciKUqvDHPbTbbZOlMmG44vxw=;
 b=kOmWKml47Sn32ECrtxuwuhU5xK8Y0A0GsqmzZEAafEu5EwWyuP9vMQTW90pA//a/lJ
 RpBycZZW2nmD033Bh34kHeuIwf53WZ+fICSxu4u9mWMeLZtKB3XRWksAWwQoVrLqdJuL
 MBSqvgF4/oHdZ7pnjTaJha3qBbv8YUwpqV+YSR+Mj25gRxCeIRFC4H2fZYT2DQQqYjmv
 lQDxFunAiHiwxvywwojK9W1i0JMK2rsXm3AlJ6Ee6I5pBjSRi31+38UnOCi30GeC4AVZ
 t0CnyAfTzFZyr9SeOCxo1IsqpH0aKSJtD29yKS5x7h4Izi/atUwBJQ/GhnfmPG0QP6w8
 RmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J3cCf84pRGt6l3COYzuciKUqvDHPbTbbZOlMmG44vxw=;
 b=mXXOVvlnx+rk7BRnELHO0M+zEUCcfni1u012AzGiNR/L8QvAHHDMl+TybzrjycnGFD
 BOTvS9QG2xPYK3ebQl8TvOwsSkvwMSSIeGPbCMNl62gOuaCTp6lqQM/4XdoXOPGWsW9u
 YOGTKDQMK1//daEj8R0mwGvufVrc1kHbDvSL0S/SXocOj81qFjou8GIU9MJv+qVS0OP4
 I8F4/z0skOA3HVfVwfnnEqH//Kx3uqF+/LmVilM8Dq527tFkJRNWJs4KLP37J6XeXZtw
 rT0n8/Ew4IrC43/S4OkNRfPXvM+MhXYkydnafnKcvsFv+rvK0yy9WJMHCwp5GqNo117k
 yKtw==
X-Gm-Message-State: AOAM531v5TgDQE/j0KkHHm+GLmqUNMZxrGYsOjcwngWit1pKB7LpFJAm
 Q+g9+zpnzNl1bO1QRULWDWY=
X-Google-Smtp-Source: ABdhPJx0RgyDVZQWPrb6x6zJPwDKqXLGzxbxW5FGgwrrubkiuhc4r1yprGmf0a6Yu5+CdWiXcSazig==
X-Received: by 2002:a17:902:b486:: with SMTP id
 y6mr6703488plr.100.1598113020841; 
 Sat, 22 Aug 2020 09:17:00 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id r7sm6114638pfl.186.2020.08.22.09.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 09:17:00 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Sun, 23 Aug 2020 00:16:46 +0800
To: Dmitry Vyukov <dvyukov@google.com>
Message-ID: <20200822161646.xwtpms3fgdmfa7vk@Rk>
References: <000000000000c57f2d05ac4c5b8e@google.com>
 <20200820060713.smilfw3otuunnepe@Rk>
 <CACT4Y+ZcU11Y0OrxsdKcwqAmJ2BmnP9pCYB1gtiBgciM0+H=cA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+ZcU11Y0OrxsdKcwqAmJ2BmnP9pCYB1gtiBgciM0+H=cA@mail.gmail.com>
Cc: syzbot <syzbot+dd768a260f7358adbaf9@syzkaller.appspotmail.com>,
 Johan Hedberg <johan.hedberg@gmail.com>, Rafael Wysocki <rafael@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, abhishekpandit@chromium.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Aug 20, 2020 at 08:13:47AM +0200, Dmitry Vyukov wrote:
>On Thu, Aug 20, 2020 at 8:07 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> On Fri, Aug 07, 2020 at 09:47:20AM -0700, syzbot wrote:
>> >Hello,
>> >
>> >syzbot found the following issue on:
>> >
>> >HEAD commit:    5a30a789 Merge tag 'x86-urgent-2020-08-02' of git://git.ke..
>> >git tree:       upstream
>> >console output: https://syzkaller.appspot.com/x/log.txt?x=1660c858900000
>> >kernel config:  https://syzkaller.appspot.com/x/.config?x=c0cfcf935bcc94d2
>> >dashboard link: https://syzkaller.appspot.com/bug?extid=dd768a260f7358adbaf9
>> >compiler:       gcc (GCC) 10.1.0-syz 20200507
>> >syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14b73afc900000
>> >C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=124893a4900000
>> >
>> >The issue was bisected to:
>> >
>> >commit 4f40afc6c76451daff7d0dcfc8a3d113ccf65bfc
>> >Author: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>> >Date:   Wed Mar 11 15:54:01 2020 +0000
>> >
>> >    Bluetooth: Handle BR/EDR devices during suspend
>> >
>> >bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11cb1e0a900000
>> >final oops:     https://syzkaller.appspot.com/x/report.txt?x=13cb1e0a900000
>> >console output: https://syzkaller.appspot.com/x/log.txt?x=15cb1e0a900000
>> >
>> >IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> >Reported-by: syzbot+dd768a260f7358adbaf9@syzkaller.appspotmail.com
>> >Fixes: 4f40afc6c764 ("Bluetooth: Handle BR/EDR devices during suspend")
>> >
>> >debugfs: Directory '200' with parent 'hci0' already present!
>> >list_add double add: new=ffff88808e9b6418, prev=ffff88808e9b6418, next=ffff8880a973ef00.
>> >------------[ cut here ]------------
>> >kernel BUG at lib/list_debug.c:29!
>> >invalid opcode: 0000 [#1] PREEMPT SMP KASAN
>> >CPU: 1 PID: 6882 Comm: kworker/u5:1 Not tainted 5.8.0-rc7-syzkaller #0
>> >Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
>> >Workqueue: hci0 hci_rx_work
>> >RIP: 0010:__list_add_valid.cold+0x26/0x3c lib/list_debug.c:29
>> >Code: 57 ff ff ff 4c 89 e1 48 c7 c7 20 92 93 88 e8 b1 f1 c1 fd 0f 0b 48 89 f2 4c 89 e1 48 89 ee 48 c7 c7 60 93 93 88 e8 9a f1 c1 fd <0f> 0b 48 89 f1 48 c7 c7 e0 92 93 88 4c 89 e6 e8 86 f1 c1 fd 0f 0b
>> >RSP: 0018:ffffc90001777830 EFLAGS: 00010282
>> >RAX: 0000000000000058 RBX: ffff8880a973ef00 RCX: 0000000000000000
>> >RDX: ffff888094f1c200 RSI: ffffffff815d4ef7 RDI: fffff520002eeef8
>> >RBP: ffff88808e9b6418 R08: 0000000000000058 R09: ffff8880ae7318e7
>> >R10: 0000000000000000 R11: 0000000000000000 R12: ffff8880a973ef00
>> >R13: ffff888087315270 R14: ffff88808e9b6430 R15: ffff88808e9b6418
>> >FS:  0000000000000000(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
>> >CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> >CR2: 00007ffdcd6db747 CR3: 000000009ba09000 CR4: 00000000001406e0
>> >DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> >DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> >Call Trace:
>> > __list_add include/linux/list.h:67 [inline]
>> > list_add_tail include/linux/list.h:100 [inline]
>> > kobj_kset_join lib/kobject.c:196 [inline]
>> > kobject_add_internal+0x18d/0x940 lib/kobject.c:246
>> > kobject_add_varg lib/kobject.c:390 [inline]
>> > kobject_add+0x150/0x1c0 lib/kobject.c:442
>> > device_add+0x35a/0x1be0 drivers/base/core.c:2633
>> > hci_conn_add_sysfs+0x84/0xe0 net/bluetooth/hci_sysfs.c:53
>> > hci_conn_complete_evt net/bluetooth/hci_event.c:2607 [inline]
>> > hci_event_packet+0xe0b/0x86f5 net/bluetooth/hci_event.c:6033
>> > hci_rx_work+0x22e/0xb10 net/bluetooth/hci_core.c:4705
>> > process_one_work+0x94c/0x1670 kernel/workqueue.c:2269
>> > worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
>> > kthread+0x3b5/0x4a0 kernel/kthread.c:291
>> > ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:293
>> >Modules linked in:
>> >---[ end trace b1bcc552c32d25e9 ]---
>> >RIP: 0010:__list_add_valid.cold+0x26/0x3c lib/list_debug.c:29
>> >Code: 57 ff ff ff 4c 89 e1 48 c7 c7 20 92 93 88 e8 b1 f1 c1 fd 0f 0b 48 89 f2 4c 89 e1 48 89 ee 48 c7 c7 60 93 93 88 e8 9a f1 c1 fd <0f> 0b 48 89 f1 48 c7 c7 e0 92 93 88 4c 89 e6 e8 86 f1 c1 fd 0f 0b
>> >RSP: 0018:ffffc90001777830 EFLAGS: 00010282
>> >RAX: 0000000000000058 RBX: ffff8880a973ef00 RCX: 0000000000000000
>> >RDX: ffff888094f1c200 RSI: ffffffff815d4ef7 RDI: fffff520002eeef8
>> >RBP: ffff88808e9b6418 R08: 0000000000000058 R09: ffff8880ae7318e7
>> >R10: 0000000000000000 R11: 0000000000000000 R12: ffff8880a973ef00
>> >R13: ffff888087315270 R14: ffff88808e9b6430 R15: ffff88808e9b6418
>> >FS:  0000000000000000(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
>> >CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> >CR2: 00007ffdcd6db747 CR3: 0000000009a79000 CR4: 00000000001406e0
>> >DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> >DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> >
>> >
>> >---
>> >This report is generated by a bot. It may contain errors.
>> >See https://goo.gl/tpsmEJ for more information about syzbot.
>> >syzbot engineers can be reached at syzkaller@googlegroups.com.
>> >
>> >syzbot will keep track of this issue. See:
>> >https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>> >For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>> >syzbot can test patches for this issue, for details see:
>> >https://goo.gl/tpsmEJ#testing-patches
>> >
>> >--
>> >You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
>> >To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
>> >To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000c57f2d05ac4c5b8e%40google.com.
>>
>> This problem occurs because the HCI_EV_CONN_COMPLETE event packet is sent
>> twice for the same HCI connection,
>>
>>      struct hci_ev_conn_complete complete;
>>      memset(&complete, 0, sizeof(complete));
>>      complete.status = 0;
>>      complete.handle = HCI_HANDLE_1;
>>      memset(&complete.bdaddr, 0xaa, 6);
>>      *(uint8_t*)&complete.bdaddr.b[5] = 0x10;
>>      complete.link_type = ACL_LINK;
>>      complete.encr_mode = 0;
>>      hci_send_event_packet(vhci_fd, HCI_EV_CONN_COMPLETE, &complete,
>>                              sizeof(complete));
>>
>> which leads to kobject_add being called twice. Thus duplicate
>> (struct hci_conn *conn)->dev.kobj.entry is inserted into
>> (struct hci_conn *conn)->dev.kobj.kset->list.
>>
>> But if it's the HCI connection creator's responsibility to
>> not send the HCI_EV_CONN_COMPLETE event packet twice, then it's not a
>> valid bug. Or should we make the kernel more robust by defending against
>> this case?
>
>Hi Coiby,

Hi Dmitry,

>
>Whoever is sending HCI_EV_CONN_COMPLETE, this should not corrupt
>kernel memory. Even if it's firmware, it's not necessary trusted, see:
>https://www.blackhat.com/us-20/briefings/schedule/index.html#finding-new-bluetooth-low-energy-exploits-via-reverse-engineering-multiple-vendors-firmwares-19655
>and:
>https://www.armis.com/bleedingbit/
>So if an attacker takes over firmware, they can then corrupt kernel memory.

Thank you for sharing the links. Although I haven't found out how exactly
this "list_add double add" corruption would be exploited by an attacker
in the two resources or on the Internet (the closest one I can find is
CVE-2019-2215 which exploits list_del with CONFIG_DEBUG_LIST disabled),
this should be an interesting bug and I'll learn more about Bluetooth to
fix it.

--
Best regards,
Coiby
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
