Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8115320EA3A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 23:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729899764; cv=none; b=lvCHxW6URk9ePZzC0YxTwvz8kWzuNReKCMLrKHO+5zeixd3MVs7pwrPuFCPYWmeSuDsiwzbbQVhNVcOT322eZJIp5/FZ3HbJc6QSzSWuLL67lkyHvNaPPxw5onar35TD+QTys8bbPnZzq3OGIxYPkaFxO3mYjZocojQBWsLlOo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729899764; c=relaxed/simple;
	bh=9AUHJ52vhcnHhpIsDcydmIMZD0WvaKeVjZTBF2tdN1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fN1xphVCJ9ztZjTZfd8v1cNu9F6rPD5xVNR3g4rMsXThGsSndsyOX5/bT/cYTwfXbQrvo5MU+1jsY0bt9+SAL+qu2JOd+nMzJVtBFwek4nY8YD0zzZDBC5uL8NGVXPcXBdyohY4eDtgqQoC0AiZlRg7f6yAsE6Z/nJRBfU97Jrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghqLW+EV; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghqLW+EV"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 232CD607F8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 23:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIT0Prh7yR9x for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Oct 2024 23:42:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06243605FF
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06243605FF
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ghqLW+EV
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 06243605FF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 23:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729899761; x=1761435761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9AUHJ52vhcnHhpIsDcydmIMZD0WvaKeVjZTBF2tdN1w=;
  b=ghqLW+EVezZ1eHfk+z7fnD7z5IaI9LmUDQr/oxnKMyQzMbf7qB9PqErj
   fKC9oQq3L7eI+4NP5WwT5Fd3kWLpDbhAP95qz1lRSKhLxaMx5rRxBtWgy
   0oqqGSBxJKfb9aNWmYx6l3X+8fn0HSxQX7vvxYAFBAfuAPwtcSn5b0fyr
   Ks09bsP4WGjVJWUNqAKjMNn7dda5iEihSkbRlwkBS06ywvCEQ2bNkmTvv
   2b/wC/65j7+Z3oU74kBsId5S1nVoseD3eu4oGAJLnVog+ta8kimBXCvZF
   Elim5Crt56L3BY1FuCgIqvmpkYi5GFFvzYhkstlu35yb0MoRq7ZxbbyXK
   A==;
X-CSE-ConnectionGUID: S9pjr4NBRJSyM7oMA7pgHQ==
X-CSE-MsgGUID: x7dPa0UZT76ieOlzAVxGsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40199502"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="40199502"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 16:42:40 -0700
X-CSE-ConnectionGUID: +TbfiPdVR+uv+a8H55sVeg==
X-CSE-MsgGUID: GjZIWSRLSlOzrUCDDGJ/xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="80992565"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Oct 2024 16:42:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Tww-000Z2j-2p;
	Fri, 25 Oct 2024 23:42:34 +0000
Date: Sat, 26 Oct 2024 07:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	brendan.higgins@linux.dev, davidgow@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org, ricardo@marliere.net,
	linux-kernel-mentees@lists.linuxfoundation.org,
	andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v2] lib/math: Add int_sqrt test suite
Message-ID: <202410260709.2XVfASBv-lkp@intel.com>
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

Hi Luis,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.12-rc4]
[also build test ERROR on linus/master]
[cannot apply to akpm-mm/mm-nonmm-unstable next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Felipe-Hernandez/lib-math-Add-int_sqrt-test-suite/20241025-035643
base:   v6.12-rc4
patch link:    https://lore.kernel.org/r/20241024195511.72674-1-luis.hernandez093%40gmail.com
patch subject: [PATCH v2] lib/math: Add int_sqrt test suite
config: i386-buildonly-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241026/202410260709.2XVfASBv-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260709.2XVfASBv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260709.2XVfASBv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/math/tests/int_sqrt_kunit.c:7:10: fatal error: 'limits.h' file not found
       7 | #include <limits.h>
         |          ^~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +7 lib/math/tests/int_sqrt_kunit.c

     2	
     3	#include <kunit/test.h>
     4	#include <linux/math.h>
     5	#include <linux/module.h>
     6	#include <linux/string.h>
   > 7	#include <limits.h>
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
