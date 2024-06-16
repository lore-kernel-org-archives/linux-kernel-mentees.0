Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617D649651
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Jun 2024 19:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718564919; cv=none; b=TeMtqPqtVzXlngDNeMhjsvED84xRrRlY5ng9z7ldqEdEdLUOLirJqABwlmdIQqxYgkZ4DnEnpDu7t0Vu6lf32AIQNll9Dzf/w/GR6X4Qo8ypE9AiiuNyohAtNWvFZ6ez6f6y5hF+4gUPczd8WMrWDWhI4jffe+CTvyIiL/fXbDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718564919; c=relaxed/simple;
	bh=jAUV2fkaJUOuqukFImg27JopNhskZOQjkb5WpZ7dnXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phs6som6Mn5MjWKxTjH7umFk1eOOKX8OjVIGOeWp4xyylrzgkBgjV+wMdCdKN1JajCAyJhqLSxZFqY6d0fWyL/p4bcZBrysiDmTohdilysk2k54/u+4a07LJhn+JMy+uvShFftMqVeR2RqzqwKM7GSLONCMxCSI+ASfFIyXsNS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIW6ANTJ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIW6ANTJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA9C781F73
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Jun 2024 19:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHHOtZ-z9GXg for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jun 2024 19:08:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A633F81F61
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A633F81F61
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UIW6ANTJ
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A633F81F61
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Jun 2024 19:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718564917; x=1750100917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jAUV2fkaJUOuqukFImg27JopNhskZOQjkb5WpZ7dnXI=;
  b=UIW6ANTJ4Svvketo8WVNwWk2g1RwXoBjmhytImSdgL1BQlQPWOX2dJIQ
   JxRMWIQDL0zNg2HlEaQuUrPgQ7sgwA+nDsJKZpLdLsjXC5Xvtk5Q5yO8c
   FKTeT8H6s4+UtGpydtAH7SANKt2L9FO1ccK38zPW6rjRqYvjI1y/dugbM
   m+RQD5Pe+sUwGHvsBLctHNkRPzemByxgGAvYzKXqIinppI9Ox46CXbWrU
   6PDe6p3nd1n/CvvweQXcKy0AsBBUva2d8y7Hh7wMYaxo9szwSTVGkTVKt
   UYMOMZQY7orl4BCBZFohnVa9jaekIKonpsu6vIIWpg/R06xog0+PQjZ6s
   Q==;
X-CSE-ConnectionGUID: u6o9F+e+RKeHiGhytkM2eQ==
X-CSE-MsgGUID: ZqkJIS/XRne5QsiIwMnlNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="32866480"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="32866480"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 12:08:35 -0700
X-CSE-ConnectionGUID: s69HtPn/S02F75KT9lBZwA==
X-CSE-MsgGUID: 3wULYVdJRtiEZ2VnXSxS8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="40937455"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Jun 2024 12:08:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIvEs-0003Ay-1n;
	Sun, 16 Jun 2024 19:08:30 +0000
Date: Mon, 17 Jun 2024 03:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Vadhavana <av2082000@gmail.com>, srinivas.kandagatla@linaro.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	rbmarliere@gmail.com, skhan@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org, av2082000@gmail.com
Subject: Re: [PATCH] slimbus: Fix struct and documentation alignment in
 stream.c
Message-ID: <202406170201.Zh53W56G-lkp@intel.com>
References: <20240616154531.38232-1-av2082000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616154531.38232-1-av2082000@gmail.com>

Hi Amit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.10-rc3 next-20240612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Vadhavana/slimbus-Fix-struct-and-documentation-alignment-in-stream-c/20240616-234811
base:   linus/master
patch link:    https://lore.kernel.org/r/20240616154531.38232-1-av2082000%40gmail.com
patch subject: [PATCH] slimbus: Fix struct and documentation alignment in stream.c
config: arm-randconfig-002-20240617 (https://download.01.org/0day-ci/archive/20240617/202406170201.Zh53W56G-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170201.Zh53W56G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170201.Zh53W56G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/slimbus/stream.c:22:1: warning: 'static' ignored on this declaration [-Wmissing-declarations]
      22 | static const struct segdist_code {
         | ^
>> drivers/slimbus/stream.c:22:8: warning: 'const' ignored on this declaration [-Wmissing-declarations]
      22 | static const struct segdist_code {
         |        ^
   2 warnings generated.


vim +/static +22 drivers/slimbus/stream.c

abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  11  
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  12  /**
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  13   * struct segdist_code - Segment Distributions code from
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  14   *	Table 20 of SLIMbus Specs Version 2.0
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  15   *
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  16   * @ratem: Channel Rate Multipler(Segments per Superframe)
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  17   * @seg_interval: Number of slots between the first Slot of Segment
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  18   *		and the first slot of the next  consecutive Segment.
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  19   * @segdist_code: Segment Distribution Code SD[11:0]
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  20   * @seg_offset_mask: Segment offset mask in SD[11:0]
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  21   */
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05 @22  static const struct segdist_code {
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  23  	int ratem;
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  24  	int seg_interval;
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  25  	int segdist_code;
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  26  	u32 seg_offset_mask;
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  27  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
