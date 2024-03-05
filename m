Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFAA128807
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  5 Mar 2024 20:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709670069; cv=none; b=c3M2ZJxN36XJZaDaH6rolyA/TAFxwqpHgNEdvdJP6uVgtzoT3oPOEgrG5tYmAfJOyeAjt1HZFrjk1sE3MFoFzuB4VH1lu3tBHhLou/iBFlvaeqri1upWyUMe9hkulfcQq1Oq1YpQW73KxSnwkFlRwtr98z3CNh7JCb5/9smMIOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709670069; c=relaxed/simple;
	bh=6/AYUfzDqzkrxKkZjplJh9OD3V2IdKBUYScD8zp5YJg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=j1BgUoEzh54wJklNzsIj3zP+IKK94X0VP1XfBiJndXl4ocK4STB34WVZGatJqWIl49o44sbhoS3GQEko+3YJHtYD497yjjMPm/euktlhx2jDhQlz5iuToaceHv2Vq0u9BK1o22K5lyXZ8eYiHJSA66zAhaSPCaAfFOg+7jH+/EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E27782219
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  5 Mar 2024 20:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 0.853
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SoOiN5Zxd6WV
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Mar 2024 20:21:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.198; helo=mail-il1-f198.google.com; envelope-from=3rn7nzqkbah8v12ndoohudsslg.jrrjohxvhufrqwhqw.frp@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC02F81EDF
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=syzkaller.appspotmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC02F81EDF
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AC02F81EDF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  5 Mar 2024 20:21:03 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-365bde344ebso69511195ab.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 05 Mar 2024 12:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709670062; x=1710274862;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUtUYHZsCEOa7X6Z+H+o0TaVUl7jsvxTuXTfFKtx4Og=;
        b=pzh1iZDTB8LLsolOvso6aDDN0hHldV1yIJ/aplH5gDND8kx9uT4uz+rRPxV6X0KNyh
         B8fUeYbtQULryCcpF2f7w6vTN5Y+5lmJmitDNdueUYqIlk+yusqgioS5RNGNfarp7cb9
         uUsyYvwWz9Vc5DL0WWzWoW+3EXIv8iEAjaAxc9DDcyiu3yIpD7VIeggZOy7CHE/aWqzK
         BGSSgxmPu1mSlOzG32XXDqBWC/QtaHhCO3l983YAt9H4gUgpdXIHyy5AtUzgCllIj/9L
         TBKYuefyH2wCZt9Ku+5hSFthOBu9bYN3fw9eqLE0pCi6UGOhohtZqSoZR19hkKqcEx4U
         4mWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmwF3fJmOUD/JxNETdPnVGHVbhvWGqc1SD6m3ZKdMNrsQE7+gWgcTGTiqLsThUpEfFsbVfEthT/POWD/VvAstYbMW84rLb5i7K+SQNJ+D3HyVI9/2TqJGAgw6ODdqX
X-Gm-Message-State: AOJu0YxBGiVAuotoSfndkIOBjDBMJWcszwrqUHjfnUi0BQS7H0Y2Wssc
	s3DfZtdHmQ4ok2ol+k19098T7pfa9Il2w4EhLCH+gsmq4u/9/15gchL5KCK5BOzD9O0BDaWh3vd
	pNGO5GTGz2fK3SBWfrl3Sz9tlnZJvCQ8JHs1dy1Ij/kiFF531Wrk+RpQ=
X-Google-Smtp-Source: AGHT+IG0HrTjf9tSzpW5mhEYahI6I+CdKvynp0WSCF6pQbzs6aTIrDo95uQZixM6D1ufLCf+gnTifAlBvx8apq0D07TCgFJ6wpLj
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:6f0b:0:b0:365:fe09:6450 with SMTP id
 k11-20020a926f0b000000b00365fe096450mr104480ilc.4.1709670062725; Tue, 05 Mar
 2024 12:21:02 -0800 (PST)
Date: Tue, 05 Mar 2024 12:21:02 -0800
In-Reply-To: <0000000000000424f205fcf9a132@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c5b2ae0612ef94a9@google.com>
Subject: Re: [syzbot] [ntfs3?] UBSAN: shift-out-of-bounds in ntfs_iget
From: syzbot <syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, anton@tuxera.com, 
	axboe@kernel.dk, brauner@kernel.org, ghandatmanas@gmail.com, 
	gregkh@linuxfoundation.org, jack@suse.cz, linkinjeon@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, 
	lkp@intel.com, llvm@lists.linux.dev, ntfs3@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12be09f2180000
start commit:   afead42fdfca Merge tag 'perf-tools-fixes-for-v6.4-2-2023-0..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=162cf2103e4a7453
dashboard link: https://syzkaller.appspot.com/bug?extid=4768a8f039aa677897d0
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12da9bbd280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=174e8115280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
