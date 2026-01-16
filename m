Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF036336EC9
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 Jan 2026 06:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768543265; cv=none; b=Vk+Zcy01IiP7pWSPl24YhtxGzf6oLDK+n2TWPHkH7gooLD2NuRtZlROkjzzB10rhEIcqbYvTrtvug5ooPYMrKM5O4jOEQsX5JNuxfXBnbsPJ9XWJfB8Fo4Le26uvvs78aRuRlVX2uM0c7pJbeIuvXnngngekX/P4BvaQZlBhLwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768543265; c=relaxed/simple;
	bh=93I/oMEzhd/e3i+NwOuCZv4NZFaytmGEp7ozk/HGMh8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dS1mlnZLkQ5d6l28DdGg111ZpRFEoW18Q5fjGLVcUHbXzI0AC6nRiAb7o/L6QEIhQxnDtRrkldfb0MKrbVqofbDFWRiGeq4AzbtAMJtsihJ8nbz9Q1YMkKVFTlqzXbmsWrK1bHRWJpjFTyj8fQqQxnNF7CGQIVk8vSu/0XK3ImA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-404201da527so8031708fac.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 15 Jan 2026 22:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768543263; x=1769148063;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqxeTpOTSPSaeYMkDqzGlSX59eRy8+Mpf+mJ9vwFUWQ=;
        b=IEgqdnBZhQkZJLrqlW7nqghmOY/XQOYmHFxEWaZpJelMuvxBwZ3CnSIj0i4Pq2kM6o
         adou2tRe1lOE9OAZIReF9N42X+1noOiYjScz9lsI/sKGXqvVgSJjP2rUxL8Tu5Fc1ndw
         UdU0gxX5J0gwgPALHQpDMYSyHJBz/iLnYw9/fStFe/L33VpBVwxCE++fBHYWBhdx21mQ
         obmZuI3zpuJ4wT+PJ+kT2L+P93eT99VHApGz2KvvecnGqX6jOKFvFBvNm6yc3IaYcVjC
         xKNKkEugSzpu7RlVKpiaqndoHDh2OuD+QJ+2Io0N3UGmPshF2XtVJPzxYiGvnkY44LO8
         hGdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQl4KExDWsRgot57IT45QdRSHCt5uRXFr3K70/lV6X9SUyNxDg0acRrrqxClXlafuSNH/eYQ9ZQ35Z5NdL53bafDwoeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YztJk/snUFLX4zh2Pj3Roa/4Ih0AbZ4xJCZs2lYSpUp8CrFiFhu
	nFkZ4zn/LhAPCIWcm+6u1tFDQt5eXqP4sbsEZEoC1WAncJT8vtZPYpgPOdzw3efOtnnkxn9619U
	velCF6L949AbeBxiMi7BiI5VkJyGHf7h4j1X+OssPkcs6/CJ7AEI2azNTrSA=
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a4a:ca0a:0:b0:659:9a49:8e2e with SMTP id
 006d021491bc7-6610e65373cmr3170889eaf.32.1768543262921; Thu, 15 Jan 2026
 22:01:02 -0800 (PST)
Date: Thu, 15 Jan 2026 22:01:02 -0800
In-Reply-To: <67117fd9.050a0220.10f4f4.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6969d41e.050a0220.58bed.003e.GAE@google.com>
Subject: Re: [syzbot] [ocfs2?] KASAN: slab-use-after-free Read in ocfs2_reserve_suballoc_bits
From: syzbot <syzbot+af14efe17dfa46173239@syzkaller.appspotmail.com>
To: activprithvi@gmail.com, akpm@linux-foundation.org, 
	david.hunter.linux@gmail.com, dmantipov@yandex.ru, heming.zhao@suse.com, 
	jlbec@evilplan.org, joseph.qi@linux.alibaba.com, khalid@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	mark@fasheh.com, ocfs2-devel@lists.linux.dev, skhan@linuxfoundation.org, 
	stable@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit e1c70505ee8158c1108340d9cd67182ade93af4a
Author: Dmitry Antipov <dmantipov@yandex.ru>
Date:   Thu Oct 30 15:30:02 2025 +0000

    ocfs2: add extra consistency checks for chain allocator dinodes

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=140a0852580000
start commit:   36c254515dc6 Merge tag 'powerpc-6.12-4' of git://git.kerne..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a3fccdd0bb995
dashboard link: https://syzkaller.appspot.com/bug?extid=af14efe17dfa46173239
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13444727980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11861440580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: ocfs2: add extra consistency checks for chain allocator dinodes

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
