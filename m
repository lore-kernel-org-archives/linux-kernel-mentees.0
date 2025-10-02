Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2118208CA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 03:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759374095; cv=none; b=HfnXAzrSP97VNikk410CaDrm4ld+ovwClbPI3v+AHMqZHB7HfB47iTjtBauJaf0WRlj12PIGxoHhZBJvRDEkc8F4yL+b5/TKDDGSXrsHF/6iR5w7ujofX76Xe130nVJIonuIcUeUkNxBiKHT85aOWt0uY14cTx5oc2mIgDWoqro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759374095; c=relaxed/simple;
	bh=KtziNFN2HjCmKyFttsjFKPM+bPdEFJbnW6oLxKpZjAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfyzeVFrq5d5LerLSBvcy2y8qbbxEbIsIUEN7bhwR5CX5/EH/U/Yk9MqYm9seSVWwr+BPN1Npt0cZZMg906RUTCe0wK7KDFFO6qjMKcImtgJ8KrmniBzigLMmRAwjq1fIxV9Ot7b1vBve7VT6ZECjeYPbTVlXt/IjoBYpeJC1VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=TBaOH67e; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="TBaOH67e"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60CA14124B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 03:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.998
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WygxrYr16nek for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Oct 2025 03:01:32 +0000 (UTC)
X-Greylist: delayed 1469 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 02 Oct 2025 03:01:31 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76A94410F0
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76A94410F0
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=TBaOH67e
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=<UNKNOWN> 
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 76A94410F0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 03:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1PtrvZw9Xx0nfWQJFaBeBCNE0Kgw4sZ0jqy1AeaLn9g=; b=TBaOH67eOfKfJRh5NoIukfzqA8
	cudUZlZHBZ/+iywfg6GN+cpMDPZHqw6MPXF42/6clUfRCmd1S/24oQSFYKL4zSTgp7BnYuEPkow4V
	q38T7PJm/YsccTuNPY2ub8UuW+MHPC0vXxc1A8LUqyM8eIXBJyFsz7Puw8Gx7cX3XZCQ5MUwdqr5h
	kyowmUd7whkryT3Wq06SGILfIgcwvd00taUOI+8wcMUkO3UZkp4m7BL9K6YOaeyYREPbwZYdLyeMV
	X5ewq/RBEPB3f6nCv83qDvds95uOzjtaNH/HhFpnNs8PXKp22Tmzu5090De2fJhDKLcWiclje02Te
	89nx6Bpw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v49Bh-00000009GBr-13zP;
	Thu, 02 Oct 2025 02:36:57 +0000
Date: Thu, 2 Oct 2025 03:36:57 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] init: Use kcalloc() instead of kzalloc()
Message-ID: <20251002023657.GF39973@ZenIV>
References: <20250930083542.18915-1-mehdi.benhadjkhelifa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930083542.18915-1-mehdi.benhadjkhelifa@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Sep 30, 2025 at 09:35:37AM +0100, Mehdi Ben Hadj Khelifa wrote:
> Replace kzalloc() with kcalloc() in init/initramfs_test.c since the
> calculation inside kzalloc is dynamic and could overflow.

Really?  Could you explain how
	a) ARRAY_SIZE(local variable) * (CPIO_HDRLEN + PATH_MAX + 3)
could possibly be dynamic and
	b) just how large would that array have to be for it to "overflow"?

Incidentally, here the use of kcalloc would be unidiomatic - it's _not_
allocating an array of that many fixed-sized elements.  CPIO_HDRLEN +
PATH_MAX + 3 is not an element size - it's an upper bound on the amount
of space we might need for a single element.  Chunks of data generated
from array elements are placed into that buffer without any gaps -
it's really an array of bytes, large enough to fit all of them.
