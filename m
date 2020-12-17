Return-Path: <SRS0=+FSu=FV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD408C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 17:03:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4703020725
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 17:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4703020725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8660878DD;
	Thu, 17 Dec 2020 17:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K+eZFeyi0QVs; Thu, 17 Dec 2020 17:03:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0657387914;
	Thu, 17 Dec 2020 17:03:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02C5EC0893;
	Thu, 17 Dec 2020 17:03:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71928C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 17:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5BE5787A50
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 17:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sae2IoZuVm2s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 17:03:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0190.hostedemail.com
 [216.40.44.190])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E5B0A879F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 17:03:12 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id CFDB880105BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 17:03:10 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 3C7751E1C;
 Thu, 17 Dec 2020 17:03:08 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: board56_600c13927436
X-Filterd-Recvd-Size: 3691
Received: from XPS-9350.home (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Thu, 17 Dec 2020 17:03:07 +0000 (UTC)
Message-ID: <94d6a56174c56ef13c9794186fdbfcc12c376c00.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Date: Thu, 17 Dec 2020 09:03:06 -0800
In-Reply-To: <20201217134221.16178-1-yashsri421@gmail.com>
References: <20201217134221.16178-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
 for COMMIT_LOG_LONG_LINE with URLs
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

On Thu, 2020-12-17 at 19:12 +0530, Aditya Srivastava wrote:
> Currently checkpatch warns for long line in commit messages even for
> URL lines.
> =

> An evaluation over v4.13..v5.8 showed that out of ~11000 warnings for
> this class, around 790 are due to the line containing link.
> =

> E.g. running checkpatch on commit 3cde818cd02b ("ASoC: topology:
> Consolidate how dtexts and dvalues are freed") reports this warning:
> =

> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars=
 per line)
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-January/144761=
.html
> =

> Avoid giving users warning for character limit, instead suggest them to
> prefix the URLs with "Link:"
> =

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> =A0scripts/checkpatch.pl | 10 ++++++++--
> =A01 file changed, 8 insertions(+), 2 deletions(-)
> =

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3032,8 +3032,14 @@ sub process {
> =A0		      $line =3D~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
> =A0					# A Fixes: or Link: line or signature tag line
> =A0		      $commit_log_possible_stack_dump)) {
> -			WARN("COMMIT_LOG_LONG_LINE",
> -			     "Possible unwrapped commit description (prefer a maximum 75 char=
s per line)\n" . $herecurr);
> +			if ($line =3D~ /(?:http|https|ftp):\/\//) {
> +				WARN("COMMIT_LOG_LONG_LINE",
> +				     "Consider prefixing the URL with 'Link:'\n" . $herecurr);
> +			}
> +			else {
> +				WARN("COMMIT_LOG_LONG_LINE",
> +				     "Possible unwrapped commit description (prefer a maximum 75 cha=
rs per line)\n" . $herecurr);
> +			}

NAK.

Aditya, you've submitted several patches to checkpatch and
you should know better by now what coding style is necessary
for acceptance.

			} else {

Make the URI/URL check follow the styles allowed by RFC 3986.
Look at the long_line check around line 3500 introduced by
commit 2e4bbbc550be336cbb3defc67430fc0700aa1426
Author: Andreas Brauchli <a.brauchli@elementarea.net>
Date:   Tue Feb 6 15:38:45 2018 -0800
checkpatch: allow long lines containing URL

Also likely the URI should not be allowed to exceed the line
maximum unless it's the first non-whitespace of the line and
not starting after some other word in the line.

Lastly, this sets $commit_log_long_line even for lines that
are now nominally exempted from the long line check.

The number of nominal fixes you showed above is not correct.

Retrospective testing of checkpatch using --git history
should be aware of changes to checkpatch.

This should count only lines from 75 to 80 chars for the
commit range you tested and only for 75 to 100 for commits
after checkpatch changed its allowed long line maximum in
commit bdc48fa11e46f867ea4d75fa59ee87a7f48be144
checkpatch/coding-style: deprecate 80-column warning



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
