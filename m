Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A6E12B66
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 16 Jan 2024 09:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P5kyLTJc"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9115F416DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 16 Jan 2024 09:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9115F416DD
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=P5kyLTJc
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cfz1ml59srPP
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 16 Jan 2024 09:25:00 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C79A9408F8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 16 Jan 2024 09:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C79A9408F8
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d47fae33e0so355645ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 16 Jan 2024 01:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705397100; x=1706001900; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKa6o7frE7cAq4cWeMN0RRhba2ve9NcMTWMZZZ/7rLg=;
        b=P5kyLTJcdyI0vF+G5fmdhExaaAtwp3sehCKCEUtKfL1NsR5uv5lG8LO7T7iJXQUwyN
         EOwHddh413/fknLX6xZx957G93SYdKjqjEAxY9f/x1IV3PM1HuwxwLuPl9f9SIh+70oO
         is0cQ1HOHWHhvEfD+0+HHR9CCs5ZSX8144xhcEaX0znuwPOhlxOQmC/aUXHQxAHb1cCJ
         XNBh9zQ3OX0P/js0NVdLJK9U4qIImx+WDalDB3A706gAkAig2l3vux9geFvfu3BgGz4U
         mqLpfMtNFjpDVwnVZbeaC/RKYyqA9Zua0wxrz4iyHAmwrQqVefaayU2WaXvgQ5cvancD
         UP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705397100; x=1706001900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKa6o7frE7cAq4cWeMN0RRhba2ve9NcMTWMZZZ/7rLg=;
        b=pIpWTUElFJfM7AU9hByl2FyG+FJgf3GP/nc28Zz5Sgi1twIAjT8ozg6SDS+ByMiLFZ
         dQAoHbP0p+XygOd0BhsE18bA6v17Ua/H0ztFHZHZjkT+51SnGNh7u4Sk4l0KmL+zPhgZ
         HIhsN15E6543gb+MFplh8LV9Y366wEKWzEzpdkT8+V8UIL053uaUkIuV3M3TEhGQhz+g
         LvytMY0K5PGRJonGSlwQwIdoqXG9jJqv0hytCnj2PCoABq8NsP7wv+TfzoIgwf6ln2Ov
         uzdJEvPB9IeSb+wcCWpTh1qTBWOQiRb8XNTjbIOwlijRV2Xrw5yGahio7Nq64rd5/s9j
         6l2w==
X-Gm-Message-State: AOJu0YyEK3EE1u5I6UCokUa9h7PLJiPFT4s17lHn66s7Jzg5moiDmDE2
	HJoN3rdTcOmNyWDn7wTwl9QXpMnRH6FyS6coch78qYCIFU6X
X-Google-Smtp-Source: AGHT+IH2N+LXlQ1VOCyauXZQF1qVOnbGiJyJ6dzx3F/X3/F1giNPKttpEmDP+89ak1lCUrtIkPCBp85ezYuDsYasAK4=
X-Received: by 2002:a17:902:fc46:b0:1d5:ad0f:7354 with SMTP id
 me6-20020a170902fc4600b001d5ad0f7354mr508581plb.21.1705397099900; Tue, 16 Jan
 2024 01:24:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000653bb6060afad327@google.com> <0000000000004d67e4060f0bcc7b@google.com>
In-Reply-To: <0000000000004d67e4060f0bcc7b@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 16 Jan 2024 10:24:48 +0100
Message-ID: <CANp29Y4Aq4SteF7HqnexK4azquKrUbV9-dcfBqsxFf3snMJrew@mail.gmail.com>
Subject: Re: [syzbot] [bfs?] general protection fault in bfs_get_block (2)
To: syzbot <syzbot+dc6ed11a88fb40d6e184@syzkaller.appspotmail.com>
Cc: aivazian.tigran@gmail.com, axboe@kernel.dk, brauner@kernel.org, 
	jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, yuran.pereira@hotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz fix: fs: Block writes to mounted block devices

On Tue, Jan 16, 2024 at 9:20=E2=80=AFAM syzbot
<syzbot+dc6ed11a88fb40d6e184@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 6f861765464f43a71462d52026fbddfc858239a5
> Author: Jan Kara <jack@suse.cz>
> Date:   Wed Nov 1 17:43:10 2023 +0000
>
>     fs: Block writes to mounted block devices
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D16c3c513e8=
0000
> start commit:   98b1cc82c4af Linux 6.7-rc2
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Daec35c1281ec0=
aaf
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Ddc6ed11a88fb40d=
6e184
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D16783b84e80=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D165172a0e8000=
0
>
> If the result looks correct, please mark the issue as fixed by replying w=
ith:
>
> #syz fix: fs: Block writes to mounted block devices
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion
>
