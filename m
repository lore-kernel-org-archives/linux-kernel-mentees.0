Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B932D480E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 20:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761683172; cv=none; b=m50NG1U398L9PH740yPXrhj0HoTI47zxxtdKDtf/AYelePO1l7nurNrxXe319EvoYig659RP4HOE3+5EovyTMS98wygfJoal6M6QKU1dHBCjP6LjSETAAuuW61apYpGtofWGD2BBnvzZF3kBUP+LD5LT2xncWj9hnDvarp9pZGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761683172; c=relaxed/simple;
	bh=mufjAN3ZOaAAOgKYwrgWMAEjc4T917ZVwPZR3WxJgy8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Lktv0C+mH7yTf4I3zB2xkeI9mT1QgkSr6W+YpNx94t0heNJKAmTlV3nP46Or4KQm/HEN+n50Wcevawe8fvdGrCNba7xI0apozV2o5ve4i4A1k7SNu3Go28MtofWKneFBDwV/CWZuxuWFw2Vv5e/Vpp0oS4jQPKH+TscGxgSdqJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LqATq1YJ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LqATq1YJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D5E240716
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 20:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKhb-q7ua6D9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Oct 2025 20:26:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB51940715
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB51940715
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=LqATq1YJ
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BB51940715
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 20:26:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3425960307;
	Tue, 28 Oct 2025 20:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910AFC4CEE7;
	Tue, 28 Oct 2025 20:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1761683167;
	bh=mufjAN3ZOaAAOgKYwrgWMAEjc4T917ZVwPZR3WxJgy8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LqATq1YJi0hjM1WG9L/R86XeOCVJFfgdgNVmn99vpM1ll3zuXM3fzCnVVdfCzwRQW
	 idKaRBsqgmBLOztOd1B+0jnWH9gWZBu29t6ncYefyHMbSTQ5qO7MPPKgw21PMtTKp0
	 Z98c/vafkmtUaDhZIks2QqCh7TREbiV+Rwd0wADk=
Date: Tue, 28 Oct 2025 13:26:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, Wei Yang
 <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Steven Rostedt
 <rostedt@goodmis.org>
Subject: Re: [PATCH] selftests/user_events: Avoid taking address of packed
 member in perf_test
Message-Id: <20251028132605.2926d3ef5eb6ea60d22ceffe@linux-foundation.org>
In-Reply-To: <aQD2Igc3svAF3klc@fedora>
References: <20251027113439.36059-1-ankitkhushwaha.linux@gmail.com>
	<20251027162521.c56c7f89f6ad4e3d639c408c@linux-foundation.org>
	<aQD2Igc3svAF3klc@fedora>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 Oct 2025 22:28:10 +0530 Ankit Khushwaha <ankitkhushwaha.linux@gmail.com> wrote:

> > > @@ -236,7 +237,8 @@ TEST_F(user, perf_empty_events) {
> > >  	ASSERT_EQ(1 << reg.enable_bit, self->check);
> > >  
> > >  	/* Ensure write shows up at correct offset */
> > > -	ASSERT_NE(-1, write(self->data_fd, &reg.write_index,
> > > +	memcpy(&write_index, &reg.write_index, sizeof(reg.write_index));
> > > +	ASSERT_NE(-1, write(self->data_fd, &write_index,
> > >  	                    sizeof(reg.write_index)));
> > 
> > Simply casting &write_index to void* would fix this?
> 
> yes, this hides the type mismatch from the compiler. But i think
> casting to void * will not fix the alignment mismatch for packed struct.
> It works on x86, but might break on other platform.

It's the second argument to write(2)!  write(2) expects a const char *,
but void* will work.
