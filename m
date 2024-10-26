Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC7584A35
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Oct 2024 01:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729907808; cv=none; b=pXHg4Guf+J4Cp3cPmgHK80rrci6gDPbtVgSQ3EJihNwhoOS0aC0izZojaqKLG4DdDWZ+9VGd3DhMB2YnMSmEMUhFjD55zUilGRj/X/vy8wA6cRK/NJATsSW3XqnX1TUvijomcSfb6HZfWS/fxvhVkmC04eUuGcU524EC8KRjLmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729907808; c=relaxed/simple;
	bh=T2eCO1HyiiBrCKcuzU+FRZBXXT1rlsa7/FPHbVTSybw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGQJwIBiO5qYfiL4wilh+pQAUtxQ3drIkzKu4ASU5MwCk5xdkTds9ZsTcDD6JrJeMW7n3D64P661Lt9jxNrK8BwQJpvrkwKcYx6Cu54UjUMWm69yZkqZ6bVcmL9AtAyKgP1fUCFYUNH+i8BLTifbbDr/wypWCoctE0MMY8hieaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyv/n+Cn; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyv/n+Cn"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FD694033D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Oct 2024 01:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guqYXr1zs3cu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Oct 2024 01:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9E1440301
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9E1440301
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nyv/n+Cn
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C9E1440301
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Oct 2024 01:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729907805; x=1761443805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T2eCO1HyiiBrCKcuzU+FRZBXXT1rlsa7/FPHbVTSybw=;
  b=nyv/n+Cnq4QU5i0NN79XNeh8rymOP8qSVljGlHOJYhl5blVKiXAcepe4
   Gv8uKDzhCUfJibXh/7+0FIWrhGj9KuoRvjYUvFUMm3NiaH5LfIVvvu8YC
   p8DrE1njphhvf57NQmP/CBqVLBZAaZD/DCnOC0FvlOs49wIqykahaYN64
   w8Hmqm1tl29+J31Lm7n38LiFgQEZYLy5NPSoMovaaMEwwUFKf2fKGTSeg
   RgHofrifxODckIDDD/mkmGH3M6Cuan3a33nnzBNgBj00zNzTg4QaEErzF
   xvYak+7nwfmnrHAztfDA6gDDW1ai8otHYo+MlcGZJLiWjiuN4KX6QI8Cf
   w==;
X-CSE-ConnectionGUID: zAM6jQ/8T1Cq60Rdn6aQRA==
X-CSE-MsgGUID: diCEsf8jTDKenSoUb4d7wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29452104"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29452104"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 18:56:44 -0700
X-CSE-ConnectionGUID: O7JNTABUS6+n1AjC1yeA7w==
X-CSE-MsgGUID: AbO1uwGLREeOS/MF4O2GRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="85050156"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Oct 2024 18:56:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4W2h-000Z9M-1e;
	Sat, 26 Oct 2024 01:56:39 +0000
Date: Sat, 26 Oct 2024 09:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	brendan.higgins@linux.dev, davidgow@google.com
Cc: oe-kbuild-all@lists.linux.dev,
	Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org, ricardo@marliere.net,
	linux-kernel-mentees@lists.linuxfoundation.org,
	andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v2] lib/math: Add int_sqrt test suite
Message-ID: <202410260915.z3q6ZOGS-lkp@intel.com>
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
config: m68k-sun3_defconfig (https://download.01.org/0day-ci/archive/20241026/202410260915.z3q6ZOGS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260915.z3q6ZOGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260915.z3q6ZOGS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/math/tests/int_sqrt_kunit.c:7:10: fatal error: limits.h: No such file or directory
       7 | #include <limits.h>
         |          ^~~~~~~~~~
   compilation terminated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


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
