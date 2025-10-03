Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A7D23D7C3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759501636; cv=none; b=iEhu211k1UEiL6MiV69jZeJbQ7lN9i+QbBiBp+2kSo76JsDtHEBg3lq9YC8XUHm+eBGlt00JIQux5XIz5/PpTDEGAQUYIDEwhbtqGVXwD2GPsETpVxBYfa1b8PqrOFsMa1ExHhFK/KH8Yxlhyi5Lx0NcTQYmNdVw8ivCCHC7lBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759501636; c=relaxed/simple;
	bh=dGFgZnRHqdceZqsBoaf4qUSTMVbavHVe6dKEnyeKKns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Upd6/GcR2dG+6ThuoDi9SFFKxEdcVc8E5OXvufNU6k2YZ7OSJE0oEPm0JpVkWIZYnb9tb/pFilAYNkUM1O7w7P8KIc5PAPf0X/07MBArvZfuSI8MeityrfO2M/QjD5WE1QLQKKyZLk9I4YMJLv5MKhQuSS+SxwlTL3QHuaFZ9Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgQGLMH+; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgQGLMH+"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBBB882232
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 14:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lm1QtukIboE5 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Oct 2025 14:27:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=tj@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9A908227A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9A908227A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QgQGLMH+
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E9A908227A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 14:27:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F44E62169;
	Fri,  3 Oct 2025 14:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A49DC4CEF5;
	Fri,  3 Oct 2025 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759501631;
	bh=dGFgZnRHqdceZqsBoaf4qUSTMVbavHVe6dKEnyeKKns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QgQGLMH+rW+2D0ZVkqgdP6Y7Qhz7kCt9KQ8/4gbwfX/Jrhz4WsdksbIhX3Tkkf+QR
	 POIeVYbv3SF91v7+4UBzL3ul/nYxr5W2RRUDuiaIRLdXRo/5n13zYBPVvk2sqVF3B2
	 v15mAip4KtkuHe7np2JHGzcZX+Y+pWCbxnbXuOjGc+PfQaRAz8RLPLeJRaRIceo3yZ
	 c5s+0eYhHqGjxR1YghfA033TNhlopfPgHZt/lmlDVeyaUKbF9Up8HjAWrqaC8tjvxf
	 USN11kMasr5pZX6HMMCIuJJKr/me8K3ns5+sGJJ8PlAlLDvzGutjbZro12o9B25qWR
	 1dzIb6PD2IEqg==
Date: Fri, 3 Oct 2025 04:27:10 -1000
From: Tejun Heo <tj@kernel.org>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: Nirbhay Sharma <nirbhay.lkd@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tiffany Yang <ynaffit@google.com>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	syzbot+27a2519eb4dad86d0156@syzkaller.appspotmail.com,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH] cgroup: Fix seqcount lockdep assertion in cgroup freezer
Message-ID: <aN_dPpjupRpc9Tj1@slm.duckdns.org>
References: <20251003114555.413804-1-nirbhay.lkd@gmail.com>
 <nbtofen2pwqmp7r5odbyc4en6vv54rpznyaanxlb6tbx5yyg25@jx2re5hdmt5e>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nbtofen2pwqmp7r5odbyc4en6vv54rpznyaanxlb6tbx5yyg25@jx2re5hdmt5e>

On Fri, Oct 03, 2025 at 04:00:22PM +0200, Michal Koutný wrote:
> On Fri, Oct 03, 2025 at 05:15:55PM +0530, Nirbhay Sharma <nirbhay.lkd@gmail.com> wrote:
> > The commit afa3701c0e45 ("cgroup: cgroup.stat.local time accounting")
> > introduced a seqcount to track freeze timing but initialized it as a
> > plain seqcount_t using seqcount_init().
> > 
> > However, the write-side critical section in cgroup_do_freeze() holds
> > the css_set_lock spinlock while calling write_seqcount_begin(). On
> > PREEMPT_RT kernels, spinlocks do not disable preemption, causing the
> > lockdep assertion for a plain seqcount_t, which checks for preemption
> > being disabled, to fail.
> > 
> > This triggers the following warning:
> >   WARNING: CPU: 0 PID: 9692 at include/linux/seqlock.h:221
> > 
> > Fix this by changing the type to seqcount_spinlock_t and initializing
> > it with seqcount_spinlock_init() to associate css_set_lock with the
> > seqcount. This allows lockdep to correctly validate that the spinlock
> > is held during write operations, resolving the assertion failure on all
> > kernel configurations.
> > 
> > Reported-by: syzbot+27a2519eb4dad86d0156@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=27a2519eb4dad86d0156
> > Fixes: afa3701c0e45 ("cgroup: cgroup.stat.local time accounting")
> > Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
> 
> Link: https://lore.kernel.org/r/20251002165510.KtY3IT--@linutronix.de/
> 
> Yes, this is what was discussed yesterday. Thanks.
> 
> Acked-by: Michal Koutný <mkoutny@suse.com>

Okay, reverting that one and applying this one.

Thanks.

-- 
tejun
