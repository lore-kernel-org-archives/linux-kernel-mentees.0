Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F70A24B26
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Nov 2024 01:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732412406; cv=none; b=MFrm4pqOtY36aMVULqn6T1q0ppiEWm4y9fGZlSUDxyVpb7IUWGnk+h8PWXzVbWS3G2veGmNvv5qEda7Oub46ZtJc/7uE2EkQ5ykS5EwNYsgTTrWCFfr4lHdtIknj2/24hSe7GcfG9sV/xMN0VlyYjzROoo0P01tcZM+w4HySgIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732412406; c=relaxed/simple;
	bh=RktkeA3/HMgOVmPFR4NL5Mc9JJJotp9v139zX+2XHks=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WLbmBYMeabTlECMBugyKNHX/AoANO1ODP/1kNv7iRSfjJlKca1VLBB0LbbdVkOXF5tjjm6wxpr2Bcp0LnMcHsTO+U+HOxfK+PayxWNMih5Uu5ZQMUGvu1rfzNtjnQ24PWX8q1G6+LlFW5iFGrPkyNKJo41qLg1zMpVAAWpy7iy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9C556153F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Nov 2024 01:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.838
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYNjaqn_iIqt for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Nov 2024 01:40:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.198; helo=mail-il1-f198.google.com; envelope-from=38onczwkbaeuz56rhsslyhwwpk.nvvnsl1zlyjvu0lu0.jvt@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 50DD360803
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=syzkaller.appspotmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50DD360803
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 50DD360803
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Nov 2024 01:40:02 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a6b9f3239dso37994845ab.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Nov 2024 17:40:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732412402; x=1733017202;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjnvTwZRN+j8oGsq1lXAqtFO6kntKG2HSXqADQ2xD/8=;
        b=Z6HD3SsGQ1fLelSmgpRU3jsmV0X9zHcfzlzXrh+am8ff7LZl/9coi5YvUFjRN4yoBj
         jamJdtOZ7wBBvJiFCEMo2cFpkJmm6/mGFv1Jd2vNQUZ5ITZ9TT7L/BTsJTeDff8cbMj+
         /B7W5HEmVqjQ8dzbTyh+gJbrEiiVet7IAbNYFMJ8h9xkp9EI51hAJIMhkPwPlc1Jwq/4
         ZLlATIan1Jwu+0N8CGUYODgQzz9p36pwbEEjRShuK73Z9tJ6LFOAjAKQJl9eaF/rnKXL
         a9q16+Q1WbP+5lLZlYb9EEBmjp619YAwEMHHRwFUEkRaJwzyEDMS4tzK6MrUb+kbtcaj
         FgrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyB4rszBUwGQXm5u+Spc9VaWqdjL5ynh/XflisAsErhgQ6uxvTJAHFEXNNx7WG4cBSeHTUdOkkokE9mJrrRL+jXnthEQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzj7DKVI+Os02/AsV+Hb9wU/Fwq/FIdIo8CCMPSqjinCAcwms70
	f7Q2SPL+qQdgJKP+4EI2ufPUh0yDXBAyQ5AU0ll8lh1GqBP4lU99SqIQNBG6dznJjyb+2GunM+e
	hW5hHrU1xjvrf9AF8NQ8P8vnw43hjOKZqOyOPwMbpKGjDf5NG0zlAsTY=
X-Google-Smtp-Source: AGHT+IGL5Lf+YBzZT0OpDq0ri6FMKUZTlGhh97G1oG7s/0nxvC8Unlrv+e1eJcQ4MUABqDopfugHmC0fm9gnQOHXJ9u/6om1qQSE
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a41:b0:3a7:820c:180a with SMTP id
 e9e14a558f8ab-3a79af16bbemr83792775ab.19.1732412402028; Sat, 23 Nov 2024
 17:40:02 -0800 (PST)
Date: Sat, 23 Nov 2024 17:40:02 -0800
In-Reply-To: <20241124010459.23283-1-leocstone@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <674283f2.050a0220.1cc393.0028.GAE@google.com>
Subject: Re: [syzbot] [f2fs?] WARNING in f2fs_unlink
From: syzbot <syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com>
To: anupnewsmail@gmail.com, chao@kernel.org, jaegeuk@kernel.org, 
	leocstone@gmail.com, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
Tested-by: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com

Tested on:

commit:         9f16d5e6 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14d40778580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e92fc420ca55fe33
dashboard link: https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15dd69c0580000

Note: testing is done by a robot and is best-effort only.
