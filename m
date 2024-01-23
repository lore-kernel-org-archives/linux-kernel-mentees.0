Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3421C60277
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Jan 2024 17:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706030997; cv=none; b=A3q7Wj8S6V6oXtFlHJ3+vqGzukBDcP2d1wUjLyd9GkxsoB9r8m0jEmzfVuWukDUyv5FRLwFJ70BRjQYuz4/rlgLhWvUCNxw3iwrGk9b1jLzbIXocgb8IlVQos3JyXFVO2L1A5/Tw36roIhDZW0Cm96la2+YS96gkYKAN9LJ4KaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706030997; c=relaxed/simple;
	bh=NOqgJkshFADiNCul245EpWBMTrjLK39GCQXs7bNGxlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2y+AH7PDSHvcCxD8rgHhgfghjqVm4pMVGFBxGC8c9Nerr+RdWBCvg7fL5OscPj/Q8d/dIG/dVCr5jmdIgHvC7uO71huxuTIQfCC7ouiVzVoFaPNNNvy1SMOcSEc3i+6IKfrJD1NbwrwIe2Ovu1O5d5iC8dGda2/XR1RPdDUEC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0r+YPcGv; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0r+YPcGv"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B830C82C5E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Jan 2024 17:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B830C82C5E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0r+YPcGv
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3cE11yIpKTu
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 23 Jan 2024 17:29:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2C9A982C3C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Jan 2024 17:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C9A982C3C
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7247561E65;
	Tue, 23 Jan 2024 17:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40D1C433F1;
	Tue, 23 Jan 2024 17:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706030994;
	bh=NOqgJkshFADiNCul245EpWBMTrjLK39GCQXs7bNGxlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0r+YPcGvXvY1EM2GPC8R+bhG1bdZSHfM2RLMDar49s1HZ+Tj5AQERhDlix+cVxNVr
	 mqVe6UlBH494mwX1nJ/P/ztzNvMH+wS6tA+7WOhTBQaJ4Mi8lUgaAZCfhJydILpz5S
	 C0d+gUFMNRR5K8CGMbx9QV5S6kovZQSXFqOL4fYE=
Date: Tue, 23 Jan 2024 09:29:51 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Vivek Yadav <vivekyadav1207731111@gmail.com>
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Add Extra kernel Version
Message-ID: <2024012329-manor-entrench-3048@gregkh>
References: <20240123165838.2110-1-vivekyadav1207731111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123165838.2110-1-vivekyadav1207731111@gmail.com>

On Tue, Jan 23, 2024 at 10:28:38PM +0530, Vivek Yadav wrote:
> - In top Makefile add kernel version to identify
> 
> Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index f1b2fd977275..7ba07e50e6d1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2,7 +2,7 @@
>  VERSION = 6
>  PATCHLEVEL = 7
>  SUBLEVEL = 0
> -EXTRAVERSION =
> +EXTRAVERSION = -mentorship
>  NAME = Hurr durr I'ma ninja sloth
>  
>  # *DOCUMENTATION*
> -- 
> 2.34.1
> 
> 

Are you meaning to send this to a public mailing list?  Has the
application process changed to need this now?

thanks,

greg k-h
