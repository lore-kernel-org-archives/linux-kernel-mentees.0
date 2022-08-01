Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D469C00144
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Aug 2022 18:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73287400F8;
	Mon,  1 Aug 2022 18:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73287400F8
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=UGFQNQwF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pk8V-ytrx5Qf; Mon,  1 Aug 2022 18:49:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 237B14006D;
	Mon,  1 Aug 2022 18:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 237B14006D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2FE0C0032;
	Mon,  1 Aug 2022 18:49:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12315C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 18:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F697605A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 18:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F697605A4
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=UGFQNQwF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UjmoOBj2Ak-f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 18:49:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3C2A605D8
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3C2A605D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 18:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659379756; cv=none; d=zohomail.in; s=zohoarc; 
 b=VmVDKppyY7mmW+pbZdDKKYx7d8inNu18GL1SuTG6bWf6Mb2GZ6jUK+NwfCmN9iveCzC/s9pPwEgTw+Cq6HRsqodMT+Y9/1XaQ33cKAcxRPVFBJR9eZUwVdUlPubhw1y8fTqEovi7Ia2zWLu5mYA/M+gvat4YzUfbmLmUd1Iapp0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659379756;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=XfAboZjbyugwzY0E4/UI5wpejzMLWhKLhGXS45Aib6k=; 
 b=Uh7vOJmtrvZuqJdWhfbOh7Rc7ovurEER0Bm4UbhBLbRgjFvSNDy6CILk34RQlJw5vVNZ77hmD0ha3LgiBlNzTlnw4tlDSFeMQ/pekxdMubUi2DRvYqbK0MP0JNRmGzMyvOlBRcL83Nr2AmadhUGrNKb+/Xx6DW58mMofq9Z9ID4=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659379756; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=XfAboZjbyugwzY0E4/UI5wpejzMLWhKLhGXS45Aib6k=;
 b=UGFQNQwF3RXxXWKpZU6KeS4TkAcf2lKDF94AHa8TWQ448Rq6SvMgJtRf2sxNKEPb
 3e51obacAN7fMBRtHHtp6i8BlYvY/nWZgJcX6ywqZ7HjRO8N+XT01AXEHUU6v46kkw3
 cl64VJFjVfhNKnXdnoLe9/DU2c8h8o+DYZcryE3c=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659379745755991.9064464551104;
 Tue, 2 Aug 2022 00:19:05 +0530 (IST)
Date: Tue, 02 Aug 2022 00:19:05 +0530
To: "Dipanjan Das" <mail.dipanjan.das@gmail.com>
Message-ID: <1825abd83c7.2fc2819e194605.6286442523651645797@siddh.me>
In-Reply-To: <20220801161642.GA1932489@berlinger>
References: <20220728155121.12145-1-code@siddh.me>
 <18258c1d370.6c4bec7a269297.4170944235031209431@siddh.me>
 <Yuepw21SyLbWt9F+@kroah.com>
 <182597c78f6.70a93066293735.4741894763116073008@siddh.me>
 <182597eccd3.14cac6a4293987.1730526835854998440@siddh.me>
 <20220801161642.GA1932489@berlinger>
Subject: Re: [PATCH v3] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: Eric Dumazet <edumazet@google.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, 01 Aug 2022 21:46:42 +0530  Dipanjan Das <mail.dipanjan.das@gmail.com> wrote:
> Are you referring to the reproducer attached to our original report?
> https://lore.kernel.org/all/CANX2M5bHye2ZEEhEV6PUj1kYL2KdWYeJtgXw8KZRzwrNpLYz+A@mail.gmail.com/
 
Yes, I meant the reproducer you gave.

I suspect I must have missed CONFIG_WATCH_QUEUE=y while setting the kernel
up, extremely sorry for it.

I now tried 5.10.y with it (using a modification of syzkaller's dashboard
config I had been using[1]), and I'm getting a __post_watch_notification()
crash (which is a related crash, as the fix[2][3] for that causes the
reproducer to not reproduce the post_one_notification crash on mainline),
but not the post_one_notification() crash you had reported. It seems if I
apply my patch, it doesn't trigger this related crash, so these bugs are
seem to be very related maybe due to racing? I haven't looked at that yet.

I then tried on v5.10.131 since that was the exact version you had
reproduced on, and it reproduces the post_one_notification() error
successfully. Applying 353f7988dd84 causes __post_watch_notification()
crash, and then applying this v3 patch does not trigger the issue, but
the patch to fix __post_watch_notification() crash is [2], which does
not really address the issue of post_one_notification() crash which
is due to the dangling reference to a freed pipe.

Can you please try reproducer at your end?

Thanks,
Siddh

[1] https://gist.github.com/siddhpant/06c7d64ca83273f0fd6604e4677f7c0d
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e64ab2dbd882933b65cd82ff6235d705ad65dbb6
[3] https://lore.kernel.org/linux-mm/18259769e5e.52eb2082293078.3991591702430862151@siddh.me/
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
