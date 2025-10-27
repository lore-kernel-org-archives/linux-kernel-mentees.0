Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D658B34CDD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761567607; cv=none; b=GZJLa+Y9rq+pyR9mL5uN1I0cse+eZ3ATNIaiYzcNET4bL7//55ojwQJaIfkvGY/jrPz9DSfG2KwuuU5H3qmeM/8RAYPdtBdW8mixjgeoDNENKDgx1MqD6xg9nT5Pr8RXyStbdKBg+AodPUYcfe9S2W5BgjSp8piU8Ql1AMeuF2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761567607; c=relaxed/simple;
	bh=+v7ks9/eTNNhXqjj83VGdNIZhAXyFvyg3wHQrgrPCtQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dDqV59JwPLbx6o1889TvNlMD5Hx2NMv1yk0a8a8QD/GtGp0iwMnRe0kC9B4AJS8jEb2/VermV+5mLYoBAbQx3mMu5Ugg6i13MtHlJkORqZR0b+6yd7NSU7kzl3LG4NdwndxOnjXpgYEbkS5V3Zu9VXcnvqn7gCvxF2sTKpwSqF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A65483ED3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 12:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.838
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sD3JTK369F93 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Oct 2025 12:20:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.199; helo=mail-il1-f199.google.com; envelope-from=3cmp_aakbaiu178tjuun0jyyrm.pxxpun31n0lxw2nw2.lxv@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5161283EC7
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=syzkaller.appspotmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5161283EC7
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5161283EC7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 12:20:02 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-430e67e2427so58863835ab.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 05:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761567602; x=1762172402;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkdLZi4ZV+215bJaTi/JeEB1alaBWY0kyjpkyUYTr3k=;
        b=CrPS/HCDXB95uYtueBXqnsteXWqKt8RNunSEK2QaV/HKgrPaTXtq7GamfIirGkEq2r
         RdxqcBOLCWspacf7900+O29LwrxYq6mZK8glDx8gLTV7fv7Z6FraBZADvjSFoBdkPAG7
         oTMa7nIazE0GflDpwu610Xi/QzEUPBoCgLjPWHzAap8EtENBF5+fjUjQlWHRZKq+g8cE
         fNVNwcbhug8TLO2EpCErCkV5hRjMC3Vwcgy+q1C3AMmCmZncq/2q50sWPcWgD7Y3kPTS
         x9vzSgtPKKf2Kh21gv8pjYHiPKLt1vCvZjYwYP5wscTZMwcD84Y6lwytui8UwXvQcjAa
         WHdA==
X-Forwarded-Encrypted: i=1; AJvYcCVZxdWOqEZqOoDRgOjNESzAoCHD45OQGLWwqT0mx+Hk+IPwuFgw2BA/lUyHo6rfM5N+iEatr43Fvpgxm8wwJJqjaPhwuw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yypdxyz4S/zUO6gvOg0svHWK1wOx/PPaEKSs/f+Y+dOgbK+eNxK
	jRtc3qObCt1E2lEBak49bnppCRkjIbIEPrrEpslInL4DPFN1wEQnIjLgQ1DO7mPjz26AmN2+8C6
	8DtDjtOb9pdNGs3KFcpGElYZHkdFvDWmyPcX2ZuQZoPjxUTPiBUipjVEvU2U=
X-Google-Smtp-Source: AGHT+IHfAtKzApOq/yF+X5k8SHk/HjFQMhS741f1oSYAqo7YLgpQGhwkBXZCLE4F7N/1tfWLOg4KPNfxoTqWPW6jXC0CoLi13FsC
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3c04:b0:430:b27a:7702 with SMTP id
 e9e14a558f8ab-430c5204155mr511415395ab.3.1761567602122; Mon, 27 Oct 2025
 05:20:02 -0700 (PDT)
Date: Mon, 27 Oct 2025 05:20:02 -0700
In-Reply-To: <68bacb00.050a0220.192772.018c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ff6372.050a0220.3344a1.038f.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] KASAN: use-after-free Read in bch2_prt_printf
From: syzbot <syzbot+7f176adb30b21606c5fc@syzkaller.appspotmail.com>
To: david.hunter.linux@gmail.com, kent.overstreet@linux.dev, 
	linux-bcachefs@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	nirbhay.lkd@gmail.com, skhan@linuxfoundation.org, 
	syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit f2c61db29f277b9c80de92102fc532cc247495cd
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Sep 29 20:43:52 2025 +0000

    Remove bcachefs core code

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1190ef34580000
start commit:   d69eb204c255 Merge tag 'net-6.17-rc5' of git://git.kernel...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=bd9738e00c1bbfb4
dashboard link: https://syzkaller.appspot.com/bug?extid=7f176adb30b21606c5fc
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17f99312580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: Remove bcachefs core code

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
