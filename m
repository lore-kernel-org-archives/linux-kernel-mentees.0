Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0CC51C354
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Sep 2026 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=140.211.166.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798697; cv=fail; b=AMFHMPjUYF3OLCxsjZpPaLdOnMb1s7N7Us1t53rD6RPL9++4zH1tofEG3InCBTBw0qPQpjPVrz568VxMD7tGeHN+GcGc9AEePloDE7uG69wqBqDaBUVpoUyvm+MCW0uTnfsfDWrLRw1gxtUiWVBEeGPRJN210M5UKptCXLNbzbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798697; c=relaxed/simple;
	bh=fY8vl7GDxM6eefJTmcCbIoGsRSR0fg+tHBlSSgyE3EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUnoj3O9PfZGeGshG05H9Le6JsGZbuPbis4pQQ9DoGrTgJolhsnV0seL3piz0I6FMyuO4kMWoE6j3iR4ThjBtXxEZccURxADD7xS0pAhnbHu8h/F0LAd2L+IdTkIV5ej/pxqcm2ouoWoee80eXA0M014GLWGIw1229r+dqFEqwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wP7OyOaQ; arc=fail smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wP7OyOaQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB4074005A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Sep 2026 16:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.75
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iq0XwBa7c5Xw for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2026 16:31:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 384974007E
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788798695;
	b=EKwYvanDIVB+ajBg9xGphfEWJzwcmTeWCusj4C6chclDQePOHJUNR5hA5cr7JOmcEOJJ
	 Eni3M8KIeKJ/s2ihs4zKWPDMeXS9JhA6oM7uDB+Y5QkQlHAADjJQLGYgfpe2VKVvxFQ0o
	 zn5/P+rWAzWVQim1WNtprXDEu5MlNLyYiutsPO9eqwEqWUhlYDmkMTDAXf97iXcZUTUTj
	 aFqy7ynCLJIVSv4H0RDoYJNpCgQUVecGv2M1DuC0EEwvulHzhY45/derI9p6gikE78ksB
	 OJ8x4i5XSDY6vvcM6AuOZxKKhtNTBW0TKAj/dl6XQustPefEfRXz0N4YnfNmk8AH9Pg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788798695;
	h=Received-SPF:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=RNRlTS4igMuxIgZGkQ9n1WFx3YFhsS6SdPB9tEv8YYs=;
	b=ayQ50j9pndN+RgLPH3hUXh4zxnxUvo4NzJ2MFOOCds2n8mvwobOllZ8Qw9Jm1NKfZqmh
	 OIVOMVGdOkt3qDiCzg7SGPCj1qnRyJSeYEEjfEP701CoIX2q/jNnQri2BfMJS0koSxi4n
	 lcuCgO8joams6tM3oONOcgkaCR8dcIuYtcKKQXTdQkuRErDMn2gRLRnOxRXgKzIJpfMsI
	 tOhZpcMQFaHIVXZMFb5AoeZMBJoco48D6Gu2Iyy/PbZX+lQpz1IcHR7vEEohQrimYoMr1
	 Otyce5caSaBktzSnr/mZ9vyI0/3LjRDqAGvN+5cSgvLZYxtb5lsJRpoC3db7Qh7i63w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; dmarc=pass header.from=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wP7OyOaQ;
	arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wP7OyOaQ
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 384974007E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Sep 2026 16:31:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B1DE601DB;
	Mon,  7 Sep 2026 16:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A1F1F00A3A;
	Mon,  7 Sep 2026 16:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788798690;
	bh=RNRlTS4igMuxIgZGkQ9n1WFx3YFhsS6SdPB9tEv8YYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wP7OyOaQG5pQ6boUpvpWGkkdo+VF8FjIgcTthZScsyxdF1xyZ2e7POD7KroalDbth
	 NZfEEKQ9g5sbF4XcCN6BWlZHXVKpYSeh4PHUSz1EHu6a7+emv9wSVKb/hohJSa+u1e
	 1Mgb/pWitV9l8xpKdTkSBj5UheSMXoj4X2yhGKdc=
Date: Mon, 7 Sep 2026 18:29:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] staging: octeon: fix use-after-free in tasklet
 teardown
Message-ID: <2026090710-disposal-tameness-3d85@gregkh>
References: <20260905153530.36693-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905153530.36693-1-ayushmukkanwar@gmail.com>

On Sat, Sep 05, 2026 at 09:05:29PM +0530, Ayush Mukkanwar wrote:
> cvm_oct_tx_shutdown() kills the tx cleanup tasklet while
> the net devices are still registered. This could lead
> to use-after-free when a tasklet is scheduled after the
> tasklet_kill() is called which might run after the net
> devices are freed.
> Fix it by unregistering the net devices before the tasklet
> is killed.
> 
> Fixes: 4898c560103f ("Staging: Octeon:  Free transmit SKBs in a timely manner")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/message/20260615172734.42038-1-ayushmukkanwar%40gmail.com
> Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
> ---
> Note: This patch has only been compile tested. No runtime testing was
> performed as I do not have access to Octeon hardware.

Please wait until you have the hardware, as the sashiko review comments
say there are still issues with this patch series :(

thanks,

greg k-h
