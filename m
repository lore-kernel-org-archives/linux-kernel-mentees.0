Return-Path: <SRS0=9x8T=H7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD602C4361A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Mar 2021 22:11:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FB7A6024A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Mar 2021 22:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FB7A6024A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D5E3843EC;
	Mon,  1 Mar 2021 22:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ru0PWJx3eipl; Mon,  1 Mar 2021 22:11:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 694B7843EB;
	Mon,  1 Mar 2021 22:11:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4141AC000A;
	Mon,  1 Mar 2021 22:11:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1E77C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 22:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D898C843EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 22:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EUp6-ED3Cfs3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 22:10:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay.hostedemail.com (smtprelay0004.hostedemail.com
 [216.40.44.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FBA2843EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 22:10:58 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 659B8180498A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 21:53:42 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 60027100E7B40;
 Mon,  1 Mar 2021 21:53:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: wind31_2101327276b7
X-Filterd-Recvd-Size: 1518
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Mon,  1 Mar 2021 21:53:38 +0000 (UTC)
Message-ID: <70877984ec78d837159dc643e3ae2b05fd91561c.camel@perches.com>
Subject: Re: [PATCH v8 0/3] checkpatch: add verbose mode
From: Joe Perches <joe@perches.com>
To: Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>,  mchehab@kernel.org
Date: Mon, 01 Mar 2021 13:53:35 -0800
In-Reply-To: <87tupu36xi.fsf@meer.lwn.net>
References: <20210226093827.12700-1-dwaipayanray1@gmail.com>
 <87tupu36xi.fsf@meer.lwn.net>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

On Mon, 2021-03-01 at 14:22 -0700, Jonathan Corbet wrote:
> Dwaipayan Ray <dwaipayanray1@gmail.com> writes:
> 
> > Add a new verbose mode to checkpatch. The verbose test
> > descriptions are read from the new checkpatch documentation
> > file at `Documentation/dev-tools/checkpatch.rst`, which
> > is also added by this series.
> 
> So I can certainly take the doc change, as requested.  Remind me,
> though...should I apply the whole set, or will the checkpatch changes go
> via another path?

There's no dedicated upstream path for checkpatch.
So please take the checkpatch changes too.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
