Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAB8C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 06:47:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C610C2222A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 06:47:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+S8dxO/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C610C2222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4BEC6879E7;
	Wed, 14 Oct 2020 06:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ddAlvepsU67; Wed, 14 Oct 2020 06:47:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E2A91879E2;
	Wed, 14 Oct 2020 06:47:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE38EC0052;
	Wed, 14 Oct 2020 06:47:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF6C3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 06:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9D949879E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 06:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yDOwRal9o3M5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 06:47:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A901D879E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 06:47:12 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n6so2307920wrm.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 23:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=aylbH1DfQpUcVy+Ho1mHnrhoBqnWuhaaKBVoBIsMNMs=;
 b=H+S8dxO/fHqBX1svmL9av09z204iJfBFG2dzmfW7kTLrlZE9K6GhQR4Nz18skneEkr
 Mib+Q/4QHhq2qxWIvJWXvKIyjkWSr3Qmf1XcG3Rseo4CExqdEJqGVfBuax9+JTG+jF7R
 NWB/q1BluISDD9mzR7tFLOd6mMgttQbPNOmtISbywT7LicAp0HjpSNrqFP6c2gmBPlZq
 EoPsAIYyJk+029iX1B7QTIKkU45VI7keIsRf+NT0BWJHaccKkDOx1PUbqK6UX9drWNXr
 vLo3I/EL5GEUlzrotBQKXLWtox3Vj1WDXGClbhoWWhyk3eY90fjHYCigDL573UDB3ooJ
 DjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=aylbH1DfQpUcVy+Ho1mHnrhoBqnWuhaaKBVoBIsMNMs=;
 b=UXZmn01AIevYra4Udvv3JpmZlEM7ug7KIo7G5SVDoY1Ffp0zjv9nm+moyNx4N+Rf6y
 GNDousbvMRVA67FFQQM5O2tzY2mEj0au3EekGhVn0D42xZtyj5pwezpVBsIHhyAqV7sc
 yhMky4c20TYULLt9hXWOAxnwEqAU9FWdP56tpKM+NXEoeryYp6+PJP5nAWu6W6Lq4YVu
 k83RHVqpdTLViGIfPwZYAvilztPN5v2vorstvCme2bpWxmMtCmTz9pYTU9/oQibZFb9N
 l6sSeclu28fMz6Rx0IUyF4vwZ8/RR1aTZlOacX+UhEgLKCGWkldOYNoTBrR3N2Bxkz8B
 mqkw==
X-Gm-Message-State: AOAM531LKXtpITSmi4vFqaBmqPAFKjaZyTRkoHCY7+5o3Qq1hi+gwWHs
 4S88nWKRAWP36J/WvK7XXDo=
X-Google-Smtp-Source: ABdhPJypNMumZjt5eo37t9gtSa1xk32QUb4MQYkoQ6QNnE5TBzrbZrRPzTzszIZ3H7kVarfx7cK60Q==
X-Received: by 2002:a5d:40cb:: with SMTP id b11mr3903071wrq.254.1602658031098; 
 Tue, 13 Oct 2020 23:47:11 -0700 (PDT)
Received: from felia ([2001:16b8:2da8:8200:4c70:9c82:f3bf:bebb])
 by smtp.gmail.com with ESMTPSA id f5sm2132307wmh.16.2020.10.13.23.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 23:47:10 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 14 Oct 2020 08:47:09 +0200 (CEST)
X-X-Sender: lukas@felia
To: Joe Perches <joe@perches.com>
In-Reply-To: <04325089b524f20d3de167051bfb81b05083d8b1.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2010140842310.6186@felia>
References: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010140734270.6186@felia>
 <316d5a53351d10cd1a26ce0c54883da05642c898.camel@perches.com>
 <alpine.DEB.2.21.2010140812370.6186@felia>
 <be7deeec0937327e0ddaadf8468d934ed363a533.camel@perches.com>
 <alpine.DEB.2.21.2010140829150.6186@felia>
 <04325089b524f20d3de167051bfb81b05083d8b1.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH v2] checkpatch: add shebang
 check to EXECUTE_PERMISSIONS
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



On Tue, 13 Oct 2020, Joe Perches wrote:

> On Wed, 2020-10-14 at 08:36 +0200, Lukas Bulwahn wrote:
> > 
> > On Tue, 13 Oct 2020, Joe Perches wrote:
> > 
> > > On Wed, 2020-10-14 at 08:21 +0200, Lukas Bulwahn wrote:
> > > > What does checkpatch.pl warn about and what does clang-format still warn 
> > > > about, which is generally accepted okay as style in the kernel?
> > > 
> > > clang-format doesn't warn at all, it just reformats.
> > > 
> > You can run clang-format with --dry-run and then it would just state the 
> > proposed changes, right?
> 
> clang-format through at least version 10 does not have
> a --dry-run option.
> 
>

Just a quick check:

version 9 does not have the --dry-run option:

https://releases.llvm.org/9.0.0/tools/clang/docs/ClangFormat.html

version 10 does:

https://releases.llvm.org/10.0.0/tools/clang/docs/ClangFormat.html

and version 12 (under development) does keep it:

https://clang.llvm.org/docs/ClangFormat.html

I have not played around with that, though.

Lukas 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
