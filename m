Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AC2C41604
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 20:09:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A0A120760
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 20:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A0A120760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 790F22094C;
	Tue,  6 Oct 2020 20:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9QYD8JkboCsb; Tue,  6 Oct 2020 20:09:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A75A6207B0;
	Tue,  6 Oct 2020 20:09:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 925ABC07FF;
	Tue,  6 Oct 2020 20:09:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9ACEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 20:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A85C587124
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 20:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yx1f1XPNwRPJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 20:09:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0016.hostedemail.com
 [216.40.44.16])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 91CF887117
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 20:09:49 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 5607F100E7B4C;
 Tue,  6 Oct 2020 20:09:47 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: event64_5d11b9e271c9
X-Filterd-Recvd-Size: 2155
Received: from XPS-9350 (unknown [172.58.35.183])
 (Authenticated sender: joe@perches.com)
 by omf15.hostedemail.com (Postfix) with ESMTPA;
 Tue,  6 Oct 2020 20:09:45 +0000 (UTC)
Message-ID: <cd8fb6742e4776a98412278815fc86b568820b6e.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 06 Oct 2020 13:09:42 -0700
In-Reply-To: <CABJPP5Awe=CDC7riYBBVDf9WRO4aAMXK2QROYdtGyJXNjqB-ew@mail.gmail.com>
References: <20201006185114.168358-1-dwaipayanray1@gmail.com>
 <8553d6679f97ae9d285a9ffd61198f5e3c11dc35.camel@perches.com>
 <CABJPP5Awe=CDC7riYBBVDf9WRO4aAMXK2QROYdtGyJXNjqB-ew@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: add new warnings
 to author signoff checks.
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

On Wed, 2020-10-07 at 00:31 +0530, Dwaipayan Ray wrote:
> On Wed, Oct 7, 2020 at 12:25 AM Joe Perches <joe@perches.com> wrote:
> > On Wed, 2020-10-07 at 00:21 +0530, Dwaipayan Ray wrote:
> > > The author signed-off-by checks are currently very vague.
> > > Cases like same name or same address are not handled separately.
> > > 
> > > For example, running checkpatch on commit be6577af0cef
> > > ("parisc: Add atomic64_set_release() define to avoid CPU soft lockups"),
> > > gives:
> > 
> > Aren't you still missing emitting an message for cases like
> > 
> > From: "J. Random Developer" <jrd@bigcorp.com>
> > [...]
> > Signed-off-by: "J. Random Developer" (BigCorp) <jrd@bigcorp.com>
> > 
> > Where a comment does not match?
> > 
> > 
> 
> Yes, messages for comments were not emitted previously too
> cause the same_email_address() function just matches name
> and email (discarding name comments and email comments).
> 
> So should I add it to this patch, or should I work on it in a different
> patch perhaps because it involves change on another subroutine?

I suggest adding it to this patch.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
