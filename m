Return-Path: <SRS0=+KdI=DZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF6EC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Oct 2020 08:46:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97EFF20874
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Oct 2020 08:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97EFF20874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4C3188766D;
	Sun, 18 Oct 2020 08:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R7Q-2-DkVl07; Sun, 18 Oct 2020 08:46:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5612387620;
	Sun, 18 Oct 2020 08:46:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FF47C088B;
	Sun, 18 Oct 2020 08:46:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3FB4DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 08:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2E8D486E90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 08:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w-_43quDZJgj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 08:45:59 +0000 (UTC)
X-Greylist: delayed 01:50:01 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0163.hostedemail.com
 [216.40.44.163])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 39E0286E00
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 08:45:59 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 6ECB018007895
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 06:20:30 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id BE8F718225E13;
 Sun, 18 Oct 2020 06:20:27 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: rake08_5a151d22722c
X-Filterd-Recvd-Size: 2202
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Sun, 18 Oct 2020 06:20:26 +0000 (UTC)
Message-ID: <eda7a64b4af42ba1fb66a5b3704780cf3f761951.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 17 Oct 2020 23:20:25 -0700
In-Reply-To: <CABJPP5DuQ_Y0LLS5BzNXUWyxjzp9ts5kgEH-3+7Pn7PPjq0Ljg@mail.gmail.com>
References: <20201017162732.152351-1-dwaipayanray1@gmail.com>
 <1ad9c5f49e10a192f0c6efb1116f3f0d31adce74.camel@perches.com>
 <CABJPP5DuQ_Y0LLS5BzNXUWyxjzp9ts5kgEH-3+7Pn7PPjq0Ljg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add new exception
	to repeated word check
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

On Sat, 2020-10-17 at 22:19 +0530, Dwaipayan Ray wrote:
> On Sat, Oct 17, 2020 at 10:03 PM Joe Perches <joe@perches.com> wrote:
> > On Sat, 2020-10-17 at 21:57 +0530, Dwaipayan Ray wrote:
> > > Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
> > > moved the repeated word test to check for more file types. But after
> > > this, if checkpatch.pl is run on MAINTAINERS, it generates several
> > > new warnings of the type:
> > 
> > NAK.
> > 
> > Slow down and test before you send more patch versions.
> > 
> > > +                             next if (index(" \t.,;?!", $end_char) == -1);
> > 
> > what does this do?
> 
> Um, it checks if end_char is not present in " \t.,;?!".
> If end_char doesn't belong to this list, then the check shall
> skip. That is the test will skip for "word word:", but will produce
> a warning for "word word." or "word word?", etc.
> 
> Shouldn't this itself be the case or am I perhaps going wrong
> somewhere?

No, you were right, I was being a numbskull.

btw: I think this should set
	my $end_char = ' ';
not '' 

so that if the last word on a line is a
repeat the test still works.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
