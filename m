Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ED11B3B35
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  9 Sep 2024 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725875462; cv=none; b=XHVjXASioilqyXXz20IpmKsBncntrPFne94mNLT3RB24XtGKqM6NMsV4MhCxPG0is/5EDilGaMw7ebS3430Zbi8OwkHRcgx5BhSFMvonIGUfSB9ApYQwF+Qj7/7jIDrfRQAYytv+oNQfSUaZFQMEC0qURErQt0c+dTzS9tsC8Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725875462; c=relaxed/simple;
	bh=cpN4c04fp/ArFHGa6SsgZy4awJOaoPGXwyrkhJbDvIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2u86De8z0t/rfdEa9lmNcd1YWe4aEkuS4zNwX5m8IulEt9AbfI+cikTOHIep8Si0tAt4qeuTAKvkSWxEQWT83aLMc70U5JrFpah1vmFeqtTvNBhmQcSXLwiflSbYezT3fxppQdOKP5GgLGo6XL2Z8yLvH/6cL2X39g8ZiHhiB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Alt0utDr; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Alt0utDr"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E475401FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  9 Sep 2024 09:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYkUBODTowCo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Sep 2024 09:50:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8BE9400FE
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8BE9400FE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Alt0utDr
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B8BE9400FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  9 Sep 2024 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725875459; x=1757411459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cpN4c04fp/ArFHGa6SsgZy4awJOaoPGXwyrkhJbDvIg=;
  b=Alt0utDrYfuUeJTYDD7qcAZI/nudWEMW+lHYtO3mDCvtH/E998nSrXtE
   apEtZDkw6x24S43GxCH2M0h4m6+QtaK8YiyPMVPhSBlm7RiEFPA8pSl4f
   02NejdmCg5lSOBLAsmbgat3NVi7FKJQA1A4PL7q+HU+9nZuQAUo80d5H4
   1wbC5lATO2yH6EbtDpjBpJCok6pJo66tkhe5llsPNFUaGWO3Jwnh41FVT
   NTJk8k1flZ8QWSHzBHgSEw41zYFdTv4H0iDeYZmVIN7HVf7hN0nw+S/O/
   cxbuC+wLqtQVSyHhLyOugmeuzMdTCkxDTox1eiZzgHXPXhseaokV69qDk
   Q==;
X-CSE-ConnectionGUID: xTP6b9OpQ6+BFoT3CI65IQ==
X-CSE-MsgGUID: 9sQGnKfFTviCFUqYFg5oqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24361723"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24361723"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 02:50:58 -0700
X-CSE-ConnectionGUID: PwWFr16YRiyxWamW3eHXtQ==
X-CSE-MsgGUID: gv9Tf7MVT4CfRlIE0eicUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="67357831"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Sep 2024 02:50:56 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snb2r-000EaU-0x;
	Mon, 09 Sep 2024 09:50:53 +0000
Date: Mon, 9 Sep 2024 17:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	brendan.higgins@linux.dev, davidgow@google.com, rmoar@google.com
Cc: oe-kbuild-all@lists.linux.dev,
	Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v4] lib/math: Add int_pow test suite
Message-ID: <202409091732.x5CGQKBV-lkp@intel.com>
References: <20240908224901.78595-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240908224901.78595-1-luis.hernandez093@gmail.com>

Hi Luis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.11-rc6]
[also build test WARNING on linus/master next-20240906]
[cannot apply to akpm-mm/mm-nonmm-unstable]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Felipe-Hernandez/lib-math-Add-int_pow-test-suite/20240909-065058
base:   v6.11-rc6
patch link:    https://lore.kernel.org/r/20240908224901.78595-1-luis.hernandez093%40gmail.com
patch subject: [PATCH v4] lib/math: Add int_pow test suite
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240909/202409091732.x5CGQKBV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091732.x5CGQKBV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091732.x5CGQKBV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/math/tests/int_pow_kunit.c:22:18: warning: integer constant is so large that it is unsigned
      22 |         { 2, 63, 9223372036854775808, "Large result"},
         |                  ^~~~~~~~~~~~~~~~~~~


vim +22 lib/math/tests/int_pow_kunit.c

    12	
    13	static const struct test_case_params params[] = {
    14		{ 64, 0, 1, "Power of zero" },
    15		{ 64, 1, 64, "Power of one"},
    16		{ 0, 5, 0, "Base zero" },
    17		{ 1, 64, 1, "Base one" },
    18		{ 2, 2, 4, "Two squared"},
    19		{ 2, 3, 8, "Two cubed"},
    20		{ 5, 5, 3125, "Five raised to the fifth power" },
    21		{ U64_MAX, 1, U64_MAX, "Max base" },
  > 22		{ 2, 63, 9223372036854775808, "Large result"},
    23	};
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
