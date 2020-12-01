Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22A3C64E7A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 18:02:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C51C1206E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 18:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C51C1206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3A1C386AB3;
	Tue,  1 Dec 2020 18:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UD11B4r8zmzE; Tue,  1 Dec 2020 18:02:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D59CE86A84;
	Tue,  1 Dec 2020 18:02:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB1C8C0859;
	Tue,  1 Dec 2020 18:02:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A305C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 564A48762D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxvkTCGFXYAZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:02:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0024.hostedemail.com
 [216.40.44.24])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6B4DE8762B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:02:01 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 3D9F7837F24D;
 Tue,  1 Dec 2020 18:02:00 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: lace58_1c0f780273ac
X-Filterd-Recvd-Size: 2679
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Tue,  1 Dec 2020 18:01:59 +0000 (UTC)
Message-ID: <2d507d3042a97613078554b1b5f1169ab8c41b42.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 01 Dec 2020 10:01:57 -0800
In-Reply-To: <20201201072320.44544-1-dwaipayanray1@gmail.com>
References: <20201201072320.44544-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix TYPO_SPELLING
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

On Tue, 2020-12-01 at 12:53 +0530, Dwaipayan Ray wrote:
> checkpatch reports a false TYPO_SPELLING warning for some words
> containing an apostrophe when run with --codespell option.
> =

> A false positive is "doesn't". Occurrence of the word causes
> checkpatch to emit the following warning:
> =

> "WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?"
> =

> Modify the regex pattern to be more in line with the codespell
> default word matching regex. This fixes the word capture and
> avoids the false warning.
> =

> Suggested-by: Joe Perches <joe@perches.com>
> Reported-by: Peilin Ye <yepeilin.cs@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
> Changes in v2:
> - Use the default codespell word regex.
> - Modify commit message to specify --codespell usage
> =

> =A0scripts/checkpatch.pl | 2 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3106,7 +3106,7 @@ sub process {
> =A0# Check for various typo / spelling mistakes
> =A0		if (defined($misspellings) &&
> =A0		    ($in_commit_log || $line =3D~ /^(?:\+|Subject:)/i)) {
> -			while ($rawline =3D~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi=
) {
> +			while ($rawline =3D~ /(?:^|[^\w\-'`])($misspellings)(?:[^\w\-'`]|$)/g=
i) {

This regex seems to work well, thanks.

> =A0				my $typo =3D $1;

A trivial improvement might be to highlight the location of the
misspelled word with a caret using

				my $blank =3D copy_spacing($rawline);
				my $ptr =3D substr($blank, 0, $-[0] + 1) . "^";
				my $hereptr =3D "$hereline$ptr\n";

> =A0				my $typo_fix =3D $spelling_fix{lc($typo)};
> =A0				$typo_fix =3D ucfirst($typo_fix) if ($typo =3D~ /^[A-Z]/);

and using $hereptr and not $hereline when emitting the message.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
