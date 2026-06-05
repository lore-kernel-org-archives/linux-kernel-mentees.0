Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BBD35836E
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  5 Jun 2026 18:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683030; cv=none; b=oKBrOT7UQJPD/CLf6Ct6vzKtGJ8A9/zl3Hf17SWidu4Cq0N0ON7lEziy8fITHyWvR3oQoTRFAK3BaSXElRxkOI/jDRDkWvvEd5GTOVfpU+OSztYtrh2ox39fMXC0u1iFv5PYu0sPRL+yqP+cQSMize5dPRWsa/ud8AA6cQdr/0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683030; c=relaxed/simple;
	bh=CqVj0C/PESAXUez0gzJ4cJi3BxzrPb7V5KZtA6FXslY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WScZyDZcg2IeiDJoeRn4I9huJSp1DHDxivb0jhNooiyFW94Qu+gqLZViGDY+KjXra0u+3PE9Ie5B9XrjZTak/9LJmQsTLZjjDIK4tBH1ykVPycmIU0k3qvpBV6lG49G1VZdekhTHeyudnq3YgAzjY+RY10NJv+rt/aat1KrSaOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fufdefqs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fufdefqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780683029; x=1812219029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CqVj0C/PESAXUez0gzJ4cJi3BxzrPb7V5KZtA6FXslY=;
  b=FufdefqsaaT2lnpqJJu3CueQh4OYD5a/LKLxCThhR+M4aTfQ/tE6/MEW
   Yp5amEmFqwYKe5d0Q2fMFwUGl4LVIv705D2vUExCNIFDJ0K7qDGZBcqgA
   wBtfjIxZxWBdOVT2VcLmdnY8uoroyazlGirkSi4J6W4daLa2cJ20QUDYT
   m6kmE0MQJBcp5WCrlh4+2ZYW6RTDQCrlI04G73hwgFKptmuuJ7BHoUFVn
   NNi1YIYnMg9bax73jckrU+EhpUdF5zbOvoKCR+EDrne7mkGgO0xusBGsl
   pr9pm88tmYayOyP2bbHmEkAjcRxD7BzQtWB+oT5LPwfPSw1tSHxUBvmQr
   g==;
X-CSE-ConnectionGUID: RvaQhWTESIqp2npB1b5EDQ==
X-CSE-MsgGUID: YoNXXoD6TL+K+vNjlXjsOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="85141907"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="85141907"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:10:29 -0700
X-CSE-ConnectionGUID: QUVxgwSVQ7+LWmRqO/Rgeg==
X-CSE-MsgGUID: NVRTWpl9SgegVwalg9Vy9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="282992143"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.178])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:10:26 -0700
Date: Fri, 5 Jun 2026 21:10:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: spear_adc: align headers with IWYU
 principle
Message-ID: <aiMRDwzwh6zXaHo_@ashevche-desk.local>
References: <20260527014058.35265-1-rodrigo.gobbi.7@gmail.com>
 <20260527014058.35265-3-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527014058.35265-3-rodrigo.gobbi.7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, May 26, 2026 at 10:36:40PM -0300, Rodrigo Gobbi wrote:
> Remove unused includes and add what is being used:
> 
> #include <linux/array_size.h> // for ARRAY_SIZE
> #include <linux/bits.h>  // for GENMASKxx
> #include <linux/dev_printk.h> // for dev_err_probe, dev_info
> #include <linux/math.h>  // for DIV_ROUND_UP
> #include <linux/mutex.h> // for struct mutex
> #include <linux/types.h> // for uXX definitions

> #include <linux/iio/types.h> // for IIO_CHAN_INFO_*

I guess we tend to avoid including this one as long as iio/iio.h is included.

-- 
With Best Regards,
Andy Shevchenko


