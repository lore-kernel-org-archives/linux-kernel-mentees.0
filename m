Return-Path: <SRS0=q8LZ=HR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8478FC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Feb 2021 18:11:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA92160235
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Feb 2021 18:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA92160235
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F4AC6F520
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Feb 2021 18:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZDz7LIYGol-8
	for <linux-kernel-mentees@archiver.kernel.org>;
	Mon, 15 Feb 2021 18:11:17 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id ADB0F6F49D; Mon, 15 Feb 2021 18:11:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE3C86F476;
	Mon, 15 Feb 2021 18:11:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9363C0893;
	Mon, 15 Feb 2021 18:11:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53F78C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 18:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41D5E6F476
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 18:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZaHZrtqZM6b7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 18:11:13 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 8733C6F494; Mon, 15 Feb 2021 18:11:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay.hostedemail.com (smtprelay0084.hostedemail.com
 [216.40.44.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E36D6F476
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 18:11:12 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 37C57180060E3;
 Mon, 15 Feb 2021 18:11:09 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: horse35_6111c282763d
X-Filterd-Recvd-Size: 1908
Received: from [192.168.43.37] (unknown [172.58.92.12])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Mon, 15 Feb 2021 18:11:06 +0000 (UTC)
Message-ID: <2162334bdf4d635f1414ffef52378c0f423366a7.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Matthew Wilcox <willy@infradead.org>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>
Date: Mon, 15 Feb 2021 10:11:03 -0800
In-Reply-To: <20210214121501.GC2858050@casper.infradead.org>
References: <20210213131513.51386-1-dwaipayanray1@gmail.com>
 <20210213131513.51386-3-dwaipayanray1@gmail.com>
 <20210214121501.GC2858050@casper.infradead.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC v3 2/3] docs: add
	documentation for checkpatch
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

On Sun, 2021-02-14 at 12:15 +0000, Matthew Wilcox wrote:
> On Sat, Feb 13, 2021 at 06:45:12PM +0530, Dwaipayan Ray wrote:
> > +Checkpatch (scripts/checkpatch.pl) is a perl script which checks for trivial style
> 
> It's quite amusing that this patch contains lines > 80 columns.

Then you could amuse yourself further by looking at the existing
line lengths of .rst files.

$ git ls-files -- '*.rst' | \
  xargs cat | \
  awk '{print length($0);}' | \
  sort -n | \
  uniq -c | \
  tail -20
      2 226
      1 230
      1 233
      1 234
     48 246
      1 253
      2 257
      1 263
      1 270
      1 275
      1 276
      1 293
      1 294
      1 308
      2 324
      1 359
      1 360
      5 369
      1 370
      2 409

Other than testing whether or not an SPDX license line exists,
checkpatch doesn't inspect .rst files.

There are better tools for that.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
