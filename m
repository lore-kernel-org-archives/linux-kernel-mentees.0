Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4508C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 12:21:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16E7A20724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 12:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16E7A20724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7DF7587053;
	Fri, 30 Oct 2020 12:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 83-8WRvjQJZT; Fri, 30 Oct 2020 12:21:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 127E487011;
	Fri, 30 Oct 2020 12:21:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0448C088B;
	Fri, 30 Oct 2020 12:21:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E956C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 12:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 32C5087018
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 12:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id txcrm87KwJad
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 12:21:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0084.hostedemail.com
 [216.40.44.84])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 035FE87011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 12:21:48 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 2A063182CF669;
 Fri, 30 Oct 2020 12:21:47 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: fall60_110101e27296
X-Filterd-Recvd-Size: 3079
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Fri, 30 Oct 2020 12:21:45 +0000 (UTC)
Message-ID: <a4d1d9412d30b060c246d33427f319cdd4a39b5e.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 30 Oct 2020 05:21:44 -0700
In-Reply-To: <alpine.DEB.2.21.2010301255460.16621@felia>
References: <20201030090704.40533-1-dwaipayanray1@gmail.com>
 <9d5c8699f94481ab5bf2d37348199ca1d6343c8b.camel@perches.com>
 <alpine.DEB.2.21.2010301255460.16621@felia>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 yashsri421@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: improve handling of
	email comments
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

On Fri, 2020-10-30 at 12:58 +0100, Lukas Bulwahn wrote:
> On Fri, 30 Oct 2020, Joe Perches wrote:
> > On Fri, 2020-10-30 at 14:37 +0530, Dwaipayan Ray wrote:
> > > checkpatch has limited support for parsing email comments. It only
> > > support single name comments or single after address comments.
> > > Whereas, RFC 5322 specifies that comments can be inserted in
> > > between any tokens of the email fields.
> > > 
> > > Improve comment parsing mechanism in checkpatch.
> > > 
> > > What is handled now:
> > > 
> > > - Multiple name/address comments
> > > - Comments anywhere in between name/address
> > > - Nested comments like (John (Doe))
> > > 
> > > A brief analysis of checkpatch output on v5.0..v5.7 showed that
> > > after these modifications, the number of BAD_SIGN_OFF warnings
> > > came down from 2944 to 1424, and FROM_SIGN_OFF_MISMATCH came
> > > down from 2366 to 2330.
> > > 
> > > So, a total of 1556 false positives were resolved in total.
> > 
> > A mere reduction in messages emitted isn't necessarily good.
> > 
> 
> Agree. That is why I also went through the list of those warnings.

So sending me a copy of that list shouldn't be a burden.
 
> > Please send me privately a complete list of these nominally
> > false positive messages that are no longer emitted.
> > 
> > I believe one of the relatively common incorrect messages is
> > for the cc: <stable@vger.kernel.org> where a version number is
> > continued on the same line after a #.
> > 
> > CC: stable@vger.kernel.org # for versions x.y.z and above
> > 
> 
> That was one, another common pattern was just quotes put inconsistently at 
> different places.

Which to me is more an indication that a message
_should_ be emitted as many email clients do not like
to copy/paste incorrectly formatted email addresses
(ie: Missing necessary quotes when the name contains
characters like .) and that's a common way to cc a
reply to a possible commit message of an email.

Perhaps as well the .mailmap mechanism may not cope
with these differently formatted email addresses.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
