Return-Path: <SRS0=lIAf=FD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD99C3E8C5
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Nov 2020 22:27:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2F432078D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Nov 2020 22:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2F432078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79EB686276;
	Sun, 29 Nov 2020 22:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pj_nZXSNnpDj; Sun, 29 Nov 2020 22:27:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6A8B786228;
	Sun, 29 Nov 2020 22:27:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40077C0859;
	Sun, 29 Nov 2020 22:27:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7B30C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 22:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D271D86F89
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 22:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjVh2frJtZY1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 22:27:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0162.hostedemail.com
 [216.40.44.162])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C99DB86F80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 22:27:30 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 63192100E7B40;
 Sun, 29 Nov 2020 22:27:29 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: wheel10_07047072739c
X-Filterd-Recvd-Size: 3936
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Sun, 29 Nov 2020 22:27:28 +0000 (UTC)
Message-ID: <45c8575f69602a3ad6bc3129ab99905e9f233af0.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya <yashsri421@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Sun, 29 Nov 2020 14:27:27 -0800
In-Reply-To: <a0f6479e-0c1b-a2f8-a265-32cc31313870@gmail.com>
References: <afaa79a6d86a4184878595ced3f2de1a92a4058c.camel@perches.com>
 <20201123102818.24364-1-yashsri421@gmail.com>
 <a0f6479e-0c1b-a2f8-a265-32cc31313870@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v7] checkpatch: add fix option
	for LOGICAL_CONTINUATIONS
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

On Sun, 2020-11-29 at 14:25 +0530, Aditya wrote:
> On 23/11/20 3:58 pm, Aditya Srivastava wrote:
> > Currently, checkpatch warns if logical continuations are placed at the
> > start of a line and not at the end of previous line.

Acked-by: Joe Perches <joe@perches.com>

> > =

> > E.g., running checkpatch on commit 3485507fc272 ("staging:
> > bcm2835-camera: Reduce length of enum names") reports:
> > =

> > CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the
> > previous line
> > +	if (!ret
> > +	    && camera_port =3D=3D
> > =

> > Provide a simple fix by inserting logical operator at the last
> > non-comment, non-whitespace char of the previous line and removing from
> > current line, if both the lines are additions(ie start with '+')
> > =

> > Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> > ---
> > changes in v2: quote $operator at substitution
> > =

> > changes in v3: add a check for previous line ending with comment;
> > If so, insert $operator at the last non-comment, non-whitespace char of=
 the previous line
> > =

> > changes in v4: improve the matching mechanism by matching line terminat=
ion at comment or white space;
> > insert the operator before comments (if any) separated by a whitespace;
> > append the comment and its pre-whitespace after the inserted operator (=
if comment was present),
> > ie if no comment was present nothing will be inserted after the operator
> > =

> > changes in v5: improve regex for comment and line end with '$;'
> > =

> > changes in v6: remove if-check; modify commit message
> > =

> > changes in v7: add an extra '$' symbol at '$fixed[$fixlinenr - 1]' rege=
x substitution to ensure match at line end
> > =

> > =A0scripts/checkpatch.pl | 12 ++++++++++--
> > =A01 file changed, 10 insertions(+), 2 deletions(-)
> > =

> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 5b1a5a65e69a..fb3c50e0bde2 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3553,8 +3553,16 @@ sub process {
> > =A0
> > =

> > =A0# check for && or || at the start of a line
> > =A0		if ($rawline =3D~ /^\+\s*(&&|\|\|)/) {
> > -			CHK("LOGICAL_CONTINUATIONS",
> > -			    "Logical continuations should be on the previous line\n" . $her=
eprev);
> > +			my $operator =3D $1;
> > +			if (CHK("LOGICAL_CONTINUATIONS",
> > +				"Logical continuations should be on the previous line\n" . $herepr=
ev) &&
> > +			    $fix && $prevrawline =3D~ /^\+/) {
> > +				# insert logical operator at last non-comment, non-whitepsace char=
 on previous line
> > +				$prevline =3D~ /[\s$;]*$/;
> > +				my $line_end =3D substr($prevrawline, $-[0]);
> > +				$fixed[$fixlinenr - 1] =3D~ s/\Q$line_end\E$/ $operator$line_end/;
> > +				$fixed[$fixlinenr] =3D~ s/\Q$operator\E\s*//;
> > +			}
> > =A0		}
> > =A0
> > =

> > =A0# check indentation starts on a tab stop
> > =

> =

> Hi Joe
> You probably missed this patch. Please review :)
> =

> Thanks
> Aditya


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
