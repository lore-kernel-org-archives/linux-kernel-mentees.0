Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180155024A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 22:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlZ6FgSq"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E7914093C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 22:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E7914093C
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IlZ6FgSq
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i8ADzRY446kQ
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 28 Nov 2023 22:51:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5D10C409C3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 22:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D10C409C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701211871; x=1732747871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ztBJ4WMhhTqyzABcnjcpzEitF6N0C+6gJOSX759StWI=;
  b=IlZ6FgSqOABgY+QF66DlTm3XvCjwgKPPbf9fLxy5u8+raS1Ul55YtFNy
   asIwZWYNlT7xSCbbN8+y7Wa3EcSn9pl70FvZHBw6HL4nfFIamnCR5Af5c
   BXUi4lXUQdqnXTbPv9mtTOhnTuaVkQM3vNKo/kLRCPnBONltzhN+g1S9w
   GUvOuysubuEkRJQn0yBUJQ0tyebSQsU3VN1/ODk9QzZHVgIcRzPMwfu1R
   w+UAnrl256jX9Pl/PnbyVNxzXcrL5SsMjgEXnMTIgSx7vD9ms7vUxdpTl
   nC/Ln3hFIuOWjhAdFBqMaFixDnNO5V4V8U/9BvgnERtd6jqAdBo9m5Ogp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6304150"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6304150"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 14:51:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="839215213"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="839215213"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Nov 2023 14:51:05 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r86v1-0008Dw-0R;
	Tue, 28 Nov 2023 22:51:03 +0000
Date: Wed, 29 Nov 2023 06:50:53 +0800
From: kernel test robot <lkp@intel.com>
To: Petre Rodan <petre.rodan@subdimension.ro>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Petre Rodan <petre.rodan@subdimension.ro>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: pressure: add honeywell,hsc030
Message-ID: <202311290346.3SedpbhM-lkp@intel.com>
References: <20231128124042.22744-1-petre.rodan@subdimension.ro>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128124042.22744-1-petre.rodan@subdimension.ro>

Hi Petre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v6.7-rc3 next-20231128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Petre-Rodan/iio-pressure-driver-for-Honeywell-HSC-SSC-series-pressure-sensors/20231128-204804
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20231128124042.22744-1-petre.rodan%40subdimension.ro
patch subject: [PATCH v4 1/2] dt-bindings: iio: pressure: add honeywell,hsc030
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311290346.3SedpbhM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311290346.3SedpbhM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> Documentation/devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
