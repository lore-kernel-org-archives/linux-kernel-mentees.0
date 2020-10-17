Return-Path: <SRS0=PE7C=DY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDCFC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 05:18:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FD0D207EA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 05:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FD0D207EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2B7A620522;
	Sat, 17 Oct 2020 05:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dj9P-LgSi3zm; Sat, 17 Oct 2020 05:18:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E41CD20515;
	Sat, 17 Oct 2020 05:18:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D763BC07FF;
	Sat, 17 Oct 2020 05:18:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BC44C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 234B420522
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uT8ae760IB80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:18:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0140.hostedemail.com
 [216.40.44.140])
 by silver.osuosl.org (Postfix) with ESMTPS id 7ECA520515
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:18:24 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 958FA18016C7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 04:42:48 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 16758180A7FE1;
 Sat, 17 Oct 2020 04:42:46 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: care04_3a11e6e27222
X-Filterd-Recvd-Size: 6288
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Sat, 17 Oct 2020 04:42:45 +0000 (UTC)
Message-ID: <9465f2a318bee7e723c250ff39cf56d6b23780cd.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 16 Oct 2020 21:42:43 -0700
In-Reply-To: <CABJPP5DjmY8N18XOhikHymiwkF9h213Rwi-ffQiBvKSrw2WqyA@mail.gmail.com>
References: <20201014163738.117332-1-dwaipayanray1@gmail.com>
 <ea011df1e30ce445d51e128287e2c6c38de20949.camel@perches.com>
 <CABJPP5DrSL7GoZUWc7P02CfLHfTBmfpLxrVOVQ08KH3pPontoA@mail.gmail.com>
 <7d8c7d80aa7b0524cca49a6dfe24e878bea6ab12.camel@perches.com>
 <81b6a0bb2c7b9256361573f7a13201ebcd4876f1.camel@perches.com>
 <CABJPP5DjmY8N18XOhikHymiwkF9h213Rwi-ffQiBvKSrw2WqyA@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add new exception
	to repeated word check
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

On Sat, 2020-10-17 at 10:02 +0530, Dwaipayan Ray wrote:
> On Sat, Oct 17, 2020 at 8:26 AM Joe Perches <joe@perches.com> wrote:
> > On Wed, 2020-10-14 at 11:35 -0700, Joe Perches wrote:
> > > On Wed, 2020-10-14 at 23:42 +0530, Dwaipayan Ray wrote:
> > > > On Wed, Oct 14, 2020 at 11:33 PM Joe Perches <joe@perches.com> wrote:
> > > > > On Wed, 2020-10-14 at 22:07 +0530, Dwaipayan Ray wrote:
> > > > > > Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
> > > > > > moved the repeated word test to check for more file types. But after
> > > > > > this, if checkpatch.pl is run on MAINTAINERS, it generates several
> > > > > > new warnings of the type:
> > > > > 
> > > > > Perhaps instead of adding more content checks so that
> > > > > word boundaries are not something like \S but also
> > > > > not punctuation so that content like
> > > > > 
> > > > >         git git://
> > > > >         @size size
> > > > > 
> > > > > does not match?
> > > > > 
> > > > > 
> > > > Hi,
> > > > So currently the words are trimmed of non alphabets before the check:
> > > > 
> > > > while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
> > > > my $first = $1;
> > > > my $second = $2;
> > > > 
> > > > where, the word_pattern is:
> > > > my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
> > > 
> > > I'm familiar.
> > > 
> > > > So do you perhaps recommend modifying this word pattern to
> > > > include the punctuation as well rather than trimming them off?
> > > 
> > > Not really, perhaps use the capture group position
> > > markers @- @+ or $-[1] $+[1] and $-[2] $+[2] with the
> > > substr could be used to see what characters are
> > > before and after the word matches.
> > 
> > Perhaps something like:
> > ---
> >  scripts/checkpatch.pl | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index fab38b493cef..a65eb40a5539 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3054,15 +3054,25 @@ sub process {
> > 
> >                                 my $first = $1;
> >                                 my $second = $2;
> > +                               my $start_pos = $-[1];
> > +                               my $end_pos = $+[2];
> > 
> >                                 if ($first =~ /(?:struct|union|enum)/) {
> >                                         pos($rawline) += length($first) + length($second) + 1;
> >                                         next;
> >                                 }
> > 
> > -                               next if ($first ne $second);
> > +                               next if (lc($first) ne lc($second));
> >                                 next if ($first eq 'long');
> > 
> > +                               my $start_char = "";
> > +                               my $end_char = "";
> > +                               $start_char = substr($rawline, $start_pos - 1, 1) if ($start_pos > 0);
> > +                               $end_char = substr($rawline, $end_pos, 1) if (length($rawline) > $end_pos);
> > +
> > +                               next if ($start_char =~ /^\S$/);
> > +                               next if ($end_char !~ /^[\.\,\s]?$/);
> > +
> >                                 if (WARN("REPEATED_WORD",
> >                                          "Possible repeated word: '$first'\n" . $herecurr) &&
> >                                     $fix) {
> > 
> > 
> 
> Hi Joe,
> Thank you for the insight. I was also doing something similar:
> 
> ---
>  scripts/checkpatch.pl | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index f1a4e61917eb..82497a71ac96 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -595,6 +595,7 @@ our @mode_permission_funcs = (
>  );
> 
>  my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
> +my $punctuation_chars = '[,:;@\.\-]';
> 
>  #Create a search pattern for all these functions to speed up a loop below
>  our $mode_perms_search = "";
> @@ -3065,6 +3066,21 @@ sub process {
>   next if ($first ne $second);
>   next if ($first eq 'long');
> 
> + # check for character before and after the word matches
> + my $ca_first = substr($rawline, $-[1]-1, 1);
> + my $cb_first = substr($rawline, $+[1], 1);
> + my $ca_second = substr($rawline, $-[2]-1, 1);
> + my $cb_second = substr($rawline, $+[2], 1);
> +
> + if ($ca_first ne $ca_second || $cb_first ne $cb_second) {
> + if ($ca_first =~ /$punctuation_chars/ ||
> +     $ca_second =~ /$punctuation_chars/ ||
> +     $cb_first =~ /$punctuation_chars/ ||
> +     $cb_second =~ /$punctuation_chars/) {
> + next;
> + }
> + }
> +
>   if (WARN("REPEATED_WORD",
>   "Possible repeated word: '$first'\n" . $herecurr) &&
>       $fix) {
> 
> Does it look okay to you??

Not really, as ca_second and cb_first are both known
to be the same position and known to be a single space.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
