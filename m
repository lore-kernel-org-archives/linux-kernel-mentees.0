Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68C9C19F28
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 18:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31C86402EB;
	Wed,  3 Aug 2022 18:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31C86402EB
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cmRFsOWk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hu5FlcEYXpWr; Wed,  3 Aug 2022 18:15:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id ECB6140112;
	Wed,  3 Aug 2022 18:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECB6140112
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B61D8C0032;
	Wed,  3 Aug 2022 18:15:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 800B7C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 18:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 465EC60B36
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 18:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 465EC60B36
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=cmRFsOWk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vbokcAP9RzFR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 18:15:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FCA860AE7
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FCA860AE7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 18:15:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 309206125E;
 Wed,  3 Aug 2022 18:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9600FC433C1;
 Wed,  3 Aug 2022 18:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659550534;
 bh=7O/on+19Nue3/Vk4JQ7+/4AVjwXWMn+5GbqToJguIEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cmRFsOWkOufQEawUoZve7qnELukP37q45otVfWWsf//TiVfLXIZvmJ/mffOL/oSo5
 aAIRdmlpqFbaBrkf4CQ4JFM0DA7O/cYLQKmaLhPa2ih01chciOJGzcyDGy6UEhmUJN
 gFwTcgSd6oBeMORJDMeNtCVmvzL6g4eYlDQib900LSBDgEDFIOy1ZkojGNbrB4sk6J
 KOmeag/W0n5DuctpmmJkN0JAGcgz7iiZB9w4K35HagHmUVfwWT8XczimkKRekQKpII
 f2rlvhhtOYTicCRD0zL+vXh9re35hsZvHR6OnC0Olbl50+HDm7P4K2CC30zt7Cujgq
 XJ1Z0nVaWDuDA==
Date: Wed, 3 Aug 2022 18:15:31 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v3] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
Message-ID: <Yuq7Q//SH/HjLsxH@gmail.com>
References: <20220728155121.12145-1-code@siddh.me>
 <YunKlJCDlmyn2hJ4@sol.localdomain>
 <18261d8a63a.33799d2a402802.7512018232560408914@siddh.me>
 <Yun1rC59USrgd0fu@sol.localdomain>
 <182621f8dca.1e0e6161130907.1470656861897824669@siddh.me>
 <YuoKi0GigXm/Hcb+@sol.localdomain>
 <18262dcb20e.4bf31faa421018.1228982721921458740@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18262dcb20e.4bf31faa421018.1228982721921458740@siddh.me>
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

On Wed, Aug 03, 2022 at 02:10:06PM +0530, Siddh Raman Pant wrote:
> On Wed, 03 Aug 2022 11:11:31 +0530  Eric Biggers <ebiggers@kernel.org> wrote:
> > I tested the syzbot reproducer
> > https://syzkaller.appspot.com/text?tag=ReproC&x=174ea97e080000, and it does
> > *not* trigger the bug on the latest upstream.  But, it does trigger the bug if I
> > recent Linus's recent watch_queue fixes.
> > 
> > So I don't currently see any evidence of an unfixed bug.  If, nevertheless, you
> > believe that a bug is still unfixed, then please provide a reproducer and a fix
> > patch that clearly explains what it is fixing. 
> > 
> > > There is a null check in post_one_notification for the pipe, most probably
> > > because it *expects* the pointer to be NULL'd. Also, there is no reason to have
> > > a dangling pointer stay, it's just a recipe for further bugs.
> > 
> > If you want to send a patch or patches to clean up the code, that is fine, but
> > please make it super clear what is a cleanup and what is a fix.
> > 
> > - Eric
> > 
> 
> I honestly feel like I am repeating myself yet again, but okay.

Well, you should try listening instead.  Because you are not listening.

> Of course, the race condition has been solved by a patch upstream, which I had
> myself mentioned earlier.
> 
> But what I am saying is that it did *not* address *what* that race condition
> had triggered, i.e. the visible cause of the UAF crash, which, among other
> things, is *because* there is a dangling pointer to the freed pipe, which
> *caused* the crash in post_one_notification() when it tried to access
> &pipe->rd.wait_lock as an argument to spin_lock_irq(), a path it reached
> after checking if wqueue->pipe is NULL and proceeded when it was not the case.
>
> And the upstream commit was made *after* I had posted this patch, hence this
> was a fix for the syzkaller issue. While I am *not* saying to accept it just
> because this was posted earlier, I am saying this patch addresses a parallel
> issue, i.e. the *actual use-after-free crash* which was reproduced by those
> reproducers, i.e., what was attempted to be used after getting freed and
> detected by KASAN.

Even if wqueue->pipe was set to NULL during free_pipe_info(), there would still
have been a use-after-free, as the real bug was the lack of synchronization
between post_one_notification() and free_pipe_info().  That is fixed now.

> 
> We don't need to wait for another similar syzbot report to pop up before doing
> this change, and say let's not fix a dangling pointer reference because now
> another commit apparately fixes the specific syzkaller issue, causing the given
> specific reproducer with its specific way of reproducing to fail, when we in
> fact now know it *can* be a valid problem in practice and doing this change
> too causes the specific reproducer under consideration to fail reproducing, as
> was reported by the reproducer itself.

To re-iterate, I encourage you to send a cleanup patch if you see an
opportunity.  It looks like the state wqueue->defunct==true could be replaced
with wqueue->pipe==NULL, which would be simpler, so how about doing that?  Just
don't claim that it is "fixing" something, unless it is, as that makes things
very confusing and difficult for everyone.

> 
> I really don't know how to create stress tests / reproducers like how syzkaller
> makes, so if a similar new reproducer is really required for showing this
> patch's validity disregarding any earlier reproducers, I unfortunately cannot
> make it due to skill issue as I just started in kernel dev, and I am deeply
> sorry for wasting the time of everyone, and I am thankful for your criticism of
> my patch.

A reproducer can just be written as a normal program, in C or another language.
The syzkaller reproducers are really hard to read as they are auto-generated, so
don't read too much into them -- they're certainly not examples of good code.

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
