Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E450C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 21:17:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06F1B20786
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 21:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06F1B20786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CE2BC870B3;
	Mon, 27 Jul 2020 21:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5sqGyeb5QEMC; Mon, 27 Jul 2020 21:17:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D9C4E87048;
	Mon, 27 Jul 2020 21:17:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5570C0050;
	Mon, 27 Jul 2020 21:17:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF173C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 21:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CA8F68685A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 21:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 382e63M3nF9H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 21:17:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0124.hostedemail.com
 [216.40.44.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 93C6A868BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 21:17:12 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 5B5901800B47D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 21:17:11 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id C73A0181D3025;
 Mon, 27 Jul 2020 21:17:08 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: pot49_0c11edd26f64
X-Filterd-Recvd-Size: 7080
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Mon, 27 Jul 2020 21:17:07 +0000 (UTC)
Message-ID: <833b5e2a19b8a811dc9a058049e29a60a4598716.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Nachiket Naganure
 <nachiketun8@gmail.com>
Date: Mon, 27 Jul 2020 14:17:06 -0700
In-Reply-To: <alpine.DEB.2.21.2007272229280.15655@felia>
References: <20200727055458.559558-1-nachiketun8@gmail.com>
 <66bbaec73d8f69541535db5390c0f12b304c0467.camel@perches.com>
 <20200727071159.GA595854@endurance>
 <alpine.DEB.2.21.2007272229280.15655@felia>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Cc: apw@canonical.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: disable commit log
 length check warning for signature tag
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

On Mon, 2020-07-27 at 22:34 +0200, Lukas Bulwahn wrote:
> On Mon, 27 Jul 2020, Nachiket Naganure wrote:
> > On Sun, Jul 26, 2020 at 11:14:42PM -0700, Joe Perches wrote:
> > > On Mon, 2020-07-27 at 11:24 +0530, Nachiket Naganure wrote:
[]
> > > OK, but the test should be:
> > > 
> > > 		      $line =~ /^\s*$signature_tags/ ||
> > > 
> > > so the line has to start with a signature and
> > > it won't match on signature tags in the middle
> > > of other content on the same line.
> > > 
> > > 
> > But the suggested won't work in case of merged signatures.
> > Such as "Reported-and-tested-by: user@email.com"
> > 
> But Joe's remark is valid; we do not want to match on signature tags in 
> the middle. These cases are probably mentioning signature tags as part of 
> a sentence or some explanation.
> 
> Nachiket, think about a proper solution for this issue.

Mostly the problem doesn't occur very often and likely
isn't worth much effort.

Combinations aren't common in git logs and arbitrary
combinatorial logic isn't trivial.

For the last million commits, only ~3000 have any combination
and almost all of those are Reported-and-tested-by:

Likely that could be added to $signature_tags and the problem
just ignored.

I'd still exempt signature lines from line length limits.

$ git log -1000000 --no-merges --format=email | \
  grep -P "^[\w_-]+-by:" | cut -f1 -d":" | \
  sort | uniq -c | sort -rn | cat -n | grep -i and
     7	   2159 Reported-and-tested-by
    11	    255 Reported-and-Tested-by
    12	    203 Reviewed-and-tested-by
    13	    132 Reviewed-and-Tested-by
    22	     68 Reported-and-bisected-by
    31	     44 Acked-and-tested-by
    40	     21 Tested-and-Acked-by
    41	     20 Tested-and-acked-by
    42	     20 Reported-bisected-and-tested-by
    49	     17 Suggested-and-Acked-by
    50	     16 Tested-and-reported-by
    51	     16 Acked-and-Tested-by
    52	     15 Suggested-and-Tested-by
    53	     15 Suggested-and-acked-by
    56	     14 Tested-and-reviewed-by
    58	     13 Tested-and-Reviewed-by
    61	     12 Reported-and-acked-by
    62	     11 Reported-and-debugged-by
    65	     10 Reported-and-Acked-by
    73	      8 Suggested-and-reviewed-by
    76	      8 Reported-and-suggested-by
    77	      8 Reported-and-analyzed-by
    79	      8 Bisected-and-tested-by
    81	      7 Requested-and-tested-by
    82	      7 Reported-and-reviewed-by
    91	      6 Bisected-and-reported-by
   104	      4 Tested-and-Reported-by
   111	      4 Requested-and-Tested-by
   125	      3 Reported-by-and-Tested-by
   127	      3 Reported-And-Tested-by
   128	      3 Reported-and-requested-by
   155	      2 Suggested-and-tested-by
   166	      2 Reported-tested-and-acked-by
   169	      2 Reported-and-Suggested-by
   170	      2 Reported-and-by
   201	      2 Debugged-and-tested-by
   232	      1 Tested-by-and-Reviewed-by
   234	      1 Tested-And-Reviewed-by
   235	      1 Tested-and-requested-by
   236	      1 Tested-and-bugfixed-by
   245	      1 Suggested-and-Reviewed-by
   265	      1 Signed-off-and-morning-tea-spilled-by
   284	      1 Reviewed-and-wanted-by
   285	      1 Reviewed-and-discussed-by
   286	      1 Reviewed-and-Acked-by
   287	      1 Reviewed-and-acked-by
   294	      1 Requested-and-debugged-by
   295	      1 Requested-and-Acked-by
   296	      1 Requested-and-acked-by
   301	      1 Reportedy-and-tested-by
   303	      1 Reported-tested-and-fixed-by
   304	      1 Reported-tested-and-bisected-by
   305	      1 Reported-Reviewed-and-Acked-by
   306	      1 Reported-requested-and-tested-by
   312	      1 Reported-by-and-tested-by
   313	      1 Reported-Bistected-and-Tested-by
   316	      1 Reported-and_tested-by
   317	      1 Reported-and-Tested-and-Reviewed-by
   318	      1 Reported-and-tested-and-reviewed-by
   319	      1 Reported-and-test-by
   320	      1 Reported-and-root-caused-by
   321	      1 Reported-and-Reviwed-by
   322	      1 Reported-and-reviwed-by
   323	      1 Reported-and-Reviewed-by
   324	      1 Reported-and-Reviewed-and-Tested-by
   325	      1 Reported-and-isolated-by
   326	      1 Reported-and-introduced-by
   327	      1 Reported-and-Inspired-by
   328	      1 Reported-and-helped-by
   329	      1 Reported-and-fixed-by
   330	      1 Reported-and-diagnosed-by
   331	      1 Reported-and-Debugged-by
   332	      1 Reported--and-debugged-by
   333	      1 Reported-and-compile-tested-by
   334	      1 Reported-and-Bisected-by
   335	      1 Reported-and-Bisected-and-Tested-by
   336	      1 Reported-and-bisected_and_tested-by
   337	      1 Reported-and-bisected-and-tested-by
   338	      1 Reported-and-argued-for-by
   339	      1 Reported-analyzed-and-tested-by
   340	      1 Reported-Acked-and-Tested-by
   343	      1 Report-and-tested-by
   344	      1 Reporeted-and-tested-by
   345	      1 Repored-and-bisected-by
   355	      1 Pointed-out-and-tested-by
   377	      1 Original-Idea-and-Signed-off-by
   383	      1 Noticed-and-Acked-by
   396	      1 Modified-and-reviewed-by
   434	      1 Fix-creation-mandated-by
   451	      1 Discovered-and-analyzed-by
   452	      1 Diagnosed-and-Reported-by
   456	      1 Demanded-by
   460	      1 Debugged-and-analyzed-by
   461	      1 Debugged-and-acked-by
   462	      1 Cut-and-paste-bug-by
   475	      1 Catched-by-and-rightfully-ranted-at-by
   484	      1 Bitten-by-and-tested-by
   485	      1 Bisected-reported-and-tested-by
   486	      1 Bisected-and-requested-by
   487	      1 Bisected-and-Reported-by
   488	      1 Bisected-and-acked-by
   489	      1 Binary file (standard input) matches
   505	      1 Analyzed-and-acked-by
   509	      1 Also-reported-and-tested-by
   525	      1 Acked-by-and-tested-by
   527	      1 Acked-and-reviewed-by
   528	      1 Acked-and-mourned-by
   529	      1 Acked-and-documention-added-by
   530	      1 Acked-and-appreciated-by

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
