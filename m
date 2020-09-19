Return-Path: <SRS0=DonT=C4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6C5C43464
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 18:58:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6884920874
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 18:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6884920874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED2FC868EF;
	Sat, 19 Sep 2020 18:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11SNdwVVR4vg; Sat, 19 Sep 2020 18:58:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E8DE868CC;
	Sat, 19 Sep 2020 18:58:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28E97C088B;
	Sat, 19 Sep 2020 18:58:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8F0EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 18:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 97B34871BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 18:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7qIHbDpJQAiC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 18:57:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0172.hostedemail.com
 [216.40.44.172])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7B71F871BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 18:57:59 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 452431813B7A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 18:19:31 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id E9A8B100E7B44;
 Sat, 19 Sep 2020 18:19:27 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: hook55_5d0121d27135
X-Filterd-Recvd-Size: 3623
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Sat, 19 Sep 2020 18:19:26 +0000 (UTC)
Message-ID: <f5d8124e54a50480b0a9fa638787bc29b6e09854.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 19 Sep 2020 11:19:25 -0700
In-Reply-To: <alpine.DEB.2.21.2009191950460.7901@felia>
References: <20200919081225.28624-1-dwaipayanray1@gmail.com>
 <ad937bba6ebd306f6e467add90cfd857bb4f2391.camel@perches.com>
 <alpine.DEB.2.21.2009191950460.7901@felia>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: apw@canonical.com, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: extend author
 Signed-off-by check for split From: header
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

On Sat, 2020-09-19 at 20:12 +0200, Lukas Bulwahn wrote:
> 
> On Sat, 19 Sep 2020, Joe Perches wrote:
> 
> > On Sat, 2020-09-19 at 13:42 +0530, Dwaipayan Ray wrote:
> > > Checkpatch did not handle cases where the author From: header
> > > was split into two lines. The author string went empty and
> > > checkpatch generated a false NO_AUTHOR_SIGN_OFF warning.
> > 
> > It's good to provide an example where the current code
> > doesn't work.
> > 
> 
> Joe, as this is a linux-kernel-mentees patch, we discussed that before 
> reaching out to you; you can find Dwaipayan's own evaluation here:
> 
> https://lore.kernel.org/linux-kernel-mentees/CABJPP5BOTG0QLFSaRJTb2vAZ_hJf229OAQihHKG4sYd35i_WMw@mail.gmail.com/
> 
> Dwaipayan, Joe's comment is still valid; it would be good to describe
> the reasons why patches might have split lines (as far as see, long 
> encodings for non-ascii names).
> 
> I will run my own evaluation of checkpatch.pl before and after patch 
> application on Monday and then check if I can confirm Dwaipayan's results.
> 
> > It likely would be better to do this by searching forward for
> > any extension lines after a "^From:' rather than searching
> > backwards as there can be any number of extension lines.
> > 
> 
> Just to sure what you are talking about...
> 
> You mean just to access the next line through the lines array, rather 
> than using prevheader and trying to decode that one line twice.
> 
> I agree the logic is a bit redundant and complicated at the moment.
> 
> Once prevheader is non-empty, it already clear that author is '' and 
> prevheader decodes with that match, because that is the only way to
> make prevheader non-empty in the first place; at least as far I see it 
> right now.

Yeah, something like this (completely untested):
---
 scripts/checkpatch.pl | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3e474072aa90..2c710d05b184 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2679,9 +2679,13 @@ sub process {
 		}
 
 # Check the patch for a From:
-		if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
+		if ($line =~ /^From:\s*(.*)/i) {
 			$author = $1;
-			$author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
+			my $curline = $linenr;
+			while (defined($rawlines[$curline] && $rawlines[$curline++] =~ /^ \s*(.*)/) {
+				$author .= $1;
+			}
+			$author = encode("utf8", $author) if ($author =~ /=\?utf-8\?/i);
 			$author =~ s/"//g;
 			$author = reformat_email($author);
 		}


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
