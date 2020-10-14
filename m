Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A5FC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 20:04:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB1B21D81
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 20:04:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="DmMNN2qm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEB1B21D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8225687E0F;
	Wed, 14 Oct 2020 20:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKp+tUz0mwHV; Wed, 14 Oct 2020 20:04:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AA92E87DE6;
	Wed, 14 Oct 2020 20:04:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F82EC07FF;
	Wed, 14 Oct 2020 20:04:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79CDAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 20:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 643A788244
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 20:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E25KixAykxa8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 20:04:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8E76388258
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 20:04:29 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id x20so298661ybs.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zGovuSkrqe3VpGrjEQXbflGvhILsF7fMmDOvOv0HZ20=;
 b=DmMNN2qmYsS4IUMJxDlpsTT/dyttCIlI2O/iRpGPsOoMVgY2VUB3FsKzLAdAllhOw6
 4WpXo9010agGLYSz5jufxNIum4wr/kq84c5wHHPZrFisDReUBtp/cNN7QU66pCr7twnU
 9qnOBQ966moAM6YTleIjUmrgQIKq+R9JM6DsNuqVDnKlPYpxYV/GLN9xC3Usg9hkTWKY
 H3aCOH+sgNsWBj+4p2m2RpM4iMEkCHBoAvLAf+yDq0Q+UHO6trWQ5RWvtf/Aw+0Mk5vK
 KCe3y8+0Bv23QOqUlh+X27SX0Uq2vvPEQ4nplyk9EwzpkLyA1Nq4ff6WPPlHSb+BZkZy
 pnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zGovuSkrqe3VpGrjEQXbflGvhILsF7fMmDOvOv0HZ20=;
 b=lqyLIDNlUQsX/T89u5RndUGffOeklcySo2lQLx4vuTjiccyNmCEtUyYw2xTr+veeE6
 jeMTG1s/VG37Ad5q7Fp5IhXSgRxTWbd9oTr7xuBAE+gZtHiEbW+LBzRWjpwNFqnbzQ0a
 RFglLVOCAJzGCvQTrdiIz4qYmAr6YnXqSYiEJrVUkgJDA+EbFu8189WzWYEWdqhSr1d5
 wvkFWsvg6YHCLtT9MlW3OT5cQaBxFk38tAztHcM5ynm7PpiUr7Sean3WyLhGFDK715Pt
 KboZPZ4MUa391UKOmWlpFEkkV9yNFeQSFLwXxzfisOc8EonRmwESzXkP33h/2YqVBk9D
 qKsg==
X-Gm-Message-State: AOAM533OPt/QwJp2QiYY9AGoNwK2Kasr2QHcVUMIJzDSc6kr0ZS0+Qn7
 QUc0Pa6g0THZObD5J8TrilfTcOUyxj54gsqSYgmffw==
X-Google-Smtp-Source: ABdhPJyEzfM9Ywu3QG2apMCdipxoXOO58m8ggHr0w0quLiQI/TLNpmE4HyYz3y8+OuT7tRmbBNkVGKUJhwp1vvzO8ds=
X-Received: by 2002:a25:d6c7:: with SMTP id n190mr584642ybg.75.1602705868286; 
 Wed, 14 Oct 2020 13:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200729201146.537433-1-vitor@massaru.org>
 <20200729203908.GD2655@hirez.programming.kicks-ass.net>
 <CADQ6JjW-=SNjV-abGpGA9NfHD4yGG_bD5FmvW99W-Vo06twkbw@mail.gmail.com>
 <20200804132517.GK2657@hirez.programming.kicks-ass.net>
 <CADQ6JjWzze-VAmg_b9EkS4iVySt5pw8V4FSxYpDFAj8jvBxuGA@mail.gmail.com>
 <20200804142344.GM2674@hirez.programming.kicks-ass.net>
 <CADQ6JjWbCsyWxZKQ5=kkxx8hkaW=mbCjDodPXDAv5vH-=tVvEQ@mail.gmail.com>
 <CAFd5g46DzWRzp9yXkpHbtyJuv236E=z7OaWeqXnfuiy6CTBL4A@mail.gmail.com>
 <CAP-5=fXhFG9sTMcfd1qJmMDNJWqOGky=jFtWNWg8U8-dkRp=dQ@mail.gmail.com>
 <20201014195948.GE2974@worktop.programming.kicks-ass.net>
In-Reply-To: <20201014195948.GE2974@worktop.programming.kicks-ass.net>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Wed, 14 Oct 2020 17:03:52 -0300
Message-ID: <CADQ6JjX+Hqw7Lm61BfMHrELya81boaYRrYmGH-o8xTBAgD_KSA@mail.gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ian Rogers <irogers@google.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, Ingo Molnar <mingo@kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: kunit: add test_min_heap
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

On Wed, Oct 14, 2020 at 5:00 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Oct 14, 2020 at 11:16:10AM -0700, Ian Rogers wrote:
>
> > There were some issues in the original patch, they should be easy to
> > fix. I'm more concerned that Peter's issues are addressed about the
> > general direction of the patch, verbosity and testing frameworks. I
> > see Vitor followed up with Peter but I'm not sure that means the
> > approach has been accepted.
>
> I kinda lost track, as long as it doesn't get more verbose I suppose I'm
> fine.


Ok. I'll send the v2 later with Ian's suggestions.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
