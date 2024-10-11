Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E571D0E15
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 10:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644093; cv=none; b=cvBt/pcvbw/8hDpmBs4n5Zm+tOl3sCTW5msh5u29MLrkrU1gvRMQufQ992sUsUrOC9QZoKVKwlu9eOoe98aeRhx+bLStEzFfeFomPt4te6ZTpB2VYulZ+5kwUaMTS79yGaMd3CVc8LIwRBiWVGRbd5l/vN3xykBr444pJsVELsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644093; c=relaxed/simple;
	bh=0KOKAhCgsCevJee4BgP8YIJB1hQodgg/8jSRCEcfAl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGDJdYfNbLhXoVYDBLv2lxugYOFqc5jnVQG4CYslN0imVtkHOH+sfLIUYt/BSeDKM8MyVK/qrtSX3s7y3cFlK1ssik7mzhyhFARJaHZjEiwBRwJU4LPhklQFOP2Jja5DT1aaJ4wk5L+HdUPQsDQjKt10Eyb68ZfD9aGWuc8qyI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGhvySuU; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGhvySuU"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E53A781164
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 10:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.99
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avquCtNsB2vQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Oct 2024 10:54:51 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A48F81156
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=linux.intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A48F81156
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XGhvySuU
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3A48F81156
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 10:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728644091; x=1760180091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0KOKAhCgsCevJee4BgP8YIJB1hQodgg/8jSRCEcfAl4=;
  b=XGhvySuUhQzETLNumjpTmgvXykpwxZab0AfMq+WkyTEbPeL8fYJSF7ZV
   uNV6JWBmMM4u8DDw0Fb4cT3XkYsK4wxkLJBZxKk77r5BNHWKwsbPOob2T
   I5XZ80xYzeIwpMVqLk+UFURKErHImuBkdG7OOVcNZMHGazLrOp9vomLnu
   naU8kzdLSOj/ydF2d8udXiEPpt+Qs7RhY7NxLNhZT8PT+CiMKbZKTC5w3
   Dmn4fRB59j3zoUuwvap5ACPXlPclPp8STy6t5IaLIC4VWX3oarY6os4zw
   sR7QdRT26u7k9MJDRjQdBSU/JGvsG/l1stTNPhN6FfzyH9sGbKx/S3rNg
   A==;
X-CSE-ConnectionGUID: yoAn7+4nQNeh93ovr9q4jw==
X-CSE-MsgGUID: Cb2gkL02TOGV1vSVLs4JCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="15662689"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="15662689"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 03:54:50 -0700
X-CSE-ConnectionGUID: OZIz0QrrRvWccFrx1xCAzg==
X-CSE-MsgGUID: PxQCfAhwRvGI8ldeFJ7V+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="81665080"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 03:54:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1szDIA-00000001rlO-2Ab0;
	Fri, 11 Oct 2024 13:54:42 +0300
Date: Fri, 11 Oct 2024 13:54:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, ricardo@marliere.net,
	skhan@linuxfoundation.org, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Vasileios Amoiridis <vassilisamir@gmail.com>,
	Angel Iglesias <ang.iglesiasg@gmail.com>,
	Adam Rizkalla <ajarizzo@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] iio: Fix uninitialized variable
Message-ID: <ZwkD8hXNWcL0z4Cr@smile.fi.intel.com>
References: <20241011093752.30685-1-0xff07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011093752.30685-1-0xff07@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 11, 2024 at 05:37:45PM +0800, Yo-Jung (Leo) Lin wrote:
> clang found that the "offset" in bmp580_trigger_handler doesn't get
> initialized before access. Add proper initialization to this variable.

...

>  	struct bmp280_data *data = iio_priv(indio_dev);
> -	int ret, offset;
> +	int ret, offset = 0;

Can it be done closer to the actual user of it?


-- 
With Best Regards,
Andy Shevchenko


