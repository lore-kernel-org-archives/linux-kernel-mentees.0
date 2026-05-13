Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFB73FB06E
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 May 2026 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669894; cv=none; b=nP/ve2XGeY7TzDC8z8IYDqtD0KThzCuiXSputktRw0hg4tjToiUusOpk8tC8LMtQ4tpAWj7UzUlCL0t80HCy4dkJYUji8vq09NshlzMpnqUt6jfWCQEZX/RX/VT+zgrzzBN5MDs2sxaS1bigcP2n8SW/1WsdC8ZXMJw4nAJCvEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669894; c=relaxed/simple;
	bh=qstERaPbkDaY7OQd0D2LxaO8ynBNl3nLhjwc91dVYqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/qvkKhl4NHMezQKC0r42YWq1Zq1A/IV9r4xU5uLFKnDg07l5VfZatRlgeOvlXxdb2/TfjkxwNTPjckT3p/XLfBMrOpJtt+kdGlUIICfVwc0pTiDmgJsU6rm+tnl6LWfs2Mwf+TqQgQVMxKWEhYKooc09WloMpBEFKSlKZsWdfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ne062H5U; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ne062H5U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669893; x=1810205893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qstERaPbkDaY7OQd0D2LxaO8ynBNl3nLhjwc91dVYqg=;
  b=ne062H5UCiEkH0KQ7sjtBIO5sQ63cOlPFn8lYXs00F+dIZKXwKJBZwLn
   DCKEuaZiAvrUNeu1+yHc74TtNB8njz9XhOZ32UmIOrNZ4HSI/E0ADosOn
   MoO/3Jxr0rMeiYn3EAvasPCd4RDGixnx8MuBl4l5tiyAW4tBJ27KsndaG
   xe9ww1u+DdpzlTRqpsHjYkOVoL0lo+cSQ3nxgoT949QsxSl54b7k2+rQC
   0cqIakk7rVjibl2BfOEzp1+1NsvjKjU+349uTVo8slzW3mts5wEmJUVc/
   DGzvC09bcHYKZr9LdKgbAFoKHpNph37pbINE38dQQrYghwODM3bMLYmyD
   g==;
X-CSE-ConnectionGUID: dSDkGzojRUKyG09YanDK1g==
X-CSE-MsgGUID: cLMeSl3oT+SUdpIhk4RKOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97020022"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="97020022"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:58:12 -0700
X-CSE-ConnectionGUID: OuWWmcCvRXalzrs3Ovl+Xw==
X-CSE-MsgGUID: Otz8OZTXTECwaHuBSkF4yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="243006980"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:58:08 -0700
Date: Wed, 13 May 2026 13:58:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Aldo Conte <aldocontelk@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, shuah@kernel.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 2/5] iio: light: tcs3472: convert remaining locking to
 guard(mutex)
Message-ID: <agRZPnr97HPFcW8-@ashevche-desk.local>
References: <20260512223215.25596-1-aldocontelk@gmail.com>
 <20260512223215.25596-3-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512223215.25596-3-aldocontelk@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, May 13, 2026 at 12:32:12AM +0200, Aldo Conte wrote:
> Convert the locking in tcs3472_read_event(), tcs3472_write_event(),
> tcs3472_read_event_config(), tcs3472_write_event_config(),
> tcs3472_powerdown() and tcs3472_resume() to use guard(mutex)
> instead of explicit mutex_lock()/mutex_unlock() pairs.
> 
> This avoids manual unlock calls on each return path, drops the goto
> in tcs3472_write_event(), and removes 'ret' variables only needed to
> return after the unlock.
> 
> No functional change.

...

> Suggested-by: Andy Shevchenko <andy@kernel.org>

Not appropriate tag, I suggested only changes (as you pointed out below) to
your idea and initial contribution.

> ---
> v2:
> (Suggested by Andy)
> - Moved earlier in the series to avoid introducing manual locking in the devm
>   patch that would then be converted here.
> - Dropped "found by code inspection" (this is a cleanup, not a bug)
> - Test details moved to cover letter

...

Code wise LGTM.

-- 
With Best Regards,
Andy Shevchenko


