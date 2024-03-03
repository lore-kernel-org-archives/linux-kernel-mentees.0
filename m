Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507DF63A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  3 Mar 2024 08:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709454609; cv=none; b=eRJh+MeR58ioVRKucGiakOjcP98FLijSVmHZALHC5cE5BEQU1vxYGNs8KuPw5U8TwGoFG1s9iE6fP2u9Gwo5wA0nnkbjsGYGl/7By6Fay5JNVQvZ9LZlNQhIKpSh5M/Ny3GVl41582CtnPrTd0yyMdpwON9ZYQ7Z59URO1NJIcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709454609; c=relaxed/simple;
	bh=ZN6/uX4Tx0/Y6hxHxujw+cQxS8rTAmYY0DHz938FZb0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Qeyp4RSuyQA3QOUHSsmgf6BgFccB5yq/0qq0TMRj9uASTUK6PnwNyhMxDcyu0GG4w0GlXTKfGa+zyGhaKqMWBA+xXVx5A8V+3BdQyU9Mi7KTyzTD9rthMTMbpDqr6AkoPam1wHmlJ0TLhpYOdKHWzV5Xe+Qw4usmR0iDaDkTiDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D960440852
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  3 Mar 2024 08:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 0.853
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t-71DQ7yrebC
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun,  3 Mar 2024 08:30:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.198; helo=mail-il1-f198.google.com; envelope-from=3dtxkzqkbad4x34pfqqjwfuuni.lttlqjzxjwhtsyjsy.htr@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92695407E8
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=syzkaller.appspotmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92695407E8
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 92695407E8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  3 Mar 2024 08:30:06 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-36512fcf643so42994105ab.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 03 Mar 2024 00:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709454605; x=1710059405;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cw6wOjMgK4MwRpjPkZeZa5isVmvzXm/3D1T3RvcQvyU=;
        b=ZV7GUD0imPFUcGp72jos82MV+G9Yd04E27miErZo3yN6LFvUmiU2HeD5+gZiMExHq6
         ErhtcdEYuGsXinqLYZ+jZ386WCNqW9oVos7axvSmF3y/0cn6PoF+EofsdtBn5HV/X0/e
         DTGENzg6IZfrBTb2nZC6b1PDPrZAM3Haym/vJQzox01h9MtaTwvZvhWcuwNabQf4mZrO
         EKz0zE0XbC9G9bqGkGWg/X9BEB1ebBPd5DWTgb+en2qZurgeVDb0oQGl+kp0Nq5CsAwQ
         Ix0rg7sez6S2K0GucPjyg8BvFTulpb+EvF4DdH79ToY4uPTXoUNo1A0Zwf7dsx0+IGFx
         q4Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVlaPVLM7wVKTuBs3TMRQ/+eX1QywL8d5Gm7O7LNQ7erRKG2PGqo08EvvqT+oXs7M6EqbfJPIa9mBETIJqqVR8zh4+UFAP2wVb+v/zVekGaNwevbaM4eG42pD2CnRAe
X-Gm-Message-State: AOJu0Yz3Ph7ESWXFkJh1GWbzYoVBKM5LDD7qfgnwV3qR8/nZ8BhYtglQ
	J0OA4EY6njQFVT+c/DWa7zEC1NPV6RS4xcKFehfK5BLOy1+p4p+oYyR0aDZbZRAGTBHtWUxb/2x
	Zq7p0CP1V7vgXlUshFFaJm0eoDCXK0W6GO8gmk64N/obDZBhcYCmzA70=
X-Google-Smtp-Source: AGHT+IHR9m9OWQf2a5daMm1kcCiAq5nUoCcInX4EAJ7d/KyuNCP7k69rkgu5tuf8PQMAEmm1FSHLXoo6Fad5z6jCDdAWcrsKdxpo
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a48:b0:365:2f9d:5f04 with SMTP id
 u8-20020a056e021a4800b003652f9d5f04mr488751ilv.5.1709454605217; Sun, 03 Mar
 2024 00:30:05 -0800 (PST)
Date: Sun, 03 Mar 2024 00:30:05 -0800
In-Reply-To: <000000000000c29dab06004a752b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000080f93d0612bd6a5e@google.com>
Subject: Re: [syzbot] [fs?] UBSAN: shift-out-of-bounds in befs_check_sb
From: syzbot <syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com>
To: 20230801155823.206985-1-ghandatmanas@gmail.com, 
	88c258bd-3d0c-de79-b411-6552841eb8d0@gmail.com, axboe@kernel.dk, 
	brauner@kernel.org, ghandatmanas@gmail.com, gregkh@linuxfoundation.org, 
	jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	luisbg@kernel.org, salah.triki@gmail.com, syzkaller-bugs@googlegroups.com, 
	syzkaller@googlegroups.com, w@1wt.eu
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14b5e754180000
start commit:   8689f4f2ea56 Merge tag 'mmc-v6.5-2' of git://git.kernel.or..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=15873d91ff37a949
dashboard link: https://syzkaller.appspot.com/bug?extid=fc26c366038b54261e53
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14237dc2a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13e34d22a80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
