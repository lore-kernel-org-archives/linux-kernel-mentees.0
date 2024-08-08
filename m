Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC17190070
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 16:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723134083; cv=none; b=HxLnq8v31+NJgxC6YKhNKCx/Qppjw3hIp+mBhg/idhUlundJoDsvQY9/3YOmRGnqv3+oZxe1MPzmSb2rbtdkPJO1XYkh9ahzTDAW1rVWRh5l6IBJtq4SWrfeK50diL8OZqR+NxWbaIfth/T+5xzh8kT8RBT7WjxMtj2xDKEU5U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723134083; c=relaxed/simple;
	bh=RFqP4xkL0CLJmnClOLZYuKsLKam93ZSXa2biSR0dbJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmssbVmPocL3fxzXYkIW8fXtHlbOYnz+CNcfw7oUvXoQJwXTyKDD1HSiU1nnHI4L5wfAekdluyMgveR2BDamAhF4SHx59NYy2cdSG7DQrzIoU8xveQrwgeXhvGh08BAkO+hOwq+je5Qm894+Z9L8GTVcESYlin+R7/MZRcgx6dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Isxx5MuZ; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Isxx5MuZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A368F40E40
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 16:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5IPffegF81S for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Aug 2024 16:21:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1FFC8403C4
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FFC8403C4
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Isxx5MuZ
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1FFC8403C4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 16:21:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6A4DACE12FB;
	Thu,  8 Aug 2024 16:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD40C32782;
	Thu,  8 Aug 2024 16:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723134076;
	bh=RFqP4xkL0CLJmnClOLZYuKsLKam93ZSXa2biSR0dbJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Isxx5MuZ0lMKrNCtvPV7qp6E4czx3ssxNK0mxsZ8yBGz4JxT4OsqahJMuR5i0Y1QN
	 3OwHCYFRaHtIHMgDmwXFBcVJ6+5ZzkD/zzJSDnWgxb/9K+wMr9KMXVPaFfIYsToZF2
	 mkAOUVJF6pUV9F5+RrbikoXiMeAVkqpLxAc5Dvjc=
Date: Thu, 8 Aug 2024 18:21:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav P <pranavsdreams@gmail.com>
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Added extra word to Extra Version
Message-ID: <2024080800-reply-fineness-f5b8@gregkh>
References: <20240808154824.13390-1-pranavsdreams@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808154824.13390-1-pranavsdreams@gmail.com>

On Thu, Aug 08, 2024 at 09:18:24PM +0530, Pranav P wrote:
> Signed-off-by: Pranav P <pranavsdreams@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 8ad55d6e7b60..9a4012a08c0f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2,7 +2,7 @@
>  VERSION = 6
>  PATCHLEVEL = 11
>  SUBLEVEL = 0
> -EXTRAVERSION = -rc1
> +EXTRAVERSION = -rc1-karuvally
>  NAME = Baby Opossum Posse
>  
>  # *DOCUMENTATION*
> -- 
> 2.34.1

I don't think you meant to send this to me...
