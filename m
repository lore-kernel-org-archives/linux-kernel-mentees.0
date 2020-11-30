Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B377C63777
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 18:41:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F87A20725
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 18:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F87A20725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0886722C44;
	Mon, 30 Nov 2020 18:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Im3lO4zxVSrA; Mon, 30 Nov 2020 18:41:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6B00520345;
	Mon, 30 Nov 2020 18:41:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6231EC163C;
	Mon, 30 Nov 2020 18:41:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FEE5C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 18:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 652B122C44
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 18:40:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P4RHAB019iMq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 18:40:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0076.hostedemail.com
 [216.40.44.76])
 by silver.osuosl.org (Postfix) with ESMTPS id 11CF520345
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 18:40:54 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id BD7611802B171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 18:01:17 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 0A3B6837F27B;
 Mon, 30 Nov 2020 18:01:15 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: fan15_5b14f8f273a3
X-Filterd-Recvd-Size: 3081
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Mon, 30 Nov 2020 18:01:13 +0000 (UTC)
Message-ID: <40b6e1fa9fc638a7e755f7e91f401b6019fee2fa.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 30 Nov 2020 10:01:12 -0800
In-Reply-To: <CABJPP5BxO20-YzbTZij4gZGm4R63iG_n2kH58pSz5mgyXXwVBw@mail.gmail.com>
References: <20201130144515.8320-1-dwaipayanray1@gmail.com>
 <c8eeab847fc09368ce270ea3e06ea0bbbd7d1b7f.camel@perches.com>
 <CABJPP5BLjbx3FbvB3nAOiHfkRLUo7s0n-vboE+AXJqrZXseUNQ@mail.gmail.com>
 <070109a56817288562a91dfeec74359eb948234e.camel@perches.com>
 <CABJPP5BxO20-YzbTZij4gZGm4R63iG_n2kH58pSz5mgyXXwVBw@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix TYPO_SPELLING
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, 2020-11-30 at 23:02 +0530, Dwaipayan Ray wrote:
> Sorry I think i explained wrong. For words like "doesn't", it still
> has the same problem.

I think you explained it wrong when you didn't mention this is
_only_ a problem when using --codespell.

Likely it'd be better to use "(?:^|\s)($misspellings)(?=\s|$)"

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7dc094445d83..b1783f02f745 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3106,7 +3106,7 @@ sub process {
 # Check for various typo / spelling mistakes
 		if (defined($misspellings) &&
 		    ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
-			while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
+			while ($rawline =~ /(?:^|\s)($misspellings)(?=\s|$)/gi) {
 				my $typo = $1;
 				my $typo_fix = $spelling_fix{lc($typo)};
 				$typo_fix = ucfirst($typo_fix) if ($typo =~ /^[A-Z]/);

$ cat t_spell.c
// SPDX-License-Identifier: GPL-2.0-only
void foo(void)
{
	//misspelled doesn' doesn't arne't word
}

$ ./scripts/checkpatch.pl -f --strict t_spell.c --codespell --codespellfile /usr/lib/python3/dist-packages/codespell_lib/data/dictionary.txt
CHECK: 'doesn'' may be misspelled - perhaps 'doesn't'?
#4: FILE: t_spell.c:4:
+	//misspelled doesn' doesn't arne't word

CHECK: 'arne't' may be misspelled - perhaps 'aren't'?
#4: FILE: t_spell.c:4:
+	//misspelled doesn' doesn't arne't word

total: 0 errors, 0 warnings, 2 checks, 5 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

t_spell.c has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
