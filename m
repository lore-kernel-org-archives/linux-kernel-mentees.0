Return-Path: <SRS0=u3rr=6A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADDAC2BB85
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Apr 2020 23:12:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0DA821841
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Apr 2020 23:12:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="n9LgZ0jV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0DA821841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 943DD87EE9;
	Thu, 16 Apr 2020 23:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EBZjuTVYHxID; Thu, 16 Apr 2020 23:12:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C30987E65;
	Thu, 16 Apr 2020 23:12:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31FECC1AE8;
	Thu, 16 Apr 2020 23:12:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DA82C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Apr 2020 23:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 41F0387EDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Apr 2020 23:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g87p4s1SoVBe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Apr 2020 23:12:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CF3AC87E65
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Apr 2020 23:12:10 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f8so219693plt.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Apr 2020 16:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qHnZMVe5Y7EDy73UocFbOqkOic/ITzFdjJim0WbrCVg=;
 b=n9LgZ0jVDeOIG0dfjM08EFewOl7JGzK1/ZndCN6VfuY6rsSsFEtpwkN3C6cLgd1uzQ
 aEZqc4K0sm8GJmecM+3Pc/OF6Ym6gj18zcOl5Qo7H1p/2YUXyuT6WzJAuvdd4mpm3S1b
 ccnvtOaThM3rMC456ydHEv88YQQa+vz/Cmocsa5AQb9pABrf/zoniuCCNIcFgzr78p1A
 Nq+ALGXBXXZB4F/OGrqGfbQ6Y79gvKlk3qY31sBqKnHGDKdtqNtax3gK5jk9YB/6bX1s
 TRo54mCyR5uuJ38KnuIY9bC2dCmr2/cWYJet3e9gzl7rinBbfuAzIYLDz/rp2NnTGOf9
 BI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qHnZMVe5Y7EDy73UocFbOqkOic/ITzFdjJim0WbrCVg=;
 b=qXm570Ehab0uPNHfwSpIqGjLLFuOQJ1zMxFoNyJUr/SI4YYPz6K6ei1Co7cbq0iOoD
 PBv8c2jCQjbPbdFmRUe9y+GiQEeUjx38lTl8z2dZ88vI4+8mRX1wSw8lS7GrSuDhIrQx
 5NBtpSfksgwe2NU4qjIS+OEHv/SIc6CCbxu7etBxQWoYvQY56SIHUuaAdIWR7POrW6pQ
 fyM3jOax9UwFltlhz+z/Ws+h7mHud+vimFCETHezkd8oKTGdlezvkuGDNoHtZeSOsHOC
 lNMzQ99qS/tsK3Xwqj0PG/ATNRIEHPAiZRBSiFLyFBUmpnP9YdmX7nF6r86RNowl4q2e
 LmzQ==
X-Gm-Message-State: AGi0PuYa6u/sGSzpg/a7lnbzULhotEEfFZxlbZjvzeEqLzxX1JaVQCFy
 bQkiDu9LHpBuI3a7SZ4WsLhL/nCWB/+j5n2KlSfQYA==
X-Google-Smtp-Source: APiQypJzSIA7M8WieLTPiRB0Atlxe05VI645b6MAkDHdrAbIL8/iKZz4Cfptd+4ZR7WHMXeYTkLG5HT32gZYTfR/mK8=
X-Received: by 2002:a17:90a:3568:: with SMTP id
 q95mr852976pjb.47.1587078730154; 
 Thu, 16 Apr 2020 16:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200414230950.83665-1-vitor@massaru.org>
In-Reply-To: <20200414230950.83665-1-vitor@massaru.org>
Date: Thu, 16 Apr 2020 16:11:58 -0700
Message-ID: <CAFd5g47CaeEBiJsiSUtihHQF+OGpfCg76dS2ys2mwy2qn_L5-w@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [RESEND] kunit: use --build_dir=.kunit
	as default
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Apr 14, 2020 at 4:09 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> To make KUnit easier to use, and to avoid overwriting object and
> .config files, the default KUnit build directory is set to .kunit
>
>  * Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205221
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
