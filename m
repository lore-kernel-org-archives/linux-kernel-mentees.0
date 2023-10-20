Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26209C001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Oct 2023 10:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCB3660F40;
	Fri, 20 Oct 2023 10:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCB3660F40
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N3KOCQFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9I4RlUYlSqK; Fri, 20 Oct 2023 10:17:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B335760071;
	Fri, 20 Oct 2023 10:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B335760071
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E0D1C0039;
	Fri, 20 Oct 2023 10:17:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACB96C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Oct 2023 10:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 833E040C14
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Oct 2023 10:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 833E040C14
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=N3KOCQFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUxbH0bgT5Vw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Oct 2023 10:17:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB74C4050C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Oct 2023 10:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB74C4050C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697797061; x=1729333061;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zN/p4K4GbcPbjIQW5+xyHKJeKGHLoCpuaoTv2SA47FI=;
 b=N3KOCQFBr661jiFfMUfhDnSSA5ukbnibYF6V/CDPDc27XThIlfZtCZFA
 dFgRaJ0t9DxWegO7diXG744AB1NSy7oSUvXgK5iphPMPisUf6ZQAFpT30
 NiikF80C+zxVBhsjM2sI8PymA6evoEOSA4rjN/m0psECnPB3EfSZ7W9kW
 7rlCQyA7zPxTi61S+idf+PZRNuGCMgM/wKX7mdQjQrtsJZYhW7+JPCbVX
 THAyH/RK5zN79OOCZ5obWToTuGkMcJ0MLN34LGwG9hDr0r1xHTrDSoXpk
 D4IrCjDPPP80e18OL1oOrNehM5WliE23PAarY0C+wO8zW1x1m7wgiLplx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="472692461"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="472692461"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:17:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="901106702"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="901106702"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:15:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qtmZT-000000077Sz-30IT; Fri, 20 Oct 2023 13:17:35 +0300
Date: Fri, 20 Oct 2023 13:17:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: syzbot <syzbot+bbc59256015533127d80@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [kernel?] general protection fault in serio_handle_event
Message-ID: <ZTJTv0hjVAgexanB@smile.fi.intel.com>
References: <000000000000f014150604d5040a@google.com>
 <000000000000701c7d06081bb14d@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000701c7d06081bb14d@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: rafael@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Oct 19, 2023 at 06:21:34PM -0700, syzbot wrote:
> syzbot suspects this issue was fixed by commit:
> 
> commit fd6f7ad2fd4d53fa14f4fd190f9b05d043973892
> Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Date:   Mon Aug 28 14:58:24 2023 +0000
> 
>     driver core: return an error when dev_set_name() hasn't happened
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17a45b9d680000
> start commit:   65d6e954e378 Merge tag 'gfs2-v6.5-rc5-fixes' of git://git...
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ff0db7a15ba54ead
> dashboard link: https://syzkaller.appspot.com/bug?extid=bbc59256015533127d80
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11d70614680000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=130eedb8680000
> 
> If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: driver core: return an error when dev_set_name() hasn't happened

> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
