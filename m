Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E39AC19F28
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 05:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF8738198D;
	Wed,  3 Aug 2022 05:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF8738198D
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h6/1FG4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLXujTiNbBo1; Wed,  3 Aug 2022 05:41:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E3DF881926;
	Wed,  3 Aug 2022 05:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3DF881926
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE428C0032;
	Wed,  3 Aug 2022 05:41:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9D6AC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 05:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC0B240139
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 05:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC0B240139
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=h6/1FG4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vgPLQwkjbss1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 05:41:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBE0C40111
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBE0C40111
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 05:41:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4480612CB;
 Wed,  3 Aug 2022 05:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA396C433C1;
 Wed,  3 Aug 2022 05:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659505293;
 bh=ASwcL9MUCRLvs4Fx3Q5d20iEV+AfPh4/M2OnWZiOYBs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h6/1FG4At3DoxSQGaBiVHI8jUPtURqIb7Ryw43T3J3nB6+fqsRcYQiGl9uhDmRjLX
 ryTEHbDURUONPCgCQT08BDrkoxxRtBoOX7F5YaHH33RbqHPkYi7zGgmiWNg1OdBhzc
 omhzuNROmzSU7ITlCmmMUkHr0PzVW+YBmpkmDndBiw2wEalo406tknLnSUCruKbec/
 C7V94Cv0rLTipztzakPs3J7bGSYCMCH1P/ZQOO+4NSrdaBE2OUW2SzQ/K8l2nVpLrh
 JH9UvhG/6qwS5mFGRKNwWYWKHzIO83P8ZbzsA67ywhGdf/a2EAYdtp9HNHJQwTrh7q
 7XhEkfYoMPNrA==
Date: Tue, 2 Aug 2022 22:41:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v3] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
Message-ID: <YuoKi0GigXm/Hcb+@sol.localdomain>
References: <20220728155121.12145-1-code@siddh.me>
 <YunKlJCDlmyn2hJ4@sol.localdomain>
 <18261d8a63a.33799d2a402802.7512018232560408914@siddh.me>
 <Yun1rC59USrgd0fu@sol.localdomain>
 <182621f8dca.1e0e6161130907.1470656861897824669@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <182621f8dca.1e0e6161130907.1470656861897824669@siddh.me>
Cc: syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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

On Wed, Aug 03, 2022 at 10:43:31AM +0530, Siddh Raman Pant wrote:
> On Wed, 03 Aug 2022 09:42:28 +0530  Eric Biggers <ebiggers@kernel.org> wrote:
> > Under what circumstances is the pipe pointer still being dereferenced after the
> > pipe has been freed?  I don't see how it can be; see my explanation above.
> 
> It really didn't fix the crash. It caused the same crash reported here, which
> I was already locally getting:
> https://syzkaller.appspot.com/bug?extid=03d7b43290037d1f87ca

I tested the syzbot reproducer
https://syzkaller.appspot.com/text?tag=ReproC&x=174ea97e080000, and it does
*not* trigger the bug on the latest upstream.  But, it does trigger the bug if I
recent Linus's recent watch_queue fixes.

So I don't currently see any evidence of an unfixed bug.  If, nevertheless, you
believe that a bug is still unfixed, then please provide a reproducer and a fix
patch that clearly explains what it is fixing. 

> There is a null check in post_one_notification for the pipe, most probably
> because it *expects* the pointer to be NULL'd. Also, there is no reason to have
> a dangling pointer stay, it's just a recipe for further bugs.

If you want to send a patch or patches to clean up the code, that is fine, but
please make it super clear what is a cleanup and what is a fix.

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
