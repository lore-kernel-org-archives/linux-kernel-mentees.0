Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60771FCF57
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739865215; cv=none; b=M4JVeI4b15Nzx7Jd2rM9nT51AlFDqLYxFGDywfVcJIAz/0qf9cC48xJh3JkRXbYFiVBWJ7DipkHpGeMD0BRjZrTTEd+5gzEhTAA2EZ3l/C+Ekw/dPCAJMYg4N0nGsNL/+VPmPXrPKk1hBoCN/zh10lez/qlwck7TzmuG8XafsR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739865215; c=relaxed/simple;
	bh=YWS+T8ECFcznKEcPjb6zYtSnqdNqHP5NPNsFHLrDhIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WaHvi3YFOQMCp5Tlz7GsLEr3IUvnktYiMaZvaFMP827PZHVLfoZxMTdykqp1wH3tKzKA/FcTKsSLAZ3mbyxlUjk7KTd1/IGk/A/QqyuSfhfVNRoFgvq6iz9y1LhYr6R3Vyr/4lFNhR7fCMPF96sVPmgTpbsZ6P+/aB3FnVf6HZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=DClj3Qzv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ESK5rYJY; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="DClj3Qzv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ESK5rYJY"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id A990E1380181;
	Tue, 18 Feb 2025 02:53:31 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 18 Feb 2025 02:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1739865211; x=1739951611; bh=syfLQdsWda
	/2sJIl/eiwwpyFBvNey7scP0IwaqQVXUo=; b=DClj3QzvwCZV+kFkAMiHnpxUlK
	Jqtxe02/UzBgmX7Mvjcn3p8iyMdlstNFgrCGMD2Jxlw1HOQMxt6J6HDDPyinPJ69
	PyLlTyTIUjkBsTKMqCnTCxcgwwfDo+h11GvVDNN6ozMubgcuUvvMc/FXDulkJRug
	CCHxy/TxxVKCVho3pSx8MkqHAkwqnjke8NfuM6I/5bIP7PSFF5MLpp5CSMo9q9mq
	XnmY9ND/o3pFxTv0fcNsRdoL4Z2X9IcbRAKkyH3M1Z2kmlbvoJv6/DDvtl0zmp9G
	XIFs6GwUWZbamYdZxod3ZeZ6eit30XBCQslqnzCCmgQllkWfKWJcbFucjl3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739865211; x=1739951611; bh=syfLQdsWda/2sJIl/eiwwpyFBvNey7scP0I
	waqQVXUo=; b=ESK5rYJYVvppN31KAukf5beDyYQwwen9JgUDui/PgyAp8NkU3P4
	9T1puoV7NMf50fzAttREjSI9QchIW8Lug9hsqcL4idkES5ZwoK3GOteGoox/LZ0w
	rICDn2m0zODEfVefyCkVnrNBsjbxetUeOOE/QDGDLQjL/UJTjOFr/jFtP5gqhEA4
	RFrrohDnqUNaNgVf1/hXvtPjK/tmnbfdvHhua0j0k4XEJb0B11h+hduMRgWypqEG
	EBNE60Q7xkMTSreFyX5Zx2vtGGRTG5Wy3+cXMWqUB6ZT5OWeXFsiBHHXM+9wKlYN
	p9V4fvmuspi7dp8Yl/XEGHH2wFS7RQAuSjg==
X-ME-Sender: <xms:ezy0Z3Dm3jQf12S16X0bVrFtYNHAPERmeNZH5yTuJtZmyH0W08tyCg>
    <xme:ezy0Z9jZJp1AhzyQl2-bB08ANkDKUA6iDoCFUim8TmO22cN4P3Mzh_jNjILkNShE3
    Bn7nRSR--PExQ>
X-ME-Received: <xmr:ezy0Zykpw-vqa3Mbw5vBzGZ4DSGu8lz-JhSNPI5LkXdwPAu1WDCZU-Az2NuEABm-WSG3sdWRhrILLDHbc8etGmYL6bQaesa22Crp-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeitdejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhumhihrghhohhquhgvvddtuddvsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepshhkhhgrnheslhhinhhugihfohhunhgurghtihhonhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtsh
    drlhhinhhugidruggvvh
X-ME-Proxy: <xmx:ezy0Z5zIwn29FfkaSnf5Yn8z3MlBPoTNte8sMGcJhE0x1u7qiYf3HQ>
    <xmx:ezy0Z8RWPwDwTwLB_DQtqNP9vys2-tWxYZ9Y0jZdHkx1H1Pz2hSHZQ>
    <xmx:ezy0Z8algngopgFqCgJSNo2CvLadSEj5qYafjBDMpWd_iMtO91-ZLA>
    <xmx:ezy0Z9QKtqmrSjcFGPK3pf4CsJnWUQexPuOoKftw7DfnW6wpjcTx5Q>
    <xmx:ezy0Z7HHkkD1zudVoiblecebmxXp9920l6iS0yR6NanS2Xw-tgS0iuGr>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Feb 2025 02:53:30 -0500 (EST)
Date: Tue, 18 Feb 2025 08:53:25 +0100
From: Greg KH <greg@kroah.com>
To: Sumya Hoque <sumyahoque2012@gmail.com>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] Fixed Spelling error
Message-ID: <2025021851-unpinned-neurosis-1ffa@gregkh>
References: <20250218032834.151392-1-sumyahoque2012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218032834.151392-1-sumyahoque2012@gmail.com>

On Tue, Feb 18, 2025 at 03:28:34AM +0000, Sumya Hoque wrote:
> diff --git a/Documentation/video4linux/hauppauge-wintv-cx88-ir.txt b/Documentation/video4linux/hauppauge-wintv-cx88-ir.txt
> index 93fec32a1188..faccee68f603 100644
> --- a/Documentation/video4linux/hauppauge-wintv-cx88-ir.txt
> +++ b/Documentation/video4linux/hauppauge-wintv-cx88-ir.txt
> @@ -30,7 +30,7 @@ provide for a handler)
>  GP_SAMPLE register is at 0x35C058
>  
>  Bits are then right shifted into the GP_SAMPLE register at the specified
> -rate; you get an interrupt when a full DWORD is recieved.
> +rate; you get an interrupt when a full DWORD is received.
>  You need to recover the actual RC5 bits out of the (oversampled) IR sensor
>  bits. (Hint: look for the 0/1and 1/0 crossings of the RC5 bi-phase data)  An
>  actual raw RC5 code will span 2-3 DWORDS, depending on the actual alignment.
> -- 
> 2.34.1
> 
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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
