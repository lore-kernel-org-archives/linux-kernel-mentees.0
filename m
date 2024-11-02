Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261EA188721
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  2 Nov 2024 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730548628; cv=none; b=O7fmzucAE1Ji7gocyxyyPmbFU2SaogI8wLgEjPGNPYPk1O0qqh8JUht6MMXKLei3b3GxIsJCZLhFI3H/xG8esHcXJP2qX9idkgbmWnsVfSUzcq3tqUMf81RaiMmUU2OHFm/h29+KbFFlYGMxbyFwQHxj+arBdS0/T0RRqUtZDEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730548628; c=relaxed/simple;
	bh=hY7Qp0LVBzkxDGAGCzMbU3IbUplH3cDlFNADtweXEZc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XzrIqhkXK2SRdx76Itw8Dun81JOqMK6ZFpSxMICLqRGkW45QJ62cG/yI5zJQ6e4V+lksme0NbLdKQRXWM8YktovplPQ/lTBsm0BBdfyfNoM9kWgvCf/7K1Uz01/SW5DWoce/T9BmipXvKoZCcQABm9YAIyhzOnoO96iX2gk5ub4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFA9481D5A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  2 Nov 2024 11:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.838
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJW0z8sD1TMX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Nov 2024 11:57:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.72; helo=mail-io1-f72.google.com; envelope-from=3kbmmzwkbai8bhi3t44xat881w.z77z4xdbxav76cx6c.v75@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE24D8193E
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=syzkaller.appspotmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE24D8193E
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BE24D8193E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  2 Nov 2024 11:57:05 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-8353599024bso254045539f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 02 Nov 2024 04:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730548625; x=1731153425;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQgRivpVF9UQ7N/9UZp37aX+ZdPtlXZX6nCsGrsrK7A=;
        b=e+L8se/9hr0KWOFmGrZkwEUKmhn8gUfdY+99VLkLBcCmUBBYi2pmLL7pW32pGXRSu1
         PctR88h32VlxyOkEmDGwMbB/K2cZ6gTjMcSeKBY4Lx4+25U0RehcG0MuMb5P+reby8YK
         llBCquibznWT0dsh++K3+DQuhfvCCPGw+djhw8mRg7ghHfTMTBGheNeUBXLa3rKFk0jP
         lUeglRtWWFszHeRPvPd0m90akvWrWWGm2YJA4Ecwu43BI1bqPFYSN1n/7fUYhCf5FXHP
         od8g5zbELmL7xaRrq1VZIi+rEpwH0pa/RsdJx82jiO4PGJm746AHwF7YNJUVjNArR5GF
         dbLw==
X-Forwarded-Encrypted: i=1; AJvYcCXNDldTGVYGX2g7mQWRTJZidPfKTV5H8Mxyy7/DXMlbuVNABtljQG4xKsFfH+RgKdE1fq4JoukllQz9EYxGakv6sb9jtQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywq9rckI7+tk46xS5kj8lixYenwLsIXPGn+vSJSTeidUaU+X56i
	gvIYcMqTWzWWdPvq9lJAlY5dj9UbXKlEZInV2kdgWuHlKd5bHpb/1fGT6nXobG3brduiiu0Za0K
	glSfgxX09vtmrTTcEXFSt2SkYKqcq5g+xQsyaL7il+Iohwx2NwqbAGaY=
X-Google-Smtp-Source: AGHT+IFmFNjiUlFoZ19V4DOoAQ7Yfyn3jBQxK76YJvFOFc/MWy6VS9PygxeZAEgcCOGek4QuT953M5xXCWp1GzRzKm+B7wTJlhH1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fcc:b0:3a0:49da:8f6d with SMTP id
 e9e14a558f8ab-3a4ed3057c0mr239739905ab.22.1730548624722; Sat, 02 Nov 2024
 04:57:04 -0700 (PDT)
Date: Sat, 02 Nov 2024 04:57:04 -0700
In-Reply-To: <6716521c.050a0220.1e4b4d.005a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67261390.050a0220.3c8d68.0976.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] kernel BUG in bch2_dev_btree_bitmap_mark
From: syzbot <syzbot+e8eff054face85d7ea41@syzkaller.appspotmail.com>
To: anupnewsmail@gmail.com, bfoster@redhat.com, devnull@kernel.org, 
	john@stoffel.org, kent.overstreet@linux.dev, lihongbo22@huawei.com, 
	linux-bcachefs@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	manas18244@iiitd.ac.in, skhan@linuxfoundation.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 60f2b1bcf519416dbffee219132aa949d0c39d0e
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Tue Apr 16 23:33:51 2024 +0000

    bcachefs: Add asserts to bch2_dev_btree_bitmap_marked_sectors()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13d4cb40580000
start commit:   6c52d4da1c74 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1034cb40580000
console output: https://syzkaller.appspot.com/x/log.txt?x=17d4cb40580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f527353e21e067e8
dashboard link: https://syzkaller.appspot.com/bug?extid=e8eff054face85d7ea41
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e972a7980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15ead340580000

Reported-by: syzbot+e8eff054face85d7ea41@syzkaller.appspotmail.com
Fixes: 60f2b1bcf519 ("bcachefs: Add asserts to bch2_dev_btree_bitmap_marked_sectors()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
