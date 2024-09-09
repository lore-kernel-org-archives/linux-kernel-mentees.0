Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B68F1CA9E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  9 Sep 2024 18:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725907011; cv=none; b=Vmxx5hkCcedECQXDxdQMtLkk40WN8iJG22FIUnwWJeyz9ovf2IjYovgv0sTZ68X3gYGC7L1eMmf57jOMnJScpDHTqg4tyZfc5oIAYhgxaf27VOYqr+lM5gPQhI/5OSnTCj0vehM43DHlcR/qYf1n0qzHYNfIVSHr/s3PCIJknvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725907011; c=relaxed/simple;
	bh=Oz8nIrkz41riwrlS01Qi8Kt7NCXl92E6S/MW6xZ1nVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tctOtlSy9ZlSO4/A+FmETlcVGGHvNtqvdpj9PtFbYjChBIw72W+vLoPywKf+paxA4WX2MRMZQSqmr7WQa8dty/7IqKvcR7bPuBs2ejXZOaMVhOS9TjMj6Wgy3RROUFvPMD2cYVVMNSXgs+PHQ2JebrVcHnQb0UOOTK93Mnh2kmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkP/JbsY; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkP/JbsY"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16FA580B8F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  9 Sep 2024 18:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIMdu7w8WbwR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Sep 2024 18:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F396C80B6B
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F396C80B6B
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PkP/JbsY
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F396C80B6B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  9 Sep 2024 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725907009; x=1757443009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oz8nIrkz41riwrlS01Qi8Kt7NCXl92E6S/MW6xZ1nVc=;
  b=PkP/JbsYvqT1TT357pET2+FEewmdRYVEg1x+vnT1mOa209TWIpljSndk
   faIANpHdhkwwkKZuDeh9wTg2ALEWvIPVrXFON7LT0eudnPrWyxT3yri1b
   wmGLgHNuRzlis8HimvQhLgBX9asN7dWrM0/IiA9mWVSPgluq3o14w2MO7
   sChXHafwn/EaBwbFlRvHKFkXHa4j9s51SxCK5mmjMVmJhPF4WsaCduTxw
   GFB2/6KxgdJxqbKmOkntuer2mWQ3XEEtS1bmioHZaLqk1eOXtprEmngy4
   Xm5qXO6sttYUe9ZSGO8JIvg77bALgDjRH+UznhOt/rQmft333rUGnzh3v
   A==;
X-CSE-ConnectionGUID: FEckFqiXTkiFQHOt5JT1Uw==
X-CSE-MsgGUID: hAnYUFo4TsyKK9LyECX8AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="27543994"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="27543994"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 11:36:47 -0700
X-CSE-ConnectionGUID: tQVDNjLBS0Kq7sUlK/R3jg==
X-CSE-MsgGUID: sGzZBAN/T3ubk8/Jmq6Rgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="66808113"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2024 11:36:45 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snjFj-000F5E-06;
	Mon, 09 Sep 2024 18:36:43 +0000
Date: Tue, 10 Sep 2024 02:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	brendan.higgins@linux.dev, davidgow@google.com, rmoar@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v4] lib/math: Add int_pow test suite
Message-ID: <202409100220.g9Ghp1te-lkp@intel.com>
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
[also build test WARNING on linus/master next-20240909]
[cannot apply to akpm-mm/mm-nonmm-unstable]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Felipe-Hernandez/lib-math-Add-int_pow-test-suite/20240909-065058
base:   v6.11-rc6
patch link:    https://lore.kernel.org/r/20240908224901.78595-1-luis.hernandez093%40gmail.com
patch subject: [PATCH v4] lib/math: Add int_pow test suite
config: arm64-randconfig-002-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100220.g9Ghp1te-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100220.g9Ghp1te-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100220.g9Ghp1te-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/math/tests/int_pow_kunit.c:22:11: warning: integer literal is too large to be represented in a signed integer type, interpreting as unsigned [-Wimplicitly-unsigned-literal]
      22 |         { 2, 63, 9223372036854775808, "Large result"},
         |                  ^
   1 warning generated.


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
