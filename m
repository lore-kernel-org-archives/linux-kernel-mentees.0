Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167B1C433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 09:28:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C98622A83
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 09:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C98622A83
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1517985CD0;
	Tue,  5 Jan 2021 09:28:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UsKDjA5ZA_Uw; Tue,  5 Jan 2021 09:28:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7730885C52;
	Tue,  5 Jan 2021 09:28:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62892C0891;
	Tue,  5 Jan 2021 09:28:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F4A4C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 09:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1578220495
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 09:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z+9ZWgcn2JF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 09:28:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0011.hostedemail.com
 [216.40.44.11])
 by silver.osuosl.org (Postfix) with ESMTPS id 9E0C6203ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 09:28:22 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 63E22100E7B46;
 Tue,  5 Jan 2021 09:28:20 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: books34_27150c3274d7
X-Filterd-Recvd-Size: 3489
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Tue,  5 Jan 2021 09:28:19 +0000 (UTC)
Message-ID: <3ffe616d8c3fb54833bfc4d86cb73427cf6c7add.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Kees Cook
 <keescook@chromium.org>,  Jonathan Corbet <corbet@lwn.net>
Date: Tue, 05 Jan 2021 01:28:18 -0800
In-Reply-To: <CABJPP5DQ0Y42z9ej_j06+KaQevT3ztWcwGMkismj4qv5EHvnxA@mail.gmail.com>
References: <20210105082303.15310-1-dwaipayanray1@gmail.com>
 <50cc861121b62b3c1518222f24f679c3f72b868d.camel@perches.com>
 <CABJPP5DQ0Y42z9ej_j06+KaQevT3ztWcwGMkismj4qv5EHvnxA@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: [Linux-kernel-mentees] deprecated.rst: deprecated strcpy ? (was:
 [PATCH] checkpatch: add a new check for strcpy/strlcpy uses)
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

On Tue, 2021-01-05 at 14:29 +0530, Dwaipayan Ray wrote:
> On Tue, Jan 5, 2021 at 2:14 PM Joe Perches <joe@perches.com> wrote:
> > =

> > On Tue, 2021-01-05 at 13:53 +0530, Dwaipayan Ray wrote:
> > > strcpy() performs no bounds checking on the destination buffer.
> > > This could result in linear overflows beyond the end of the buffer.
> > > =

> > > strlcpy() reads the entire source buffer first. This read
> > > may exceed the destination size limit. This can be both inefficient
> > > and lead to linear read overflows.
> > > =

> > > The safe replacement to both of these is to use strscpy() instead.
> > > Add a new checkpatch warning which alerts the user on finding usage of
> > > strcpy() or strlcpy().
> > =

> > I do not believe that strscpy is preferred over strcpy.
> > =

> > When the size of the output buffer is known to be larger
> > than the input, strcpy is faster.
> > =

> > There are about 2k uses of strcpy.
> > Is there a use where strcpy use actually matters?
> > I don't know offhand...
> > =

> > But I believe compilers do not optimize away the uses of strscpy
> > to a simple memcpy like they do for strcpy with a const from
> > =

> > =A0=A0=A0=A0=A0=A0=A0=A0strcpy(foo, "bar");
> > =

> =

> Yes the optimization here definitely helps. So in case the programmer
> knows that the destination buffer is always larger, then strcpy() should =
be
> preferred? I think the documentation might have been too strict about
> strcpy() uses here:
> =

> Documentation/process/deprecated.rst:
> "strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading to
> all kinds of misbehaviors. While `CONFIG_FORTIFY_SOURCE=3Dy` and various
> compiler flags help reduce the risk of using this function, there is
> no good reason to add new uses of this function. The safe replacement
> is strscpy(),..."

Kees/Jonathan:

Perhaps this text is overly restrictive.

There are ~2k uses of strcpy in the kernel.

About half of these are where the buffer length of foo is known and the
use is 'strcpy(foo, "bar")' so the compiler converts/optimizes away the
strcpy to memcpy and may not even put "bar" into the string table.

I believe strscpy uses do not have this optimization.

Is there a case where the runtime costs actually matters?
I expect so.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
