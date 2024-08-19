Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F301716848B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724070889; cv=none; b=c5LmFFnXUJPCCADH4Cw769gnO/ear6eC5fQgZL0iPPckaCR1DfgBOu7QzA9X48wVCX1h5Jbl0Lidi3RcxtSat7I6gIVGe9MPGi/9rXyO4oIBt1NY0GKroPpHkGZ9vcI+NC7Y0OVn0QcScElREjrOv3bRTvW+lPlpre7hiqhiUsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724070889; c=relaxed/simple;
	bh=FSBw0nDKyr+17jrVXlyQDZ8KK0OJv6v6h9/4uJd+mVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vijsv6wLqU0qWmdZKzyjSUriTa7N3gkk9xBNHyHqKEaD7GXWy0KhQ9Qfb662o306ndGM3v8DVnne/xIAfkTO/AQtUxm/r4Fi3cWC1ZMgI4Wir/cMZcF2oNUBCaPLBx7mzrmSBT/mdggJgA3jbw1JJ0dX2/AADVWkhx2EUvpTIps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKU9Da0O; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKU9Da0O"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A7A940147
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 12:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUCAYAJa8SQm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Aug 2024 12:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E6E74012B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E6E74012B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nKU9Da0O
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3E6E74012B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 12:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724070886; x=1755606886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FSBw0nDKyr+17jrVXlyQDZ8KK0OJv6v6h9/4uJd+mVU=;
  b=nKU9Da0OR+Lo5KFPVQEaDesIbRV0CmXXXwBi/OXNyPbnt8fDcYflKHp6
   y4xq6YdKkbrubnKLRxJ4P7CUcnmvBh3qRumirA2eUgNKo86Z1dYcSIFF2
   hUdJevq7bXu4HBoqpyLfs/epa7b5ojxKdClPAL3441G1atXFRJ5tcCFtE
   QabyML1lWw1Pq1nQXFlwp2/iY5JI+/Zt6rWDBFN5z2IQSiMgMtet0Cu5H
   bPQYZPfJafeU2fgYYv+HHgo3wy6OQUmXYsd3fkt2LoLRxKJndh58xmYa5
   7C08vKve4eSF5jO442Eohi+dwD3+ckpw1D7cxHhWJZct7SR3QQT6ufsQD
   A==;
X-CSE-ConnectionGUID: Gu3w/0PpQN+2YSgFazrXnQ==
X-CSE-MsgGUID: u117poPbRdWNhPVykA4/zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22450382"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="22450382"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 05:34:44 -0700
X-CSE-ConnectionGUID: YPc5YmGOQL6kDegrSbl12w==
X-CSE-MsgGUID: UBRSh1UqR3m8Zu51AEFIRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="65314237"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Aug 2024 05:34:42 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg1ap-0008yk-15;
	Mon, 19 Aug 2024 12:34:39 +0000
Date: Mon, 19 Aug 2024 20:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	brendan.higgins@linux.dev, davidgow@google.com, rmoar@google.com
Cc: oe-kbuild-all@lists.linux.dev,
	Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] lib/math: Add int_pow test suite
Message-ID: <202408191958.Xq9SR93K-lkp@intel.com>
References: <20240819014115.221135-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819014115.221135-1-luis.hernandez093@gmail.com>

Hi Luis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.11-rc4]
[also build test WARNING on linus/master next-20240819]
[cannot apply to akpm-mm/mm-nonmm-unstable]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Felipe-Hernandez/lib-math-Add-int_pow-test-suite/20240819-094252
base:   v6.11-rc4
patch link:    https://lore.kernel.org/r/20240819014115.221135-1-luis.hernandez093%40gmail.com
patch subject: [PATCH v2] lib/math: Add int_pow test suite
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240819/202408191958.Xq9SR93K-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408191958.Xq9SR93K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408191958.Xq9SR93K-lkp@intel.com/

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
    20		{ 5, 5, 3125, "Five raised to the fith power" },
    21		{ U64_MAX, 1, U64_MAX, "Max base" },
  > 22		{ 2, 63, 9223372036854775808, "Large result"},
    23	};
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
