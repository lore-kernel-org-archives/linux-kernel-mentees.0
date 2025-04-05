Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3396D1C68F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Apr 2025 07:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743836773; cv=none; b=JaiNtGuUHjssFz8qk4i46qvPobHA71DAlLJSMRFkmgO0i6UUnhybe/pW/qOJz1rdX6zjLsb7WchBh+IXD4zYFoxuQ9zsb2guH+nwSvyxzhGc26gOrZap+BzB+6HZOiZxkBbTqNCpLsdVhOWPeABYwmB70rPiCi0WAqCmQ+koJe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743836773; c=relaxed/simple;
	bh=c6pVeoNRFL0+YVb4Jo8fBY1tS3Gnyl5Tlg2+CQkLYkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6gwe3efLOXYSyV7Xf53DwqJmh9LAF40K3D+K40llk4THxb3lAIQyTvhCVeBRwY8BNT87LLTVas/xsVA1X/dwSfE3FJN3x6I0GTidMs7lGdZjVVAHOPPy1IlS5KuUeorntKRy2RpRwf28u1WXIbC7vZHG0QYwYIhpEP3nxJSYU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wzj9YxVo; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wzj9YxVo"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B43FE405A5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Apr 2025 07:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrPJQ6Tv2bS4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Apr 2025 07:06:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A63E4403DC
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A63E4403DC
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wzj9YxVo
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A63E4403DC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Apr 2025 07:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743836770; x=1775372770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c6pVeoNRFL0+YVb4Jo8fBY1tS3Gnyl5Tlg2+CQkLYkI=;
  b=Wzj9YxVo6Fw/NEZSHopfPuHNZ4M9VJtBi2SROsv9bvmpW/sJb4qW8o0b
   eLTzf8PDTgOj01DMPY080Q08mtOtAJmbOoJZ1Re4dMXBpfxH/Vb28n5bQ
   KkqZd9aWgwsEonRk4naW/4x5vJZKMQFRE/oPT5jxeyt2ky0Wq9HBOs5fD
   nc7HnAIJZvkGMQ91hmF2cbK8MB1oO02NIInEfT17MQpWuknjOLKFdu7XF
   NoM5sPcRwDQYxNtdwYyfWvWwaPUhlvEUb7f7K7n9gVVzaKwucvYNycmiD
   5fNLghrVvpVaFlYENtZUFnLl8eOF8v6epipULt8RGcnA/Tzwm4HUwxzOG
   w==;
X-CSE-ConnectionGUID: MhU74n40Q5S1hgez4ft5rw==
X-CSE-MsgGUID: piVZr35rR4GO/Z22THAkeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49072312"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="49072312"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 00:06:09 -0700
X-CSE-ConnectionGUID: gAUA3IfzRCe9ESoQV2bv5Q==
X-CSE-MsgGUID: +NpNIIZ+TPOZvAzfnJgRgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="132472871"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Apr 2025 00:06:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0xbC-0001sB-2q;
	Sat, 05 Apr 2025 07:05:50 +0000
Date: Sat, 5 Apr 2025 15:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ahmed Salem <x0rw3ll@gmail.com>, robert.moore@intel.com,
	rafael.j.wysocki@intel.com, lenb@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ACPI: sysfs: apply ACPI_NONSTRING annotation
Message-ID: <202504051453.3rcptolF-lkp@intel.com>
References: <dcc3a018fb28899b277df2e154740d59d4e404af.1743754416.git.x0rw3ll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcc3a018fb28899b277df2e154740d59d4e404af.1743754416.git.x0rw3ll@gmail.com>

Hi Ahmed,

kernel test robot noticed the following build errors:

[auto build test ERROR on b3c623b9a94f7f798715c87e7a75ceeecf15292f]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-Salem/ACPI-PRM-apply-ACPI_NONSTRING-annotation/20250404-162651
base:   b3c623b9a94f7f798715c87e7a75ceeecf15292f
patch link:    https://lore.kernel.org/r/dcc3a018fb28899b277df2e154740d59d4e404af.1743754416.git.x0rw3ll%40gmail.com
patch subject: [PATCH 2/2] ACPI: sysfs: apply ACPI_NONSTRING annotation
config: i386-buildonly-randconfig-004-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051453.3rcptolF-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051453.3rcptolF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051453.3rcptolF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/sysfs.c:310:30: error: expected ';' at end of declaration list
     310 |         char name[ACPI_NAMESEG_SIZE] ACPI_NONSTRING;
         |                                     ^
         |                                     ;
   drivers/acpi/sysfs.c:312:49: error: expected ';' at end of declaration list
     312 |         char filename[ACPI_NAMESEG_SIZE+ACPI_INST_SIZE] ACPI_NONSTRING;
         |                                                        ^
         |                                                        ;
   2 errors generated.


vim +310 drivers/acpi/sysfs.c

   307	
   308	struct acpi_table_attr {
   309		struct bin_attribute attr;
 > 310		char name[ACPI_NAMESEG_SIZE] ACPI_NONSTRING;
   311		int instance;
   312		char filename[ACPI_NAMESEG_SIZE+ACPI_INST_SIZE] ACPI_NONSTRING;
   313		struct list_head node;
   314	};
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
