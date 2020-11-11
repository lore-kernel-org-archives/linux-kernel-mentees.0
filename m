Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2D5C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 11:23:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83D7B20659
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 11:22:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="TJjO8cBz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83D7B20659
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E3D278753A;
	Wed, 11 Nov 2020 11:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4tylMwrUICW; Wed, 11 Nov 2020 11:22:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 70A2B87532;
	Wed, 11 Nov 2020 11:22:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 572EDC0889;
	Wed, 11 Nov 2020 11:22:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB788C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CAB472A12C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5DCwh3n9kce
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:22:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 0CD76228EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:22:56 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id n63so1001368qte.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 03:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a+0hvWNZjuGzR2yuBkOrthU1shgFfePvt4BkuauBxXY=;
 b=TJjO8cBzKT2rHIMjTFeHyNQ6EvDH4DKhPDmsFzKSLrGZ/Q8IyNQbicX1fyF54q4j8m
 IQBVC1sm2Vv12ZD75TApN/8T0uvgHnJS/JPsd6smNt/Mph5p4+mTpuPwf/i5tD5n9eKM
 C9rX+qkd4yZ3xpbh/oWM/cK4tEExKHE5llKm8dkD65h+a3Uogt6odU6p7ukYgKsVwJnG
 TuPt8CAxoENWh63Umn3BxEjUigoUPXYQFBzhCRkaFAt+nRmvVQMw4qjWGgjFLrZ+vTED
 kB80zM7rWDaSkzPTA0wDslSNY6/661lGnBOZnGNFkTVxZfDQqGzKX+F0HGUUvV0bmBmo
 +7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a+0hvWNZjuGzR2yuBkOrthU1shgFfePvt4BkuauBxXY=;
 b=WhuN7AFUEKZgkacVEEDpuj6da6P4aOWutw5IclC13KgeJQTS+n0VbbCxRM0NNMESe3
 e5YdroXslgbWaRF9+uSVQ6qwP9xMk4etWZ+tnZo+26xx0QfMrPyyI1U3krHtVTzJkZSU
 U9pJK0Q191F7e074pfPzJafwpTBvj0KxFle/LRKw9d/t8aNu893CldR3+p+EWbEVJVSx
 kW2aYemxpPA4lWOaHU5Elx5uZPaTSl55OwpP4gwSEWNwTAsDd7pF39gZ53dUOklsjSaN
 ZGCTmSA23P1lSKNlHvpgnULrGxcVIeod3+zP/DijQXEnAUJBF1rvYKvm+1W+9u0l0CLr
 eoqQ==
X-Gm-Message-State: AOAM532auGbT53mtZWO3knY8n6htLcGtbjEeldpdvu0pTHarrclWWcVL
 BVQdKa4nWAFlV8XADM60nf+vqW2VyEuo2hEWeecIQA==
X-Google-Smtp-Source: ABdhPJwLNYMg/E8M6NNNJsIV8jVxHNKK8b1huFHUn20uWGl5RATA0MNnH+Vn1aZZtb41l988fqwX7EwaS8SrxwXPrto=
X-Received: by 2002:ac8:37f2:: with SMTP id e47mr22634777qtc.290.1605093774733; 
 Wed, 11 Nov 2020 03:22:54 -0800 (PST)
MIME-Version: 1.0
References: <000000000000c57f2d05ac4c5b8e@google.com>
 <0000000000002a736805b3a05697@google.com>
In-Reply-To: <0000000000002a736805b3a05697@google.com>
Date: Wed, 11 Nov 2020 12:22:43 +0100
Message-ID: <CACT4Y+bTDLYNe2_5qbLNR7PaFmKR1Nz7mg+S95XwjUdp=zMc3Q@mail.gmail.com>
To: syzbot <syzbot+dd768a260f7358adbaf9@syzkaller.appspotmail.com>
Cc: sonnysasaka@chromium.org, Johan Hedberg <johan.hedberg@gmail.com>,
 Rafael Wysocki <rafael@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Coiby Xu <coiby.xu@gmail.com>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, abhishekpandit@chromium.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] BUG: corrupted list in
	kobject_add_internal
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, Nov 8, 2020 at 11:55 PM syzbot
<syzbot+dd768a260f7358adbaf9@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit a46b7ed4d52d09bd6c7ab53b2217d04fc2f02c65
> Author: Sonny Sasaka <sonnysasaka@chromium.org>
> Date:   Fri Aug 14 19:09:09 2020 +0000
>
>     Bluetooth: Fix auto-creation of hci_conn at Conn Complete event
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13d75792500000
> start commit:   d6efb3ac Merge tag 'tty-5.9-rc1' of git://git.kernel.org/p..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ff87594cecb7e666
> dashboard link: https://syzkaller.appspot.com/bug?extid=dd768a260f7358adbaf9
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=105054aa900000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ab6976900000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: Bluetooth: Fix auto-creation of hci_conn at Conn Complete event
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

#syz fix: Bluetooth: Fix auto-creation of hci_conn at Conn Complete event
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
