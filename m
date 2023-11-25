Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F1531595
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 23:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90B1F400C6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 23:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90B1F400C6
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 0.856
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8L2-2yW7k9X
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 25 Nov 2023 23:21:07 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 421C2400B8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 23:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 421C2400B8
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1cfc42c748eso488295ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 15:21:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700954466; x=1701559266;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8irKbRQf4ulqP864AaN8Yh83B8c2j63BxzIEMPOYPM=;
        b=Z18gNbG6mXZXRDGJa93eTjjSBzvCHZQI7zd99dC7aTyk3zkVms9uKhGOtlN9M0Rhss
         sZkW9ToK+TXXOxD6W2f/e4jt+T4H8C7U6IQl8UpIWKmc4paw3KK/0CvKXwV0FBfxwq8a
         CJ59CrUNgcxmScnTSWqWYWnWZgnsNyj3Q7R04ueRYxSGZqoxRF69N3xJh4V/atwHh8b2
         3+Blam2a/MgBQ86pFw/ENB/lwGhQivWCBd5ONNUWU1HDup7bpiQ7b+bEvDsqOSQnCpRy
         FQSqZ0GRpjOAwzy8aCDM/tZD4VwtdSkCeN5aL6NJz7RVY2PTqOBnfgn2cUJnm975UccX
         o0oA==
X-Gm-Message-State: AOJu0YxLOycqjo7+imf/oDDpRwGLoLe4iUIkWPvc4/15VXHVAwAPVvPl
	V/7agdRVyFke1BQBmjNSiElGZsO38tdtUj2ElwZ918Whieu6
X-Google-Smtp-Source: AGHT+IFetQ4Ea4jYYNu4u1E8cYyU5EKkb9XFCyMuTXo4Yo84ERnycivmlcdAMjCkdweSpyAyN58iIPW0zBpeCEXnglUtqHcV13Dm
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a17:902:f68e:b0:1cc:20dd:8811 with SMTP id
 l14-20020a170902f68e00b001cc20dd8811mr1631703plg.5.1700954466756; Sat, 25 Nov
 2023 15:21:06 -0800 (PST)
Date: Sat, 25 Nov 2023 15:21:06 -0800
In-Reply-To: <000000000000459c6205ea318e35@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c52fdb060b02522a@google.com>
Subject: Re: [syzbot] [jfs?] UBSAN: array-index-out-of-bounds in xtSearch
From: syzbot <syzbot+76a072c2f8a60280bd70@syzkaller.appspotmail.com>
To: cuigaosheng1@huawei.com, dave.kleikamp@oracle.com, ghandatmanas@gmail.com, 
	jfs-discussion@lists.sourceforge.net, juntong.deng@outlook.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org, shaggy@kernel.org, 
	syzkaller-bugs@googlegroups.com, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit a779ed754e52d582b8c0e17959df063108bd0656
Author: Dave Kleikamp <dave.kleikamp@oracle.com>
Date:   Thu Oct 5 14:16:14 2023 +0000

    jfs: define xtree root and page independently

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16eb55af680000
start commit:   72a85e2b0a1e Merge tag 'spi-fix-v6.2-rc1' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e2d7bfa2d6d5a76
dashboard link: https://syzkaller.appspot.com/bug?extid=76a072c2f8a60280bd70
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15802088480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: jfs: define xtree root and page independently

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
