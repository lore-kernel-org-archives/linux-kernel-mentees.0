Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDD4C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 11:48:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C6AF21D95
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 11:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C6AF21D95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0CC5586A7F;
	Thu, 30 Jul 2020 11:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAF7Ban-R2yW; Thu, 30 Jul 2020 11:48:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 68766862D4;
	Thu, 30 Jul 2020 11:48:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C30EC004F;
	Thu, 30 Jul 2020 11:48:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24664C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 11:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0CBBE87ADB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 11:48:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HIR5t-dQmFKL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 11:48:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 84EE68664E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 11:48:47 +0000 (UTC)
IronPort-SDR: MlavBrHr7Gc+d4sIkiIHvenbVivW6NX8uipDYv3XNd0OhKss2IF1qeP8wJdNogpBrBCKjJcx/c
 EczEnbFaLqDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="149415531"
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; d="scan'208";a="149415531"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 04:48:47 -0700
IronPort-SDR: wmlhB2ZzttBFINXRufelrxv8L53CImhLZ6YLEBjkVR5V0gkzH1JXuIS1XD0H6dLKepNgiLNPuq
 Qw0S9w3OkVZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; d="scan'208";a="491097611"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga005.fm.intel.com with ESMTP; 30 Jul 2020 04:48:43 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k173C-004ugB-9a; Thu, 30 Jul 2020 14:48:42 +0300
Date: Thu, 30 Jul 2020 14:48:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200730114842.GH3703480@smile.fi.intel.com>
References: <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CACRpkda7k4L+nqAYE6z2FVZF-WT2Pm3CHH_=fW24xz_u+QCMRQ@mail.gmail.com>
 <20200728130632.GI1913@kadam>
 <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
 <CAMRc=MciXb152=CHAi1kfpwFuELLN55-BfNOo8hBg8Tzp4wMnQ@mail.gmail.com>
 <CAK8P3a1m7C0rGGEHvndhxun2TyFh-cweNnPHp-rDtu7Z=YyUKw@mail.gmail.com>
 <20200730083833.GD3703480@smile.fi.intel.com>
 <CAK8P3a2i2mnRPZ-f9UNxPNJcjyjdTOA7-fgcMqavsV8Ab17RkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2i2mnRPZ-f9UNxPNJcjyjdTOA7-fgcMqavsV8Ab17RkQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
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

On Thu, Jul 30, 2020 at 11:18:04AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 30, 2020 at 10:38 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Jul 30, 2020 at 10:15:24AM +0200, Arnd Bergmann wrote:
> > > On Thu, Jul 30, 2020 at 10:07 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

...

> > > I would argue that it needs to be fixed anyway, unless you also want
> > > to remove the v1 interface for native mode. If this works on 32-bit
> > > kernels, on 64-bit kernels with 64-bit user space and on compat
> > > 32-bit user space on 64-bit non-x86 architectures, I see no reason
> > > to leave it broken specifically on x86 compat user space. There are
> > > still reasons to use 32-bit x86 user space for low-memory machines
> > > even though native i386 kernels are getting increasingly silly.
> >
> > It was possible to "fix" (mitigate to some extent) before libgpiod got support
> > for several events in a request. Now it seems to be impossible to fix. AFAIU we
> > must discard any request to more than one event in it.
> 
> Any reason why the workaround I suggested above would not work?

That is the question to somebody who has better understanding. If it works,
I vote up to get it fixed with little effort. I would be glad to test patches!

> The in_ia32_syscall() check should be completely reliable in telling whether
> we are called from read() by an ia32 task or not, and we use the same
> logic for input_event, which has a similar problem (on all compat architectures,
> not just x86).

By the way any reason why we have to have in_ia32_syscall() instead of
in_compat_syscall()?

> > However I'm not an expert in compat IOCTL code (you are :-) and perhaps you may
> > provide ideas better than mine.
> 
> What makes this interface tricky is that this is actually a read() call, not
> ioctl() which is usually easier because it encodes the data length in the
> command code. As far as I could tell from skimming the interface, the
> ioctls are actually fine here.

Right.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
