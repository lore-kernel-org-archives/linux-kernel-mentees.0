Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94D330AAC8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 14:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468152; cv=none; b=avC2Gk5Ic0NPaagnK1J6E1+MR2+XRcFtDs11bKwT7jp0FOSvgIVJ/A6HcTEhhuiPEtU01D5Qu7Loii0F8KdSlSb5yaGJLTLCOmrWr0XssEQp5xg4l9F4feoFxIIrd00BpT5dUYdAAoNTcfKmDV1heDmpI8Hv0SxbOmV4Vww0oRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468152; c=relaxed/simple;
	bh=rLyX23ymLYa8j5VfciRa5YAFA/KvzENBXUoIUXYhWnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAa83E/Hy4W3GY1qtSzQPVzqZi2dHv2DkhWk82+hbKHaMX5UCndZ2o01qwNRyuG9bdK1vZaBnAlL6PJQn5ySQdPtLUcBhhpLoXSqi9hFdAKr5R9CQ+m3l5jtBciuFC76WQRbXS61S5J0i679GqPiCr3i99Cl0rVhaAoC9UYmfDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXEcwP+6; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXEcwP+6"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 488B1404D6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 14:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g95SI75pcBmU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jul 2025 14:55:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DEC04149D
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DEC04149D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lXEcwP+6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9DEC04149D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751468150; x=1783004150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rLyX23ymLYa8j5VfciRa5YAFA/KvzENBXUoIUXYhWnw=;
  b=lXEcwP+6DdglkKyAV78h8yrHHpsO/9tjZpWqy5ZaLf2RDJAvnYhnPp5Z
   86W5QbAqco9FzJRBXxqt46Hd8uezsQgOguD/C8vpdbtW3W7jWfsqIHa0s
   TbSIXVV3Qff2TSvvbGZLiVig0ayopcBIV1070D2fhYOGvBeRbPcIoIXVj
   WvtzZyL+oMIsqniy4+1FSxsNhRW0m7yi3qQzdrZQyjPnk5ErHVholjVH5
   G38jVVlM70rFCKV5QhwPOnTYOpweJOCwk5gEs6yNUgY0CbHJil48RDuVQ
   GzfbhZdFyP2Ad1H7sIiSFi1/376DiuRySWvwQM4HFJAYi2FaN5zyUJA+Y
   w==;
X-CSE-ConnectionGUID: ktIfKISVQ1aKNOcs91666Q==
X-CSE-MsgGUID: SSWDXuFVTGuVt6sSOed6QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53886532"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53886532"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 07:55:50 -0700
X-CSE-ConnectionGUID: XN4ArCpnT4OmAZgIK5ZmGw==
X-CSE-MsgGUID: YvrNEx8VSl2LgAQ71WXxpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="191269399"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 07:55:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uWysC-0000000BwmV-3TTU;
	Wed, 02 Jul 2025 17:55:44 +0300
Date: Wed, 2 Jul 2025 17:55:44 +0300
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
Message-ID: <aGVIcBLgXZj_YR7B@smile.fi.intel.com>
References: <20250702135855.59955-1-akbansd@gmail.com>
 <f96b68a5-d750-45f0-8cdd-9761b5daca1d@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f96b68a5-d750-45f0-8cdd-9761b5daca1d@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 02, 2025 at 09:16:51AM -0500, David Lechner wrote:
> On 7/2/25 8:58 AM, Akshay Bansod wrote:
> > Update the sysfs interface for sampling frequency and scale attributes.
> > Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
> > and recommended for use in sysfs.

...

> > +		len += sysfs_emit_at(buf, len, "%d.%03d ",
> >  				 odr_table->odr_avl[i].milli_hz / 1000,
> >  				 odr_table->odr_avl[i].milli_hz % 1000);
> 
> Let's keep checkpatch happy and change the indent of the wrapped lines to
> line up with ( since the ( moved.

While I see the point, wouldn't be better to have 1000 replaced with MILLI
at the same time?

-- 
With Best Regards,
Andy Shevchenko


