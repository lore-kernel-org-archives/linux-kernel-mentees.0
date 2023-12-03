Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B06C10E9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  3 Dec 2023 05:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E68CE60EE6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  3 Dec 2023 05:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E68CE60EE6
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 0.853
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qN0WOnfxCE9P
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun,  3 Dec 2023 05:25:05 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C468E60BDA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  3 Dec 2023 05:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C468E60BDA
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3b8b91c5638so263106b6e.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 02 Dec 2023 21:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701581104; x=1702185904;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gh8kA0wvcEudJg4sTCzviSk9gPRZ58CLaMI+8dOTqeg=;
        b=dt/kUQwSEZlS1N6TfJx8xjspSOrXz0iJXsTtj7REkuGc9oXuJAtCguZmGWqoICScQh
         OhysSLap2aYbYfKkDo4NZPwPF2OF45UvobGdJoUaQ8/JpnK8onP00k3S4YgHxTegE209
         8WIstpNgvpkEfrUEFXPyalaOHSwPzgX8+Y9N2aUvF9LaLaoQFtRjYBYx72N1npYC6XAp
         aMeR46yhvkn2fDfxm8cyj2G9VqowG3GSqq14MqKCOusuxjbdB2h8V8bMdI9vFSH3vf61
         uKDGhKJa0GbuaZAuHXIgrsBZq91FnUygyCsY9CIhIgpoo+D38JPTaYmGEEy+aIC/MIED
         eF8Q==
X-Gm-Message-State: AOJu0YwQZ01cbz5SIxtABKj9jva6Fks5RTUf7Mw5C3RqIDO25pSqhJ3/
	FhHjlckFd00DgRu9Kpk9jiFjbLZNEcqadtnVECVhfm20lIbz
X-Google-Smtp-Source: AGHT+IEDkTe1NFy8Y5QzTTM+crOH53QnZSWciCcsTjwYdrTuB7mIO4LDXoZqEvhZEj1GGk+/ZWWcmX0wDRoOmUA5vaOGR++lr6JE
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:344:b0:3ae:61f:335e with SMTP id
 j4-20020a056808034400b003ae061f335emr1111285oie.5.1701581104799; Sat, 02 Dec
 2023 21:25:04 -0800 (PST)
Date: Sat, 02 Dec 2023 21:25:04 -0800
In-Reply-To: <000000000000f841fb05eb364ce6@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004ee8c3060b943920@google.com>
Subject: Re: [syzbot] [jfs?] UBSAN: array-index-out-of-bounds in txCommit
From: syzbot <syzbot+0558d19c373e44da3c18@syzkaller.appspotmail.com>
To: brauner@kernel.org, dave.kleikamp@oracle.com, ghandatmanas@gmail.com, 
	jack@suse.cz, jfs-discussion@lists.sourceforge.net, jlayton@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org, liushixin2@huawei.com, mirimmad17@gmail.com, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit a779ed754e52d582b8c0e17959df063108bd0656
Author: Dave Kleikamp <dave.kleikamp@oracle.com>
Date:   Thu Oct 5 14:16:14 2023 +0000

    jfs: define xtree root and page independently

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14f67ce2e80000
start commit:   d88520ad73b7 Merge tag 'pull-nfsd-fix' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=9ee601744db6e780
dashboard link: https://syzkaller.appspot.com/bug?extid=0558d19c373e44da3c18
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11e974ed680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11b2588b680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: jfs: define xtree root and page independently

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
