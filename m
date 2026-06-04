Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5AC3C199E
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  4 Jun 2026 08:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780561907; cv=none; b=hyUdbbl4gn0tu82blNLBbCZ/1MdQx7hG6YL02f4IyhetHbhPHuFnse4ipz01N1xbwTWTEY5ixHYm5NovC7tMSpQmY6mH0QtnGpdSpb6QbDuvUj385JOtIzAii9L1hl3p2BF7lyd2uJ2JxJJ3XwChSaGPCv8w7PkOcIlqMT4QfBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780561907; c=relaxed/simple;
	bh=I4FItoWotYZH4qH5u6UA9ezvM52pF6d5FYapRGSlh2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDVVseTUGU9OAMYeYCcA5ukn3SS9PnV2amYPYbHu/v8cfOLAHDrTkmiVenP1G0FL6M9BsuTeEvAs+zc+i7azJj12NEIvNC0IT/CaKMR1tP7X0/KOGlLxd0SUZ4IpIlHDhLgG0sDm50zQViac0mFjoD9bqEeInNbfZAHY17HuIlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ae8ORSV+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ae8ORSV+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780561905; x=1812097905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I4FItoWotYZH4qH5u6UA9ezvM52pF6d5FYapRGSlh2U=;
  b=Ae8ORSV+r6doVhNXU/Fvga970QgGzBkOLY8IWMuP9iOEW/KHKDkB7SMI
   TXJvLx5Q4hqkUUnzz+EPJHRu5MyWDzT+EcebVQ7vDu13Z1iN8CQqPZyPX
   uKKYK5DOdS2pwavqwGuA5kaxuQBKTIw847S5bGIZgreMzlpvmYLH+KwRQ
   2uVuVprYAo28k1QVH0GCL6A4xPKYFjOQQ9ipD62n/xTqY3UZ19qsCJ7Uz
   FjhdB/sSFCYTBY+oyWtu+xc7QXTxs3E4WED/co3HcUeIF5mmn7oP/Zg8y
   O7y+pl7OT685qKhd6rKj5h8YEmZ3mQTJmh62FYZry+n5UyvsbYzLW7IUY
   g==;
X-CSE-ConnectionGUID: MvXYBLKsSNe+6YE0Ge8+NQ==
X-CSE-MsgGUID: 4P1pQiwJQQaWrsTkdbLn4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81509953"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="81509953"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 01:31:44 -0700
X-CSE-ConnectionGUID: /msW8+HNSGO4a1GCZVHvag==
X-CSE-MsgGUID: AHoHQN/XSvWXCZMSSNQ9nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="241514938"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 01:31:42 -0700
Date: Thu, 4 Jun 2026 11:31:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Aldo Conte <aldocontelk@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, shuah@kernel.org, joshua.crofts1@gmail.com,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3 4/8] iio: tcs3472: use ! instead of explicit NULL check
Message-ID: <aiE36_SrwCvwLYTu@ashevche-desk.local>
References: <20260522123420.45495-1-aldocontelk@gmail.com>
 <20260522123420.45495-5-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522123420.45495-5-aldocontelk@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, May 22, 2026 at 02:34:15PM +0200, Aldo Conte wrote:
> Replace 'if (indio_dev == NULL)' with 'if (!indio_dev)' in
> tcs3472_probe() to follow the preferred kernel style.

> Suggested-by: Joshua Crofts <joshua.crofts1@gmail.com>

Joshua, even if it's not written in the documentation (or unclear) the idea is
that whoever formally suggested the change has to acknowledge it (Acked-by is
enough, but full review is superior, of course).

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


