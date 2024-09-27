Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519681C2317
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 27 Sep 2024 18:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463548; cv=none; b=DE1T2UHYahDktUJ60mrke4GGEZl2TJm6zYc3OQ2cwWFj1HsmcHuNZDmbb9ue7jOSXy3q23Oh47TOWrmmAWuKpACLxnnVsKYv/SuRpeoj6Ku7/2+dKbDnYXT9gGDrigZW3j5Hs/Th1G+RIIRwWWIiXQew0NUQBK4oC5PmCf0J1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463548; c=relaxed/simple;
	bh=ky0Qt5OUyJliJOveB+7uwkeqJHQ34/da2gDj0EVdVh8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aY2d1dFTk9acB6wF/pAqoPhHMeWvVA8qR2eOF9tzE5RvFN7/CdVGrhrk7ZVGHHBKhFgK+jJ2+6/L/q8Ao1qNCUm+Z7Yk+E1RSypLXlDdBE9LjY13kRMut0WsHGZq6EVzIqSh7a/yVB+cWufNJRbaIVF1UwRrvdBZ9IOYNbAqhpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0D3F424BE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 27 Sep 2024 18:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.838
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwzAndecR4xz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Sep 2024 18:59:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.198; helo=mail-il1-f198.google.com; envelope-from=3ead3zgkbajmflm7x881excc50.3bb381hf1ezbag1ag.zb9@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F99441E2C
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=syzkaller.appspotmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F99441E2C
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6F99441E2C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 27 Sep 2024 18:59:05 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a1a6d8bb03so31563275ab.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 27 Sep 2024 11:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727463544; x=1728068344;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3dTrhEW4JbtxGsv9/ziMsjoJhu8gsQrCpGygXIu/nBQ=;
        b=tSkGwMhQBnmulq5QI125atB6Ln0t8lfAtBtuZEmUCMn/FV8AcVPQXTctGwEXAqgWA1
         Y8EjaaprpiOIoWKkh3SMQ9HbYNgoO3rYwXodtWFD7Rtu0wGVkYb5egRX0h2IkB9tsI6N
         eC5+ij9PI4acicss9+nbtJ5VcK/+38R+T5pAJTo72heq+ZzV2Jt21U8ldvFCdLqp+Y2T
         O2JWZdxXOejyY/PCFA54bCcfOaAbDkqw0I7D+EOK0BR4VxFk4wwwLotzCL6Rv9gVoCZ6
         IRdrnywU4VB5iQz3RQ3Xis9iwRZw6b/9ep2OAupNYCRwEhqHuoR0iuIJYtgiGo5ge71W
         vrzA==
X-Forwarded-Encrypted: i=1; AJvYcCXhuVr7vmI6c4+EGuSakAH2RqGvK9f1UMLdTv9o9O/EH4YYn46gpF4HUx8PCJrn8bkODtaP2EgQ7uxSkXtYURUpTp6ptg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyA7kDwEOhgocN4jLedy5XHSCkFjHqgEHOli4kiSWiX73BTOTHU
	cMQBRf84tSkPB/9g2Pmh477F2zmaFjCplI6cv11bwjbAtsZAVd846YvyAHVYb6sw3iNmdlIUgJS
	/k6l1GQLbAOXedCOJIDzQVRqy3cAc0mfLAtX/4Azl6yXGIV3APb0cY+o=
X-Google-Smtp-Source: AGHT+IFqa7yF6ECvwnlAxi3NdjJ+CnDzIfbmLXO7BSnSZm+8+qYvYSHemIaLjKJV7fVtke5qcGUD3IsXyAqMg5c4+lgltsFxaoGO
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:164b:b0:3a0:9ea3:8d79 with SMTP id
 e9e14a558f8ab-3a3451bbd54mr45858575ab.16.1727463544448; Fri, 27 Sep 2024
 11:59:04 -0700 (PDT)
Date: Fri, 27 Sep 2024 11:59:04 -0700
In-Reply-To: <20240927165132.17289-1-rbrasga@uci.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66f70078.050a0220.46d20.0024.GAE@google.com>
Subject: Re: [syzbot] [ext4?] WARNING: locking bug in ext4_ioctl
From: syzbot <syzbot+a3c8e9ac9f9d77240afd@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	rbrasga@uci.edu, skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com, 
	tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING: locking bug in ext4_ioctl

loop0: detected capacity change from 0 to 512
ext4 filesystem being mounted at /root/syzkaller-testdir500386566/syzkaller.6PgxEV/36/bus supports timestamps until 2038-01-19 (0x7fffffff)
------------[ cut here ]------------
Looking for class "&ei->i_data_sem" with key init_once.__key.799, but found a different class "&ei->i_data_sem" with the same key
WARNING: CPU: 1 PID: 5815 at kernel/locking/lockdep.c:939 look_up_lock_class+0xdc/0x170 kernel/locking/lockdep.c:936
Modules linked in:
CPU: 1 UID: 0 PID: 5815 Comm: syz-executor.0 Not tainted 6.11.0-syzkaller-11673-geee280841e1c-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:look_up_lock_class+0xdc/0x170 kernel/locking/lockdep.c:936
Code: 01 0f 85 8a 00 00 00 c6 05 b3 f8 46 04 01 90 49 8b 16 49 8b 76 18 48 8b 8b b8 00 00 00 48 c7 c7 60 ea ea 8b e8 75 2c bf f5 90 <0f> 0b 90 90 eb 61 90 e8 08 44 18 f9 e8 53 5e de f5 48 c7 c7 a0 e9
RSP: 0018:ffffc900049ef4f0 EFLAGS: 00010046
RAX: 3592bb3d4927ad00 RBX: ffffffff931c0730 RCX: ffff888027c18000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900049ef600 R08: ffffffff8155a9c2 R09: 1ffff1101722519a
R10: dffffc0000000000 R11: ffffed101722519b R12: ffff888077aadbb0
R13: ffff888077aadbb0 R14: ffff888077aadbb0 R15: ffffffff94d9f1c1
FS:  00007f214c1256c0(0000) GS:ffff8880b9100000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000002000e000 CR3: 0000000027aec000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 register_lock_class+0x102/0x980 kernel/locking/lockdep.c:1290
 __lock_acquire+0xf0/0x2050 kernel/locking/lockdep.c:5074
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5822
 down_write_nested+0xa2/0x220 kernel/locking/rwsem.c:1695
 swap_inode_boot_loader fs/ext4/ioctl.c:432 [inline]
 __ext4_ioctl fs/ext4/ioctl.c:1436 [inline]
 ext4_ioctl+0x4124/0x5590 fs/ext4/ioctl.c:1626
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f214b47dea9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f214c1250c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f214b5abf80 RCX: 00007f214b47dea9
RDX: 0000000000000000 RSI: 0000000000006611 RDI: 0000000000000004
RBP: 00007f214b4ca4a4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007f214b5abf80 R15: 00007fff61b66448
 </TASK>


Tested on:

commit:         eee28084 Merge tag 'mm-hotfixes-stable-2024-09-27-09-4..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=161cde27980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6e73c530afb43e82
dashboard link: https://syzkaller.appspot.com/bug?extid=a3c8e9ac9f9d77240afd
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17082507980000

