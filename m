Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C292132470
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Feb 2024 14:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707230949; cv=none; b=OAUNU2MoQvxx+pse0pPA2W7435aSTI7OyqmLmu2fej2H2vhIQAq0qro5K84nFjLV65qTZUshUVRuXP2W/5xS59p6ZPPw8b6hfw5gjQXH1MPFsqd2TidxQr8VWkxO2CgrZ/qNUk06gzyuCZpSlxqbNipbLHxlMplnoZZXNpXAJik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707230949; c=relaxed/simple;
	bh=ZYhM25AzuOO8uiA+4AJts7dxWvnoP0sziHlbTBDdgdU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TduoKnNXyDzl5niK9rhsZFoi64QuSR93hSd+RSg8sJvPFVXDhQkSGk9mlvL3U1p1nZjwkv5g9+s4APVCPKFY/9zzgGA1GCWCVXNPc/W2KbkPXimwYjRX2zjZWEUAzvwxyjsgqzjiqhcRgXU2CWi9w1Y03ZeQaQ5w7prC2BdnSM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C48578187F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Feb 2024 14:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 0.853
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41RsAf1jbtgn
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  6 Feb 2024 14:49:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.72; helo=mail-io1-f72.google.com; envelope-from=34ubczqkbakweklwmxxqdmbbup.saasxqgeqdoazfqzf.oay@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E79C4823E0
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=syzkaller.appspotmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E79C4823E0
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E79C4823E0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Feb 2024 14:49:06 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7baa6cc3af2so619694639f.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 06 Feb 2024 06:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707230946; x=1707835746;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kSrsdZ/RuKV0gEG27LOO5dIr8YmZtFDZ3FYa41rVAQo=;
        b=SJqLPsgWlOKWMFADUYK5Pdz37sO+yhCo9CEO8FfJhcJtO3JHAL3BjztNvhR/c0qIwU
         mon58hc+o19NG6UBBpwz7Zzvyj3j+GI8x9w6srwigkOTQNEf6a7SMen2egekSkinuURk
         VAlZfZKOJbIY8mh3en3Mb71zSpnYuA+XzIMPV5kqEj57C2/JlMj571Xr3DQQP4j1JIdj
         62WTbK5Kw8vrmnJ92T5gPCmjwk8pYHFN+ep/u7mKTe26mO3KCbaGMP71vKaWjg3s7ZFC
         4COYqyGodHZWOFCte5szjIsQ3dglLmJOJ4wd+fthU9qHBHsRymYpaLdsxDymfL/Tho3H
         XFPQ==
X-Gm-Message-State: AOJu0Yx6l/TvlXhJYS+3RuZsttX4FzG6cf/tujoNbCwGaDs9zX1RbScy
	V5G2Cyw+D8ono6LDls3nbECI9iHnyxgiSScV7No1ghj1cqn+IMbsWcfqg1mQIDb+TOxmv7C6SXu
	mUpwAxPGWZlUwU0+yokEsZcoR+En+jEwzD3INjL/ZZn2ThR6bST8uBZg=
X-Google-Smtp-Source: AGHT+IGyJ27bMyWH8/GynoFXTjuNU5g+uu1OXbn98nBQ0bYYkpj0BC/KPVZdYE7KwK+zDcXtX/Ot0QVWkk9m9WuMvI7pjKLzBruq
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154d:b0:363:a059:670b with SMTP id
 j13-20020a056e02154d00b00363a059670bmr186965ilu.4.1707230945919; Tue, 06 Feb
 2024 06:49:05 -0800 (PST)
Date: Tue, 06 Feb 2024 06:49:05 -0800
In-Reply-To: <000000000000332a2505e981f474@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000014c9ca0610b7aec6@google.com>
Subject: Re: [syzbot] [jfs?] KASAN: slab-out-of-bounds Read in dtSearch
From: syzbot <syzbot+9924e2a08d9ba0fd4ce2@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, dan.carpenter@linaro.org, 
	dave.kleikamp@oracle.com, ghandatmanas@gmail.com, jack@suse.cz, 
	jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	lkp@intel.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	oe-kbuild@lists.linux.dev, shaggy@kernel.org, syzkaller-bugs@googlegroups.com, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13767e8fe80000
start commit:   bee0e7762ad2 Merge tag 'for-linus-iommufd' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b45dfd882e46ec91
dashboard link: https://syzkaller.appspot.com/bug?extid=9924e2a08d9ba0fd4ce2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=152bfc22e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1608f4a2e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
