Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3AE8834
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758635938; cv=none; b=d52SYUevjBHWsgM9ztqAuzFlnl3gdRO22ujpMSWnFec09Mij0WYNfnWlrFwNC46UkJbjzoZExQtw43oMhgCJq+EseOZ4OS+kIyU4qnSBHYilZwaRKPMGOSjCJV9xiEGwFmYc/zyB8Jn85SR8KklqPurfI5fvyFdWzf60jnUry6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758635938; c=relaxed/simple;
	bh=KNsHfCNP5BcDpTQ3p9SIHGa9nh0HGDtnumDcWKGG+V0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Nrkie062wU7mGqLD6MVpkUZBTCa0SUXqCIS8WtrXjNCFAzD/zDhI9dP6Cdwpm29mW3SB68G4k9w1YU/MlV0RDWQbzl+Zg+rG8YUxoHtFOcT7wJP2hUvjeNVXEn2wc4xEtqyrMI5L05TpD6msPRPk0//pah+AZ419x0aqt6eSop4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYhLxMcs; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYhLxMcs"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 947D44089D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.992
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9j_zm1WKPcQd for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Sep 2025 13:58:55 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org; Tue, 23 Sep 2025 13:58:55 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76E794088E
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=linux.intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76E794088E
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XYhLxMcs
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=jani.nikula@intel.com; receiver=<UNKNOWN> 
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 76E794088E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758635935; x=1790171935;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=KNsHfCNP5BcDpTQ3p9SIHGa9nh0HGDtnumDcWKGG+V0=;
  b=XYhLxMcsQZhaNgYmrmzthN6Bdh6rSmQ2OUZ9CYV9pbpUqJ1r4jxQ7j1Q
   i7CNVqh9pVBqH8K8M+pB3g1MRTqImJ9JnSp/SNONATdMsWfAZSxGbcV5E
   DYxbP9pPr27/OZWqe8Ai9pcr/Y2dHxLva7TmSAkvSXK05ryV9CV0tGq2a
   nsnSOKuXybSXefGDJAHu5UuwFiWLUOj9IsugwVd+e8eWLrOOveWow6Ztp
   RmLb/fgP3KhPJPvbnRofbBrBuW8fHgTG+70Ot7gK3k1agmUta9ljDFEc/
   c8PdOUvHmZCF4p61Idsl6MShZa0BPH2U9T9b3VQGUkXDNqBlTpI1wHy3u
   g==;
X-CSE-ConnectionGUID: CBdZsFBARNG0797LDMOe3g==
X-CSE-MsgGUID: a7ycR06dRCq/WRDrlnYsmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64550602"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="64550602"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 06:51:47 -0700
X-CSE-ConnectionGUID: NPFOkG42QwKwZ+wCXwUQmg==
X-CSE-MsgGUID: ae/oMbIkS7me6pQQdxZZ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="181940449"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost) ([10.245.246.94])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 06:51:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rahul Kumar <rk0006818@gmail.com>, lanzano.alex@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 rk0006818@gmail.com
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
In-Reply-To: <20250923110025.1358920-1-rk0006818@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250923110025.1358920-1-rk0006818@gmail.com>
Date: Tue, 23 Sep 2025 16:51:40 +0300
Message-ID: <712a27fc6c4060e67b3da58cb8564387b40b5971@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 23 Sep 2025, Rahul Kumar <rk0006818@gmail.com> wrote:
> Documentation/process/deprecated.rst recommends against the use of
> kmalloc with dynamic size calculations due to the risk of overflow and
> smaller allocation being made than the caller was expecting.
>
> Replace kmalloc() with kmalloc_array() in drivers/gpu/drm/tiny/repaper.c
> to make the intended allocation size clearer and avoid potential overflow
> issues.
>
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> ---
>  drivers/gpu/drm/tiny/repaper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 5c3b51eb0a97..4d439a2d973a 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -535,7 +535,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb,
>  	DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>  		  epd->factored_stage_time);
>  
> -	buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
> +	buf = kmalloc_array(fb->width, fb->height / 8, GFP_KERNEL);

That's just not the same thing, though.

BR,
Jani.

>  	if (!buf) {
>  		ret = -ENOMEM;
>  		goto out_exit;

-- 
Jani Nikula, Intel
