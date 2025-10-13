Received: from mailscanner09.zoner.fi (mailscanner09.zoner.fi [5.44.246.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8752F0696
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Oct 2025 20:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.44.246.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388810; cv=none; b=j5ZMvG0zEhTO2KT7Pe2reE6xyTVFrFdllQ/Tdm+xqiZXjOKWrtM+bt36ZmWxb25LEBFGBqE3Jhg3bKo27PmdFbyG0kYKpnbSIkilSoYoRsVTTzcNXY8mqAJxla1rm/I2QJXkQ2WJ2dWqyrYHDc8QymUAQmHTnvpxTA58kjD9wM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388810; c=relaxed/simple;
	bh=wmrcLpdHbAolQNtyHpMNdAFBYE+XjtDnmy0JpcEEGb0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c7eyorMJmNjmNNqGvzQvqHWqiZUuuR+HA62VuSawgUtDOUmx2Snp/sRw3cvu0F51tl/Etnfjrb4mBtA7MXffC4Ax28277ygpR726XOk+K/zIvo4C8k0noJDlWLy07MzMyGkntjDInuDqQBgQWnFDINbRq3yMbC2CaqLvRL4SxUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tukaani.org; spf=pass smtp.mailfrom=tukaani.org; dkim=pass (2048-bit key) header.d=tukaani.org header.i=@tukaani.org header.b=OZUYWJ2D; arc=none smtp.client-ip=5.44.246.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tukaani.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tukaani.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tukaani.org header.i=@tukaani.org header.b="OZUYWJ2D"
Received: from www25.zoner.fi (www25.zoner.fi [84.34.147.45])
	by mailscanner09.zoner.fi (Postfix) with ESMTPS id 03EDC21240;
	Mon, 13 Oct 2025 23:44:08 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tukaani.org
	; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description; bh=uZpQDcJ5hYuqJt+/UmDpHd8wg36xNPNAPWkG9K9j3Vg=; b=OZUYW
	J2D/TnPVNS9YZPJlWDkzhlQdy526+QSpmzfBSopNkmyJ8kgXXQbWKgDbeZJ5NqMVv6Vc8KIu3ZrVo
	5hYguIR1LglAHPWdbogb66/lMDOQPYPNYl3N3z3IPCoVt1unLn4UNSKB3GA4jU+k+FXX4XynFxbXw
	dCYdSTv8sb0rCPSNkxuBfM+k8ADcZ35k7sXLTmyTmZU73azeFTUeOJf/wT5x0+rLdo4kGVr03qepA
	hfI85o/lkedFxZB3GGIv58oQr5QiG1edVeeuq9NQw3K6mX2OI/p+Ki/DpjGy/JMBW6ycBry6gSlme
	+co7SXK+vWt20FegqjBP1uR0xNN2w==;
Received: from mail.zoner.fi ([84.34.147.244])
	by www25.zoner.fi with esmtp (Exim 4.98.2)
	(envelope-from <lasse.collin@tukaani.org>)
	id 1v8POs-0000000F3mM-0NXz;
	Mon, 13 Oct 2025 23:44:07 +0300
Date: Mon, 13 Oct 2025 23:44:07 +0300
From: Lasse Collin <lasse.collin@tukaani.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>, Ankan Biswas
 <spyjetfayed@gmail.com>
Cc: skhan@linuxfoundation.org, khalid@kernel.org,
 david.hunter.linux@gmail.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] lib/xz: remove dead IA-64 (Itanium) support code
Message-ID: <20251013234407.11e70f22.lasse.collin@tukaani.org>
In-Reply-To: <aO1gOckA14Ed/26F@visitorckw-System-Product-Name>
References: <20251013173446.8692-1-spyjetfayed@gmail.com>
	<aO1gOckA14Ed/26F@visitorckw-System-Product-Name>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-10-14 Kuan-Wei Chiu wrote:
> On Mon, Oct 13, 2025 at 11:01:58PM +0530, Ankan Biswas wrote:
> > Note that the upstream version of xz_dec_bcj.c still retains support
> > for the IA-64 BCJ filter.  
> 
> Not sure if it's necessary to mention this, but I guess it's fine.

Information about upstream version isn't needed in Linux commit log, so
that sentence could be omitted.

> I'm not quite sure what you changed in v2 compared to v1.

It added the second hunk to the diff of xz_private.h.

> Lasse,
> Since this change is located under lib/, I assume it will be routed
> through Andrew's tree?
> If that's the case, then perhaps we should also Cc Andrew.

Yes, putting him into the To field and others as Cc should make the
patch go forward. Sorry that I didn't notice and comment this myself
earlier.

-- 
Lasse Collin
