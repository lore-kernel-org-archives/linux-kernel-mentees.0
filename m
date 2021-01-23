Return-Path: <SRS0=Gcau=G2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987BEC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 21:01:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC56222CA0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 21:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC56222CA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4FED9204B9;
	Sat, 23 Jan 2021 21:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TAyDPxGLMXQp; Sat, 23 Jan 2021 21:01:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A4F4D20361;
	Sat, 23 Jan 2021 21:01:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F4D2C08A1;
	Sat, 23 Jan 2021 21:01:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7101C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 21:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 98EF9863FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 21:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J2T4FAXcvQV1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 21:01:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0004.hostedemail.com
 [216.40.44.4])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AA15886274
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 21:01:54 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 028621800BE9C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 21:01:48 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 8D756100E7B42;
 Sat, 23 Jan 2021 21:01:45 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: bait30_0e0497e27577
X-Filterd-Recvd-Size: 3210
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Sat, 23 Jan 2021 21:01:43 +0000 (UTC)
Message-ID: <a7329e5d5661ed6478a7eb33db854a6357447c16.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Date: Sat, 23 Jan 2021 13:01:42 -0800
In-Reply-To: <20210123190459.9701-1-yashsri421@gmail.com>
References: <f23f4003-0017-d52a-39b9-2737e60182bb@gmail.com>
 <20210123190459.9701-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 broonie@kernel.org, jpoimboe@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add warning for
 avoiding .L prefix symbols in assembly files
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

On Sun, 2021-01-24 at 00:34 +0530, Aditya Srivastava wrote:
> objtool requires that all code must be contained in an ELF symbol.
> Symbol names that have a '.L' prefix do not emit symbol table entries, as
> they have special meaning for the assembler.
> =

> '.L' prefixed symbols can be used within a code region, but should be
> avoided for denoting a range of code via 'SYM_*_START/END' annotations.
> =

> Add a new check to emit a warning on finding the usage of '.L' symbols
> for '.S' files, if it denotes range of code via SYM_*_START/END
> annotation pair.
> =

> Suggested-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/lkml/20210112210154.GI4646@sirena.org.uk
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Joe Perches <joe@perches.com>

> ---
> * Applies perfectly on next-20210122
> =

> Changes in v3:
> - Modify regex for SYM_*_START/END pair
> - remove check for arch/x86/entry/* and arch/x86/lib/*
> - change 'Link:' in commit message to lkml
> - Modify commit description accordingly
> =

> Changes in v2:
> - Reduce the check to only SYM_*_START/END lines
> - Reduce the check for only .S files in arch/x86/entry/* and arch/x86/lib=
/* as suggested by Josh and Nick
> - Modify commit message
> =

> =A0scripts/checkpatch.pl | 7 +++++++
> =A01 file changed, 7 insertions(+)
> =

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7030c4d6d126..4a03326c87b6 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3590,6 +3590,13 @@ sub process {
> =A0			}
> =A0		}
> =A0
> =

> +# check for .L prefix local symbols in .S files
> +		if ($realfile =3D~ /\.S$/ &&
> +		    $line =3D~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)=
?\s*\(\s*\.L/) {
> +			WARN("AVOID_L_PREFIX",
> +			     "Avoid using '.L' prefixed local symbol names for denoting a ran=
ge of code via 'SYM_*_START/END' annotations; see Documentation/asm-annotat=
ions.rst\n" . $herecurr);
> +		}
> +
> =A0# check we are in a valid source file C or perl if not then ignore thi=
s hunk
> =A0		next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
> =A0
> =



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
