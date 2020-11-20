Return-Path: <SRS0=YTQs=E2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC22C56201
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 17:27:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 300A0208D5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 17:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 300A0208D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 996EB87614;
	Fri, 20 Nov 2020 17:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RtNrhghewvCp; Fri, 20 Nov 2020 17:27:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B76E3875EE;
	Fri, 20 Nov 2020 17:27:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99008C1825;
	Fri, 20 Nov 2020 17:27:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB53FC0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 17:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CA2A486FB6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 17:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3dntiXWj9fEw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 17:26:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0228.hostedemail.com
 [216.40.44.228])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D647786FB4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 17:26:58 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id AED1F18009B6D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 17:26:56 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 4E7F3181D3030;
 Fri, 20 Nov 2020 17:26:54 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: stick91_05052de2734d
X-Filterd-Recvd-Size: 3077
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Fri, 20 Nov 2020 17:26:53 +0000 (UTC)
Message-ID: <08f164e93dc40e066e81c4021485d27d5ad5a6b7.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya <yashsri421@gmail.com>
Date: Fri, 20 Nov 2020 09:26:52 -0800
In-Reply-To: <48f56f40-a365-faac-542d-0e120fcf4365@gmail.com>
References: <20201117171856.13284-1-yashsri421@gmail.com>
 <48f56f40-a365-faac-542d-0e120fcf4365@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix option
 for ASSIGNMENT_CONTINUATIONS
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

On Fri, 2020-11-20 at 16:11 +0530, Aditya wrote:
> On 17/11/20 10:48 pm, Aditya Srivastava wrote:
> > Currently, checkpatch warns us if an assignment operator is placed
> > at the start of a line and not at the end of previous line.
> > =

> > E.g., running checkpatch on commit 8195b1396ec8 ("hv_netvsc: fix
> > deadlock on hotplug") reports:
> > =

> > CHECK: Assignment operator '=3D' should be on the previous line
> > +	struct netvsc_device *nvdev
> > +		=3D container_of(w, struct netvsc_device, subchan_work);
> > =

> > Provide a simple fix by appending assignment operator to the previous
> > line and removing from the current line, if both the lines are additions
> > (ie start with '+')
> > =

> > Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> > ---
> > Changes in v2:
> > add check if both the lines are additions (ie start with '+')
> > =

> > Changes in v3:
> > quote $operator; test with division assignment operator ('/=3D')
> > =

> > =A0scripts/checkpatch.pl | 10 ++++++++--
> > =A01 file changed, 8 insertions(+), 2 deletions(-)
> > =

> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index c9aaaa443265..d5bc4d8e4f6c 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3542,8 +3542,14 @@ sub process {
> > =A0
> > =

> > =A0# check for assignments on the start of a line
> > =A0		if ($sline =3D~ /^\+\s+($Assignment)[^=3D]/) {
> > -			CHK("ASSIGNMENT_CONTINUATIONS",
> > -			    "Assignment operator '$1' should be on the previous line\n" . $=
hereprev);
> > +			my $operator =3D "$1";
> > +			if (CHK("ASSIGNMENT_CONTINUATIONS",
> > +				"Assignment operator '$1' should be on the previous line\n" . $her=
eprev) &&
> > +			    $fix && $prevrawline =3D~ /^\+/) {
> > +				# add assignment operator to the previous line, remove from curren=
t line
> > +				$fixed[$fixlinenr - 1] .=3D " $operator";
> > +				$fixed[$fixlinenr] =3D~ s/$operator\s*//;
> > +			}
> > =A0		}
> > =A0
> > =

> > =A0# check for && or || at the start of a line
> > =

> =

> Hi Joe
> This patch probably got missed. Please review :)

Did you look at $Assignment?  Did you see it can be /=3D ?

If it is, what happens in the $fixed[$fixlinenr] line?


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
