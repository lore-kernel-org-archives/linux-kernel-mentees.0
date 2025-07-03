Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C502E03F4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751550011; cv=none; b=BZB6YBHBebJaYFNu+jVhu6vpho0kWCCWz9NTW0i+o/RL8DXbPX1A8JE3g4bInn/LvHpw8Ym/5oR7okLV1FGzLECUsiR6JCWBoWSmRR/2tdj6QgKyhdcTKK7Ti7BqZNOlKSbhnySUkwOvBsaofsV1k6zSTBM5zqdPtoPwi6+JmIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751550011; c=relaxed/simple;
	bh=7tjoXBgVlhft02eD+orqPpaW/4xw5wOeTcdUF5x4nz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrFCBjuQ0ko903/sLfSy1+Q66QyvftzNY2n/jlgb1gZq4ZooRCYxztO5Fx1n7NQBa18z9I/5HrCh5mFzzK4iCXS4KfwDyQYxedqdMH6dVqnu4oZRFTlvtruVZn41bgDMpY6e1u4pUhpd0SW6PR+gEqEgJwsp+oKbKLA+FDflPJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HnVq0hfS; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HnVq0hfS"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44F02813FF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 13:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.093
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h89cDWl-waBM for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Jul 2025 13:40:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6EBC480C72
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EBC480C72
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HnVq0hfS
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6EBC480C72
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 13:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751550009; x=1783086009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7tjoXBgVlhft02eD+orqPpaW/4xw5wOeTcdUF5x4nz8=;
  b=HnVq0hfSoTjfPrKKe5k0tISD1hj3wgyrvmohg4cn2b3XPTZi7ygrkVpy
   9YxrTNB6sGm16vpRYqTDvH7qqfCvQSGD3FP2SA0qS5vqnvqaszlXTMjPI
   3MHOVggxd6B+pFDaB7Abtjq+xXTLq1VUBR8qLAwzCsUcvVdbT6xc5g/0a
   QUCipQY11XLRrJgCISmOu/Wxc/SUMLCR5vTXiqLBt5S2eKtKfivWdkT+x
   Ru3l6oRZF9mZIni1CC8g9h2bmId/3kMa+jsMcP88z6cUuvI+HTm/7AjCm
   p7ptwhiBYsRJ321/NVvBeH9r4tkDD4AHwqJXFWDnWUSferA1iGqci/oWC
   g==;
X-CSE-ConnectionGUID: W1eZ+3EYREqr0eCaMVTf2A==
X-CSE-MsgGUID: e/nWPCXBTfSBPkIEk//PyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53971327"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53971327"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:40:08 -0700
X-CSE-ConnectionGUID: gDTPfZpVQUS2W0Y+nOqTBg==
X-CSE-MsgGUID: qrOytyl9S62aZ1oQrJ7V+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="191554579"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:40:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uXKAU-0000000CDXy-3qwF;
	Thu, 03 Jul 2025 16:40:02 +0300
Date: Thu, 3 Jul 2025 16:40:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Akshay Bansod <akbansd@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Message-ID: <aGaIMjkYBmfMmCBn@smile.fi.intel.com>
References: <20250703053900.36530-1-akbansd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703053900.36530-1-akbansd@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 03, 2025 at 11:08:59AM +0530, Akshay Bansod wrote:
> Update the sysfs interface for sampling frequency and scale attributes.
> Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
> and recommended for use in sysfs.

'must' is stronger than 'recommendation'.
Of has the documentation been changed lately?

...

> st_lsm6dsx_sysfs_sampling_frequency_avail(struct device *dev,

>  	odr_table = &sensor->hw->settings->odr_table[sensor->id];
>  	for (i = 0; i < odr_table->odr_len; i++)
> -		len += scnprintf(buf + len, PAGE_SIZE - len, "%d.%03d ",
> -				 odr_table->odr_avl[i].milli_hz / 1000,
> -				 odr_table->odr_avl[i].milli_hz % 1000);
> +		len += sysfs_emit_at(buf, len, "%d.%03d ",
> +				     odr_table->odr_avl[i].milli_hz / 1000,
> +				     odr_table->odr_avl[i].milli_hz % 1000);
>  	buf[len - 1] = '\n';

My gosh, this is error prone. I'm wondering when some CIs will start to
complain on this line. But this was already before your change...

>  	return len;

...

>  	fs_table = &hw->settings->fs_table[sensor->id];
>  	for (i = 0; i < fs_table->fs_len; i++)
> -		len += scnprintf(buf + len, PAGE_SIZE - len, "0.%09u ",
> -				 fs_table->fs_avl[i].gain);
> +		len += sysfs_emit_at(buf, len, "0.%09u ",
> +				     fs_table->fs_avl[i].gain);
>  	buf[len - 1] = '\n';

Ditto.

-- 
With Best Regards,
Andy Shevchenko


