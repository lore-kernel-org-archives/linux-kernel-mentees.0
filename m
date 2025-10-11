Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CE023506F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 11 Oct 2025 07:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760168917; cv=none; b=VdxDVr+edW0sfG+gRa2oDs1r4k89/XPVKy+6pONBA6IVP+QMag18uli5gMdtpBxG/NDMgIvCGrl7pg3pPQtklB7Rrl7kl/aYpTDeOUou93XVnhEqe059/yQFA3XzsOUwIN3nQ1pfLzjHsfrWRgU805o6kAm8f8nIk+bM7FvTY3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760168917; c=relaxed/simple;
	bh=LHHPf2UPJZHB06XnOCsmcRYEMeWIuhBk1mgQHMhJ01g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLA1mfXgbTRK+1B/SjKSVtYv1sd8W5XtyRuczCLZQnHSSnG+uTR/yQX0JXa03aBgqlMetgMaZOMC4uabV2nY/N5wNVxrJ4wufYO1o2mgpAZqYp1yw4gKIZ+uljIA0L79LV4NGrxPjM7QGtIhpH8tu2+Kqpew5ubyvN2JUT1eu0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iCHtlip/; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCHtlip/"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE40D608F1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 11 Oct 2025 07:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbhMC0gKqPQn for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Oct 2025 07:48:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B7F296069F
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7F296069F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iCHtlip/
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B7F296069F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 11 Oct 2025 07:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760168914; x=1791704914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LHHPf2UPJZHB06XnOCsmcRYEMeWIuhBk1mgQHMhJ01g=;
  b=iCHtlip/Fucxx9MfoOckL3HmvaSytkkw1PMHXCKJ+c6xQvGjMmNFmedP
   Mz4B8E0nZcIRTZcshFsvuTnUgSSnzBV4UaLUBSBWaD3zNy3ya5z1+8SGt
   VLvMW7nsv4nwgE1ebm68OHE7IvLytCAvQ72CyRXbYoXIWOYRuvstaFrg3
   m4HH9L9WNQqgRV/MSg3U8ynyyYaT5qsqPiiJ0jPeGCWtIy5TdS9ZLqDKE
   xHG2hL6HsI7HUXVyIxK5iuLZ96P2GpFewPc7NhasmIyqaHhFDWJeM8aZC
   2h7GrqfYrp3qC1I6yca13L9JkviyZfpo4bImkmUjvVdewdFtC2TwCjQME
   w==;
X-CSE-ConnectionGUID: F4LrEZklSsmtLQIR5bwGiA==
X-CSE-MsgGUID: eXO0CnemRxCax1bYaE1LIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73820266"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="73820266"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 00:48:31 -0700
X-CSE-ConnectionGUID: ZK1hUfyNTlGOlZ3+a5VOhg==
X-CSE-MsgGUID: kvHUn0d+S8ip7VmHV25tLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="181168851"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Oct 2025 00:48:28 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7UL4-0003ch-0V;
	Sat, 11 Oct 2025 07:48:26 +0000
Date: Sat, 11 Oct 2025 15:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ranganath V N <vnranganath.20@gmail.com>, tytso@mit.edu,
	adilger.kernel@dilger.ca
Cc: oe-kbuild-all@lists.linux.dev, linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org, Ranganath V N <vnranganath.20@gmail.com>
Subject: Re: [PATCH] fs: ext4: fix uninitialized symbols
Message-ID: <202510111521.OLlwqh7d-lkp@intel.com>
References: <20251008171614.12129-1-vnranganath.20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008171614.12129-1-vnranganath.20@gmail.com>

Hi Ranganath,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ranganath-V-N/fs-ext4-fix-uninitialized-symbols/20251010-065232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20251008171614.12129-1-vnranganath.20%40gmail.com
patch subject: [PATCH] fs: ext4: fix uninitialized symbols
config: i386-randconfig-063-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111521.OLlwqh7d-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111521.OLlwqh7d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111521.OLlwqh7d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ext4/inode.c:3547:34: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] next_pblk @@     got void * @@
   fs/ext4/inode.c:3547:34: sparse:     expected unsigned long long [usertype] next_pblk
   fs/ext4/inode.c:3547:34: sparse:     got void *

