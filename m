Return-Path: <SRS0=oxYf=GL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426AFC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Jan 2021 00:51:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A669D23447
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Jan 2021 00:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A669D23447
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 545B987142;
	Fri,  8 Jan 2021 00:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-+rk3eyoYlA; Fri,  8 Jan 2021 00:51:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7F1CD86FFF;
	Fri,  8 Jan 2021 00:51:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A8D0C088B;
	Fri,  8 Jan 2021 00:51:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4356C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 00:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D087A87293
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 00:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7J5TUEP8Mw3s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 00:51:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0138.hostedemail.com
 [216.40.44.138])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 87DCF8728E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 00:51:35 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 57BD9181D337B;
 Fri,  8 Jan 2021 00:51:34 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: clam92_5d138c7274ee
X-Filterd-Recvd-Size: 5431
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Fri,  8 Jan 2021 00:51:32 +0000 (UTC)
Message-ID: <9e111f0f673ae6ced12efc01d32eefe8402c7f72.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Kees Cook <keescook@chromium.org>
Date: Thu, 07 Jan 2021 16:51:31 -0800
In-Reply-To: <202101071310.3AC5F0C4@keescook>
References: <20210105082303.15310-1-dwaipayanray1@gmail.com>
 <50cc861121b62b3c1518222f24f679c3f72b868d.camel@perches.com>
 <CABJPP5DQ0Y42z9ej_j06+KaQevT3ztWcwGMkismj4qv5EHvnxA@mail.gmail.com>
 <3ffe616d8c3fb54833bfc4d86cb73427cf6c7add.camel@perches.com>
 <202101071310.3AC5F0C4@keescook>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] deprecated.rst: deprecated strcpy ?
 (was: [PATCH] checkpatch: add a new check for strcpy/strlcpy uses)
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

On Thu, 2021-01-07 at 13:16 -0800, Kees Cook wrote:
> On Tue, Jan 05, 2021 at 01:28:18AM -0800, Joe Perches wrote:
> > On Tue, 2021-01-05 at 14:29 +0530, Dwaipayan Ray wrote:
> > > On Tue, Jan 5, 2021 at 2:14 PM Joe Perches <joe@perches.com> wrote:
> > > > =

> > > > On Tue, 2021-01-05 at 13:53 +0530, Dwaipayan Ray wrote:
> > > > > strcpy() performs no bounds checking on the destination buffer.
> > > > > This could result in linear overflows beyond the end of the buffe=
r.
> > > > > =

> > > > > strlcpy() reads the entire source buffer first. This read
> > > > > may exceed the destination size limit. This can be both inefficie=
nt
> > > > > and lead to linear read overflows.
> > > > > =

> > > > > The safe replacement to both of these is to use strscpy() instead.
> > > > > Add a new checkpatch warning which alerts the user on finding usa=
ge of
> > > > > strcpy() or strlcpy().
> > > > =

> > > > I do not believe that strscpy is preferred over strcpy.
> > > > =

> > > > When the size of the output buffer is known to be larger
> > > > than the input, strcpy is faster.
> > > > =

> > > > There are about 2k uses of strcpy.
> > > > Is there a use where strcpy use actually matters?
> > > > I don't know offhand...
> > > > =

> > > > But I believe compilers do not optimize away the uses of strscpy
> > > > to a simple memcpy like they do for strcpy with a const from
> > > > =

> > > > =A0=A0=A0=A0=A0=A0=A0=A0strcpy(foo, "bar");
> > > > =

> > > =

> > > Yes the optimization here definitely helps. So in case the programmer
> > > knows that the destination buffer is always larger, then strcpy() sho=
uld be
> > > preferred? I think the documentation might have been too strict about
> > > strcpy() uses here:
> > > =

> > > Documentation/process/deprecated.rst:
> > > "strcpy() performs no bounds checking on the destination buffer. This
> > > could result in linear overflows beyond the end of the buffer, leadin=
g to
> > > all kinds of misbehaviors. While `CONFIG_FORTIFY_SOURCE=3Dy` and vari=
ous
> > > compiler flags help reduce the risk of using this function, there is
> > > no good reason to add new uses of this function. The safe replacement
> > > is strscpy(),..."
> > =

> > Kees/Jonathan:
> > =

> > Perhaps this text is overly restrictive.
> > =

> > There are ~2k uses of strcpy in the kernel.
> > =

> > About half of these are where the buffer length of foo is known and the
> > use is 'strcpy(foo, "bar")' so the compiler converts/optimizes away the
> > strcpy to memcpy and may not even put "bar" into the string table.
> > =

> > I believe strscpy uses do not have this optimization.
> > =

> > Is there a case where the runtime costs actually matters?
> > I expect so.
> =

> The original goal was to use another helper that worked on static
> strings like this. Linus rejected that idea, so we're in a weird place.
> I think we could perhaps build a strcpy() replacement that requires
> compile-time validated arguments, and to break the build if not.
> =

> i.e.
> =

> given:
> 	char array[8];
> 	char *ptr;
> =

> allow:
> =

> =

> 	strcpy(array, "1234567");
> =

> disallow:
> =

> 	strcpy(array, "12345678");	/* too long */
> 	strcpy(array, src);		/* not optimized, so use strscpy? */
> 	strcpy(ptr, "1234567");		/* unknown destination size */
> 	strcpy(ptr, src);		/* unknown destination size */

I think that's not a good idea as it's not a generic equivalent of the
string.h code.

I still like the stracpy variant I proposed:

https://lore.kernel.org/lkml/24bb53c57767c1c2a8f266c305a670f7@sk2.org/T/#m0=
627aa770a076af1937cb5c610ed71dab3f1da72
https://lore.kernel.org/lkml/CAHk-=3DwgqQKoAnhmhGE-2PBFt7oQs9LLAATKbYa573UO=
=3DDPBE0Q@mail.gmail.com/

Linus liked a variant he called copy_string:

https://lore.kernel.org/lkml/CAHk-=3Dwg8vLmmwTGhXM51NpSWJW8RFEAKoXxG0Hu_Q9U=
wbjj8kw@mail.gmail.com/

I think the cocci scripts that convert:

	strlcpy -> strscpy (only when return value unused)
	str<sln>cpy(array, "string") -> stracpy(foo, "string")
	s[cn]printf -> sysfs_emit

would leave relatively few uses of strcpy and sprintf variants and would
make it much easier to analyze the remainder uses for potential overflows.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
