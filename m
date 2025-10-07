Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C378D2E8B9A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 17:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759859107; cv=none; b=lT1maOtnVVy1e0wbYPMkHh5nuJVHqQ4mbA70EVl/481NSqEpuEJpoRGnzZ3fBMcLAxp7GIVJnZAidMiiTn9HmPyAcX5SJ7Lu6iKa+aFI2wpsu2SFLEHhr2OCNiYfOmUXh7qR5y2PXNvuOFNA/c0Xk6liX4xZA/NSGUU+DEDQE8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759859107; c=relaxed/simple;
	bh=iHVSASOMpEg/He/hoeH9kIEP14zS1QbDrqdwO1rPbLA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LDiCmf1NtNVvyKyus6AbIyne1CQttsyV283Uz7lbSNG5nrgPoyJH9o9H3IlHqANDqLHOylW6TjoZnKrMtwKN92XfAY5Z3TPOCIgWKKOBJJL7K2tlkhiuqlSb3ih3ODSoKep+828uMzrj3He5vqRusAE3ygC4vibblfb+ubdSuUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F130607AC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 17:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.838
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SolWxjCp0C30 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Oct 2025 17:45:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.70; helo=mail-io1-f70.google.com; envelope-from=3nlhlaakbacutzalbmmfsbqqje.hpphmfvtfsdpoufou.dpn@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E4D6A607B3
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=syzkaller.appspotmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4D6A607B3
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E4D6A607B3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 17:45:03 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-8870219dce3so691601539f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Oct 2025 10:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759859103; x=1760463903;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQ8LwJ2kllcnIjhbSb8t8QQLy2sXIVFfw/qICKEG1sY=;
        b=HMro/uWdMLsUaqL+WIv1sdk2CW+L6OUxA/GzB9KrCqfmXYap8qsYPh+4jBHhrM+tmh
         jckQmDWwp871gOUKx9zozpEXV6Wb99qtCb84XO2isfLJYx1FaiQA2fKtYEI0rQI2QWKr
         /HxWeY6nCkGr9yjCfOTkQXlYLf5+JqBF1dmnAY7OTRzUA0PE20RpiJl1JXv72AkELksq
         EsOnQIGr7fk7Rq0RWScTEjIL5bmvAti5MPVsvLXueHj3xVc/uikApd5TKJxZoMleZOJn
         uhUh05ihZSCksRgb7owtSjeegk+YEQjkRXA9zsTnjnIkj4mqyX+CSmOscuUs7L1S4t0C
         bPVw==
X-Forwarded-Encrypted: i=1; AJvYcCUFdmbtvbPLsFfm25x6wki2Mw/fvemf86P+xsqTkUkJG7dH8bnnV+cadHto02VmnlWh6whystWMsLCYtjRfkM4WcMqm0w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx1GJjW/ihfYxVYpXGf/PnWbWjjyPJEtX/556FB/JDVbo1VQYe7
	wkmiME+cJlKZpoBQ55exz+Hl881GeCwfG7vAz7KXlb2UE7zO77O9MEqQL38ySdpib/F0plRkOh0
	DAV818SB4QxxY8zb0IuSsaesc2VfeJ7LqRHUM4ErULaun3b799i5gHNUIDuk=
X-Google-Smtp-Source: AGHT+IFSDH+Kx4nFTO1p/Mgi17M1eo4iFNiAqnoTP2PGFKpeamxueHtLoiP1elV9Re0bzLbxiLZOEJw3X6kx1ZTxkY0Eqb3HK7Hg
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2d8f:b0:922:6c20:45ef with SMTP id
 ca18e2360f4ac-93bd18cbaa4mr17149539f.7.1759859102832; Tue, 07 Oct 2025
 10:45:02 -0700 (PDT)
Date: Tue, 07 Oct 2025 10:45:02 -0700
In-Reply-To: <20251007171256.20884-1-ankitkhushwaha.linux@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68e5519e.a00a0220.298cc0.0482.GAE@google.com>
Subject: Re: [syzbot] [trace?] WARNING in tracing_buffers_mmap_close
From: syzbot <syzbot+ddc001b92c083dbf2b97@syzkaller.appspotmail.com>
To: ankitkhushwaha.linux@gmail.com, david.hunter.linux@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com, 
	mhiramat@kernel.org, rostedt@goodmis.org, skhan@linuxfoundation.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ddc001b92c083dbf2b97@syzkaller.appspotmail.com
Tested-by: syzbot+ddc001b92c083dbf2b97@syzkaller.appspotmail.com

Tested on:

commit:         4ff71af0 Merge tag 'net-6.17-rc8' of git://git.kernel...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17676892580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=595e5938a1dd5b4e
dashboard link: https://syzkaller.appspot.com/bug?extid=ddc001b92c083dbf2b97
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1249d1e2580000

Note: testing is done by a robot and is best-effort only.
