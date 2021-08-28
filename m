Return-Path: <SRS0=ANfH=NT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E83C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Aug 2021 18:32:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37C5F60E78
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Aug 2021 18:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37C5F60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02F594267F;
	Sat, 28 Aug 2021 18:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bi0iyCPle3aT; Sat, 28 Aug 2021 18:32:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8980242659;
	Sat, 28 Aug 2021 18:32:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58659C001A;
	Sat, 28 Aug 2021 18:32:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83AB5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Aug 2021 18:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77A0A8186A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Aug 2021 18:32:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syGtjP07UU11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Aug 2021 18:32:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B17783046
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Aug 2021 18:32:11 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 i11-20020a056602134b00b005be82e3028bso932657iov.18
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Aug 2021 11:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=up8sbinmdfW5FEk6l6npSbM0ylrChylbR3vjt8i49Xs=;
 b=poZCeuWIWmwYeQAsYFQrrWc9MKoApyp0akMTnMoa/PQuWOxGwjKCo6i47Vqx1JkqfU
 nH1JJw88Ot0ESz914YJ3K8RQjOEt1oKhUR0tJfZ4N68f6pyvuBtFGDunjALkIV+Nooos
 A8SaOggfBW1elZITSrd/j8uJtG9DBMR2ZcJzsVrY09CKILT8C2CdQeCfeJPwlzlgzyeU
 mgjqGmbd2t7a33Ax4ABZLMW+3S3fFj5GYmq3vN4GxRXNQFyZVPFnXxHHtpdTQ1jyD8Ca
 +KxlD+yTh5T9JXQoKTo/6ZXx7ihGTlJuRfRVWHRLg0bjT0jVufO/jaVJ75e8RU75CEuD
 GLEg==
X-Gm-Message-State: AOAM532WtfKBQDIHjvu4kaiXgMRrUHFS+yLijNOsl4I7zopg41NLtic1
 CYuPO3DHD+a/HVdneirPSQbujbs2dmmG+Z76A+BPlISjckV1
X-Google-Smtp-Source: ABdhPJz+Yyr5HRroDxrfkjQQ5ziL5gBeIlEZ7KitgTECC5WrydwZTAne5hlTp3U9EC17zAoYBcRj22iKM9omVjv0Oo7cv7/OiVjq
MIME-Version: 1.0
X-Received: by 2002:a92:280d:: with SMTP id l13mr10827952ilf.99.1630175530430; 
 Sat, 28 Aug 2021 11:32:10 -0700 (PDT)
Date: Sat, 28 Aug 2021 11:32:10 -0700
In-Reply-To: <000000000000b575ab05aebfc192@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000069bb3e05caa2d1f8@google.com>
Subject: Re: [syzbot] WARNING: refcount bug in qrtr_node_lookup
From: syzbot <syzbot+c613e88b3093ebf3686e@syzkaller.appspotmail.com>
To: anant.thazhemadam@gmail.com, bjorn.andersson@linaro.org, 
 butterflyhuangxx@gmail.com, davem@davemloft.net, dragonjetli@gmail.com, 
 hdanton@sina.com, kuba@kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
 mani@kernel.org, manivannan.sadhasivam@linaro.org, masahiroy@kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
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

commit 7e78c597c3ebfd0cb329aa09a838734147e4f117
Author: Xiaolong Huang <butterflyhuangxx@gmail.com>
Date:   Thu Aug 19 19:50:34 2021 +0000

    net: qrtr: fix another OOB Read in qrtr_endpoint_post

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11279a4d300000
start commit:   ba4f184e126b Linux 5.9-rc6
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=af502ec9a451c9fc
dashboard link: https://syzkaller.appspot.com/bug?extid=c613e88b3093ebf3686e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12263dd9900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13d77603900000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: net: qrtr: fix another OOB Read in qrtr_endpoint_post

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
