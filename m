Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD051FC8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jan 2024 07:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1ECB4151F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jan 2024 07:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1ECB4151F
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 0.853
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WytARJT4N9mC
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 14 Jan 2024 07:18:06 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EB4ED4086F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jan 2024 07:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB4ED4086F
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-35ff23275b8so73086155ab.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 13 Jan 2024 23:18:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705216685; x=1705821485;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rFuCfXt+BxUWXTPpDFo62pMwYcUozTAUPCD33bbohME=;
        b=coYllFO9yixF+q4UQmULe86lHoUGLUi2EtryeQOK89VQuZ5wa+88UJEFyVwmStU3//
         i6f9we9pifA9X47yvGVkRh/ZZop73oerc2lh5FeDqSF6QqA8Ft2aouAXPsJimjS02n4i
         zQycaI1LDPOkSxlEJrffFcB3tNSPBVTQkL5NhL/0Q5XMrN2L1Yar/ulqPMFF8gcxgxSh
         0ULsNohRns1ISAJJyU9ZoEO8VKUezfsHsZkdzdJDO+9Bg3RW6USTUzwRSmUriiWJngEH
         zkdC8QK8ogfTWHbayYQIXaDxFFzeWEL+UXc92PP2nN61m6FR+cPd1YmKRn1bm0efeGNr
         Z/7w==
X-Gm-Message-State: AOJu0YwW5GKfy+QEoyWTD5qJWGhVjLRYr6O+tZXHbIc6scWBtBO8i5Oc
	1kD+9M2qxmgAMiXFAa3nRbeWXwjNHAPD6OBf5WMOt78pkVtb
X-Google-Smtp-Source: AGHT+IGimRhoUIZge/Cefcap1amRLfI0F1bGWHGp+s1g1C+s2YzJZW/J5H80QFOHyQ2sc6MsZ6q2WFU0y1Lb49i7Bwlgo47qNbkD
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12ce:b0:360:7c34:ffa7 with SMTP id
 i14-20020a056e0212ce00b003607c34ffa7mr516080ilm.1.1705216685063; Sat, 13 Jan
 2024 23:18:05 -0800 (PST)
Date: Sat, 13 Jan 2024 23:18:05 -0800
In-Reply-To: <00000000000027993305eb841df8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c746f0060ee2b23a@google.com>
Subject: Re: [syzbot] [jfs?] UBSAN: array-index-out-of-bounds in diWrite
From: syzbot <syzbot+c1056fdfe414463fdb33@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, dave.kleikamp@oracle.com, 
	ghandatmanas@gmail.com, jack@suse.cz, jfs-discussion@lists.sourceforge.net, 
	linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org, shaggy@kernel.org, 
	syzkaller-bugs@googlegroups.com, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17ec162be80000
start commit:   493ffd6605b2 Merge tag 'ucount-rlimits-cleanups-for-v5.19'..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=d19f5d16783f901
dashboard link: https://syzkaller.appspot.com/bug?extid=c1056fdfe414463fdb33
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12f431d2880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1208894a880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
