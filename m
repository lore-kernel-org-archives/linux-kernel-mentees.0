Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0B5C19F2C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 01:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFBA281334;
	Wed,  3 Aug 2022 01:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFBA281334
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IK44tNyA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cm2x3vXpnvcG; Wed,  3 Aug 2022 01:08:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E089F80DA5;
	Wed,  3 Aug 2022 01:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E089F80DA5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC16BC0032;
	Wed,  3 Aug 2022 01:08:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE2D5C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 01:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBCC440932
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 01:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBCC440932
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=IK44tNyA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YtKPNWjXoZM7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 01:08:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F606408A7
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F606408A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 01:08:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 46A34CE216B;
 Wed,  3 Aug 2022 01:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200F8C433D6;
 Wed,  3 Aug 2022 01:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659488918;
 bh=nFvBbjR87hTY904i1+8Fy8FiC4hebZxTVV+qEYLIg/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IK44tNyATmuHIJbWXYRZMj56Cu8AdGwvjirxqR90PmsqSdmS1JoZOnmyd7NUcUKWl
 avx17DBgigH9IH3d1beVf0Z7h0wMJxGe8DW3jjidN0HKn5sxI9w9X2I/c3qDMlmVKj
 kUjPBQMDanzoZX1U6MsM3KUxl80kDuh9qN6OloReq/EVXf4soGAWlONt8wd2aA03zo
 /DffC6Xko1Qxt42aK2yLSp9t+oSsimdWBspR6JY7viQKAXYc95G3u1jxM/t0rexV67
 fUvT76BqSpCP7BHZQyZ1K4WH+US2HghnrlSlxP3jk7TrDzhp2tzJ/RaBD17N/7uYRn
 EQ9yTuwrgkh8Q==
Date: Tue, 2 Aug 2022 18:08:36 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v3] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
Message-ID: <YunKlJCDlmyn2hJ4@sol.localdomain>
References: <20220728155121.12145-1-code@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220728155121.12145-1-code@siddh.me>
Cc: syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com,
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

On Thu, Jul 28, 2022 at 09:21:21PM +0530, Siddh Raman Pant wrote:
> If not done, a reference to a freed pipe remains in the watch_queue,
> as this function is called before freeing a pipe in free_pipe_info()
> (see line 834 of fs/pipe.c).
> 
> This causes a UAF when post_one_notification() tries to access the pipe
> on a key update, which is reported by syzbot.
> 
> We also need to use READ_ONCE() in post_one_notification() to prevent the
> compiler from optimising and loading a non-NULL value from wqueue->pipe.

Didn't this already get fixed by the following commit?

	commit 353f7988dd8413c47718f7ca79c030b6fb62cfe5
	Author: Linus Torvalds <torvalds@linux-foundation.org>
	Date:   Tue Jul 19 11:09:01 2022 -0700

	    watchqueue: make sure to serialize 'wqueue->defunct' properly

With that, post_one_notification() only runs while the watch_queue is locked and
not "defunct".  So it's guaranteed that the pipe still exists.  Any concurrent
free_pipe_info() waits for the watch_queue to be unlocked in watch_queue_clear()
before proceeding to free the pipe.  So where is there still a bug?

> 
> Bug report: https://syzkaller.appspot.com/bug?id=1870dd7791ba05f2ea7f47f7cbdde701173973fc
> Reported-and-tested-by: syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com

If this actually does fix something, then it's mixing Fixes and Cc stable tags.

> diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
> index bb9962b33f95..617425e34252 100644
> --- a/kernel/watch_queue.c
> +++ b/kernel/watch_queue.c
> @@ -99,7 +99,7 @@ static bool post_one_notification(struct watch_queue *wqueue,
>  				  struct watch_notification *n)
>  {
>  	void *p;
> -	struct pipe_inode_info *pipe = wqueue->pipe;
> +	struct pipe_inode_info *pipe = READ_ONCE(wqueue->pipe);
>  	struct pipe_buffer *buf;
>  	struct page *page;
>  	unsigned int head, tail, mask, note, offset, len;
> @@ -637,6 +637,12 @@ void watch_queue_clear(struct watch_queue *wqueue)
>  		spin_lock_bh(&wqueue->lock);
>  	}
>  
> +	/* Clearing the watch queue, so we should clean the associated pipe. */
> +	if (wqueue->pipe) {
> +		wqueue->pipe->watch_queue = NULL;
> +		wqueue->pipe = NULL;
> +	}
> +
>  	spin_unlock_bh(&wqueue->lock);
>  	rcu_read_unlock();
>  }

And this is clearly the wrong fix anyway, since it makes the call to
put_watch_queue() in free_pipe_info() never be executed.  So AFAICT, this patch
introduces a memory leak, and doesn't actually fix anything...

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
