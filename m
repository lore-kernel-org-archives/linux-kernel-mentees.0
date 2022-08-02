Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9608C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  2 Aug 2022 06:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 388D8607F5;
	Tue,  2 Aug 2022 06:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 388D8607F5
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i9m2hzue
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M89oEALEpSZv; Tue,  2 Aug 2022 06:50:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1C9F060AC6;
	Tue,  2 Aug 2022 06:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C9F060AC6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 090EAC0033;
	Tue,  2 Aug 2022 06:50:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 977A0C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 06:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7302B4048E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 06:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7302B4048E
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=i9m2hzue
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OwTTyi6xosmB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 06:50:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71510400CC
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71510400CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 06:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659423013; x=1690959013;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Em4r8waKeUhhrtXpfrHO7VA66HUnkdX4I+KJBKy59zY=;
 b=i9m2hzue420/jzXqaKcUqPJ/s+kZH3bwfmekhGRIv6N8j20sJGYxf4wU
 1BbpCPgCdoyf19YUMSsFaYZiZmfvv+7TFDio7pUuBHMpJAOsm70klRZTH
 ghRS3YTdQcFqtH+ZcaaCcEJErb34r4Zvn0bHsqsCTsiUi/vxEY16p1Ucq
 uZ3Ku4T17Oqj5mvZGHTpJw6dcoDIxtcAj8wZbGf4+c9SCaklW4lOi9YJR
 UR2Dn/WhxcLqnmENkGHTSfsDBHO/fKAfd5JJfKljvDQuwUK0dG6jK+AZz
 1z74Z9a9cuSxLu5rVP2yBBwK7L8+1i04wwBFOMbb2pIuz7Lvahk6r+I3V Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="289349603"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="289349603"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 23:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="744561851"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2022 23:50:08 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oIljD-000Fn7-39;
 Tue, 02 Aug 2022 06:50:07 +0000
Date: Tue, 2 Aug 2022 14:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Gautam Menghani <gautammenghani201@gmail.com>,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shuah@kernel.org
Subject: Re: [PATCH] selftests/net: Refactor xfrm_fill_key() to use array of
 structs
Message-ID: <202208021442.LI0ioKrz-lkp@intel.com>
References: <20220731170316.71542-1-gautammenghani201@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220731170316.71542-1-gautammenghani201@gmail.com>
Cc: kbuild-all@lists.01.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Gautam Menghani <gautammenghani201@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Gautam,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on klassert-ipsec-next/master]
[also build test WARNING on klassert-ipsec/master net-next/master net/master linus/master v5.19 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gautam-Menghani/selftests-net-Refactor-xfrm_fill_key-to-use-array-of-structs/20220801-010446
base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git master
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/deea0844458f9991c45aff2949b7180a95105752
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gautam-Menghani/selftests-net-Refactor-xfrm_fill_key-to-use-array-of-structs/20220801-010446
        git checkout deea0844458f9991c45aff2949b7180a95105752
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> ipsec.c:83:1: warning: useless storage class specifier in empty declaration
      83 | };
         | ^
   ipsec.c: In function 'xfrm_fill_key':
>> ipsec.c:812:13: warning: unused variable 'i' [-Wunused-variable]
     812 |         int i = 0;
         |             ^

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
