Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106B5C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 12:10:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85EC922226
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 12:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85EC922226
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3A7CE86C5A;
	Sat, 21 Nov 2020 12:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wfr4lGE6tpXH; Sat, 21 Nov 2020 12:10:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 39A0E84413;
	Sat, 21 Nov 2020 12:10:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 359E3C1825;
	Sat, 21 Nov 2020 12:10:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2CAB5C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1B54D874D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jd-z1zu6dzHx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:10:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0170.hostedemail.com
 [216.40.44.170])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 10F11874C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:10:35 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 14FDC18014480
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:10:33 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id BB7C0837F24A;
 Sat, 21 Nov 2020 12:10:30 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: drain07_1a158e527354
X-Filterd-Recvd-Size: 2923
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Sat, 21 Nov 2020 12:10:29 +0000 (UTC)
Message-ID: <edc52eb1c1515a592d93799933021ff39ba8028e.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Date: Sat, 21 Nov 2020 04:10:28 -0800
In-Reply-To: <20201121120407.22942-1-yashsri421@gmail.com>
References: <1d7692d0-359f-6b6a-32d4-1627ebd8b100@gmail.com>
 <20201121120407.22942-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: add fix option
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

On Sat, 2020-11-21 at 17:34 +0530, Aditya Srivastava wrote:
> Currently, checkpatch warns us if an assignment operator is placed
> at the start of a line and not at the end of previous line.

Right, thanks.

Acked-by: Joe Perches <joe@perches.com>

> =

> E.g., running checkpatch on commit 8195b1396ec8 ("hv_netvsc: fix
> deadlock on hotplug") reports:
> =

> CHECK: Assignment operator '=3D' should be on the previous line
> +	struct netvsc_device *nvdev
> +		=3D container_of(w, struct netvsc_device, subchan_work);
> =

> Provide a simple fix by appending assignment operator to the previous
> line and removing from the current line, if both the lines are additions
> (ie start with '+')
> =

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> Changes in v2:
> add check if both the lines are additions (ie start with '+')
> =

> Changes in v3:
> quote $operator; test with division assignment operator ('/=3D')
> =

> Changes in v4:
> fix incorrect use of quote
> =

> =A0scripts/checkpatch.pl | 10 ++++++++--
> =A01 file changed, 8 insertions(+), 2 deletions(-)
> =

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 2749f32dffe9..d4c8d42cb13e 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3533,8 +3533,14 @@ sub process {
> =A0
> =

> =A0# check for assignments on the start of a line
> =A0		if ($sline =3D~ /^\+\s+($Assignment)[^=3D]/) {
> -			CHK("ASSIGNMENT_CONTINUATIONS",
> -			    "Assignment operator '$1' should be on the previous line\n" . $he=
reprev);
> +			my $operator =3D $1;
> +			if (CHK("ASSIGNMENT_CONTINUATIONS",
> +				"Assignment operator '$1' should be on the previous line\n" . $herep=
rev) &&
> +			    $fix && $prevrawline =3D~ /^\+/) {
> +				# add assignment operator to the previous line, remove from current =
line
> +				$fixed[$fixlinenr - 1] .=3D " $operator";
> +				$fixed[$fixlinenr] =3D~ s/\Q$operator\E\s*//;
> +			}
> =A0		}
> =A0
> =

> =A0# check for && or || at the start of a line


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
