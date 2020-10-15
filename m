Return-Path: <SRS0=0JRt=DW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE97C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 17:55:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53F9A22260
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 17:55:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="zQJqUMJb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53F9A22260
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B255D88893;
	Thu, 15 Oct 2020 17:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNoVJ3BVKu-1; Thu, 15 Oct 2020 17:55:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3449188889;
	Thu, 15 Oct 2020 17:55:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B504C0052;
	Thu, 15 Oct 2020 17:55:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55432C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 17:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 43D528847C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 17:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oNoZjMApwbRU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 17:55:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4CCEF88479
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 17:55:01 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id h9so2971468ybm.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 10:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RNMeTvOaz0/h5HrgVdhcL0I723yFp6eeFhAhKe832tM=;
 b=zQJqUMJbqE10ZDoKYvabI/IVuow1p9ef3k/Xbjk1edMb/E4/ELSAWeJbhMhnNTtZr8
 rGWQSQIkzaphHykRwMilrYtSrJt+ab04A3b7kvsRVLsAi149Y7t0L+ug+dQFIbcTOufy
 WO9pvVnf/mO2fRfSuF86nj2/n2G9CAV0WCn9qXfqlZb8ZA9WgSNn4YXIjU3heXAFphIt
 baSCChawLtd6EJx5PZ600yPVOYgMet9x3eW5qqt6JQt0sCx2eGKfu9lpjUA5cPZFiFTI
 Lfo87vlafID5WJmXytXlMnHOPCdJ1k8l6wPDZVtRZ8AFtCFwenhb6mTN1QqQ9YdDncZz
 a18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RNMeTvOaz0/h5HrgVdhcL0I723yFp6eeFhAhKe832tM=;
 b=XkqJnv928S4DLM9h58k/1G3QzPXOyYXGsque0rTBvMZkrUyFd6zIbvsbAuJ+COpFyr
 TKjJeNPQnLlLZLnwhTxWFPpp2ZauHpm+ZNbBPiR4DHa0LwfwyNQjgYRTB5X4OefOYbnF
 4JiN8Yg7Sj3eJiH+QHgojcS/C2X47avNaNtbOcbDsuJQS2tZ4fgHlet6h3j+48CgvlSS
 guzEmlwL0E/HCxVbBRFflCGPrNp3WvVnIHyTMsvqjrAsEIKl+AqREyi1PZmmKdu3IedK
 CMuoQ3uXsOLByzicNumFQARljZAje4z1vqg5B/dsUpu+baft4hAhJuJstM0ui2OJqWGr
 +d9Q==
X-Gm-Message-State: AOAM532Sq0ONKrH414L1AMVkRVWCev5BD2Fgb2wIOHaQbiXII1Ac8l//
 RXMObDgsZApYW4/YcOgTrsSYCNJY7k9NMQtvhvJI2w==
X-Google-Smtp-Source: ABdhPJxwp0LTMI67BFC1GnQldzIHFWKrt37t3xVhpxf9+u2vv32ZtNDxZ9ocgvw95gQ/gCNeE8r7pZNvgJvyvREPDlE=
X-Received: by 2002:a25:2311:: with SMTP id j17mr7280173ybj.362.1602784500232; 
 Thu, 15 Oct 2020 10:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201015014616.309000-1-vitor@massaru.org>
 <20201015105105.GS4077@smile.fi.intel.com>
In-Reply-To: <20201015105105.GS4077@smile.fi.intel.com>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Thu, 15 Oct 2020 14:54:24 -0300
Message-ID: <CADQ6JjVxRGLr3-fY-Ovmq+oZHdsNbWg43RVa8-tsT-=3tKb1pA@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marco Elver <elver@google.com>, mhocko@suse.com, arnd@arndb.de,
 torvalds@linux-foundation.org, Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 elfring@users.sourceforge.net, paul.gortmaker@windriver.com,
 geert@linux-m68k.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 tglx@linutronix.de, linux-kernel-mentees@lists.linuxfoundation.org,
 akpm@linux-foundation.org, KUnit Development <kunit-dev@googlegroups.com>
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

On Thu, Oct 15, 2020 at 7:50 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Oct 14, 2020 at 10:46:16PM -0300, Vitor Massaru Iha wrote:
> > This adds the conversion of the runtime tests of test_list_sort,
> > from `lib/test_list_sort.c` to KUnit tests.
>
> Please, provide better commit message. For example, add the output of _succeeded_
> *and* _failed_ test cases (yes, you have to break code manually to reproduce failed
> test cases) _before_ *and* _after_ the change.

Sure, I'll do it. Thanks!

> W/o above information I'm going to NAK this as I promised before.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
