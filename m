Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00D23A6F16
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Aug 2026 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786351540; cv=none; b=O8rON70xcLZb73skKWZfq2cU6gJoyh3ziiidFHHesmmQbpRhz8VRrQ83qOHGoXjxMxd3zMvbICQDKaM9eeZ6YSodQgjexp/58dlRPfUYABQY+RezQzt3uC8gQPns9qWfvEBCPcoMKQSIdvCHwijPHyP8hRYYnzQL7r6G6lMZ/hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786351540; c=relaxed/simple;
	bh=g3KLnNa7mba9EqnXPrJsH/PqBFPCY9MX/UplqaGydPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3ENWj+iuJ3MLoFx374FEG3fz3Q+2nLuxBR13NKfVxo/Ea9SPY194jd+izsohTnurRI2bhswQlc2tVaQG+kQgKoAqklq0D/FRJBi1rfcgq/CjX4TQHabLUxK4heSN62JgRIwAuyVVBpITzlQyqwDlF/Ut92h20ckjGmygocCXjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1wYMXI1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1wYMXI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786351539; x=1817887539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g3KLnNa7mba9EqnXPrJsH/PqBFPCY9MX/UplqaGydPk=;
  b=d1wYMXI1ZhZqrySz9I1npXrs9NyGY1wlA3TXk34EF3Hc+BlpLlyZuWuK
   hQi/WBIydKNUt6xVDRVWYS002t8j4VfDPPxPT/hO3ay/WP2MmX0IgVlP7
   oiksLDgDFJ29xTh4bt3ZwG62MxSvoREaeIBDYyudmVECocB5/t/r7H4LQ
   0K9cmAq0f0KVWJ6hl9zCcCQM8n1JKc24ABdrRmvJybqV4TCdLxDw+OcHm
   Oh4viaJhK1iCDzrSE0Waf6goW64yEsSozFJLVCkEbfxml0NEoC9d7W1gz
   Siy39mEAgIAWsZEhc6TMuOiWNp6Sx0sMy0Ohmg9gWELgcfCQt1idFLo1n
   w==;
X-CSE-ConnectionGUID: OUYdb88wSOiKrHBZDSnTAQ==
X-CSE-MsgGUID: zEZGDKVrQSWCq956vC5SNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="90537574"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="90537574"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 01:45:39 -0700
X-CSE-ConnectionGUID: rYCKv+mXSoK6jpTAZrDM8A==
X-CSE-MsgGUID: ktYw5Ay4SreEyQS8ZohhrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="261244859"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.99])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 01:45:36 -0700
Date: Mon, 10 Aug 2026 11:45:34 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Adi Nata <adinata.softwareengineer@gmail.com>
Cc: lorenzo@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 4/5] iio: humidity: hts221: use dev_err_probe() in probe
 paths
Message-ID: <anmPrjxK3ydCtuDS@ashevche-desk.local>
References: <20260808090026.34187-1-adinata.softwareengineer@gmail.com>
 <20260808090026.34187-5-adinata.softwareengineer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808090026.34187-5-adinata.softwareengineer@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Aug 08, 2026 at 05:00:25PM +0800, Adi Nata wrote:
> Convert remaining probe-time error logs to dev_err_probe() so the
> errno is included and deferred probe failures stay quiet.

...

> @@ -579,33 +579,27 @@ int hts221_probe(struct device *dev, int irq, const char *name,

>  	/* configure humidity sensor */
>  	err = hts221_parse_rh_caldata(hw);
> -	if (err < 0) {
> -		dev_err(hw->dev, "failed to get rh calibration data\n");
> -		return err;
> -	}
> +	if (err < 0)
> +		return dev_err_probe(hw->dev, err,
> +				     "failed to get rh calibration data\n");

Why hw->dev and not simply dev?!
Also in all cases.

-- 
With Best Regards,
Andy Shevchenko


