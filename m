Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA35168486
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 05:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722316102; cv=none; b=a7/llLdYuuFRuUbWjud8o6w3SMJa0lOeVqNLK2tteofKfPODH21CSr6C7kAIXMcXyeOmMSSP/ZKif7nIzrRZ3ZkGHRd/dtjmcT9Op1FatNETcZdtwtsJcx2mQZwwMRsk3PkEsDc3D8s+s7MKh4jki2pNpYGkpi1SJtl1g2TIcYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722316102; c=relaxed/simple;
	bh=fzBWPut0GGiuHt31Gpf5zYyofFcIgVb4VK6ByHw8QYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VaHAVjgRYFRPmiACBXnD3cDAihCCn6OoIAvRzC0YpzYX39cvbi+wnxtQVGGLkBHnfFnHPdK+fKR51Oc5iJytOtUd0UmhFy4M0Y10gyz3XuUQZkeqRfN6qNfGLt/Pcxp3ZA4XVeNVVqdbY+NtEw2iVUCXIbmFuFr5Z79FsU2ie7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a/JgRF1E; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a/JgRF1E"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 154CA608EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 05:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxuclHpZOMr1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Jul 2024 05:08:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2064B608CE
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2064B608CE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=a/JgRF1E
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2064B608CE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 05:08:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C36D61DC6;
	Tue, 30 Jul 2024 05:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3608C32782;
	Tue, 30 Jul 2024 05:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722316098;
	bh=fzBWPut0GGiuHt31Gpf5zYyofFcIgVb4VK6ByHw8QYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/JgRF1Ep4CA2d6xBGNjTtjXsAoQgYM/GNUQXGkn0aSNkcEWoU3gJgUJZTvTAsEP2
	 79TuNWCEGVWAd2sP0fQI8xXHe/Bp18iKEqi+iNumd1mC3L4hT8HIFoRE9FVJZySoUE
	 prwjXSDaxW104qEUXMhQIeijdRc2jo6udPstSMkw=
Date: Tue, 30 Jul 2024 07:08:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: W_Armin@gmx.de, corbet@lwn.net, platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] [PATCH v2] wmi: Fix spelling mistakes
Message-ID: <2024073058-visitor-widely-3109@gregkh>
References: <20240729223649.135639-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729223649.135639-1-luis.hernandez093@gmail.com>

On Mon, Jul 29, 2024 at 06:36:44PM -0400, Luis Felipe Hernandez wrote:
> There were a few instances of typos that could lead to confusion
> when reading. The following words have been corrected:
> Binay -> Binary
> singe -> single
> chaged -> changed
> 
> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> ---
>  Documentation/wmi/devices/msi-wmi-platform.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
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
