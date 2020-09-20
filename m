Return-Path: <SRS0=4nEd=C5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA91C43465
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Sep 2020 17:37:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C75020789
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Sep 2020 17:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C75020789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2A79786A26;
	Sun, 20 Sep 2020 17:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hnIgmdgaPrhC; Sun, 20 Sep 2020 17:37:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B7C886A24;
	Sun, 20 Sep 2020 17:37:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32669C0859;
	Sun, 20 Sep 2020 17:37:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3992FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 17:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2815585F09
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 17:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uIXsIr87OdNo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 17:37:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0067.hostedemail.com
 [216.40.44.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 01B8685D94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 17:37:28 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id D8A2A181CA74F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 15:09:46 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 1A7B7180A7FFE;
 Sun, 20 Sep 2020 15:09:44 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: taste68_280c5f42713d
X-Filterd-Recvd-Size: 5265
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf10.hostedemail.com (Postfix) with ESMTPA;
 Sun, 20 Sep 2020 15:09:43 +0000 (UTC)
Message-ID: <7958ded756c895ca614ba900aae7b830a992475e.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 20 Sep 2020 08:09:42 -0700
In-Reply-To: <20200920091706.56276-1-dwaipayanray1@gmail.com>
References: <20200920091706.56276-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: apw@canonical.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: extend author
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, 2020-09-20 at 14:47 +0530, Dwaipayan Ray wrote:
> Checkpatch did not handle cases where the author From: header
> was split into multiple lines. The author identity could not
> be resolved and checkpatch generated a false NO_AUTHOR_SIGN_OFF
> warning.

Hi Dwaipayan.

> A typical example is Commit e33bcbab16d1 ("tee: add support for
> session's client UUID generation"). When checkpatch was run on
> this commit, it displayed:
> =

> "WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal
> patch author ''"
> =

> This was due to split header lines not being handled properly and
> the author himself wrote in Commit cd2614967d8b ("checkpatch: warn
> if missing author Signed-off-by"):
> =

> "Split From: headers are not fully handled: only the first part
> is compared."
> =

> Support split From: headers by correctly parsing the header
> extension lines. RFC 2822, Section-2.2.3 stated that each extended
> line must start with a WSP character (a space or htab). The solution
> was therefore to concatenate the lines which start with a WSP to
> get the correct long header.

This is a good commit message, though I believe the
latest rfc is 5322.  I'm not sure there is any real
difference in the referenced section though.

While your patch seems to work for git format-email,
other emailers seem to set headers that have multiple
whitespace chars that should be collapsed into a
single space.

I think you'll find that the eliding all whitespace
after header folding causes mismatches for emails.

For instance:

From:   "=3D?UTF-8?q?Christian=3D20K=3DC3=3DB6nig?=3D" =

        <ckoenig.leichtzumerken@gmail.com>

Always inserting a single space if there is any
whitespace after the folding WSP might be better
otherwise this is decoded as

From: "Christian K=F6nig"<ckoenig.leichtzumerken@gmail.com>

What I have does a bit more by saving any post-folding

"From: <name and email address>"

and comparing that to any "name and perhaps different
email address" in a Signed-off-by: line.

A new message is emitted if the name matches but the
email address is different.

Perhaps it's reasonable to apply your patch and then
update it with something like the below:
---
 scripts/checkpatch.pl | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3e474072aa90..1ecc179e938d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1240,6 +1240,15 @@ sub same_email_addresses {
 	       $email1_address eq $email2_address;
 }
 =

+sub same_email_names {
+	my ($email1, $email2) =3D @_;
+
+	my ($email1_name, $name1_comment, $email1_address, $comment1) =3D parse_e=
mail($email1);
+	my ($email2_name, $name2_comment, $email2_address, $comment2) =3D parse_e=
mail($email2);
+
+	return $email1_name eq $email2_name;
+}
+
 sub which {
 	my ($bin) =3D @_;
 =

@@ -2679,20 +2688,32 @@ sub process {
 		}
 =

 # Check the patch for a From:
-		if (decode("MIME-Header", $line) =3D~ /^From:\s*(.*)/) {
+		if ($line =3D~ /^From:\s*(.*)/i) {
 			$author =3D $1;
-			$author =3D encode("utf8", $author) if ($line =3D~ /=3D\?utf-8\?/i);
+			my $curline =3D $linenr;
+			while (defined($rawlines[$curline]) && $rawlines[$curline++] =3D~ /^\s(=
\s+)?(.*)/) {
+				$author .=3D ' ' if (defined($1));
+				$author .=3D "$2";
+			}
+			if ($author =3D~ /=3D\?utf-8\?/i) {
+				$author =3D decode("MIME-Header", $author);
+				$author =3D encode("utf8", $author);
+			}
+
 			$author =3D~ s/"//g;
 			$author =3D reformat_email($author);
 		}
 =

 # Check the patch for a signoff:
 		if ($line =3D~ /^\s*signed-off-by:\s*(.*)/i) {
+			my $sig =3D $1;
 			$signoff++;
 			$in_commit_log =3D 0;
 			if ($author ne '') {
-				if (same_email_addresses($1, $author)) {
-					$authorsignoff =3D 1;
+				if (same_email_addresses($sig, $author)) {
+					$authorsignoff =3D "1";
+				} elsif (same_email_names($sig, $author)) {
+					$authorsignoff =3D $sig;
 				}
 			}
 		}
@@ -6937,6 +6958,9 @@ sub process {
 		} elsif (!$authorsignoff) {
 			WARN("NO_AUTHOR_SIGN_OFF",
 			     "Missing Signed-off-by: line by nominal patch author '$author'\n");
+		} elsif ($authorsignoff ne "1") {
+			WARN("NO_AUTHOR_SIGN_OFF",
+			     "From:/SoB: email address mismatch: 'From: $author' !=3D 'Signed-o=
ff-by: $authorsignoff'\n");
 		}
 	}
 =


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
