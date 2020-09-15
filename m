Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA1DC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 11:34:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C80B320872
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 11:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C80B320872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 858DB866B8;
	Tue, 15 Sep 2020 11:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2mDlgj6zaDz3; Tue, 15 Sep 2020 11:34:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B76E866B1;
	Tue, 15 Sep 2020 11:34:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A8B4C08A2;
	Tue, 15 Sep 2020 11:34:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E099C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 11:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 38E7287181
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 11:34:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H-yUb8NwVTuQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 11:34:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 23C6787168
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 11:34:26 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id i80so2253090ild.18
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 04:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to:cc;
 bh=GjQSO95ViTMWsBMYyQY+wntxzIsU7HWPwOfADr/WHCc=;
 b=lMRj3RE2/N+J7v3HHp0GssVOOECx2QTEXoKXx7TVCwH9/QuO3tibqgfarJ6i6kUTr3
 hf0C31GwMUGe2h4P+z92BFB6TPazVLVCVY1eTt+lHyWxcvzK/mhwvtw59HKC0+U6VR+1
 NQXfAbfeGSJzOHZSvu7jQq4Vb2qGOhtY51ekHqyJdsk08JTJIDhGifM6JZen5Yd3l0Yn
 EuqPcmMVRbKmmYFYFpJQRPbCMf2Rc0V0wnadWn1Lowg6AEYPGeRfTaQtQQassXp1uRn9
 3Czt3IbMHb9omoVuRHrNj5GBfrRCmnmjB5N2NBu5SC/fFx1nsR2PQq0byYrDNxmrOOOu
 7SIA==
X-Gm-Message-State: AOAM5325r2tPhGiPmx9eYtUARWrfya6dja5xrAEXkXRBH9Cqp/LDIzOl
 172q4e6lnZNGizhcvGt8Ug2XB9cdNIfmcFw/fJ5jdzBUlJyg
X-Google-Smtp-Source: ABdhPJyW5CPSKGdgSrREEcEuRMyqHwy8ds68yquIyiJXUYH50EBp8DaCDL7wlWLTys5/y2k1TE/k8CJvbQGIZBm5ENJy7MQdbZQI
MIME-Version: 1.0
X-Received: by 2002:a5e:820d:: with SMTP id l13mr15031538iom.3.1600169664998; 
 Tue, 15 Sep 2020 04:34:24 -0700 (PDT)
Date: Tue, 15 Sep 2020 04:34:24 -0700
In-Reply-To: <CAOY-YVkOq8cr4_hs8BOtEOL-1BsQDznsDG6cLYQUBoM7Gag7ig@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000076762405af5888be@google.com>
From: syzbot <syzbot+dc3cab055dff074f2d7f@syzkaller.appspotmail.com>
To: Himadri Pandya <himadrispandya@gmail.com>
Cc: syzkaller-bugs@googlegroups.com, syzkaller@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] #syz invalid
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

> The reproducer is no longer triggering the issue on linux-next.git or linux.git.
>
> Thanks,
> Himadri

Your 'invalid' command is accepted, but please keep syzkaller-bugs@googlegroups.com mailing list in CC next time. It serves as a history of what happened with each bug report. Thank you.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
