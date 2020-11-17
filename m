Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63E7C63777
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 04:20:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 302D42463D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 04:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 302D42463D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CB95687060;
	Tue, 17 Nov 2020 04:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPS4kIOvj6nt; Tue, 17 Nov 2020 04:20:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4792987053;
	Tue, 17 Nov 2020 04:20:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EC85C0891;
	Tue, 17 Nov 2020 04:20:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07632C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 04:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DB7C487053
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 04:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EorsLDFwfbFH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 04:20:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0017.hostedemail.com
 [216.40.44.17])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ADEB68703C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 04:20:45 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 83C7A837F24A;
 Tue, 17 Nov 2020 04:20:44 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: birth03_35059fb2732e
X-Filterd-Recvd-Size: 3269
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Tue, 17 Nov 2020 04:20:43 +0000 (UTC)
Message-ID: <477496bed101ed007e7e8db6d511ece2fa2d119c.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Date: Mon, 16 Nov 2020 20:20:42 -0800
In-Reply-To: <20201117040501.21914-1-yashsri421@gmail.com>
References: <20201117040501.21914-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix option
	for MAINTAINERS_STYLE
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

On Tue, 2020-11-17 at 09:35 +0530, Aditya Srivastava wrote:
> Checkpatch expects entries in MAINTAINERS file in a specific order and
> warns if the changes made do not follow the specified order.
> =

> E.g., running checkpatch on commit b33bc2b878e0 ("nexthop: Add entry to
> MAINTAINERS") reports this warning:
> =

> WARNING: Misordered MAINTAINERS entry - list file patterns in
> alphabetic order
> +F:	include/uapi/linux/nexthop.h
> +F:	include/net/netns/nexthop.h

OK, this should work.
Thanks Aditya.

Acked-by: Joe Perches <joe@perches.com>

> =

> Provide a simple fix by swapping the unordered lines, if both the lines
> are additions (start with '+')
> =

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> Changes in v2:
> modified commit message
> =

> Changes in v3:
> add check if both the lines are additions(ie start with '+')
> =

> =A0scripts/checkpatch.pl | 17 +++++++++++++----
> =A01 file changed, 13 insertions(+), 4 deletions(-)
> =

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 2749f32dffe9..7ee3f05c354d 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3299,13 +3299,22 @@ sub process {
> =A0					     "Unknown MAINTAINERS entry type: '$cur'\n" . $herecurr);
> =A0				} else {
> =A0					if ($previndex >=3D 0 && $curindex < $previndex) {
> -						WARN("MAINTAINERS_STYLE",
> -						     "Misordered MAINTAINERS entry - list '$cur:' before '$prev:'\=
n" . $hereprev);
> +						if (WARN("MAINTAINERS_STYLE",
> +							 "Misordered MAINTAINERS entry - list '$cur:' before '$prev:'\n" =
. $hereprev) &&
> +						    $fix && $prevrawline =3D~ /^\+[A-Z]:/) {
> +							# swap these lines
> +							$fixed[$fixlinenr - 1] =3D $rawline;
> +							$fixed[$fixlinenr] =3D $prevrawline;
> +						}
> =A0					} elsif ((($prev eq 'F' && $cur eq 'F') ||
> =A0						  ($prev eq 'X' && $cur eq 'X')) &&
> =A0						 ($prevval cmp $curval) > 0) {
> -						WARN("MAINTAINERS_STYLE",
> -						     "Misordered MAINTAINERS entry - list file patterns in alphabe=
tic order\n" . $hereprev);
> +						if (WARN("MAINTAINERS_STYLE",
> +							 "Misordered MAINTAINERS entry - list file patterns in alphabetic=
 order\n" . $hereprev) &&
> +						    $fix && $prevrawline =3D~ /^\+[A-Z]:/) {
> +							$fixed[$fixlinenr - 1] =3D $rawline;
> +							$fixed[$fixlinenr] =3D $prevrawline;
> +						}
> =A0					}
> =A0				}
> =A0			}


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
