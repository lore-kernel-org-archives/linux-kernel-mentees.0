Return-Path: <SRS0=wdXo=FG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61278C64E8A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 09:50:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ADFC206F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 09:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ADFC206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF39186F0C;
	Wed,  2 Dec 2020 09:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PbpcJR0GeEFq; Wed,  2 Dec 2020 09:50:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7C19E86EFD;
	Wed,  2 Dec 2020 09:50:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61C78C0859;
	Wed,  2 Dec 2020 09:50:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CC8CC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 09:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EF27E2E187
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 09:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9bIRggOkKGj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 09:50:19 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by silver.osuosl.org (Postfix) with ESMTPS id B61DA2E183
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 09:50:19 +0000 (UTC)
IronPort-SDR: 5fQj18JZ1GKHb8h7DJHHX1NORAFwpUVb44GV0Y/Rxz9OgXlf9Qwx1gk7occ1JD0vycR9QfRFF2
 +GuGCggOUs+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="234595415"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="234595415"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 01:43:08 -0800
IronPort-SDR: PUay8JE6CyCYGQ6OEqTbAITVx1PocfHXw7Y+ZE7N83/IJBWZY2mgXSVQMEs3J47Ae/ZqgTCjZT
 PE1macl5QL+Q==
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="316040233"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 01:43:06 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1kkOgC-00BToQ-4M; Wed, 02 Dec 2020 11:44:08 +0200
Date: Wed, 2 Dec 2020 11:44:08 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <20201202094408.GW4077@smile.fi.intel.com>
References: <20201201071632.68471-1-98.arpi@gmail.com>
 <CAHp75VfV60sRAKkzvbEKW7UEZSiDmNVfd_kB-OOKZRk5MNMeDQ@mail.gmail.com>
 <e10ef8d3-f22b-db10-3784-c94ee425af46@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e10ef8d3-f22b-db10-3784-c94ee425af46@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: Convert test_hexdump.c
	to KUnit
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

On Wed, Dec 02, 2020 at 09:51:19AM +0530, Arpitha Raghunandan wrote:
> On 01/12/20 4:36 pm, Andy Shevchenko wrote:
> > On Tue, Dec 1, 2020 at 9:21 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:

...

> >> I ran both the original and converted tests as is to produce the
> >> output for success of the test in the two cases. I also ran these
> >> tests with a small modification to show the difference in the output
> >> for failure of the test in both cases. The modification I made is:
> >>  static const char * const test_data_4_le[] __initconst = {
> >> -       "7bdb32be", "b293180a", "24c4ba70", "9b34837d",
> >> +       "7bdb32be", "b293180a", "24c4ba70", "9b3483d",
> >>
> >> The difference in outputs can be seen here:
> >> https://gist.github.com/arpi-r/38f53a3c65692bf684a6bf3453884b6e
> > 
> > Looks pretty much good, what I'm sad to see is the absence of the test
> > statistics. Any ideas if we can get it back?
> > 
> 
> I could again include variable total_tests as was in the original test.
> Would that be fine?

What I;m talking about is the output. How it will be implemented (using the
same variable or differently) is up to you. So the point is I want to see the
statistics of success/total at the end.

I think this should be done in KUNIT rather than in the individual test cases.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
