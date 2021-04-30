Return-Path: <SRS0=4o7+=J3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A720C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Apr 2021 11:30:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55BEB6024A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Apr 2021 11:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55BEB6024A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E718E41ADC;
	Fri, 30 Apr 2021 11:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0MCp4nMvsEx5; Fri, 30 Apr 2021 11:30:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFE9341A3D;
	Fri, 30 Apr 2021 11:30:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3F80C000D;
	Fri, 30 Apr 2021 11:30:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50DB7C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Apr 2021 11:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 385EB850D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Apr 2021 11:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 43fESFIAw6o4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Apr 2021 11:30:53 +0000 (UTC)
X-Greylist: delayed 09:27:38 by SQLgrey-1.8.0
Received: from smtprelay.hostedemail.com (smtprelay0167.hostedemail.com
 [216.40.44.167])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C915850D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Apr 2021 11:30:53 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id B42901801A9A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Apr 2021 02:03:15 +0000 (UTC)
Received: from omf17.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 61B9F180278B4;
 Fri, 30 Apr 2021 02:03:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf17.hostedemail.com (Postfix) with ESMTPA id 2A83527DD11; 
 Fri, 30 Apr 2021 02:03:11 +0000 (UTC)
Message-ID: <8dc8272b78e2340a4244ded29d342ff0f0f519eb.camel@perches.com>
Subject: Re: [RFC v3] scripts: kernel-doc: reduce repeated regex expressions
 into variables
From: Joe Perches <joe@perches.com>
To: Jonathan Corbet <corbet@lwn.net>, Aditya Srivastava <yashsri421@gmail.com>
Date: Thu, 29 Apr 2021 19:03:09 -0700
In-Reply-To: <8735v8d5ja.fsf@meer.lwn.net>
References: <20210427165633.GA235567@casper.infradead.org>
 <20210429063729.8144-1-yashsri421@gmail.com> <8735v8d5ja.fsf@meer.lwn.net>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Stat-Signature: xe1pdak8z3o5kcfrqusxzbhj9hisx4we
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 2A83527DD11
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+WL1RP+awhB6YUyhGH9yq3tt1EagZ+/iE=
X-HE-Tag: 1619748191-726048
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, willy@infradead.org, linux-doc@vger.kernel.org
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

On Thu, 2021-04-29 at 17:39 -0600, Jonathan Corbet wrote:
> Aditya Srivastava <yashsri421@gmail.com> writes:
> =

> > There are some regex expressions in the kernel-doc script, which are us=
ed
> > repeatedly in the script.
> > =

> > Reduce such expressions into variables, which can be used everywhere.
> > =

> > A quick manual check found that no errors and warnings were added/remov=
ed
> > in this process.
> > =

> > Suggested-by: Jonathan Corbet <corbet@lwn.net>
> > Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> > ---
> > Changes in v3:
> > - Remove variables for separate qualifiers in "sub dump_struct"
> > - Make a common variable for all the qualifiers
> > - Make $attribute global variable to use it at "sub check_sections" as =
well
> > =

> > Changes in v2:
> > - Rename $pointer_function to $function_pointer
> > - Combine elsif-block expressions at "sub dump_function" into lesser re=
gex expressions
> > - Combine $prototype_end1,$prototype_end2 expressions into a common $pr=
ototype_end
> > =

> > =A0scripts/kernel-doc | 71 ++++++++++++++++++++++----------------------=
--
> > =A01 file changed, 34 insertions(+), 37 deletions(-)
> =

> So this looks good but ... it adds a warning to the build:
> =

> /stuff/k/git/kernel/Documentation/driver-api/media/v4l2-controls:823: ./i=
nclude/media/v4l2-ctrls.h:964: WARNING: Invalid C declaration: Expected ide=
ntifier in nested name. [error at 6]
> =A0=A0const * v4l2_ctrl_get_menu (u32 id)
> =A0=A0------^
> =

> So it looks like something isn't being parsed quite identically?

Perhaps a few of the regexes from checkpatch could be used or
maybe a linux specific perl module produced.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
