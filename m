Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558C91A8BF6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 08:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722414864; cv=none; b=O2Mr1VBMmqhOhzJazECQawnU6/YlNJx7toPYyeGVmsbKq8ajhzCIdBN1EPehAJTZMOK/d82/2/qb7IlWtIfTkHu6QDUzkx7MF2WOdpIFQzx7/pV8U8TX0Of1TWNAZ+4HScyuLXIpYcuucV55ncuT+HCCG0qo+ZWFDkAQM4xcS3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722414864; c=relaxed/simple;
	bh=8+E4Mx6nsvQdhnv7jB7tqDc4lCt4yb/9UOa+s297XNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEDTQXLuUoz68MOtFBAVsAjjszRq65M/lFZPxkYoVtnecuwuW2X77cM2JXeGZ0Qu99PB6S8lTGUoP1onrnJCN6K1l2DqV9Agnre/1rKmBYmVaoxPR92Olh/lgk+kngfYnJ3Do+8MT4k1ms95so1y0DGw+VXIg6dHRNGxKRrQBfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cBiaV14n; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cBiaV14n"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC2E040224
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 08:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5TmlbLDm7UW for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Jul 2024 08:34:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A48C040150
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A48C040150
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=cBiaV14n
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A48C040150
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 08:34:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 99079CE12D0;
	Wed, 31 Jul 2024 08:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74327C4AF09;
	Wed, 31 Jul 2024 08:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722414857;
	bh=8+E4Mx6nsvQdhnv7jB7tqDc4lCt4yb/9UOa+s297XNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cBiaV14nHYc6s6VsYITJu5KaTaND7A+yUt2pxHnlCgrctD+bEyovKK9gh54uvDbM1
	 4FMo5eAGQaRxD7vm1F7ydwm47jxYymyheech1ZO1L3JW00kI0cGBWMA0xTkjQ9Eq2h
	 BF/QLpsFT1TB/AT86cO551Ppvn2JpU5fd/+E3bEs=
Date: Wed, 31 Jul 2024 10:34:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: skhan@linuxfoundation.org, dan.carpenter@linaro.org,
	rbmarliere@gmail.com, christophe.jaillet@wanadoo.fr,
	Chris.Wulff@biamp.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: u_audio: Use C99 syntax for array
 initializers
Message-ID: <2024073102-calculate-disabled-8700@gregkh>
References: <20240729174639.446105-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729174639.446105-1-abhishektamboli9@gmail.com>

On Mon, Jul 29, 2024 at 11:16:39PM +0530, Abhishek Tamboli wrote:
> Convert array initializers to C99 syntax by adding the '=' after each
> designated initializer. This change resolves warnings from smatch
> about obsolete array initializers.
> 
> drivers/usb/gadget/function/u_audio.c:1117:20:warning: obsolete array initializer, use C99 syntax
> drivers/usb/gadget/function/u_audio.c:1124:28:warning: obsolete array initializer, use C99 syntax
> drivers/usb/gadget/function/u_audio.c:1131:19:warning: obsolete array initializer, use C99 syntax
> drivers/usb/gadget/function/u_audio.c:1138:27:warning: obsolete array initializer, use C99 syntax
> drivers/usb/gadget/function/u_audio.c:1145:25:warning: obsolete array initializer, use C99 syntax
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>  drivers/usb/gadget/function/u_audio.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
