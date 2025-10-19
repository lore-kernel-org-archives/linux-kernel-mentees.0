Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC18D2EAD18
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 14:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760884508; cv=none; b=rODZ2MmAiMwtJ/BSkwEzs16o7PwF2hRWUj8IAQ/PlVl5sw3naSkmB2bjwYUTBZW+1zQn5RAyEpr3aa9SWcqzqBWSb7D8adP8Qh/wKdMJbfDHnEhjqJcKMlbj1i5bLbXc6wog3bl+6dlJeTU8lGVrWVwR9U7pvuvvhAEC/rAadIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760884508; c=relaxed/simple;
	bh=y7cvxQqQD1a5PHENO82BrDOOIH5qq6OOuxFThXQ36dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdBBF6H+cWuT+C1j3ZoQAZaCFipIt0ikCyAfcCHAVgDZKrg1WxIOJzWwNDm8SvYdTT+j7CL2e+e/1lvayBNPpiwN2SLdEOT+A/w9mD8xjHtoacKR2z+Df1qQJ3LNkkTKIjw652q/sNi3MTfQIOyo57y5l3CMFPYYSdbHjFkmvsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X0zEXi7N; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X0zEXi7N"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74D036111C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 14:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRKpMuhjQxt4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Oct 2025 14:35:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5516561113
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5516561113
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=X0zEXi7N
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5516561113
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 14:35:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14F0060217;
	Sun, 19 Oct 2025 14:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DD1C4CEE7;
	Sun, 19 Oct 2025 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760884502;
	bh=y7cvxQqQD1a5PHENO82BrDOOIH5qq6OOuxFThXQ36dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X0zEXi7N3qg02EN+vP29+2Xg0tUW8RV04086pk5OctIKpkZsAyHOhF65hE39ixzHd
	 uvvrMnkIse3YPY3kk9GECQYSES85PYMYwoyiidT65itCGuc44chhgAmb3gfrE635ld
	 J/E3x1hwHAh5ajLFb6x8hV7s09PjKrGAmkgmgSLk=
Date: Sun, 19 Oct 2025 16:34:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
Message-ID: <2025101910-dipper-suburb-1755@gregkh>
References: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>

On Sun, Oct 19, 2025 at 04:12:28PM +0100, Mehdi Ben Hadj Khelifa wrote:
> Replace kmalloc() with kmalloc_array() to correctly
> handle array allocations and benefit from built-in overflow checking[1].
> 
> [1]:https://docs.kernel.org/process/deprecated.html
> 
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
>  drivers/gpu/drm/tiny/repaper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 4824f863fdba..290132c24ff9 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb, const struct iosys_map *
>  	DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>  		  epd->factored_stage_time);
>  
> -	buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
> +	buf = kmalloc_array(fb->height / 8, fb->width, GFP_KERNEL);

This isn't an array, so this function change doesn't seem to make much
sense, right?  The size should have already been checked earlier in the
call change to be correct.

thanks,

greg k-h
