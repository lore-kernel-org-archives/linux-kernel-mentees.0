Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB99364A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 05:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722057191; cv=none; b=MAoNdfia30GcbDQbEHJ0zwnUTEsXLFp3pFyHZm/IjzSwPzH1wiNxJUnKmfcsOl+1isl+3x5yhxM3dDhbMI9vnhW/HCL+EZean8yMy6csd5r0Cwgotr/kDPUilqzwXO3ongssjk4ooVEN9lpCJ1xvtxIPhx60k1Omkhy/P5Xo7Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722057191; c=relaxed/simple;
	bh=wn2akuMBYSG9bOglzxWJckrDzpwvZlf4QbkqolCMY7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaW8dESW/oDBItY4eGuvAulLmbKsgOC4AUdMA1DRdkjEiDScyDzz/KS64dYBL0lM9ECLeh7noYWinnlybjIMJPArbjgmFSAQhtODh2qJqPa5j7Wu4XAaVTApDTFPHmiaG5N00/lWO7S0+jdDyPohaXFBIy2sbMLqwMXjmC2Xui8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NPebm1gf; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NPebm1gf"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CC9840DAB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 05:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OKjPRGZs5kt for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Jul 2024 05:13:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16C4240D93
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16C4240D93
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NPebm1gf
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 16C4240D93
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 05:13:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96ACB60A76;
	Sat, 27 Jul 2024 05:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30CAC4AF07;
	Sat, 27 Jul 2024 05:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722057187;
	bh=wn2akuMBYSG9bOglzxWJckrDzpwvZlf4QbkqolCMY7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NPebm1gfH10HWV3tav+g5jBkPpuwD+MDBcJ0Upu8Ij5AfDfMm5quiBcKKwryqjRpq
	 YGeO1Sndv4+ft91OohcK0pE9D7kqvMtrXmW+9NgDLgGdQp5reZ15rFSOiDZeWu1LZW
	 JrukpH1/ztZIxEGb5i1653IjF/A/a6vJzpyXZ7rI=
Date: Sat, 27 Jul 2024 07:13:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Siddharth Menon <simeddon@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: hfsplus: Initialize directory subfolders in hfsplus_mknod
Message-ID: <2024072732-collage-scam-e1b7@gregkh>
References: <20240727045127.54746-1-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727045127.54746-1-simeddon@gmail.com>

On Sat, Jul 27, 2024 at 10:21:29AM +0530, Siddharth Menon wrote:
>     hfsplus: Initialize directory subfolders in hfsplus_mknod
>     
>     Addresses uninitialized subfolders attribute being used in `hfsplus_subfolders_inc` and `hfsplus_subfolders_dec`.
>     
>     Fixes: https://syzkaller.appspot.com/bug?extid=fdedff847a0e5e84c39f
>     Reported-by: syzbot+fdedff847a0e5e84c39f@syzkaller.appspotmail.com
>     Closes: https://syzkaller.appspot.com/x/report.txt?x=16efda06680000
> 

Odd indentation :(

Also, why the extra blank line before:

> Signed-off-by: Siddharth Menon <simeddon@gmail.com>

This one?

thanks,

greg k-h
