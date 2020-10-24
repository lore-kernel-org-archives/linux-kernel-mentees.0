Return-Path: <SRS0=3SZq=D7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8275C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 01:37:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C68FE24248
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 01:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C68FE24248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5942C8747D;
	Sat, 24 Oct 2020 01:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEXiTGjbHlY0; Sat, 24 Oct 2020 01:37:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E05B18747C;
	Sat, 24 Oct 2020 01:37:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2E9EC088B;
	Sat, 24 Oct 2020 01:37:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 923E9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 01:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 65ECA203B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 01:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7RCX2oKM3ZrU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 01:37:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0195.hostedemail.com
 [216.40.44.195])
 by silver.osuosl.org (Postfix) with ESMTPS id CAEAB203AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 01:37:21 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 6B111181D3039;
 Sat, 24 Oct 2020 01:37:19 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: stove76_3d02c7c2725e
X-Filterd-Recvd-Size: 4265
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Sat, 24 Oct 2020 01:37:18 +0000 (UTC)
Message-ID: <5bc34c6faf989f528c92f5e631607f1774f08d20.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Date: Fri, 23 Oct 2020 18:37:16 -0700
In-Reply-To: <20201024000830.12871-1-yashsri421@gmail.com>
References: <20201024000830.12871-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: fix false
 positives in REPEATED_WORD warning
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

On Sat, 2020-10-24 at 05:38 +0530, Aditya Srivastava wrote:
> Presence of hexadecimal address or symbol results in false warning
> message by checkpatch.pl.
> =

> For example, running checkpatch on commit b8ad540dd4e4 ("mptcp: fix
> memory leak in mptcp_subflow_create_socket()") results in warning:
> =

> WARNING:REPEATED_WORD: Possible repeated word: 'ff'
> =A0=A0=A0=A000 00 00 00 00 00 00 00 00 2f 30 0a 81 88 ff ff  ........./0.=
....
> =

> Similarly, the presence of list command output in commit results in
> an unnecessary warning.
> =

> For example, running checkpatch on commit 899e5ffbf246 ("perf record:
> Introduce --switch-output-event") gives:
> =

> WARNING:REPEATED_WORD: Possible repeated word: 'root'
> =A0=A0dr-xr-x---. 12 root root    4096 Apr 27 17:46 ..
> =

> Here, it reports 'ff' and 'root to be repeated, but it is in fact part

'root'

> of some address or code, where it has to be repeated.
> =

> In these cases, the intent of the warning to find stylistic issues in
> commit messages is not met and the warning is just completely wrong in
> this case.
> =

> To avoid these warnings, add additional regex check for the

add an

> directory permission pattern and avoid checking the line for this
> class of warning. Similarly, to avoid hex pattern, check if the word
> consists of hex symbols and skip this warning if it is not among the
> common english words formed using hex letters.
> =

> A quick evaluation on v5.6..v5.8 showed that this fix reduces
> REPEATED_WORD warnings from 2797 to 907.

How many of these 907 remaining are still false positive?
 =

> A quick manual check found all cases are related to hex output or
> list command outputs in commit messages.

You mean 1890 of the 2797 are now no longer reported and all 1890
were false positives yes?

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3049,7 +3049,9 @@ sub process {
> =A0		}
> =A0
> =

> =A0# check for repeated words separated by a single space
> -		if ($rawline =3D~ /^\+/ || $in_commit_log) {
> +# avoid false positive from list command eg, '-rw-r--r-- 1 root root'
> +		if (($rawline =3D~ /^\+/ || $in_commit_log) &&
> +                    $rawline !~ /[bcCdDlMnpPs\?-][rwxsStT-]{9}/) {

Use maximal tab indentation and spaces to align please.
2 tabs, 4 spaces

> =A0			pos($rawline) =3D 1 if (!$in_commit_log);
> =A0			while ($rawline =3D~ /\b($word_pattern) (?=3D($word_pattern))/g) {
> =A0
> =

> @@ -3074,6 +3076,17 @@ sub process {
> =A0				next if ($start_char =3D~ /^\S$/);
> =A0				next if (index(" \t.,;?!", $end_char) =3D=3D -1);
> =A0
> =

> +                                # avoid repeating hex occurrences like '=
ff ff fe 09 ...'
> +                                my %allow_repeated_words =3D (
> +                                        add =3D> '',
> +                                        added =3D> '',
> +                                        bad =3D> '',
> +                                        be =3D> '',
> +                                );

If perl caches this local hash declaration, fine,
but I think it better to use 'our %allow_repeated_words'
and move it so it's only declared using the file scope.

> +                                if ($first =3D~ /\b[0-9a-f]{2,}\b/) {

This regex matches only lower case so it wouldn't match "Add".

I think this regex would be clearer using
	/^[0-9a-f]+$/i or /^[A-Fa-f0-9]+$/


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
