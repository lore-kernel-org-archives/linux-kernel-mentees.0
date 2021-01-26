Return-Path: <SRS0=tq4P=G5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF0CC43381
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jan 2021 20:31:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33035221FC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jan 2021 20:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33035221FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9664C84F24;
	Tue, 26 Jan 2021 20:31:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjKtkCtTzuBf; Tue, 26 Jan 2021 20:30:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E3EA684F2E;
	Tue, 26 Jan 2021 20:30:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8077C0FA7;
	Tue, 26 Jan 2021 20:30:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 355C0C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 20:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 26C3886DE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 20:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WlOtSQXHASJ1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 20:30:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0242.hostedemail.com
 [216.40.44.242])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1335D86E1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 20:30:54 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 1E0948124198
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 20:11:18 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 3F4C918224D77;
 Tue, 26 Jan 2021 20:11:11 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: bean36_25142e827591
X-Filterd-Recvd-Size: 3411
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Tue, 26 Jan 2021 20:11:10 +0000 (UTC)
Message-ID: <9bfc9c21d93bb55419954114ed3a7e5cbdc84ddb.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 26 Jan 2021 12:11:09 -0800
In-Reply-To: <20210126183521.26535-2-dwaipayanray1@gmail.com>
References: <20210126183521.26535-1-dwaipayanray1@gmail.com>
 <20210126183521.26535-2-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 1/3] checkpatch: add verbose
	mode
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

On Wed, 2021-01-27 at 00:05 +0530, Dwaipayan Ray wrote:
> Add a new verbose mode to checkpatch.pl to emit additional verbose
> test descriptions.
> =

> The verbose mode is optional and can be enabled by the flag
> --verbose.
> =

> The test descriptions are itself loaded from the checkpatch

descriptions are themselves, but themselves is unnecessary.

The verbose descriptions are read from Documentation/dev-tools/checkpatch.r=
st

> documentation file at Documentation/dev-tools/checkpatch.rst.
> The descriptions in the documentation are in a specified format
> enclosed within .. CHECKPATCH_START and .. CHECKPATCH_END labels.
> =

> This serves a dual purpose as an external documentation to checkpatch
> as well as enables flawless integration of the verbose mode.

Using 'flawless' when describing code or documentation generally isn't true.

> A subtle example of the format is as follows:

What is subtle about an example?

If there is something subtle about an example, there's also something
wrong with the example.

> Documentation/dev-tools/checkpatch.rst:
> =

> .. CHECKPATCH_START

Nak on the keyword uses.

This should really just parse the input file whenever TYPE is found
via some fixed format and save the verbose description after that.

Use .rst Field Lists instead, and ideally, keep the list in alphabetic
order or group by similar use.

https://docutils.sourceforge.io/docs/user/rst/quickref.html#field-lists

e.g.:

:LINE_SPACING:
	Vertical space is wasted given the limited number of lines an
	editor window can display when multiple blank lines are used.

:SPACING:
	Whitespace style used in the kernel sources is described in
	ref:`Documentation/process/Coding-Style.rst section 3.1.

:TRAILING_WHITESPACE:
	Trailing whitespace should always be removed.
	Some editors highlight the trailing whitespace and cause visual
	distractions when editing files.

etc...

> @@ -2185,6 +2235,11 @@ sub report {
> =A0		splice(@lines, 1, 1);
> =A0		$output =3D join("\n", @lines);
> =A0	}
> +
> +	if ($verbose && !$terse &&
> +	    exists $verbose_messages{$type}) {
> +		$output .=3D $verbose_messages{$type} . "\n\n";
> +	}
> =A0	$output =3D (split('\n', $output))[0] . "\n" if ($terse);

Don't use unnecessary multiple tests of the same object, just reorder
the code instead.  And also please use c-style function parentheses
rather than bare tests.

	if ($terse) {
		$output =3D ...
	} elsif ($verbose && exists($verbose_messages{$type})) {
		$output .=3D ...
	}



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
