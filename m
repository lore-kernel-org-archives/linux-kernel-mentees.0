Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEACDC4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 15:33:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B220E2074B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 15:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B220E2074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6AE48863C5;
	Thu,  1 Oct 2020 15:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mjatZYBEpZ7N; Thu,  1 Oct 2020 15:33:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1C24186374;
	Thu,  1 Oct 2020 15:33:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0753EC016F;
	Thu,  1 Oct 2020 15:33:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F66EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 15:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 82049863C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 15:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RNGdzSKESRIA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 15:33:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0172.hostedemail.com
 [216.40.44.172])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 402CF86374
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 15:33:23 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 0AC2018012CF2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 15:26:31 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 84903100E7B42;
 Thu,  1 Oct 2020 15:26:28 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: judge34_4014a9f2719c
X-Filterd-Recvd-Size: 6149
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Thu,  1 Oct 2020 15:26:27 +0000 (UTC)
Message-ID: <dc985938aa3986702815a0bd68dfca8a03c85447.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 01 Oct 2020 08:26:26 -0700
In-Reply-To: <361bda20762efce0e374bd2ba7c82d1c64628a67.camel@perches.com>
References: <20201001103314.136645-1-dwaipayanray1@gmail.com>
 <8e110121c89414ab1601071868dbcf410195a209.camel@perches.com>
 <CABJPP5CFE3KXzMzuvVxtJt5tOg8Ye6y1V7-mqT5pqazHjVWvJw@mail.gmail.com>
 <f3dadda8af7eef6613d7a4105170058f2759507d.camel@perches.com>
 <CABJPP5AM01voDwARL4G0vMhFw4hMY+=dEQ7=obiKPzNtunyb7Q@mail.gmail.com>
 <361bda20762efce0e374bd2ba7c82d1c64628a67.camel@perches.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: fix
	multi-statement macro checks
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

On Thu, 2020-10-01 at 07:38 -0700, Joe Perches wrote:
> On Thu, 2020-10-01 at 19:44 +0530, Dwaipayan Ray wrote:
> > On Thu, Oct 1, 2020 at 7:12 PM Joe Perches <joe@perches.com> wrote:
> > > On Thu, 2020-10-01 at 18:57 +0530, Dwaipayan Ray wrote:
> > > > On Thu, Oct 1, 2020 at 6:47 PM Joe Perches <joe@perches.com> wrote:
> > > > > On Thu, 2020-10-01 at 16:03 +0530, Dwaipayan Ray wrote:
> > > > > > Checkpatch.pl doesn't have a check for excluding while (...) {...}
> > > > > > blocks from MULTISTATEMENT_MACRO_USE_DO_WHILE error.
> > > > > > 
> > > > > > For example, running checkpatch.pl on the file mm/access.c in the
> > > > > > kernel generates the following error:
> > > > > > 
> > > > > > ERROR: Macros with complex values should be enclosed in parentheses
> > > > > > +#define copy_from_kernel_nofault_loop(dst, src, len, type, err_label)        \
> > > > > > +     while (len >= sizeof(type)) {                                   \
> > > > > > +             __get_kernel_nofault(dst, src, type, err_label);        \
> > > > > > +             dst += sizeof(type);                                    \
> > > > > > +             src += sizeof(type);                                    \
> > > > > > +             len -= sizeof(type);                                    \
> > > > > > +     }
> > > > > > 
> > > > > > The error is misleading for this case. Enclosing it in parantheses
> > > > > > doesn't make any sense.
> > > > > 
> > > > > OK
> > > > > 
> > > > > > Checkpatch already has an exception list for such common macro types.
> > > > > > Added a new exception for while (...) {...} style blocks to the same.
> > > > > > This effectively fixed the wrong error message.
> > > > > []
> > > > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > > > []
> > > > > > @@ -5342,6 +5342,7 @@ sub process {
> > > > > >                           $dstat !~ /^\.$Ident\s*=/ &&                                # .foo =
> > > > > >                           $dstat !~ /^(?:\#\s*$Ident|\#\s*$Constant)\s*$/ &&          # stringification #foo
> > > > > >                           $dstat !~ /^do\s*$Constant\s*while\s*$Constant;?$/ &&       # do {...} while (...); // do {...} while (...)
> > > > > > +                         $dstat !~ /^while\s*$Constant\s*$Constant\s*$/ &&           # while (...) {...}
> > > 
> > > Note the \s*
> > >                                                               ^
> > > 
> > > > > Did you try to output $dstat for some matching cases?
> > > > > What was the $dstat value for the cases you tried?
> > > > > 
> > > > > 
> > > > Hi,
> > > > I did check $dstat values.
> > > > 
> > > > For example on file mm/maccess.c, there were two such macros:
> > > > 
> > > > Case 1:
> > > > 
> > > > $ctx:
> > > > +#define copy_from_kernel_nofault_loop(dst, src, len, type, err_label) \
> > > > + while (len >= sizeof(type)) { \
> > > > + __get_kernel_nofault(dst, src, type, err_label); \
> > > > + dst += sizeof(type); \
> > > > + src += sizeof(type); \
> > > > + len -= sizeof(type); \
> > > > + }
> > > > 
> > > > $dstat:
> > > > while 1 1
> > > 
> > > And perhaps this test should use \s+ instead.
> > > What is $dstat with a #define like:
> > > 
> > > #define foo(bar,baz)while(bar){bar--;baz++;}
> > > 
> > > (no spaces anywhere bot the required one after define
> > > 
> > 
> > In this case, $dstat is: while11
> > 
> > So, if \s+ is used, it won't match with this. I ran checkpatch
> > on it and some other condition seems to match, so it is
> > excluded from the error.
> > 
> > However, if the macro is like:
> > 
> > #define foo(bar,baz)while(bar) {bar--;baz++;}
> > (one space after condition)
> > 
> > $dstat is: while1 1
> > (space after first 1)
> > and the same error is again emitted.
> > 
> > So I think \s* works better since there can be
> > 0 or more whitespaces between them.
> 
> All I'm trying to point out to you is that $Constant\s*$Constant
> isn't a proper test as the first $Constant will pull the test
> entire sequence of digits and the second $Constant will not be
> met.
> 
> It may take some conversion of the collapsing of the dstat
> block to work appropriately
> 
> 
> 			# Flatten any parentheses and braces
> 			while ($dstat =~ s/\([^\(\)]*\)/1/ ||
> 			       $dstat =~ s/\{[^\{\}]*\}/1/ ||
> 			       $dstat =~ s/.\[[^\[\]]*\]/1/)
> 			{
> 			}
> 
> Maybe the /1/ should be / 1 / but I didn't look to see what
> happens to the exclusion tests below that.

I think your patch would work well enough if the /1/ bits
here were simply changed to /1u/.

1 is a $Constant as it's just a number.
11 though is also a $Constant.
1u is also a $Constant but it stops the acquisition of
digits that 11 would not and the sequence of
"while1u1u" should match your newly introduced test
of $Constant\s*$Constant as "while11" would not match.







> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
