Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E1DC19F2B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 04:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BF73408AE;
	Wed,  3 Aug 2022 04:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BF73408AE
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TK/kg7Xb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1-Tt0iZMoX1; Wed,  3 Aug 2022 04:12:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1589F400FB;
	Wed,  3 Aug 2022 04:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1589F400FB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0165DC0033;
	Wed,  3 Aug 2022 04:12:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8B77C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 04:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 832818196A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 04:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 832818196A
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=TK/kg7Xb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7LI4qvZJ1Or
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 04:12:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0D7181926
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0D7181926
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 04:12:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B3E81B8217D;
 Wed,  3 Aug 2022 04:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265B4C433C1;
 Wed,  3 Aug 2022 04:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659499950;
 bh=/5bvzOm7MhNymrzvwwNIjMW1hlBKd/c+bwCabXKjulY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TK/kg7XborVlqtD+QqcnVGtcUkNADw5IfNGaVYfYqXXFNmHLq2d6ujPQltcJryKVy
 TJUUj0OcYfsnwGLNdJoAY7uX//5ypfeFaN/R80zJ/EaIfwWYPQWHii5iUAAhT2en0R
 iX8v6rUlrH4dxBIVXu+sIb4OwsBTZjIj0qQyr6vEMi61EFnzezcfWro3xriRyGlN2k
 3YhYeotmg8/cx2Ub6T9Ff8VrTgEoBw+WvqIcw6VbxB7PngQ/IN+NfoDFmLvvkqC2ks
 boPrrM2kyXg+Svr15sRFW7Cn0xr/BooFpyBAQUFmOdKe4Z8VIS64huSLc49P4GR5Rm
 oiw/l80kfo5Uw==
Date: Tue, 2 Aug 2022 21:12:28 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v3] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
Message-ID: <Yun1rC59USrgd0fu@sol.localdomain>
References: <20220728155121.12145-1-code@siddh.me>
 <YunKlJCDlmyn2hJ4@sol.localdomain>
 <18261d8a63a.33799d2a402802.7512018232560408914@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18261d8a63a.33799d2a402802.7512018232560408914@siddh.me>
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

On Wed, Aug 03, 2022 at 09:26:04AM +0530, Siddh Raman Pant wrote:
> On Wed, 03 Aug 2022 06:38:36 +0530  Eric Biggers <ebiggers@kernel.org> wrote:
> > On Thu, Jul 28, 2022 at 09:21:21PM +0530, Siddh Raman Pant wrote:
> > > If not done, a reference to a freed pipe remains in the watch_queue,
> > > as this function is called before freeing a pipe in free_pipe_info()
> > > (see line 834 of fs/pipe.c).
> > > 
> > > This causes a UAF when post_one_notification() tries to access the pipe
> > > on a key update, which is reported by syzbot.
> > > 
> > > We also need to use READ_ONCE() in post_one_notification() to prevent the
> > > compiler from optimising and loading a non-NULL value from wqueue->pipe.
> > 
> > Didn't this already get fixed by the following commit?
> > 
> >     commit 353f7988dd8413c47718f7ca79c030b6fb62cfe5
> >     Author: Linus Torvalds <torvalds@linux-foundation.org>
> >     Date:   Tue Jul 19 11:09:01 2022 -0700
> > 
> >         watchqueue: make sure to serialize 'wqueue->defunct' properly
> > 
> > With that, post_one_notification() only runs while the watch_queue is locked and
> > not "defunct".  So it's guaranteed that the pipe still exists.  Any concurrent
> > free_pipe_info() waits for the watch_queue to be unlocked in watch_queue_clear()
> > before proceeding to free the pipe.  So where is there still a bug?
> 
> It doesn't fix the dangling pointer to the freed pipe in the watch_queue, which
> had caused this crash.
> 

Under what circumstances is the pipe pointer still being dereferenced after the
pipe has been freed?  I don't see how it can be; see my explanation above.

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
