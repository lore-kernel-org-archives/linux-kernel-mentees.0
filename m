Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC80C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 19:55:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F01C2053B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 19:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F01C2053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B33118634C;
	Wed, 23 Sep 2020 19:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgjri2MjblhQ; Wed, 23 Sep 2020 19:55:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E940586341;
	Wed, 23 Sep 2020 19:55:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C864AC0889;
	Wed, 23 Sep 2020 19:55:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 042AFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 19:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DB0A987046
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 19:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QRvqQ-h-ICHW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 19:55:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0138.hostedemail.com
 [216.40.44.138])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C8F46872D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 19:55:51 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id D8B1118004A14
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 15:09:00 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 3BF7118636318;
 Wed, 23 Sep 2020 15:08:58 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: train48_5413b6227157
X-Filterd-Recvd-Size: 3272
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Wed, 23 Sep 2020 15:08:57 +0000 (UTC)
Message-ID: <7b52e085f0b69ad1742966f8eacd02deb9299b96.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 23 Sep 2020 08:08:56 -0700
In-Reply-To: <CABJPP5BgYXk2DFDtPjj1Ma=oXMsmWQPQje7=Zb-y5Ubvh8fZgw@mail.gmail.com>
References: <20200923100213.83901-1-dwaipayanray1@gmail.com>
 <338209a79fdd0b3f30d020825a5dafa98dd49ee8.camel@perches.com>
 <CABJPP5BgYXk2DFDtPjj1Ma=oXMsmWQPQje7=Zb-y5Ubvh8fZgw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: extend
 same_email_address check to load mailmap entries
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

On Wed, 2020-09-23 at 16:41 +0530, Dwaipayan Ray wrote:
> > .mailmap entries are used when a person no longer has
> > access to a particular email and a mapping is created to
> > allow these old/invalid email addresses to be converted
> > to a current/valid email address.
> > 
> > The idea here is that a person may have a .gitconfig or
> > equivalent that still uses an old/invalid email address
> > but uses a Signed-off-by: for a current/valid one, so
> > a warning _should_ be emitted for this case.
> > 
> > At least for checkpatch, mismatches in email addresses
> > should not be papered over by assuming equivalence between
> > multiple email addresses.
> > 
> > So this should be a separate test and not used in a function
> > named
> > "same_email_address".  These are specifically _not_
> > the same email
> > addresses.
> > 
> > 
> 
> Hi,
> Thanks for the clarification.
> 
> So instead of eliminating the warning completely will it be a
> better alternative to display a more descriptive warning
> on the lines of:
> 
>   "WARNING: NO_AUTHOR_SIGN_OFF:
>    invalid/obsolete email address used in signoff by
>    author $author"
> 
> Or is it better to ignore the mailmap extension in checkpatch
> and just display warnings for either mismatch in name/
> mismatch in email.
> 
> Like, you had mentioned one in:
> https://lore.kernel.org/linux-kernel-mentees/
> 7958ded756c895ca614ba900aae7b830a992475e.camel@perches.com/
> 
> In that case, same name, but different mail address was
> reported as a different warning.
> 
> So, I believe two cases can be handled better:
> 1) Same name, different email
> 2) Same email, different name
> 
> For case 2, it might also be possible to ignore the warning
> completely.

Maybe both.

I suggest seeing if extensions to email addresses like:

	<local_part+extension@domain.tld>
could be compared to:
	<local_part@domain.tld>

and comment blocks like:

	"First Last" (via mailing list) <local_part@domain.tld>
could be compared to:
	"First Last" <local_part@domain.tlc> (MAINTAINER)

Still, I think all of these should emit warnings or
--strict checks messages.

The idea is to notify that some oddity has occurred
rather than silently accept it.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
