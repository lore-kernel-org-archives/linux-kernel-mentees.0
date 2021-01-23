Return-Path: <SRS0=Gcau=G2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39744C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 17:21:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7950922D75
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 17:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7950922D75
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 08AAD2034C;
	Sat, 23 Jan 2021 17:21:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwOz0t5rjSKw; Sat, 23 Jan 2021 17:21:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A9BA620346;
	Sat, 23 Jan 2021 17:21:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CA65C088B;
	Sat, 23 Jan 2021 17:21:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23488C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 17:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0FF59867B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 17:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOiglfkQRsvS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 17:21:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0242.hostedemail.com
 [216.40.44.242])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C24B9866E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 17:21:07 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 95799837F24F;
 Sat, 23 Jan 2021 17:21:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: sheet19_41034fd27576
X-Filterd-Recvd-Size: 3077
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf15.hostedemail.com (Postfix) with ESMTPA;
 Sat, 23 Jan 2021 17:21:04 +0000 (UTC)
Message-ID: <d5eacb78bd354d26725c34d887a75bf1e8f27a04.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>, linux-kernel@vger.kernel.org
Date: Sat, 23 Jan 2021 09:21:02 -0800
In-Reply-To: <20210123151405.26267-1-yashsri421@gmail.com>
References: <bd560a8e-7949-933a-e4a9-508cb42c2570@gmail.com>
 <20210123151405.26267-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, ndesaulniers@google.com,
 clang-built-linux@googlegroups.com, broonie@kernel.org, jpoimboe@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add warning for
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

On Sat, 2021-01-23 at 20:44 +0530, Aditya Srivastava wrote:
> objtool requires that all code must be contained in an ELF symbol.
> Symbol names that have a '.L' prefix do not emit symbol table entries, as
> they have special meaning for the assembler.
> =

> '.L' prefixed symbols can be used within a code region, but should be
> avoided for denoting a range of code via 'SYM_*_START/END' annotations.
> =

> Add a new check to emit a warning on finding the usage of '.L' symbols
> for '.S' files in arch/x86/entry/* and arch/x86/lib/*, if it denotes
> range of code via SYM_*_START/END annotation pair.
> =

> Suggested-by: Mark Brown <broonie@kernel.org>
> Link: https://groups.google.com/g/clang-built-linux/c/-drkmLgu-cU/m/4staO=
lf-CgAJ

Please do not use groups.google.com links, or if you must, please
use links that are readable.

For instance, this is a better link as it shows the context without
struggling with the poor interface:

https://groups.google.com/g/clang-built-linux/c/E-naBMt_1SM

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> * Applies perfectly on next-20210122
> =

> Changes in v2:
> - Reduce the check to only SYM_*_START/END lines
> - Reduce the check for only .S files in arch/x86/entry/* and arch/x86/lib=
/* as suggested by Josh and Nick

I think that's unnecessary.

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3590,6 +3590,13 @@ sub process {
> =A0			}
> =A0		}
> =A0
> =

> +# check for .L prefix local symbols in .S files
> +		if ($realfile =3D~ m@^arch/x86/(?:entry|lib)/.*\.S$@ &&

Using /.S$/ should be enough

> +		    $line =3D~ /^\+\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L=
/) {

This might need to be

+		    $line =3D~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\=
s*\(\s*\.L/) {

> +			WARN("AVOID_L_PREFIX",
> +			     "Avoid using '.L' prefixed local symbol names for denoting a ran=
ge of code via 'SYM_*_START/END' annotations; see Documentation/asm-annotat=
ions.rst\n" . $herecurr);
> +		}
> +


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
