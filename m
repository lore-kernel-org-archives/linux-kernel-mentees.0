Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980E338E5E1
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  6 Apr 2026 17:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775496265; cv=none; b=Bnxz6zPOCck8q7XqBpZTPjHvUZ1O7hQa6YysXmWbAwNc6TJAZLvgaU5mJX92rqTYE3zJnTTxOnK5RW2wtRnA01D3eFEW5E8c8LmSE2pgY0GC3bhIFANThIO0FVMXMHVf08KhhJwH2AkC+jIUNc+bNDQUPf7w5xJr0VE0Wah0qQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775496265; c=relaxed/simple;
	bh=pnNeFKB4W8R2YW5TrU1RMLrxD9/0EXaR6Tm7ufhU/Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsR3OrJqfnHUCcpxjSXgXlVlppcepmCms8FvIk0oz3rHNLzas3Z9fZU7kyR1smi5O2jxI6KkWcR9ejgLzLQ5WcWbh4vDQf88VSajgTHi7ymDfvOkxDT1rRFCzrLLnthQEsF5Dys9JaUZhuNDRv9pSON1vk6rODyHhLQBeUsB9Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IL+iItf1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IL+iItf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775496262; x=1807032262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pnNeFKB4W8R2YW5TrU1RMLrxD9/0EXaR6Tm7ufhU/Bk=;
  b=IL+iItf1UoiDJ/5QnM2iqLdqn5CRRtzU3ftv39YD2piTNpB17A6EK6kg
   vbiBwbVcxzigCRH2FHYdQNT5a0UWut/Tj0SS/KRbH8Hz69qcieSrllBVN
   eJsOmEj3doQzzNCypTy3dTzm9LUgSLwmOF4HYC4J5fV46Pf13OTdCwADN
   uxYJsb9PDTsNIclSj1UO8/qhMMn823pqgZVAt0uAzgOnS41j1OqxbNsQQ
   kyQeqn4vIY+h135im+cRvynH61vIjLhRvN8Jy7Eq4hYT4UNir4cNQ1Dw1
   PgPHzWyWbZsut/p7Pzu9XfLn6yMnloY55tLJuQPjPechaer64cSuFCmjE
   A==;
X-CSE-ConnectionGUID: gZPPpqUvSmqC+V1UE4TUSQ==
X-CSE-MsgGUID: r85MCw/NQKybi0OMTQCCAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86741041"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86741041"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 10:24:21 -0700
X-CSE-ConnectionGUID: YfaSJIAOTdGEMcln251LFg==
X-CSE-MsgGUID: 9PNhf2jaTq65TlO42Zc1Sg==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.73])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 10:24:18 -0700
Date: Mon, 6 Apr 2026 20:24:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Aldo Conte <aldocontelk@gmail.com>
Cc: jic23@kernel.org, ktsai@capellamicro.com, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, daniel.baluta@intel.com,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 2/2] iio: light: cm3323: use dev_err_probe() in probe
 path
Message-ID: <adPr4AagFaHfuoOf@ashevche-desk.local>
References: <20260404205853.18559-1-aldocontelk@gmail.com>
 <20260404205853.18559-3-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404205853.18559-3-aldocontelk@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Apr 04, 2026 at 10:58:52PM +0200, Aldo Conte wrote:
> Replace dev_err() calls with dev_err_probe() in cm3323_init() and
> cm3323_probe(). cm3323_init() is called by cm3323_probe(),  so using
> dev_err_probe() ensures that deferred probing is handled
> correctly and simplifies error paths.
> 
> Remove the redundant error message in cm3323_probe().
> 
> Tested on a Raspberry Pi 3B using i2c-stub. The driver probes
> successfully and successfully read integration_time after this change.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
assuming the comment from David is being addressed.

-- 
With Best Regards,
Andy Shevchenko


