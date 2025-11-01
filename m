Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44D1A41
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  1 Nov 2025 03:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761967169; cv=none; b=A/r2+f4OwEBXaT4rWUNcLK1xzhpGqdlJVO7sqlyeXeYAKqpajtFNcl5mkRTW2rcTu85eL2muPt6Ijrle+Lk3U7uXECgo/Woztbu8v8C17CB8aEXsXjKMwMq0E9WzOuzX+c0knoI1kSy6Kw5gXZvD9i6Fau6ShU4MWGz+eUAnWbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761967169; c=relaxed/simple;
	bh=0bDl4Evl43JD3FcmfjL9pGUxTnN5KWMJY8C8qeVhF+Q=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=AUP1lySFoPloYP2fcCrr+RZnHhnz0eouWfV+rQbNUcEsQnPbUaXX1Gsa0uUZGzt0bdXbx39bdOVzGYkUVCIEVFnax7YKbdQQg23z85icimrwxOYn7zjlEh5dxyLx3rP4RPKmYT2aYownDQUvVIX/yFMIOltrPBL54NDgI5qS+E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CLFRKK9T; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CLFRKK9T"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F2B641D3E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  1 Nov 2025 03:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITvE1Zw2Honq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Nov 2025 03:19:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5495D40E4A
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5495D40E4A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=CLFRKK9T
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5495D40E4A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  1 Nov 2025 03:19:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49783600AA;
	Sat,  1 Nov 2025 03:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C8CC4CEF7;
	Sat,  1 Nov 2025 03:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1761967164;
	bh=0bDl4Evl43JD3FcmfjL9pGUxTnN5KWMJY8C8qeVhF+Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CLFRKK9TWsimttfuaW9EtO5QFoKpOVoQnRWdpjAS0qdvxt2bFvMkPcC4bcArqHtaQ
	 aFcBWz2z7DCoc2sGAp2bGOyuujPsyO2sRbuTR36Jft1WpIktstGLYw5fQ5bYfCiaQk
	 +yfqCb7YHBbG4LwOiePhDC/6ZQZMi+F6ct5vdTW8=
Date: Fri, 31 Oct 2025 20:19:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, Wei Yang
 <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Steven Rostedt
 <rostedt@goodmis.org>
Subject: Re: [PATCH] selftests/user_events: Avoid taking address of packed
 member in perf_test
Message-Id: <20251031201923.2e9a592a209c0978246f63d6@linux-foundation.org>
In-Reply-To: <aQIwxjBNonW5Py_I@fedora>
References: <20251027113439.36059-1-ankitkhushwaha.linux@gmail.com>
	<20251027162521.c56c7f89f6ad4e3d639c408c@linux-foundation.org>
	<aQD2Igc3svAF3klc@fedora>
	<20251028132605.2926d3ef5eb6ea60d22ceffe@linux-foundation.org>
	<aQIwxjBNonW5Py_I@fedora>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Oct 2025 20:50:38 +0530 Ankit Khushwaha <ankitkhushwaha.linux@gmail.com> wrote:

> > > > >  	/* Ensure write shows up at correct offset */
> > > > > -	ASSERT_NE(-1, write(self->data_fd, &reg.write_index,
> > > > > +	memcpy(&write_index, &reg.write_index, sizeof(reg.write_index));
> > > > > +	ASSERT_NE(-1, write(self->data_fd, &write_index,
> > > > >  	                    sizeof(reg.write_index)));
> > > > 
> > > > Simply casting &write_index to void* would fix this?
> > > 
> > > yes, this hides the type mismatch from the compiler. But i think
> > > casting to void * will not fix the alignment mismatch for packed struct.
> > > It works on x86, but might break on other platform.
> > 
> > It's the second argument to write(2)!  write(2) expects a const char *,
> > but void* will work.
> 
> Hi Andrew,
> Indeed 
> `ASSERT_NE(-1, write(self->data_fd, (void *)&reg.write_index, 
> 		     sizeof(reg.write_index)));`
> 
> would work. However since `reg` is packed struct, directly taking the 
> address of its member  `&reg.write_index` may lead to unaligned access 
> on some architectures. as indicated by the compiler warning
> 
> 	perf_test.c:239:38: warning: taking address of packed member
> 	'write_index' of class or structure 'user_reg' may result in 
> 	an unaligned pointer value [-Waddress-of-packed-member]

Well sure, we might get an unaligned pointer value and it would be an
error to dereference that pointer.

But we don't dereference it!  We pass that pointer to write(2), which
is happy with any alignment.

The warning is accurate.  It "may" indeed "result in an unaligned
pointer value".  But there is nothing at all wrong with this code.  OK,
let's find some way to suppress the warning (preferably without adding
a pointless memcpy) and let's make the changelog and code comments be
clear about what's going on here.

