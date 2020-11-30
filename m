Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9746AC63777
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 19:45:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB66F20709
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 19:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB66F20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 44DD9203B5;
	Mon, 30 Nov 2020 19:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RQ3MPVpVuEzh; Mon, 30 Nov 2020 19:45:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B88BD20010;
	Mon, 30 Nov 2020 19:45:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A221EC0859;
	Mon, 30 Nov 2020 19:45:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE01CC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 19:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D3BEF2033E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 19:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rqf31apjq82p
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 19:45:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0228.hostedemail.com
 [216.40.44.228])
 by silver.osuosl.org (Postfix) with ESMTPS id 6ABBE20010
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 19:45:52 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id C13EC8004D0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 19:37:35 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 58E7E181D3039;
 Mon, 30 Nov 2020 19:37:33 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: jar12_59094b1273a4
X-Filterd-Recvd-Size: 2194
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Mon, 30 Nov 2020 19:37:32 +0000 (UTC)
Message-ID: <ddfde921e75f36cab2cd924d45dfbd11e07c6768.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 30 Nov 2020 11:37:30 -0800
In-Reply-To: <CABJPP5C0eN5kC8-jB0Bes438GxWbwnNyYeN5a+6uym5MgyuBPw@mail.gmail.com>
References: <20201130144515.8320-1-dwaipayanray1@gmail.com>
 <c8eeab847fc09368ce270ea3e06ea0bbbd7d1b7f.camel@perches.com>
 <CABJPP5BLjbx3FbvB3nAOiHfkRLUo7s0n-vboE+AXJqrZXseUNQ@mail.gmail.com>
 <070109a56817288562a91dfeec74359eb948234e.camel@perches.com>
 <CABJPP5BxO20-YzbTZij4gZGm4R63iG_n2kH58pSz5mgyXXwVBw@mail.gmail.com>
 <40b6e1fa9fc638a7e755f7e91f401b6019fee2fa.camel@perches.com>
 <CABJPP5C0eN5kC8-jB0Bes438GxWbwnNyYeN5a+6uym5MgyuBPw@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix TYPO_SPELLING
 check for words with apostrophe
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, 2020-11-30 at 23:56 +0530, Dwaipayan Ray wrote:
> Thanks, this does resolve the original problem, but again the following
> line throws 0 warnings:
> =

> "zeebra" ther, yourr.
> =

> Any punctuation separators are ignored :(
> =

> =A0(?:^|\s)($misspellings)(?=3D[\s\.\,\:\;\"\?\!]|$)
> =

> Would this be acceptable rather? But again this doesn't
> handle [therr] or (therr).

No idea.
What does codespell use for its regex?
Maybe that should be used.

Maybe all the added lines should be collected and
codespell should be called on those lines instead.

Try other options and check if the overall cpu/wall clock use is reduced.

Adding codespell's dictionary was kind of a 'nice to have' option and
it's not likely that it matters a lot if it's perfect or not.

My presumption is that it's not frequently used, but hey, who knows.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
