Return-Path: <SRS0=uW6w=HT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF61C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Feb 2021 10:44:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4D4A64DF3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Feb 2021 10:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4D4A64DF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79C2185FCB;
	Wed, 17 Feb 2021 10:44:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JK4aNxzTtKXI; Wed, 17 Feb 2021 10:44:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F21E985FBA;
	Wed, 17 Feb 2021 10:44:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9E1AC0893;
	Wed, 17 Feb 2021 10:44:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 832D7C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 10:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7E9D885FC3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 10:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40tF4DJ6atMR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 10:44:02 +0000 (UTC)
X-Greylist: delayed 00:06:22 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0247.hostedemail.com
 [216.40.44.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2BE9D85FBA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 10:44:02 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 3844A180364CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 10:37:42 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 99826837F24C;
 Wed, 17 Feb 2021 10:37:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: gold08_4914dfe2764b
X-Filterd-Recvd-Size: 3759
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Wed, 17 Feb 2021 10:37:38 +0000 (UTC)
Message-ID: <4d6856b33cc870ac655d801d066f04af6ebadcd7.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>
Date: Wed, 17 Feb 2021 02:37:37 -0800
In-Reply-To: <CABJPP5CaAavDMWy8xmQ8Bxpf5549v8fqOz8Zi=g7g6ZGnCAVmg@mail.gmail.com>
References: <20210213131513.51386-1-dwaipayanray1@gmail.com>
 <20210213131513.51386-3-dwaipayanray1@gmail.com>
 <b2e25e683a3e2f31d4dc2d666e082634e30643b3.camel@perches.com>
 <CABJPP5CaAavDMWy8xmQ8Bxpf5549v8fqOz8Zi=g7g6ZGnCAVmg@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, 2021-02-16 at 19:48 +0530, Dwaipayan Ray wrote:
> On Sun, Feb 14, 2021 at 10:27 PM Joe Perches <joe@perches.com> wrote:
> > On Sat, 2021-02-13 at 18:45 +0530, Dwaipayan Ray wrote:
> > > Add documentation for kernel script checkpatch.pl.
> > > This documentation is also parsed by checkpatch to
> > > enable a verbose mode.
> > > =

> > > The message types in checkpatch are documented with rst
> > > field lists. A total of 33 checkpatch type descriptions
> > > are added.
> > =

> > Alphabetic ordering isn't that great for these entries.
> > Please group them by use:
> > =

> > whitespace/code layout style:
> > SPACING, TRAILING_WHITESPACE, LINE_SPACING
[]
> Could I get some comment on this grouping for types:
> =

> Allocation Style: ALLOC_ARRAY_ARGS, ALLOC_SIZEOF_STRUCT, ALLOC_WITH_MULTI=
PLY
> =

> API Usage: ARCH_DEFINES, ARCH_INCLUDE_LINUX, ARRAY_SIZE, AVOID_BUG,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0AVOID_EXTERNS=
, AVOID_L_PREFIX, BIT_MACRO, CONSIDER_KSTRTO
> =

> Comment Style: BLOCK_COMMENT_STYLE, C99_COMMENTS
> =

> Commit Message: BAD_SIGN_OFF, BAD_STABLE_ADDRESS_STYLE, COMMIT_COMMENT_SY=
MBOL,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0COMMIT_MESSAGE, MISSING_SIGN_OFF,
> NO_AUTHOR_SIGN_OFF
> =

> Comparison Style: ASSIGN_IN_IF, BOOL_COMPARISON, COMPARISON_TO_NULL,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0CONSTANT_COMPARISON
> =

> Spacing & Brackets: ASSIGNMENT_CONTINUATIONS, BRACES, BRACKET_SPACE,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0CODE_INDENT, CONCATENATED_STRING,
> LINE_SPACING,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0TRAILING_WHITESPACE
> =

> Others: CAMELCASE, CONFIG_DESCRIPTION
> =

> This is what I have done till now. Any suggestions would be nice and if i=
t looks
> okay I would like to send the v4 in.

Looks OK.

Please make sure you at least include SPACING in the spacing & brackets
descriptions.

It also seems like ref links to Documentation/process/coding-style.rst
<section> (3.1 in the SPACING case) should be used more frequently.

It'd be 'nice' to somehow use sortable tables with some grouping
attribute for these groups, but I have no idea if that's feasible with
.rst restrutured text files.

Perhaps simplify the checkpatch code a bit for the --terse and --verbose
output.

Maybe something like:
---
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 869d80397f9f..07566cb3b3f8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl

@@ -292,15 +292,16 @@ GetOptions(
 =

 help(0) if ($help);
 =

+die "$P: --git cannot be used with --file or --fix\n" if ($git && ($file |=
| $fix));
+die "$P: --verbose canot be used with --terse\n" if ($verbose && $terse);
+
 list_types(0) if ($list_types);


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
