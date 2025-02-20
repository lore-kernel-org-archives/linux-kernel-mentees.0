Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659FC1D5AC2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 05:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740030276; cv=none; b=IwgFh4BbxS2xrDww4az9USDpRb0lQ3ySPc/qzW8MXlQQ4DT6WKXDwQtxlRyXNRFJKKFyarJ2s4GtsK5PYOobZ7d5TbmZSeblsOXoekF34HhY1n1Zhr9BmXBSiUtnsq5jaDleRml1oqUTUyji4eyAkF3+yn77mWNF1ikYgSoTwsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740030276; c=relaxed/simple;
	bh=XQ508VSSFA97njrwo7AFNEChjQJ70/G58Y0criKE2Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfqBTucoRYpzgg0FW3O64+27QNlkT6qU/BivppnXfP2c4v1oQ/TLLHsimH15fEPfPlWImSuYvRiNy4TN5O+wH9isXdaHSroEGTMNgZY9ODa5VTZTa5YtCJGu+nGamNfNDzDh4MXRYQIQQ4vjLHlNMhfw26wLHQrKHBs2k1G8P90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gcQcFc6k; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gcQcFc6k"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E388940B80
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 05:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SR501H1pCDcg for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Feb 2025 05:44:34 +0000 (UTC)
X-Greylist: delayed 549 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 20 Feb 2025 05:44:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D5E8440B78
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5E8440B78
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gcQcFc6k
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D5E8440B78
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 05:44:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E6116119C;
	Thu, 20 Feb 2025 05:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9285C4CED1;
	Thu, 20 Feb 2025 05:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740029722;
	bh=XQ508VSSFA97njrwo7AFNEChjQJ70/G58Y0criKE2Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcQcFc6k7bwz5ZFusHhNK9TWljz9mmJJqPobwzpDeLGDURG4YxXgfG4ujqmex0bRy
	 WHxrkmAdzen0xyZtgd5ONLjZYq+brEQDsY8ygCZOhcZq1gCtXWVfToaeEHOjHmoFUw
	 uB4W9uU0dXDutW16dAO53aFk5cUuLtkY5S2Os5TI=
Date: Thu, 20 Feb 2025 06:35:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sumya Hoque <sumyahoque2012@gmail.com>
Cc: skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
	shuah@kernel.org, linux-fsdevel@vger.kernel.org, kees@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] selftests:sysctl:Fix minor typos in sysctl test
Message-ID: <2025022055-cubicle-kebab-b9b6@gregkh>
References: <202502190912.CA03B56796@keescook>
 <20250219193301.46563-1-sumyahoque2012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219193301.46563-1-sumyahoque2012@gmail.com>

On Wed, Feb 19, 2025 at 07:33:01PM +0000, Sumya Hoque wrote:
> 
> Signed-off-by: Sumya Hoque <sumyahoque2012@gmail.com>
> ---
>  tools/testing/selftests/sysctl/sysctl.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/sysctl/sysctl.sh b/tools/testing/selftests/sysctl/sysctl.sh
> index 84472b436c07..323468653327 100755
> --- a/tools/testing/selftests/sysctl/sysctl.sh
> +++ b/tools/testing/selftests/sysctl/sysctl.sh
> @@ -891,11 +891,11 @@ usage()
>  	echo "    -l      List all test ID list"
>  	echo " -h|--help  Help"
>  	echo
> -	echo "If an error every occurs execution will immediately terminate."
> +	echo "If an error ever occurs execution will immediately terminate."
>  	echo "If you are adding a new test try using -w <test-ID> first to"
>  	echo "make sure the test passes a series of tests."
>  	echo
> -	echo Example uses:
> +	echo Example usage:
>  	echo
>  	echo "$TEST_NAME.sh            -- executes all tests"
>  	echo "$TEST_NAME.sh -t 0002    -- Executes test ID 0002 number of times is recomended"
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

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
