Return-Path: <SRS0=zGdC=E4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4ABC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Nov 2020 02:37:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 943AA206F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Nov 2020 02:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 943AA206F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1FC7E20109;
	Sun, 22 Nov 2020 02:37:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VHA65AfXuHbU; Sun, 22 Nov 2020 02:37:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EDC3F20494;
	Sun, 22 Nov 2020 02:37:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4327C1825;
	Sun, 22 Nov 2020 02:37:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DB38C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 02:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5A0298716C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 02:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryJZ57HZL6N6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 02:37:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0131.hostedemail.com
 [216.40.44.131])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D736D87148
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 02:37:32 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id B9DA1100E7B42;
 Sun, 22 Nov 2020 02:37:31 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: step08_1801d0827359
X-Filterd-Recvd-Size: 3257
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Sun, 22 Nov 2020 02:37:30 +0000 (UTC)
Message-ID: <1823e72eb92280d30457dda49e0a0036dee15dd3.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Date: Sat, 21 Nov 2020 18:37:29 -0800
In-Reply-To: <20201121210442.17299-1-yashsri421@gmail.com>
References: <a6ee46ce01747627196478ff2a965d48dd4eed73.camel@perches.com>
 <20201121210442.17299-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: add fix option
	for LOGICAL_CONTINUATIONS
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

On Sun, 2020-11-22 at 02:34 +0530, Aditya Srivastava wrote:
> Currently, checkpatch warns if logical continuations are placed at the
> start of a line and not at the end of previous line.
> 
> E.g., running checkpatch on commit 3485507fc272 ("staging:
> bcm2835-camera: Reduce length of enum names") reports:
> 
> CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the
> previous line
> +	if (!ret
> +	    && camera_port ==
> 
> Provide a simple fix by adding logical operator at the end of previous
> line and removing from current line, if both the lines are additions
> (ie start with '+')
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> changes in v2: quote $operator at substitution
> 
> changes in v3: add a check for previous line ending with comment;
> If so, insert $operator at the last non-comment, non-whitespace char of the previous line
> 
> changes in v4: improve the matching mechanism by matching line termination at comment or white space;
> insert the operator before comments (if any) separated by a whitespace;
> append the comment and its pre-whitespace after the inserted operator (if comment was present),
> ie if no comment was present nothing will be inserted after the operator

nak. I gave you a hint to the match string to use.

$prevline =~ /[\s$;]*$/

this matches either /* foo */ or // foo comment styles
(or optional blanks before EOL)

Try something like:
---
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fab38b493cef..3c78cf0c219f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3434,8 +3434,15 @@ sub process {
 
 # check for && or || at the start of a line
 		if ($rawline =~ /^\+\s*(&&|\|\|)/) {
-			CHK("LOGICAL_CONTINUATIONS",
-			    "Logical continuations should be on the previous line\n" . $hereprev);
+			my $operator = $1;
+			if (CHK("LOGICAL_CONTINUATIONS",
+				"Logical continuations should be on the previous line\n" . $hereprev) &&
+			    $fix && $prevrawline =~ /^\+/) {
+				# add logical operator to the previous line, remove from current line
+				$prevline =~ /([\s$;]*$)/;
+				substr($fixed[$fixlinenr - 1], $-[0]) = " $operator" . substr($prevrawline, $-[0],$+[0]);
+				$fixed[$fixlinenr] =~ s/\Q$operator\E\s*//;
+			}
 		}
 
 # check indentation starts on a tab stop

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
