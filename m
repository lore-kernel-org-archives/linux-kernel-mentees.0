Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6997E586
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Mar 2024 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710846187; cv=none; b=fMVram3CsQHGeB2moNr9DGfXXSrjX41yHFLBrog01Zx2/L31d1sQCNkGJIGAsMn0n5EA09ci70UDzuZeEDvbhz0xuZBBOcteS1vNkO2LOxTnlHUlDDiOy4e1pUiQ3YNEQnmfwo9iDsc0Sr/lrezKEr5sXiT9VfptIU27jLWDplQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710846187; c=relaxed/simple;
	bh=slKjRaMkRRkHh/39qn7hwcXp2X2erWHCbqhQGdEu/ow=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=d8OeGW9EU2FNyZpOG03lyWBJvutNOiOMnbctVg7dXW5oTHbXrBidOxkPWJpbr7tg5xP2S7Es/hQTR94ldySRvD1+xEGCAfp/X9oRKqV82Vb6zRnP8R3A4ujcNsOmOQxEScWm22n/d/d+/qGIFGf0OFz2aQUw9qeOlEMOzzvHO7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E52A681E01
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Mar 2024 11:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 0.853
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FhmRDx5N_RNO
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 19 Mar 2024 11:03:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.199; helo=mail-il1-f199.google.com; envelope-from=353d5zqkbaoqyefqgrrkxgvvoj.muumrkaykxiutzktz.ius@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F374F81E02
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=syzkaller.appspotmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F374F81E02
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F374F81E02
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Mar 2024 11:03:04 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3684e301749so2777485ab.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Mar 2024 04:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710846183; x=1711450983;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NS31IZUVISj+9f5GH0XsvKxqqRb+tl8wJ9ZGlJagits=;
        b=r6J+xK5hxgdpuLEBPuaBbXr6EUsFgA8CcwagEboR50ji3Zk2VW71F9JxVDWYO5Z3hR
         U4Z6sWVPIOA65ijtIYIqLPq21+UhqtT90K1Q6FFRo94rriothl6aNHxPF4y3/c6Y/5Wi
         m3B+17sheCNCEO5hWKq0KP+tcACRCXJeuge95FZZ5XjhkQeDsjTmhVp6BLr3j4CFPYH3
         n8npyfXfybGYklCwFjaHOctonhzBBCG6v1E5+rSbdEklXEhnvvp54gxS2J10cn/ww8YU
         yU4WSHowKtWsXIZ76CyKxUPmyTRW29OL/9UnIYFdao92wNScrpYVpWymS9wijiuNWdp6
         QMFw==
X-Forwarded-Encrypted: i=1; AJvYcCXE6FuoIi3u0jDF90NHCgIQ0gw6Hs94k4/6JizT90o0MPXD0pxPm8Br69/H7EYZYwwzrha4RR+UiHSl5MMxEfB6pMKYCPgDqSssPayUZ0dt69riaYf6ZAHjGqWVJ1Ay
X-Gm-Message-State: AOJu0Yx2II64uaiT/dfOjdlxESh7oiowgX1I5GiMEdoKc9uk+J/J+/wv
	H2W/hMx26pxI/0TGOYohUIQblOHYxA8bTSgXAkP0BeDQEgLdj1La2W+HvCUWoHImgiPOP9rzeLp
	IJOmtN/EigsflDLkBhbX9Y8eINBo9dFN2nAnyF7TOjDSFkLSEAbxwo0Q=
X-Google-Smtp-Source: AGHT+IFiDK1WT/n8TCOKAH5CGiH/AJ5QTidJfxOX7D2n/lTfWZAch3GSOQ51Bj+zC4HRoLqpgpszLLuCibMY38T8UfSWzD9bvdOO
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c02:b0:366:c200:a9fa with SMTP id
 l2-20020a056e021c0200b00366c200a9famr121313ilh.1.1710846183604; Tue, 19 Mar
 2024 04:03:03 -0700 (PDT)
Date: Tue, 19 Mar 2024 04:03:03 -0700
In-Reply-To: <000000000000aefc5005f5df169b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000a1c180614016bc9@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: use-after-free Read in ntfs_attr_find (2)
From: syzbot <syzbot+ef50f8eb00b54feb7ba2@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, anton@tuxera.com, 
	brauner@kernel.org, david@fromorbit.com, ghandatmanas@gmail.com, 
	linkinjeon@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, syzkaller@googlegroups.com, 
	willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 7ffa8f3d30236e0ab897c30bdb01224ff1fe1c89
Author: Matthew Wilcox (Oracle) <willy@infradead.org>
Date:   Mon Jan 15 07:20:25 2024 +0000

    fs: Remove NTFS classic

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11fafac9180000
start commit:   9d64bf433c53 Merge tag 'perf-tools-for-v6.8-1-2024-01-09' ..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a6ff9d9d5d2dc4a
dashboard link: https://syzkaller.appspot.com/bug?extid=ef50f8eb00b54feb7ba2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13d79fbde80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14be4a73e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Remove NTFS classic

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
