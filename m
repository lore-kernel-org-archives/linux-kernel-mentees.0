Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC741DED4C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Jan 2025 07:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736236092; cv=none; b=rO3tdJ403ltNYkFoff0Ehaie9zGeWILf+H5WFMqaF3Q7op9NqMuiTveqsPaFRDwJSzc/u9Ip7o19WYNgZxdd54+Zae2+2C/z1MPEf1CEdjd9od7U+8q47/isMzzTDzZxDnNUKFboXfcVWgiO6PM18XwfD8QW/4qVzR7tmNBVrUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736236092; c=relaxed/simple;
	bh=uaVVdzHvimeT06a3yMQxd4H4JJ3bnfuSNFVWvQxNyo0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KrmHJnpE9udzZe2Aq5OsxAwk0WJueOMJV8/tlnrH+GcF7wapkuD+ykdXy/Vqkm6i04LdmgaIvUxFjBDnXU/UkhbN7iXN/tnb/JGGsdqjhUz8+vPLJKruEfNAs4Z8P/2FVIEAO6hYPtG4OAIu3Oq43MPb9gzL/19UTr/gqN86MiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 458214101A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Jan 2025 07:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.838
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Z8lNy0xDAG4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2025 07:48:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.200; helo=mail-il1-f200.google.com; envelope-from=3m9x8zwkbaciqwxi8jjcp8nngb.emmejcsqcpamlrclr.amk@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3179341016
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=syzkaller.appspotmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3179341016
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3179341016
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Jan 2025 07:48:04 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ae31bb8ee3so318496255ab.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 06 Jan 2025 23:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736236083; x=1736840883;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+0LRMsuN1s1WV9iFBr4RyKU3rvRdJKMKEAM5GaIKjUo=;
        b=b0E4K95JBCed6KIC8mpvv2WxVGA3F442+QBe+Ie8eisJGMCI7ufvOwhQ9J8TrScTez
         /Vae5tsa8HJkXet+IXgv9r+DJksekN5+h5R7vbf2bUiIO11NzD+3X3lLgZ427d7YfmDP
         0x04OuVBe5fOzpNuw5H7Hx7cXHU9K2Go1FO8VVfe+DmXUVlMcR2uhXCcwjOYhOTw0Kg3
         a4wLQEh/oDVg6xybqMev+flulhEmDydY/P7ht6+XcOJ+zMfO8IzWEnd6ehVwA6lHvGPi
         rg6bTInpCorFVsuVU+F4fWeaTPClpm8fZHvUZC43Lm0dFjRK/PSQuxWM3zMwKUI5j1hF
         +fAA==
X-Forwarded-Encrypted: i=1; AJvYcCVVsX4w7m+OF/B3U1fSB6dv3TJZHxfSzeJE6pHKYvfhL9HdBUCbVe0a8SgDtCnCQs5C2qKLf2do72DyIK8G1MkUxpAyOQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyfOT0rArmHRNWtqrjJbPEVqNmcwPmGIX3OLNhZSAs4EvXbKvxv
	KVNqpd//4ephJs6Hk54XhX+ivbl+6dYlijgP2OEqmP51Wj/RyAPYSjexNgVQo+2/Rtiz6nLmXIV
	G0Trx8SDZqywAVI6I150icIJASTyRwFzbEvgNNBiPf0+XPj5zLj48hEg=
X-Google-Smtp-Source: AGHT+IHDptQRW0FdBNOP4RuSazmJVDi5pAb0YIRMujgxtO70akVi8BHtliImaXYT/qZJouOKonbPJH5Yoc43GUbFsaYWGkaL9Iai
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:198d:b0:3a7:1bfc:97c6 with SMTP id
 e9e14a558f8ab-3c2d514f9bdmr460357485ab.16.1736236083179; Mon, 06 Jan 2025
 23:48:03 -0800 (PST)
Date: Mon, 06 Jan 2025 23:48:03 -0800
In-Reply-To: <000000000000d1149605fd5b0c0d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <677cdc33.050a0220.a40f5.0019.GAE@google.com>
Subject: Re: [syzbot] [ext4?] WARNING: locking bug in ext4_ioctl
From: syzbot <syzbot+a3c8e9ac9f9d77240afd@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, boqun.feng@gmail.com, bottaawesome633@gmail.com, 
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	longman@redhat.com, mingo@redhat.com, peterz@infradead.org, rbrasga@uci.edu, 
	skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com, tytso@mit.edu, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit d7fe143cb115076fed0126ad8cf5ba6c3e575e43
Author: Ahmed Ehab <bottaawesome633@gmail.com>
Date:   Sat Aug 24 22:10:30 2024 +0000

    locking/lockdep: Avoid creating new name string literals in lockdep_set_subclass()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16c9ffd8580000
start commit:   e42b1a9a2557 Merge tag 'spi-fix-v6.12-rc5' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=4aec7739e14231a7
dashboard link: https://syzkaller.appspot.com/bug?extid=a3c8e9ac9f9d77240afd
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=123fef57980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1598eebb980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: locking/lockdep: Avoid creating new name string literals in lockdep_set_subclass()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
