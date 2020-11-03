Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B8EC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 19:32:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B63EE216C4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 19:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B63EE216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 36784862C1;
	Tue,  3 Nov 2020 19:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DvKkjSJvGqgU; Tue,  3 Nov 2020 19:32:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 63637860DE;
	Tue,  3 Nov 2020 19:32:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A52AC088B;
	Tue,  3 Nov 2020 19:32:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39659C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 19:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1ED1986B89
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 19:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nboTXh-F0AMf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 19:32:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0243.hostedemail.com
 [216.40.44.243])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DCE5486B16
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 19:32:15 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 7092218225AE2;
 Tue,  3 Nov 2020 19:32:13 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: iron68_570fe6d272bb
X-Filterd-Recvd-Size: 3437
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Tue,  3 Nov 2020 19:32:12 +0000 (UTC)
Message-ID: <6c275d95c3033422addfc256a30e6ae3dd37941d.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 03 Nov 2020 11:32:10 -0800
In-Reply-To: <CAKXUXMwH+tEBSV6xA952xQQFe+HvdJ5ew6V=n63sk89enj6p7Q@mail.gmail.com>
References: <20201103054810.21978-1-dwaipayanray1@gmail.com>
 <CABJPP5DkJ3gwZDW+FBShs3Yo8z6GfP4LSMRW4hO5hL+fVXjShQ@mail.gmail.com>
 <e9d540c35ac04f0bb69e26d29c76c7cbd5693df8.camel@perches.com>
 <CAKXUXMwH+tEBSV6xA952xQQFe+HvdJ5ew6V=n63sk89enj6p7Q@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: improve email
	parsing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, 2020-11-03 at 09:10 +0100, Lukas Bulwahn wrote:
> Maybe you can coordinate among each other who would want to create
> suitable fix rules here?

Yes please.

> Also, start with the class of the most frequent mistakes for
> unexpected content after email addresses.
> 
> I imagine that a maintainer can simply run a tag sanitizing script
> which just cleans up those stupid mistakes before creating their git
> trees or sending git pulls to Linus.

Does anyone really do that?
It generally requires rebasing or post processing each commit after
being committed before another commit occurs.

> Let us try to add these
> sanitizing rules to checkpatch.pl with fix options for now; if that
> sanitizing feature becomes a monster script of its own within
> checkpatch.pl, we can refactor that into an independent script for
> cleaning up.

I rather doubt an independent script is going to be worthwhile
as these rules shouldn't be all that complex.

The only prefixes acceptable for a stable address should be
CC:|Cc:|cc:.  There are 2 uses in the last 100k commits for
Signed-off-by: and Acked-by: with stable addresses, those should have a
message/warning emitted in the future.

The forms used with those cc: stable addresses:

2777	stable without comment
1381	stable # comment
74	stable [ comment ]

So I suggest standardizing on no comment and # comment with any other
style getting a warning.

For non-stable <foo>-by: and cc: addresses and other signatures:

Likely any content after a email address other than a parenthesized
block should have some checkpatch message emitted.

This should be OK:

Signed-off-by: Full Name (comment) <address@domain.tld> (maintainer:...)

But perhaps this should not be OK:

Signed-off-by: Full Name (comment) <address@domain.tld> # comment

There are 316 uses of this # comment style in the last 100k commits
and 103 with (comment) after the address.
Maybe the # use should be ok, maybe not.

And anyone that uses a multiple comments in a name or a even
a single comment in the email address should also get warned.

The below should not be OK even if actually valid address forms:

Signed-off-by: Full (comment1) Name (comment2) <address@domain.tld>
Signed-off-by: Full Name <address@(comment)domain.tld>


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
