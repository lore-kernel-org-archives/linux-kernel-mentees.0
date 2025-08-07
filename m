Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E3C26A1AF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Aug 2025 15:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582239; cv=none; b=K0NuLeC7Hb4jjtzJl2vFVXLOOWH3Fz2Pu5VFZr308tS0LheaE1FbvpTjIZdQRMd/qm/XLSaxXF/pFx3jXrvosuFSlFfVpbGKbBj//n+lCyRWNN7UY/9FiS18hGlrw5Jsl/PLcRP7xBzttb8GfjUlWgGCzREP5zgPfYeu1eMGzAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582239; c=relaxed/simple;
	bh=wijCqtSFgvwfCnGWy8j3vxWrbKu6Gn+GUWOOTZgLR3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjVma3asWWe2PZFldHPdoEaLEWDhV+aeMcESIV7HrnJAXdzUOVrrZfcosUBUgz/kBjOhR7dKAilontvVvMupjB8wvR9nIhd4yoECkCQL9HZx25BTm2eNm/EBnBmfL06SowflPiQl9DXFG5lY+EE1080drOU6/qYZ8dQ2j2o+HF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=brf6SW+g; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="brf6SW+g"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C868384ED3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Aug 2025 15:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJLzX2JbmrFl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Aug 2025 15:57:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3924C84ED2
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3924C84ED2
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=brf6SW+g
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3924C84ED2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Aug 2025 15:57:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51E8142B20;
	Thu,  7 Aug 2025 15:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDB4C4CEF1;
	Thu,  7 Aug 2025 15:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754582236;
	bh=wijCqtSFgvwfCnGWy8j3vxWrbKu6Gn+GUWOOTZgLR3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=brf6SW+gcSqUbaBUS+Fgzi6oxKy9Hme41RnY9oTbxW2vbJCaJF9Vhn4MoQgVRC72j
	 jPxzCxP2cWMV8dn2PXEItHOlK3k07GSGmSNMjG0b6OnXrVcUx+MKBKi8kHmRzSXa2W
	 6nIaFvFwIbOIGmQgjcrLc6V07wCzQZSHLlVLQ8Kk=
Date: Thu, 7 Aug 2025 16:57:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Devaansh Kumar <devaanshk840@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org,
	dvhart@infradead.org, skhan@linuxfoundation.org, shuah@kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] futex: selftests: Add description for futex_wake_op()
Message-ID: <2025080753-utensil-magnifier-3301@gregkh>
References: <20250806183030.542453-1-devaanshk840@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806183030.542453-1-devaanshk840@gmail.com>

On Thu, Aug 07, 2025 at 12:00:26AM +0530, Devaansh Kumar wrote:
> Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
> ---
>  tools/testing/selftests/futex/include/futextest.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/futex/include/futextest.h b/tools/testing/selftests/futex/include/futextest.h
> index ddbcfc9b7..c77352b97 100644
> --- a/tools/testing/selftests/futex/include/futextest.h
> +++ b/tools/testing/selftests/futex/include/futextest.h
> @@ -134,7 +134,9 @@ futex_unlock_pi(futex_t *uaddr, int opflags)
>  }
>  
>  /**
> - * futex_wake_op() - FIXME: COME UP WITH A GOOD ONE LINE DESCRIPTION
> + * futex_wake_op() - atomically modify uaddr2
> + * @nr_wake:	wake up to this many tasks on uaddr
> + * @nr_wake2:	wake up to this many tasks on uaddr2
>   */
>  static inline int
>  futex_wake_op(futex_t *uaddr, futex_t *uaddr2, int nr_wake, int nr_wake2,
> -- 
> 2.49.0
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

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
