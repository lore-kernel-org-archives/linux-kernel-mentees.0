Return-Path: <SRS0=sW3u=BQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BA7C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Aug 2020 11:21:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F30BA206B5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Aug 2020 11:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F30BA206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0F4888889F;
	Thu,  6 Aug 2020 10:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4VTSNtLFtCn; Thu,  6 Aug 2020 10:05:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A81C588894;
	Thu,  6 Aug 2020 10:05:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 817D1C0050;
	Thu,  6 Aug 2020 10:05:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8341C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 10:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DD93A8697E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 10:05:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNKL6_ZUDJU5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 10:05:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 649C386E1C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 10:05:45 +0000 (UTC)
IronPort-SDR: w0VHvJ1dgjSItr8+Y+Pc1mHE/2o35SphrBsQSbHkf1yBsL9g4DZqqSHB7O2hfk6p/DkF0S3Fh9
 by3WjRsKYERQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="237622332"
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; d="scan'208";a="237622332"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 03:05:45 -0700
IronPort-SDR: rE3lJhlRUXmwvLUip+sH/wzJoWOMlybFBgk21RUiVATUNM9Yo0xhByxdA6k/S9SOSHDpi+iupS
 1254V3QJHu8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; d="scan'208";a="275037615"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga007.fm.intel.com with ESMTP; 06 Aug 2020 03:05:42 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k3cmK-006p2q-Lr; Thu, 06 Aug 2020 13:05:40 +0300
Date: Thu, 6 Aug 2020 13:05:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <20200806100540.GE3703480@smile.fi.intel.com>
References: <20200806094440.14962-1-98.arpi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806094440.14962-1-98.arpi@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: Convert test_hexdump.c to
	KUnit
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

On Thu, Aug 06, 2020 at 03:14:40PM +0530, Arpitha Raghunandan wrote:
> Converts test lib/test_hexdump.c to KUnit.
> More information about KUnit can be found at
> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
> KUnit provides a common framework for unit tests in the kernel.

...

> -	if (memcmp(test, real, TEST_HEXDUMP_BUF_SIZE)) {
> -		pr_err("Len: %zu row: %d group: %d\n", len, rowsize, groupsize);
> -		pr_err("Result: '%s'\n", real);
> -		pr_err("Expect: '%s'\n", test);
> -		failed_tests++;
> -	}
> +	KUNIT_EXPECT_EQ(kunittest, 0, memcmp(test, real, TEST_HEXDUMP_BUF_SIZE));


Ah, can you explain how user will see now what is being expected and what is in
reality in the buffer? I'm not gonna accept such changes without showing in
explicitly that user is not going to suffer of this change.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
