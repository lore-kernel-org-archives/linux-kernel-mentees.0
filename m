Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A8A2EBBAA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469766; cv=none; b=RHc1IZDa/P68kMpAlpd5IDOQyYAEmX2U0ycRpjjqmV37XxDEZHR0Ev7FlpXam1HLeX2yKN4JkVS/lSv2qic1fwZsU2RoA/7S54BnYK3VBt4r68aAlTzd9mcW2w9vMxVjAc5RF+mpTeNyYMuVrVo6SUuQQCoJwTiRUcQNw0TuF8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469766; c=relaxed/simple;
	bh=Gfd43r0aPmt7xwxQu+ivhcc61vxw7OkRTYOyvI6KUBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSEqkd8VIKx+ElMwV5y8DYIeWSGUbvJJLaoxAm2yPCx1ziYWRIKYXcWQIQT1zCjBLuUVUrFVupYPSI55VKU+m+jaqEEz5BCpDxC5LlorG3lGn1tMhXqEtpnezWhQCPAQfgR+udrsQD3bTkU/CXkX7ly5KatD/nuVFFx0zTHYi5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFzV4YHg; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFzV4YHg"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50A446076D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 15:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EslvTXl7m_gT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jul 2025 15:22:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 48FB760779
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48FB760779
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GFzV4YHg
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 48FB760779
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751469764; x=1783005764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gfd43r0aPmt7xwxQu+ivhcc61vxw7OkRTYOyvI6KUBs=;
  b=GFzV4YHgwJ48pgMqI2+KtNTOX1iXgHAlC4CmDQ//Hg/1E5aiaz8d5pet
   feRNHIcsDanAk9xW44lycfYl0w5C6gk//y4PJm6KmZPpIzzUTX5VM0yp8
   Up3CKpaG2uo6Ugt98gPnfuFCHoEErZzY+inZMtWpq/gaYwjUGINu/EaK9
   jLg9TnNq0vxxBKlyJUKluXnXxaeeqbv3qmdnlm4tIPnqw1hcgk0A//DIh
   Z5tJV8SXGA9zzVN04EV/lYizT1LIQ5VJfZAyIWzrXdpJcdpJKhE2YEVZ3
   dkim2TWEUIeOr9YOgT5K2s5NGZ6xBhiFJcSivUNPaLYQURjFjgG6KXBTd
   w==;
X-CSE-ConnectionGUID: 82OUwavoRtmYe1TIccCn0Q==
X-CSE-MsgGUID: a80cF7XOTFm7Da4nUIhBDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53916727"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53916727"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:22:43 -0700
X-CSE-ConnectionGUID: JazSnvquTuOe/GL6N+pS9w==
X-CSE-MsgGUID: j0fBUXJ4QIWvk3ArkQJfew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="185051371"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:22:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uWzIE-0000000BxC8-1T4K;
	Wed, 02 Jul 2025 18:22:38 +0300
Date: Wed, 2 Jul 2025 18:22:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Akshay Bansod <akbansd@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Message-ID: <aGVOvgxhBO_qSoe3@smile.fi.intel.com>
References: <20250702135855.59955-1-akbansd@gmail.com>
 <f96b68a5-d750-45f0-8cdd-9761b5daca1d@baylibre.com>
 <aGVIcBLgXZj_YR7B@smile.fi.intel.com>
 <e474db53-1b52-48b0-9253-2f62a3861bb4@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e474db53-1b52-48b0-9253-2f62a3861bb4@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 02, 2025 at 10:04:23AM -0500, David Lechner wrote:
> On 7/2/25 9:55 AM, Andy Shevchenko wrote:
> > On Wed, Jul 02, 2025 at 09:16:51AM -0500, David Lechner wrote:
> >> On 7/2/25 8:58 AM, Akshay Bansod wrote:

...

> >>> +		len += sysfs_emit_at(buf, len, "%d.%03d ",
> >>>  				 odr_table->odr_avl[i].milli_hz / 1000,
> >>>  				 odr_table->odr_avl[i].milli_hz % 1000);
> >>
> >> Let's keep checkpatch happy and change the indent of the wrapped lines to
> >> line up with ( since the ( moved.
> > 
> > While I see the point, wouldn't be better to have 1000 replaced with MILLI
> > at the same time?
> 
> For anything with 3 zeros, I don't consider MILLI better (or worse).
> Science shows that the average human can easily see 3 or 4 things
> without having to count them [1]. So it is only when we start getting
> more 0s than that is when I think we should be picky about using macros
> instead.
> 
> And in this particular case, we are converting milli to micro so `1000`
> should be replaced by `(MICRO / MILLI)` if we are going to do that.

I see. This changes the picture drastically. Let's leave it for another day then.

> [1]: https://www.scientificamerican.com/article/your-brain-finds-it-easy-to-size-up-four-objects-but-not-five-heres-why/

-- 
With Best Regards,
Andy Shevchenko


