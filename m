Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF44F1171D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 15:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869630; cv=none; b=dW9CMJ3jhIgUuTF7hXbcYBNcB/YNTFaohhjvlSob+lPZ3MnekMArri6Btkk33fcdIZ2blKdCjceym8GwxtNAE/z1rePCdZA568Qn0w8vdo0HKyE6nBX79pBTT8zZYOVxnO8kk6ReCDeeMZ4jPTsRjfOIibAUB1v7jXKrSOs1xlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869630; c=relaxed/simple;
	bh=/CRZccK48TTkm9/y8qzsegbvd/zAcrFx30TxSE7jFb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sviNVwY6LtkyIq7IL7IJVN2HI2+2HhghO/31HgEsO+3rrEFBeVtQTI6WFVxLt0etnwFn+KcJWFxs4M6hTZHXj1BUZ5tXP3dnfN5bbXmuwzYRsH79LJZgMNwE1VIrGSmIJpSPtdKTBX7Gn72I0v9mRJlyCC11ZIHLFPl4i03h4iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHaDoy11; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHaDoy11"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DFC781FF5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 15:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.99
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NwhgR3PP0fOI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Oct 2024 15:20:27 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C3DB81FF2
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=linux.intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C3DB81FF2
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZHaDoy11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4C3DB81FF2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729869627; x=1761405627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/CRZccK48TTkm9/y8qzsegbvd/zAcrFx30TxSE7jFb0=;
  b=ZHaDoy11vEeMRWiM3+OWMwZOd6z+8u/IXwyBdy9Dhi2LKwMK0pHr2ajg
   ckcAfe6kiKSompUcwJsx7oErgpLFDNTocMhoMxyYylL70CEWD4lXobQxj
   hlyNngrD/qT80xY/HbX3VbJv1+xvdMBd98Bg6AZrLrQB+SiQ65BB7Nh+q
   KzjM1Do5o2zQlSplo+WY3to4KKjdQu+fVmVmgy/Exz3RrH9IEY/hZI/Fp
   K+sAB88TExUY3QJtR4mZxZHVw1ZsC6gjA5hfHDMT4XEFfdc/PGMHVPM0A
   lXf/UM6+SRIr9IDsCw7BNLzJ+fUzyv/S0o0irILm3bieMj5bEOqdLzv7k
   w==;
X-CSE-ConnectionGUID: Su4UExQlQjqIkENGKJpXTQ==
X-CSE-MsgGUID: NTRIuaJITc60nIo/ZOKliw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29438232"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="29438232"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 08:20:26 -0700
X-CSE-ConnectionGUID: 2FFeEofwSmixujwq9s+nsg==
X-CSE-MsgGUID: QZE9di3AQWuZsctjIjAZUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="80965243"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 08:20:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t4M6v-00000006xWS-160X;
	Fri, 25 Oct 2024 18:20:21 +0300
Date: Fri, 25 Oct 2024 18:20:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: brendan.higgins@linux.dev, davidgow@google.com,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org, ricardo@marliere.net,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] lib/math: Add int_sqrt test suite
Message-ID: <Zxu3Nd_xdOIdyYl9@smile.fi.intel.com>
References: <20241024195511.72674-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024195511.72674-1-luis.hernandez093@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 24, 2024 at 03:55:09PM -0400, Luis Felipe Hernandez wrote:
> Adds test suite for integer based square root function.
> 
> The test suite is designed to verify the correctness of the int_sqrt

int_aqrt()

> math library function.

...

> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug

> +config INT_SQRT_KUNIT_TEST
> +	tristate "Integer square root test test" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables the KUnit test suite for the int_sqrt function,
> +	  which performs square root calculation. The test suite checks
> +	  various scenarios, including edge cases, to ensure correctness.
> +
> +	  Enabling this option will include tests that check various scenarios
> +	  and edge cases to ensure the accuracy and reliability of the square root
> +	  function.
> +
> +	  If unsure, say N
> +
> +

One blank line is enough.

Shouldn't the thing to be in lib/tests/Kconfig?

...

>  obj-$(CONFIG_INT_POW_TEST) += int_pow_kunit.o

Where is this? I don't see it right now in the Linux Next...

...

> +#include <kunit/test.h>
> +#include <linux/math.h>
> +#include <linux/module.h>
> +#include <linux/string.h>
> +#include <limits.h>

linux/limits.h, of course.

Sorry that I wasn't clear about this, but it's kinda rule of thumb that all
headers in 99.999% kernel-space related files in the Linux kernel are from
in-project folders and not from outside.

-- 
With Best Regards,
Andy Shevchenko


