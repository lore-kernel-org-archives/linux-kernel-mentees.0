Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB42C64E7A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 18:39:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F018E208FE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 18:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F018E208FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3EC6787636;
	Tue,  1 Dec 2020 18:39:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LERhCyXzIHdv; Tue,  1 Dec 2020 18:39:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B0CB18761D;
	Tue,  1 Dec 2020 18:39:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A28D3C1833;
	Tue,  1 Dec 2020 18:39:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E15DC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3CE42850AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:39:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FOJxmGZf46nS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:39:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0134.hostedemail.com
 [216.40.44.134])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4775485078
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:39:28 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 0EFB4182CED34;
 Tue,  1 Dec 2020 18:39:27 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: wall32_490fb3e273ac
X-Filterd-Recvd-Size: 3588
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Tue,  1 Dec 2020 18:39:26 +0000 (UTC)
Message-ID: <ceb3ffcdae151d6ea1d7f1a45bf61b3d2a1c183c.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 01 Dec 2020 10:39:24 -0800
In-Reply-To: <CAKXUXMx8RURmeyzp5Ak7_409oaVJo622ndpC5VceN-C_f-HPdg@mail.gmail.com>
References: <20201201112931.11192-1-yashsri421@gmail.com>
 <f4392362e682ce7a02eee8a2036e1035342a0b4f.camel@perches.com>
 <CAKXUXMx8RURmeyzp5Ak7_409oaVJo622ndpC5VceN-C_f-HPdg@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add fix and
 improve warning msg for Non-standard signature
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

On Tue, 2020-12-01 at 19:21 +0100, Lukas Bulwahn wrote:
> On Tue, Dec 1, 2020 at 6:24 PM Joe Perches <joe@perches.com> wrote:
> > 
> > On Tue, 2020-12-01 at 16:59 +0530, Aditya Srivastava wrote:
> > > Currently, checkpatch.pl warns for BAD_SIGN_OFF on non-standard signature
> > > styles.
> > > 
> > > This warning occurs because of incorrect use of signature tags,
> > > e.g. an evaluation on v4.13..v5.8 showed the use of following incorrect
> > > signature tags, which may seem correct, but are not standard:
> > 
> > I'm not a fan of this patch.
> > 
> > There is already a "non-standard" signature warning for
> > all of these cases since 2012, predating the range of this
> > retrospective evaluation by over 5 years and yet these
> > existing commits have been accepted.
> > 
> > The value in actual standardization and effectively
> > requiring specific signature style tags is quite low.
> > 
> > Anyone that signed a thing a particular way should be free
> > to sign the thing as they choose.
> > 
> > Most of these warnings would also still be in the tree in
> > the future in new patches as running checkpatch without
> > it emitting a message of any type isn't a requirement nor
> > should checkpatch use actually be required workflow.
> > 
> 
> Can we scale this fixing feature down to the very obvious synonyms
> that simply do not add anything but confusion?
> 
> Such as for those four here:
> 
> Co-authored-by (count: 43) => Co-developed-by

I've never been a big fan of "Co-developed-by" as a signature tag,
but a "this should be that" here could be ok.

> Reviewed-off-by (count: 5) => Reviewed-by

I don't see value.  If no one notices a BAD_SIGN_OFF
for the Reviewed-off-by:, I doubt this would add anything.

> Proposed-by (count: 5) => Suggested-by
> Suggestions-by (count: 3) => Suggested-by

Suggestions-by is not suggested-by as these suggestions could
have been in response to an initial patch proposal and the
author could have incorporated those suggestions.

> Then, we can probably also drop the rationale because it is pretty clear.
> 
> Of course, the impact might be really zero, given that it is unclear
> if those authors did actually ever run checkpatch in the first place.
> 
> Joe, if you see no value in even such a minimal fix feature, let us
> drop that idea and move on. There are enough other things to work on.

Maybe only add the Co-authored-by: -> Co-developed-by: check.

But IMO: none of this is particularly useful.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
