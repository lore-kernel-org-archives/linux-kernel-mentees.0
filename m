Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D253149628
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Jun 2024 18:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718563599; cv=none; b=eLL2FfdON2Rl2EmlkNRfNXqUMYbGrto9XuzUI11V2dMPp1PZnOjWZ/xtzgOwFdIBxirgn7M11bSC6rTnlMvtI0NBhZtOgqRUMoaiZLk7uyGvmSHBcrenz+AecK7YV+Rdq+1CPKG/oGgrhVhb5KJX8Gj9WlQ/z7XD6jiJRQXbfJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718563599; c=relaxed/simple;
	bh=tLd7mS6bPJCicOINSMGFRmf6Hzbsirhin6FWdqKp3bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzVXsKV6Y64718VufEZhehOIM+DBLHppblZDDLeRdhoSJ+oRJrBnI682YPlbK+HJ6GcrgF9Iuo1fNFh0goM7nGXnNy0s1Oe1QUKddiRKHU4nynNNgVeZLIP4jND3PveaYj2U1amC4UXexnuOTN34Fqz0aIK1qejkinoJF1aig+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awl7emMi; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awl7emMi"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50B20405B0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Jun 2024 18:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKiDu6zDyAQC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jun 2024 18:46:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2CFF405C9
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2CFF405C9
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=awl7emMi
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B2CFF405C9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Jun 2024 18:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718563595; x=1750099595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tLd7mS6bPJCicOINSMGFRmf6Hzbsirhin6FWdqKp3bk=;
  b=awl7emMi2o2JmddRowerA3AHZALzDH3RpiTFfwCh0bJn9ACllDYhkMr2
   XfmvZ7OEGZ2xYE3eeolkivA2AnKlHN8k8sRxAmsXAfBt0PGqBRRPCKTpT
   JWlz8QRfCxZlk08F4DWR2CVvJDzDmRGN+rSOdCW0oCU7OBeBiH+NL13bu
   ubUoJBrvo7nkPGc5L4rUDOMr8rpq8zaZXWVhP3evQROcpr+Q7K7JXj0eE
   wX9hIVjG0wZEb+09YeLiOVwbt3TqZf4ZlC0MnqPX6s3ZXWjC2VhXDUlXe
   +F+tYF1EsoPZkuz/IDy++VgmurXrwwHr+MGZIuRjTHKP8virkttygi+dQ
   g==;
X-CSE-ConnectionGUID: pAnFkhEaTdSkeV/jzWz0VQ==
X-CSE-MsgGUID: E7R1b/qYT6++j5jtqx9Dyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="37917619"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="37917619"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 11:46:34 -0700
X-CSE-ConnectionGUID: 6sKTfiJsQBqIZ6eWJZm/CA==
X-CSE-MsgGUID: Mp/rJAFEQqSKXh14liab6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="72209287"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jun 2024 11:46:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIuta-0003AI-0i;
	Sun, 16 Jun 2024 18:46:30 +0000
Date: Mon, 17 Jun 2024 02:45:54 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Vadhavana <av2082000@gmail.com>, srinivas.kandagatla@linaro.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	rbmarliere@gmail.com, skhan@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org, av2082000@gmail.com
Subject: Re: [PATCH] slimbus: Fix struct and documentation alignment in
 stream.c
Message-ID: <202406170228.1TcJ2eGD-lkp@intel.com>
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
[also build test WARNING on v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Vadhavana/slimbus-Fix-struct-and-documentation-alignment-in-stream-c/20240616-234811
base:   linus/master
patch link:    https://lore.kernel.org/r/20240616154531.38232-1-av2082000%40gmail.com
patch subject: [PATCH] slimbus: Fix struct and documentation alignment in stream.c
config: arc-randconfig-002-20240617 (https://download.01.org/0day-ci/archive/20240617/202406170228.1TcJ2eGD-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170228.1TcJ2eGD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170228.1TcJ2eGD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/slimbus/stream.c:28:1: warning: useless storage class specifier in empty declaration
      28 | };
         | ^


vim +28 drivers/slimbus/stream.c

    11	
    12	/**
    13	 * struct segdist_code - Segment Distributions code from
    14	 *	Table 20 of SLIMbus Specs Version 2.0
    15	 *
    16	 * @ratem: Channel Rate Multipler(Segments per Superframe)
    17	 * @seg_interval: Number of slots between the first Slot of Segment
    18	 *		and the first slot of the next  consecutive Segment.
    19	 * @segdist_code: Segment Distribution Code SD[11:0]
    20	 * @seg_offset_mask: Segment offset mask in SD[11:0]
    21	 */
    22	static const struct segdist_code {
    23		int ratem;
    24		int seg_interval;
    25		int segdist_code;
    26		u32 seg_offset_mask;
    27	
  > 28	};
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
