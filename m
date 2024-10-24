Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8CA22B661
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 19:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729798527; cv=none; b=MMBmnhMa0antCX/pC8NSSYYNn6Fbvtv0wyabLngVW0ped+4Qu5pF+OvMcgWixJB9vfdb5KO5sf0Mmi2hw1IOkTZa/3foO3HTPNATRfIA5terTLAj9Kpiwhh4ZNG9sycRa4H7P0zqGdd0qNfRgYw6oLaGrXyQmeoth15/Qkmu3Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729798527; c=relaxed/simple;
	bh=BtOPfOz++nM7ImZbRJjtWqJw1z6cTjOA0xjMtChsNuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kETsZC+zp3ZT/e7rV1zmwob7SlgoJAhkGT8RZ44e8R9hzQc+M0/7c2RMnNmPyw3Fi26khn+Tjgl73m2dDSC7HOS3kUDjlkXtgZVpMrR82KmoPnMVY7xq5YEPxNRl3TMrsLssYeoSrJbV1fTc4uS+5Q3wdMih/qvaBrFEWVhntoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aX3/TOWt; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aX3/TOWt"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2379F81397
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 19:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.99
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fz3vI9rXmSt2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Oct 2024 19:35:24 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 735F381380
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=linux.intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 735F381380
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aX3/TOWt
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 735F381380
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 19:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729798524; x=1761334524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BtOPfOz++nM7ImZbRJjtWqJw1z6cTjOA0xjMtChsNuU=;
  b=aX3/TOWt4BIh9TAJU8OyXBS2Onu9n/FpzqKLYbEtJIf6KPYBvJytjpJC
   /RcwApyZWqjElv6J9/iIiImwm59BaqkZZej57RyMHSPlkReCd6cGs4E5x
   DPLZG7dRk8ZN7CgyBGBQ88uwTqzxF5sLRl79zXhoz6oLKPBdvfxKxefjZ
   vIvsVLfYqo0ZH8r7Hcc8onaEyJSdo2jfH/Syh9+V661KvuBFF8LD86TDk
   noSMKSc35yZyYQluyJw5/shNg2yWLPLrOJJLIWuS5whrZL0rltPYJouRw
   EfO6NQKTw+Gjog9Hp5LkQlnBztuAUvvk67+DdB9W3CB2GT61ER+vwoJkt
   A==;
X-CSE-ConnectionGUID: jw2wsnwvTuis0VayZ47CJA==
X-CSE-MsgGUID: d3OH7r9qSMO+Hg6p4lG+dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="28907810"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="28907810"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 12:35:23 -0700
X-CSE-ConnectionGUID: pgkgCp+KQEWk7EYmRwVn+g==
X-CSE-MsgGUID: /mylFFwTRnC/WfKFpxUbdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="80681549"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 12:35:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t43c6-00000006gj3-2dQv;
	Thu, 24 Oct 2024 22:35:18 +0300
Date: Thu, 24 Oct 2024 22:35:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: brendan.higgins@linux.dev, davidgow@google.com,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org, ricardo@marliere.net,
	linux-kernel-mentees@lists.linuxfoundation.org,
	davidlohr.bueso@hp.com
Subject: Re: [PATCH] lib/math: Add int_sqrt test suite
Message-ID: <ZxqhdgDr_s_4UON7@smile.fi.intel.com>
References: <20241024191730.69542-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024191730.69542-1-luis.hernandez093@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 24, 2024 at 03:17:28PM -0400, Luis Felipe Hernandez wrote:
> Adds test suite for integer based square root function.
> 
> The test suite is designed to verify the correctness of the int_sqrt
> math library function.

...

>  obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
>  obj-$(CONFIG_TEST_MULDIV64)	+= test_mul_u64_u64_div_u64.o
>  obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
> +obj-y  += tests/
> \ No newline at end of file

^^^ Please, fix this.

...

> +#include <kunit/test.h>

+ limits.h

> +#include <linux/math.h>

+ module.h
+ string.h

-- 
With Best Regards,
Andy Shevchenko


