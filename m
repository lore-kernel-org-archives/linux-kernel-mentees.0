Return-Path: <SRS0=GiD0=3H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE03C32771
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jan 2020 04:07:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35AEA2192A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jan 2020 04:07:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he/HqRKh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35AEA2192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0C42B86A29;
	Sat, 18 Jan 2020 04:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JfvP2X_eJoL1; Sat, 18 Jan 2020 04:07:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A27DC86A14;
	Sat, 18 Jan 2020 04:07:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96AA5C1D81;
	Sat, 18 Jan 2020 04:07:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F38BFC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 04:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EF896221B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 04:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h9Eda2t90Pdd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 04:07:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id B469A20410
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 04:07:39 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id n96so4047446pjc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 20:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PIRa3Me1MuVP3scCn41TBw4mEuh3lRWcGYrwRLyuooo=;
 b=he/HqRKhdajTtzeAyutff/zMg8NhVoykxV8x8Lct0t2F+5QE+FJpEcsML/xjMv9DhO
 d21j+fpDGqrbXw7sgfg6XBrVGM6pQXGxJYD69E/6oWwKB7VW+++zgPYaSn6XywzMLSic
 VrvW06fTfC36SWN63zIYrFvMYdjpmV/s0tNervXM7wL3DGp12Jm6dMqd4bVx05KuYPdH
 Gd9EbcwrRuP4JMT2O4ovdHD0R/moQ3zufVkLenWPKEFpBhvmVvhkMShTlNKhDwbit67H
 esBV168gY1H3UlDETGjx4uJ9oVKusU7pZha/xjH/cr/GBjdEE+U64cDt/Q8XyCV5tT5T
 FDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PIRa3Me1MuVP3scCn41TBw4mEuh3lRWcGYrwRLyuooo=;
 b=gwSqDMGBhoMEvza/mFF6QFGKz+Fm4vDzGWaRcsI86R8FUZ5GHH4XvSEZ6lgYyrXGsd
 OEnDMDKlgcnDCWrX61L6x1QgdGDLJQ/O1gBYAnX8f5nHzCtSwdBFxaw8aIBUBn2AsPpv
 liFptRGzy1G//mRJbqUeUa32/VOZ0YSMq3s9bAhqEutLQJf+02TalgBEqdNbZk2T2/pB
 tkRT7RhJ6E/FOy4BuZNpW8M+52JFs7HcFKDpfCvVbVN5nkKKSp6wHARo5yHqPv6RT0UW
 PY6tdJh0YaM2lfMeQu8uzAhx8cd0KbPqpedFVhUUcBuSjYWDmdonCpiYiLLxdZqaRojA
 OMDQ==
X-Gm-Message-State: APjAAAXPh4P4ZaIJJTj0kUfExv76xDOWbGrhQ1t9BorYdzfFyqkJeivx
 QpcD4/9tpcqhn10KJcp6nus=
X-Google-Smtp-Source: APXvYqzn4rsu/9mzBMbb1i9gkk/w2Y1AZ9IYMLGgk0U3+gBrOS0TVCTIxhXEQRQCTFVx+2cV2J+Y+g==
X-Received: by 2002:a17:902:b212:: with SMTP id
 t18mr2853630plr.135.1579320459261; 
 Fri, 17 Jan 2020 20:07:39 -0800 (PST)
Received: from workstation-portable ([146.196.37.181])
 by smtp.gmail.com with ESMTPSA id c18sm30565333pfr.40.2020.01.17.20.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 20:07:38 -0800 (PST)
Date: Sat, 18 Jan 2020 09:37:30 +0530
From: Amol Grover <frextrite@gmail.com>
To: Olof Johansson <olof@lixom.net>
Message-ID: <20200118040730.GA6783@workstation-portable>
References: <20200117133048.31708-1-frextrite@gmail.com>
 <5d77df7f-8693-0232-dbfe-0acfc37e040f@oracle.com>
 <20200117192555.baoxu4xd7krxgfjz@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117192555.baoxu4xd7krxgfjz@localhost>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: "Paul E . McKenney" <paulmck@kernel.org>, santosh.shilimkar@oracle.com,
 linux-kernel@vger.kernel.org, arm-soc <arm@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] drivers: soc: ti:
 knav_qmss_queue: Pass lockdep expression to RCU lists
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

On Fri, Jan 17, 2020 at 11:25:55AM -0800, Olof Johansson wrote:
> On Fri, Jan 17, 2020 at 10:24:04AM -0800, santosh.shilimkar@oracle.com wrote:
> > On 1/17/20 5:30 AM, Amol Grover wrote:
> > > inst->handles is traversed using list_for_each_entry_rcu
> > > outside an RCU read-side critical section but under the protection
> > > of knav_dev_lock.
> > > 
> > > Hence, add corresponding lockdep expression to silence false-positive
> > > lockdep warnings, and harden RCU lists.
> > > 
> > > Add macro for the corresponding lockdep expression.
> > > 
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > ---
> > > v2:
> > > - Remove rcu_read_lock_held() from lockdep expression since it is
> > >    implicitly checked for.
> > > 
> > Looks fine to me.
> > 
> > Hi Olof, Arnd,
> > Can you please pick this one and apply to your driver-soc branch ?
> > I already sent out pull request and hence the request.
> 
> Hi,
> 
> Can you please email the whole patch with sign-off to
> soc@kernel.org? Otherwise it won't end up in patchwork, which is how we track
> patches and pull requests these days.
> 

Thank you Santosh and Olof. I'm resending the patch to soc@kernel.org
as well.

Thanks
Amol

> 
> Thanks,
> 
> -Olof
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
