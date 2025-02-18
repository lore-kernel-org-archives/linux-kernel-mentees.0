Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F451ADC81
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 07:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739864422; cv=none; b=V+Lh4Xm98V1zW7kZNe9iBt2GUGATZvNHlzL/ZoU7xUHdhY7skE2S6BqvUVvv7EaoX7VeU7vgh74qXC3RSbqrpwVLnlttzm0JM60uPTu4lvUBo3iwWU7sFYcc6ceFYQOw8dEknoi/oVeDfiYrpUDJ+CX4Pw0ZrqDBSmMG2SB9A/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739864422; c=relaxed/simple;
	bh=Pq7LLjZoBUZBjY5oGtFfoW4PTkQkOdSRiZ9tfEt0h1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QO4Wac0l2c0jGuyT6zOMcAUtT85he2FMgjkFjAkOFZBIXHM4GijdaGO6iGEx6cq5+lLyTSlfCvPxCseGB9b+GHZE+icTp8GVSV2MtOsqGOJeuaZB1wAs2ytb6gwEqrSNlywWsShOD5RIA7zDa9RMuD87er/jDz4Qosu0xAzha1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=u8hPOgp5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u8hPOgp5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7398C4CEE2;
	Tue, 18 Feb 2025 07:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739864422;
	bh=Pq7LLjZoBUZBjY5oGtFfoW4PTkQkOdSRiZ9tfEt0h1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8hPOgp5cELyyf6/pmxxduOHicyfiqv34pEKjaSnjinABnr3vpeYT6Om0OW/nFEWZ
	 Sg44UqtZ0BOu/TlFc32Shc7zKJE84dqrxn8sm0tKrtH9j0UASdddd4dL576FHiJR2m
	 nrG2YeZeae2f+JgVGqZYXH3Hkc063Ig7+zsl1LSA=
Date: Tue, 18 Feb 2025 08:40:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Marvin Murithi <murithimarvin09@gmail.com>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	Marvin Murithi <50557936+rimubytes@users.noreply.github.com>
Subject: Re: [PATCH] selftests: Fix spelling mistake in documentation
Message-ID: <2025021827-partner-trekker-0025@gregkh>
References: <20250218072849.23752-1-murithimarvin09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218072849.23752-1-murithimarvin09@gmail.com>

On Tue, Feb 18, 2025 at 07:28:49AM +0000, Marvin Murithi wrote:
> From: Marvin Murithi <50557936+rimubytes@users.noreply.github.com>
> 
> ---
>  tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh b/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
> index c63d840ead61..f63b7f12b36a 100755
> --- a/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
> +++ b/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
> @@ -171,7 +171,7 @@ table inet filter {
>  }
>  EOF
>  
> -# make sure NAT core rewrites adress of icmp error if nat is used according to
> +# make sure NAT core rewrites address of icmp error if nat is used according to
>  # conntrack nat information (icmp error will be directed at nsrouter1 address,
>  # but it needs to be routed to nsclient1 address).
>  ip netns exec "$nsrouter1" nft -f - <<EOF
> -- 
> 2.47.1
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

- You sent multiple patches, yet no indication of which ones should be
  applied in which order.

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
