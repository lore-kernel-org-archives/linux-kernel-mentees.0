Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A40125B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 16 Jan 2024 08:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB5F4096B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 16 Jan 2024 08:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEB5F4096B
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 0.853
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m5rj4QAWpsuP
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 16 Jan 2024 08:20:07 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BAD98408DA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 16 Jan 2024 08:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAD98408DA
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3610073a306so8572175ab.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 16 Jan 2024 00:20:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705393207; x=1705998007;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P4AGGCWKnuT2bwg8lZv/N9IC2unP9VYmjMc7v61ESxY=;
        b=prrrdPGolaaMZ/rAkZrTn8rQNY/2hFmlFq+P0OmT3ZuB32826GYyIRP6z72MqF6tTL
         B5IViW9AgNBcJj/gnNZKdSMVYwWjQAmj/PtAkNotyAz9nx5NEaKLPqqKVXJOtbcp+EGb
         eBQOIf1tv3b0AJBk4e/oJe24YuLq23I+NEekZw2FEHf1eLL3tznLPGVb22g+9QMaDjPN
         mbmVu1qhMxyzGEsK76Wp/NR1g61eC9CV33wQ84nRAJWhCzCH1R1Oe4Nft0YfA1fr4WsN
         uRVVVgXe+esFXTWIp3Ivf84omSq59kmveS/GmrcUHQ5fV2j8HgA5xwfqIwGhS0ENlmIq
         dvUw==
X-Gm-Message-State: AOJu0YzGFv0628ZxEmmbDTFSkbCgKi4Ht6kAIXnolZwDGCvQLRF07O3u
	ygeH0ASTznCGnK1ICNo6Ib+7dPMwecI40FmuivUAogS1xiMZ
X-Google-Smtp-Source: AGHT+IEb61hugOjJ5e8Jm0bjn5QogKBHjP7P1Is1XXv85ADzC6t1Ye75sSF5jszE4L8o1PWkAbSf388qLvDMVz7EDpzCwogHqtfj
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3206:b0:35f:ebc7:6065 with SMTP id
 cd6-20020a056e02320600b0035febc76065mr971207ilb.1.1705393206943; Tue, 16 Jan
 2024 00:20:06 -0800 (PST)
Date: Tue, 16 Jan 2024 00:20:06 -0800
In-Reply-To: <000000000000653bb6060afad327@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004d67e4060f0bcc7b@google.com>
Subject: Re: [syzbot] [bfs?] general protection fault in bfs_get_block (2)
From: syzbot <syzbot+dc6ed11a88fb40d6e184@syzkaller.appspotmail.com>
To: aivazian.tigran@gmail.com, axboe@kernel.dk, brauner@kernel.org, 
	jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, yuran.pereira@hotmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16c3c513e80000
start commit:   98b1cc82c4af Linux 6.7-rc2
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=aec35c1281ec0aaf
dashboard link: https://syzkaller.appspot.com/bug?extid=dc6ed11a88fb40d6e184
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16783b84e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=165172a0e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
