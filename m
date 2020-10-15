Return-Path: <SRS0=0JRt=DW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38269C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 10:50:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE3DC22249
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 10:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE3DC22249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5496D8827E;
	Thu, 15 Oct 2020 10:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z4TsYB76BkHH; Thu, 15 Oct 2020 10:50:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1993484312;
	Thu, 15 Oct 2020 10:50:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F36EDC07FF;
	Thu, 15 Oct 2020 10:50:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABED7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 10:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 915FB87F11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 10:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QJ237xRyH1j
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 10:50:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4719287ED0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 10:50:08 +0000 (UTC)
IronPort-SDR: sdp2ncfbfDpqcBbfEPTDTxpScCiCwtXHJWgD8ZcJPS4eI+jh4gyK1FlMHNUyKEItpv08FCvi8p
 ATjG4rarasXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9774"; a="165533374"
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; d="scan'208";a="165533374"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 03:50:07 -0700
IronPort-SDR: XRJgxpgsxB4D8wBiqZnKJX82Bk4f1AUWT+2R8p9xT6iB3rw/VzqF/BhBLRPBXaIElicUARBrwz
 Ddg00+IephIg==
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; d="scan'208";a="330757409"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 03:50:03 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kT0qf-007N8B-4h; Thu, 15 Oct 2020 13:51:05 +0300
Date: Thu, 15 Oct 2020 13:51:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <20201015105105.GS4077@smile.fi.intel.com>
References: <20201015014616.309000-1-vitor@massaru.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015014616.309000-1-vitor@massaru.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: elver@google.com, mhocko@suse.com, arnd@arndb.de,
 torvalds@linux-foundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, elfring@users.sourceforge.net,
 paul.gortmaker@windriver.com, geert@linux-m68k.org,
 linux-kselftest@vger.kernel.org, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, akpm@linux-foundation.org,
 kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2] lib: kunit: add list_sort
	test conversion to KUnit
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

On Wed, Oct 14, 2020 at 10:46:16PM -0300, Vitor Massaru Iha wrote:
> This adds the conversion of the runtime tests of test_list_sort,
> from `lib/test_list_sort.c` to KUnit tests.

Please, provide better commit message. For example, add the output of _succeeded_
*and* _failed_ test cases (yes, you have to break code manually to reproduce failed
test cases) _before_ *and* _after_ the change.

W/o above information I'm going to NAK this as I promised before.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
