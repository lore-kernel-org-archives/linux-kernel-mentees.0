Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887051DCB2B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Sep 2024 14:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726236244; cv=none; b=kyv5/heJcYHyd+raQbQz3z94P2mhvJS22L6jJj9QlFoESnIjn2Bhh8vy4BiCENpgOoJhARiWhL6oko1xXANRW37HjYVBwLRrm3aseTu8JIGT34DFSnVE+1xDe+pYzE5CkP2fa/sulRdNrKtr8xSd1U+wOVYFJotmoI2xUUSwEN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726236244; c=relaxed/simple;
	bh=oAWsuUUJ5Y00qoIELcyG3wd1465N2OzwrLCkJX2zUZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpyLlgb/VAHA3Gfv6iRKRpLkTdOGWXbzECK+ydcEvYebWzn5hU6sLIPMn/l2pRuLQX6qVG/Jy7L5ERta82qlchuzmKBOIcp1HKRCqIcJ6Uglw+pKu8g44qA23TEdQDVVjm54s+tVBTjldE8VzWJ5bk1qUBULH2ZdEsqFJVwQR30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRHinECM; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRHinECM"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F17F4118C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Sep 2024 14:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXACv_BBk4hH for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Sep 2024 14:04:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8CE644059D
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CE644059D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PRHinECM
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8CE644059D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Sep 2024 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726236241; x=1757772241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oAWsuUUJ5Y00qoIELcyG3wd1465N2OzwrLCkJX2zUZM=;
  b=PRHinECMoO6vesDAWpclURG4Iq60rB7n4T76ssbsXbGCzIcHIyT+hMCu
   ly22k7AiHH8imFKiOpWf1p5jnv7LA/I6ddwdRt+lw6UI3xGS+6m1tdIsa
   fHJ+zd/yjJecWQNi6/1mrC7i0xL1nHIfFIDJTGitsXH8t57zVqdGukR8I
   rUnMZ5Jo4Y/bcnayrYGHYl0s8dZhb1AceraI2JVlpebIl8QbtK38waHqD
   VQNY2Qdj+SibT19yBm0NwCHz1IOHdCmpO9XlnKbs9XVxvZdXMv+tA9sJj
   mhdN8KwwVil22YCrCOxIgrAZzTwKMvgAhFzAXwQMWIXu+pwa9zPmYRYfE
   w==;
X-CSE-ConnectionGUID: MjFk8ibVQMK3WtZA8RQ8xw==
X-CSE-MsgGUID: A4xQ2uGBRmObGT42oqruDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28883003"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="28883003"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:03:59 -0700
X-CSE-ConnectionGUID: WpRz/hMYTBSRPLwLcDW24w==
X-CSE-MsgGUID: XewqBxMuTReB0mac/EYPoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68567380"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Sep 2024 07:03:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp6tv-0006YU-1F;
	Fri, 13 Sep 2024 14:03:55 +0000
Date: Fri, 13 Sep 2024 22:03:02 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: Use new initialization api for tasklet
Message-ID: <202409132123.Kfncs3AN-lkp@intel.com>
References: <20240912172231.369566-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912172231.369566-1-abhishektamboli9@gmail.com>

Hi Abhishek,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Tamboli/staging-octeon-Use-new-initialization-api-for-tasklet/20240913-012448
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20240912172231.369566-1-abhishektamboli9%40gmail.com
patch subject: [PATCH] staging: octeon: Use new initialization api for tasklet
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240913/202409132123.Kfncs3AN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409132123.Kfncs3AN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409132123.Kfncs3AN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel_stat.h:8,
                    from include/linux/cgroup.h:25,
                    from include/net/netprio_cgroup.h:11,
                    from include/linux/netdevice.h:42,
                    from drivers/staging/octeon/ethernet-tx.c:10:
>> drivers/staging/octeon/ethernet-tx.c:44:52: error: initialization of 'void (*)(struct tasklet_struct *)' from incompatible pointer type 'void (*)(struct tasklet_struct)' [-Wincompatible-pointer-types]
      44 | static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/interrupt.h:665:21: note: in definition of macro 'DECLARE_TASKLET'
     665 |         .callback = _callback,                          \
         |                     ^~~~~~~~~
   drivers/staging/octeon/ethernet-tx.c:44:52: note: (near initialization for 'cvm_oct_tx_cleanup_tasklet.<anonymous>.callback')
      44 | static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/interrupt.h:665:21: note: in definition of macro 'DECLARE_TASKLET'
     665 |         .callback = _callback,                          \
         |                     ^~~~~~~~~


vim +44 drivers/staging/octeon/ethernet-tx.c

  > 10	#include <linux/netdevice.h>
    11	#include <linux/etherdevice.h>
    12	#include <linux/ip.h>
    13	#include <linux/ratelimit.h>
    14	#include <linux/string.h>
    15	#include <linux/interrupt.h>
    16	#include <net/dst.h>
    17	#ifdef CONFIG_XFRM
    18	#include <linux/xfrm.h>
    19	#include <net/xfrm.h>
    20	#endif /* CONFIG_XFRM */
    21	
    22	#include <linux/atomic.h>
    23	#include <net/sch_generic.h>
    24	
    25	#include "octeon-ethernet.h"
    26	#include "ethernet-defines.h"
    27	#include "ethernet-tx.h"
    28	#include "ethernet-util.h"
    29	
    30	#define CVM_OCT_SKB_CB(skb)	((u64 *)((skb)->cb))
    31	
    32	/*
    33	 * You can define GET_SKBUFF_QOS() to override how the skbuff output
    34	 * function determines which output queue is used. The default
    35	 * implementation always uses the base queue for the port. If, for
    36	 * example, you wanted to use the skb->priority field, define
    37	 * GET_SKBUFF_QOS as: #define GET_SKBUFF_QOS(skb) ((skb)->priority)
    38	 */
    39	#ifndef GET_SKBUFF_QOS
    40	#define GET_SKBUFF_QOS(skb) 0
    41	#endif
    42	
    43	static void cvm_oct_tx_do_cleanup(struct tasklet_struct clean);
  > 44	static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
