Return-Path: <SRS0=jjuT=LB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A89BC4743F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Jun 2021 22:25:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44978610E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Jun 2021 22:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44978610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E3228258A;
	Mon,  7 Jun 2021 22:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnKXdFCokrPn; Mon,  7 Jun 2021 22:25:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B75981DA0;
	Mon,  7 Jun 2021 22:25:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8994DC000D;
	Mon,  7 Jun 2021 22:25:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEA37C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Jun 2021 22:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6432606C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Jun 2021 22:25:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id af-D7XNyo_29
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Jun 2021 22:25:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8015660694
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Jun 2021 22:25:08 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 c11-20020a928e0b0000b02901e829148382so6798745ild.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Jun 2021 15:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=b6fHq6inNIhipW1ztkPlqvY4f9MP6CcM1fFIRec2g9Q=;
 b=UhAsOCZiFNMlNpiPDfukKWvDeBvbe3V5hhsWTqMMLhrgFrTc/gRme0E7dTzfHp0AiI
 uNIrNnyc94JRqNr2rZuUO+yhlvavAGRi+5ZFTg8TJeRubiBxVebcyslc8y6NcHgvU6S4
 392neSIKgywWwA64qhVeNMfEkBN6emV6xktwXytp+96S2LqJ5c+gUKJ1ZSJDdbhC/bke
 dbebwTJTxos1mk/Dws9Lbx5sl+TIaHH1emdmqIf+u8sky34V0Dllm3sNUpGlT2q3uTAT
 tMUpDbsHgphJMw2x76bL8ff+U+m3EN9FVTLv7Y20EewH5TA37fDeEf1zfp97YLDJNzUt
 /H0g==
X-Gm-Message-State: AOAM533xkBcWqTU6iqW/fF0xN/r+dxVYFnLeALdHoHpBZYbE6ForGq8X
 3J9uWsDEErigeIlqjDjAjehVOcnKf9XW7tBr9aEHLhyjSfcL
X-Google-Smtp-Source: ABdhPJwtAcTvPmWHX1yhNgZvplxVlg3Lq4Iy23LPMcdSinVbgK/jgNTPKiwR7uQG+A5JZN6RstwFjKbGZgb+FMJKPmXgZx7fH8dH
MIME-Version: 1.0
X-Received: by 2002:a92:c98b:: with SMTP id y11mr16544524iln.27.1623104707679; 
 Mon, 07 Jun 2021 15:25:07 -0700 (PDT)
Date: Mon, 07 Jun 2021 15:25:07 -0700
In-Reply-To: <000000000000adea7f05abeb19cf@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000088dbd105c4348388@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in hci_chan_del
From: syzbot <syzbot+305a91e025a73e4fd6ce@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, anmol.karan123@gmail.com, coiby.xu@gmail.com, 
 coreteam@netfilter.org, davem@davemloft.net, devel@driverdev.osuosl.org, 
 dsahern@kernel.org, dvyukov@google.com, eric@anholt.net, fw@strlen.de, 
 greg@kroah.com, gregkh@linuxfoundation.org, johan.hedberg@gmail.com, 
 kaber@trash.net, kadlec@blackhole.kfki.hu, kadlec@netfilter.org, 
 kernel-hardening@lists.openwall.com, kuba@kernel.org, 
 linux-bluetooth@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
 marcel@holtmann.org, netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 pablo@netfilter.org, phil@philpotter.co.uk, syzkaller-bugs@googlegroups.com, 
 syzscope@gmail.com, yoshfuji@linux-ipv6.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

syzbot suspects this issue was fixed by commit:

commit 43016d02cf6e46edfc4696452251d34bba0c0435
Author: Florian Westphal <fw@strlen.de>
Date:   Mon May 3 11:51:15 2021 +0000

    netfilter: arptables: use pernet ops struct during unregister

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1325d967d00000
start commit:   af5043c8 Merge tag 'acpi-5.10-rc4' of git://git.kernel.org..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=f9aa2432c01bcb1f
dashboard link: https://syzkaller.appspot.com/bug?extid=305a91e025a73e4fd6ce
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=130152a1500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=102b1bba500000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: netfilter: arptables: use pernet ops struct during unregister

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
