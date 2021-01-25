Return-Path: <SRS0=F5qy=G4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67607C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Jan 2021 09:36:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5E3822CAD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Jan 2021 09:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5E3822CAD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 425FA867C6;
	Mon, 25 Jan 2021 09:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zNzWqeIK3xqH; Mon, 25 Jan 2021 09:36:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A971386789;
	Mon, 25 Jan 2021 09:36:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 978FFC0FA7;
	Mon, 25 Jan 2021 09:36:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5089FC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jan 2021 09:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4C0EB867C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jan 2021 09:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zd9wJObuk9VC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jan 2021 09:36:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 60A6586789
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jan 2021 09:36:49 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id t17so9221681qtq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jan 2021 01:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cRQosLm6C15KsdbC23z53ajS0ecGg4Tv0WOPnf4DcbI=;
 b=EHl79LcNBPa09vYmh5NvxQvwwidvVxnIqn3I/Hy/z9XHQ/fHzVwKPcucw1DHXOV3ug
 vYD3EbzHtHyuqjEgXkK0bduWkFxxoKGyzKX6qpt159lfypUoBN4LItQQc/6tyeHTDAHM
 7uOabEhAEHERLBY1WRTHE9SA17jPhFPTUJUalI0ZXPTDLuhkpDX1XkU61wMqvv9eNKec
 XZJO51qerZojWiNgdVnXAmlPwSY5ueaeAo+CcTYVWKVrEQlGbL0d0B9xBc1v3nvQ9M0f
 BcSaFnw4p/WvBfghFxU/VegTdjo93M6UIv5jZhhuhJLfg6foUVIr8U06lYJMe/QG8IIB
 Gn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cRQosLm6C15KsdbC23z53ajS0ecGg4Tv0WOPnf4DcbI=;
 b=ZzSgBaSqSdAAecJcDSJOXME3ngiTsDBQwxeKa6gQtoaQWrPxpw89SS0uuCViIXMP4e
 W8sFnhZ9BLFhidRYhckuFN0vt9t0yrE+wy9NH/R8z2oLiHoXftuz44RAUurw1gMa/9ZT
 eAOVLbTSKNnpeCrbLQomxjMXv031rFPNyP19IxxzXe2ciTkgvxbyofJZtuHSzKXN2qw9
 SJvnvXqP+yC39Tx5fK+rXDdA/98VhHT/CBqNw9jVi815OMpchf43hQN2LlJXcXciQ29n
 ThemfPlb9r5T6kJxMfv+EL9xGQCnXoTkLv3v86MrSOwcIFt9zbYa1pLeJUR1sdKj2GNW
 CyTA==
X-Gm-Message-State: AOAM531m8okeR1tU7g3oMqlKgu74hGO+OO/MeGOS9U7feZ9We0HS4Mb5
 t778LNpdyTS9/6WFfqnNut7GpQQG4XC0R2JlllXo7A==
X-Google-Smtp-Source: ABdhPJx/RY2g66p/t1/L0q/cqPmlQAgvBZkCf/KHiV6YEfYM36LT31LfSHFCetjbvDZYwqBG8g5Q4idYKqRctw+2qic=
X-Received: by 2002:ac8:e0e:: with SMTP id a14mr587226qti.66.1611567408146;
 Mon, 25 Jan 2021 01:36:48 -0800 (PST)
MIME-Version: 1.0
References: <000000000000418c7705afcff2e1@google.com>
 <0000000000001b4eeb05b91ae518@google.com>
In-Reply-To: <0000000000001b4eeb05b91ae518@google.com>
Date: Mon, 25 Jan 2021 10:36:36 +0100
Message-ID: <CACT4Y+Y=rsqHVRGWtfcJmdd_8CAYw3W_tO72_YkpLiu6d9Qo6w@mail.gmail.com>
To: syzbot <syzbot+9765367bb86a19d38732@syzkaller.appspotmail.com>
Cc: lizhe67@huawei.com, dwmw2@infradead.org, jamie@nuviainc.com,
 Eric Sandeen <sandeen@sandeen.net>, LKML <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, linux-mtd@lists.infradead.org,
 Al Viro <viro@zeniv.linux.org.uk>, Richard Weinberger <richard@nod.at>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] general protection fault in
	jffs2_parse_param
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

On Sun, Jan 17, 2021 at 5:14 PM syzbot
<syzbot+9765367bb86a19d38732@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit a61df3c413e49b0042f9caf774c58512d1cc71b7
> Author: Jamie Iles <jamie@nuviainc.com>
> Date:   Mon Oct 12 13:12:04 2020 +0000
>
>     jffs2: Fix NULL pointer dereference in rp_size fs option parsing
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15cb91e7500000
> start commit:   bf3e7628 Merge branch 'mtd/fixes' of git://git.kernel.org/..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=61033507391c77ff
> dashboard link: https://syzkaller.appspot.com/bug?extid=9765367bb86a19d38732
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13d81f32500000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13516852500000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: jffs2: Fix NULL pointer dereference in rp_size fs option parsing
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

#syz fix: jffs2: Fix NULL pointer dereference in rp_size fs option parsing
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