vim +3547 fs/ext4/inode.c

  3540	
  3541	static int ext4_map_blocks_atomic_write_slow(handle_t *handle,
  3542				struct inode *inode, struct ext4_map_blocks *map)
  3543	{
  3544		ext4_lblk_t m_lblk = map->m_lblk;
  3545		unsigned int m_len = map->m_len;
  3546		unsigned int mapped_len = 0, m_flags = 0;
> 3547		ext4_fsblk_t next_pblk = NULL;
  3548		bool check_next_pblk = false;
  3549		int ret = 0;
  3550	
  3551		WARN_ON_ONCE(!ext4_has_feature_bigalloc(inode->i_sb));
  3552	
  3553		/*
  3554		 * This is a slow path in case of mixed mapping. We use
  3555		 * EXT4_GET_BLOCKS_CREATE_ZERO flag here to make sure we get a single
  3556		 * contiguous mapped mapping. This will ensure any unwritten or hole
  3557		 * regions within the requested range is zeroed out and we return
  3558		 * a single contiguous mapped extent.
  3559		 */
  3560		m_flags = EXT4_GET_BLOCKS_CREATE_ZERO;
  3561	
  3562		do {
  3563			ret = ext4_map_blocks(handle, inode, map, m_flags);
  3564			if (ret < 0 && ret != -ENOSPC)
  3565				goto out_err;
  3566			/*
  3567			 * This should never happen, but let's return an error code to
  3568			 * avoid an infinite loop in here.
  3569			 */
  3570			if (ret == 0) {
  3571				ret = -EFSCORRUPTED;
  3572				ext4_warning_inode(inode,
  3573					"ext4_map_blocks() couldn't allocate blocks m_flags: 0x%x, ret:%d",
  3574					m_flags, ret);
  3575				goto out_err;
  3576			}
  3577			/*
  3578			 * With bigalloc we should never get ENOSPC nor discontiguous
  3579			 * physical extents.
  3580			 */
  3581			if ((check_next_pblk && next_pblk != map->m_pblk) ||
  3582					ret == -ENOSPC) {
  3583				ext4_warning_inode(inode,
  3584					"Non-contiguous allocation detected: expected %llu, got %llu, "
  3585					"or ext4_map_blocks() returned out of space ret: %d",
  3586					next_pblk, map->m_pblk, ret);
  3587				ret = -EFSCORRUPTED;
  3588				goto out_err;
  3589			}
  3590			next_pblk = map->m_pblk + map->m_len;
  3591			check_next_pblk = true;
  3592	
  3593			mapped_len += map->m_len;
  3594			map->m_lblk += map->m_len;
  3595			map->m_len = m_len - mapped_len;
  3596		} while (mapped_len < m_len);
  3597	
  3598		/*
  3599		 * We might have done some work in above loop, so we need to query the
  3600		 * start of the physical extent, based on the origin m_lblk and m_len.
  3601		 * Let's also ensure we were able to allocate the required range for
  3602		 * mixed mapping case.
  3603		 */
  3604		map->m_lblk = m_lblk;
  3605		map->m_len = m_len;
  3606		map->m_flags = 0;
  3607	
  3608		ret = ext4_map_blocks(handle, inode, map,
  3609				      EXT4_GET_BLOCKS_QUERY_LAST_IN_LEAF);
  3610		if (ret != m_len) {
  3611			ext4_warning_inode(inode,
  3612				"allocation failed for atomic write request m_lblk:%u, m_len:%u, ret:%d\n",
  3613				m_lblk, m_len, ret);
  3614			ret = -EINVAL;
  3615		}
  3616		return ret;
  3617	
  3618	out_err:
  3619		/* reset map before returning an error */
  3620		map->m_lblk = m_lblk;
  3621		map->m_len = m_len;
  3622		map->m_flags = 0;
  3623		return ret;
  3624	}
  3625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
