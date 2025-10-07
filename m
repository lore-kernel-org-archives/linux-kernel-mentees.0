Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8936242AA3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 00:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759798026; cv=none; b=UbT8oGeDRpSSeEkbuMCgPlxmq2YJJERNNwSRu0vQsjKbauhevYTFGOa7JdQ+3Z7ukNzqxFIje9taKYNLZ9l/PyT1d3msoeJcnyQN1Var4iuQg0CZt2mZxtGlVlhjyzdpzIhgwIr//3pUuV+RpxPWx46ItQo1AvcFzI5rQi+wiJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759798026; c=relaxed/simple;
	bh=/edHMvz+Y94IkGIsLIBbfy4ZTCY+RKCL1yC1EXnf1Mw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TVVtO9PEi7R+SygJiAa6k2IgD6Ady+/gZ3BO7RtyAhs+lqxAf4fkJy6OyF1ytSROaAuiAa+vY8Qk3C9+YqNvf+SKauiYtsEeiUHn+OrLZtqGHXDjommQKVanyov55I/awUa2p1/uqCmK7bSJjIUyzoWuPd4rgIvd5qLCjW/i3Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D54C84301
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 00:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.838
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqjEIJno63Gx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Oct 2025 00:47:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.200; helo=mail-il1-f200.google.com; envelope-from=3bmpkaakbaksdjkvlwwpclaato.rzzrwpfdpcnzyepye.nzx@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E86B84225
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=syzkaller.appspotmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E86B84225
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3E86B84225
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 00:47:03 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-42f610046d9so101248735ab.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 06 Oct 2025 17:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759798023; x=1760402823;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3PbGjzVRxtTuYpOOcutOEgeT9EIRHwUbach4rkxczu8=;
        b=NEu64yVuc3CuPdsJVWXWKGomEG9J3UEBPQ/neu5qEwrbIzfi01v3bzllKTUFPDGJhE
         oxqxAzA5sNqieWw/CWWNSpG4gbWAuJ4WS4hhnERSUAsu7t4PPmBa03F5zhu1ou//ucsi
         HuN+C5a4UcrqmQPzTeMJvA+qHAIJFHL4YrPtYa0Iwigq7y8Bm5dko91iT4FCQ+E+x9sn
         9Zv2iD7vtFJKYItgt88OkUih2HmXCAEch/AFwQQJkAWjm8w1ezMcKquH8smcSXErNh9K
         ZAW9FS4wVkiTTHKaNvqrZAzfT0/emtavC8tngxqCd2aRm473HPcYU3RKOQlv4/4OKa7l
         SXmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/fvKj1fGuREvyW7yDDHQ2rndgTwstu6xaYuBm9XBAQopMwdlf1TSeSC9HK5VKsUb8ezMYAK4l/U6GJ1RhlXpvchEjtA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx3y9xPXBaf5Y/KAfcSCMwWJPFG+XA2QaTQKxmBlP2a776jcRjm
	Q0U8fGIDMWVCnV3yu8huQ9IrGBqSHTdYk5KuWnp7CGfjSj2oLg/duIbYkJ5k8UcQOTrTdI5UGti
	w8q3QBAxMQ9d78bdjDnMEDwQBowHMCHJwvI9ksOp8p9vWDM0y3YIyU1IhYBY=
X-Google-Smtp-Source: AGHT+IFuQmXH2Y1R/sHKs/tHlrWglwesCLeiRlwymjn5Hs9AoFRCepyxaawNkimFNHgnmEwnlFaj0zeCnge1l6GKUHCHKJSkJGqF
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e02:b0:42d:5d48:acb9 with SMTP id
 e9e14a558f8ab-42e7ad0501dmr176812735ab.7.1759798022940; Mon, 06 Oct 2025
 17:47:02 -0700 (PDT)
Date: Mon, 06 Oct 2025 17:47:02 -0700
In-Reply-To: <20251006223805.139206-1-nirbhay.lkd@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68e46306.a00a0220.298cc0.046c.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] KMSAN: uninit-value in attr_set_size
From: syzbot <syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, david.hunter.linux@gmail.com, 
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org, nirbhay.lkd@gmail.com, ntfs3@lists.linux.dev, 
	skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com
Tested-by: syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com

Tested on:

commit:         9b0d551b Merge tag 'pull-misc' of git://git.kernel.org..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17a855cd980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=50fb29d81ff5a3df
dashboard link: https://syzkaller.appspot.com/bug?extid=83c9dd5c0dcf6184fdbf
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1609f942580000

Note: testing is done by a robot and is best-effort only.
