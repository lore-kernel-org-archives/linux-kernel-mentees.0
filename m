Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFD7C64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 17:24:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019892076E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 17:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 019892076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 70F1885DE1;
	Mon, 30 Nov 2020 17:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0WdWehim8x-6; Mon, 30 Nov 2020 17:24:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 32A2A85ECE;
	Mon, 30 Nov 2020 17:24:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21DBBC0859;
	Mon, 30 Nov 2020 17:24:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 060D0C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 17:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E8860871C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 17:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EuRnrpEDZhM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 17:24:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0170.hostedemail.com
 [216.40.44.170])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E0240871AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 17:24:40 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 8B5CF8384367;
 Mon, 30 Nov 2020 17:24:38 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: skirt20_52007ab273a3
X-Filterd-Recvd-Size: 4104
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Mon, 30 Nov 2020 17:24:37 +0000 (UTC)
Message-ID: <070109a56817288562a91dfeec74359eb948234e.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 30 Nov 2020 09:24:36 -0800
In-Reply-To: <CABJPP5BLjbx3FbvB3nAOiHfkRLUo7s0n-vboE+AXJqrZXseUNQ@mail.gmail.com>
References: <20201130144515.8320-1-dwaipayanray1@gmail.com>
 <c8eeab847fc09368ce270ea3e06ea0bbbd7d1b7f.camel@perches.com>
 <CABJPP5BLjbx3FbvB3nAOiHfkRLUo7s0n-vboE+AXJqrZXseUNQ@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix TYPO_SPELLING
 check for words with apostrophe
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

On Mon, 2020-11-30 at 22:33 +0530, Dwaipayan Ray wrote:
> On Mon, Nov 30, 2020 at 10:13 PM Joe Perches <joe@perches.com> wrote:
> > =

> > On Mon, 2020-11-30 at 20:15 +0530, Dwaipayan Ray wrote:
> > > checkpatch reports a false TYPO_SPELLING warning for some words
> > > containing an apostrophe.
> > > =

> > > A false positive is "doesn't". Occurrence of the word causes
> > > checkpatch to emit the following warning:
> > > =

> > > "WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?"
> > > =

> > > Check the word boundary for such cases so that words like
> > > "doesn't", "zig-zag", etc. aren't misinterpreted due to wrong
> > > splitting of the word by the \b regex metacharacter.
> > []
> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > []
> > > @@ -3106,7 +3106,7 @@ sub process {
> > > =A0# Check for various typo / spelling mistakes
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (defined($misspellings) =
&&
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0($in_commit_log=
 || $line =3D~ /^(?:\+|Subject:)/i)) {
> > > -                     while ($rawline =3D~ /(?:^|[^a-z@])($misspellin=
gs)(?:\b|$|[^a-z@])/gi) {
> > > +                     while ($rawline =3D~ /(?:^|[^a-z@])($misspellin=
gs)(?:\b(?![^\w]?[a-z@]+)|$|[^a-z@])/gi) {
> > =

> > Wouldn't it be simpler to change the existing [^a-z@] blocks to [^a-z@'=
-] ?
> > =

> Hi,
> I tried it and it doesn't seem to work. Probably because the first
> group already causes the
> word to be captured. In this case `doesn'` was already captured
> because of the \b group.
> =

> Is the first group modification perhaps okay? Or would you suggest
> something else?

Seems to work for me:

$ git diff --stat -p scripts/checkpatch.pl
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7dc094445d83..a6d4d524ae66 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3106,7 +3106,7 @@ sub process {
 # Check for various typo / spelling mistakes
 		if (defined($misspellings) &&
 		    ($in_commit_log || $line =3D~ /^(?:\+|Subject:)/i)) {
-			while ($rawline =3D~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
+			while ($rawline =3D~ /(?:^|[^a-z@'-])($misspellings)(?:\b|$|[^a-z@'-])/=
gi) {
 				my $typo =3D $1;
 				my $typo_fix =3D $spelling_fix{lc($typo)};
 				$typo_fix =3D ucfirst($typo_fix) if ($typo =3D~ /^[A-Z]/);

$ cat t_spell.c
// SPDX-License-Identifier: GPL-2.0-only
void foo(void)
{
	//misspelled arne't word
}

$ ./scripts/checkpatch.pl -f --strict t_spell.c
CHECK: 'arne't' may be misspelled - perhaps 'aren't'?
#4: FILE: t_spell.c:4:
+	//misspelled arne't word

total: 0 errors, 0 warnings, 1 checks, 5 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplac=
e.

t_spell.c has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
