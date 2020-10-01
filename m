Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B23C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 13:42:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74F48206FC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 13:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74F48206FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 23FFE2041D;
	Thu,  1 Oct 2020 13:42:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ILlCGqUj6otz; Thu,  1 Oct 2020 13:42:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2E5B720408;
	Thu,  1 Oct 2020 13:42:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14477C016F;
	Thu,  1 Oct 2020 13:42:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A7E9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 18BDF2041D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3MJjiFd8sK+4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:42:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0046.hostedemail.com
 [216.40.44.46])
 by silver.osuosl.org (Postfix) with ESMTPS id 767B820408
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:42:36 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 30C70100E7B49;
 Thu,  1 Oct 2020 13:42:35 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: power08_61089732719b
X-Filterd-Recvd-Size: 4147
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Thu,  1 Oct 2020 13:42:34 +0000 (UTC)
Message-ID: <f3dadda8af7eef6613d7a4105170058f2759507d.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 01 Oct 2020 06:42:32 -0700
In-Reply-To: <CABJPP5CFE3KXzMzuvVxtJt5tOg8Ye6y1V7-mqT5pqazHjVWvJw@mail.gmail.com>
References: <20201001103314.136645-1-dwaipayanray1@gmail.com>
 <8e110121c89414ab1601071868dbcf410195a209.camel@perches.com>
 <CABJPP5CFE3KXzMzuvVxtJt5tOg8Ye6y1V7-mqT5pqazHjVWvJw@mail.gmail.com>
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

On Thu, 2020-10-01 at 18:57 +0530, Dwaipayan Ray wrote:
> On Thu, Oct 1, 2020 at 6:47 PM Joe Perches <joe@perches.com> wrote:
> > On Thu, 2020-10-01 at 16:03 +0530, Dwaipayan Ray wrote:
> > > Checkpatch.pl doesn't have a check for excluding while (...) {...}
> > > blocks from MULTISTATEMENT_MACRO_USE_DO_WHILE error.
> > > 
> > > For example, running checkpatch.pl on the file mm/access.c in the
> > > kernel generates the following error:
> > > 
> > > ERROR: Macros with complex values should be enclosed in parentheses
> > > +#define copy_from_kernel_nofault_loop(dst, src, len, type, err_label)        \
> > > +     while (len >= sizeof(type)) {                                   \
> > > +             __get_kernel_nofault(dst, src, type, err_label);        \
> > > +             dst += sizeof(type);                                    \
> > > +             src += sizeof(type);                                    \
> > > +             len -= sizeof(type);                                    \
> > > +     }
> > > 
> > > The error is misleading for this case. Enclosing it in parantheses
> > > doesn't make any sense.
> > 
> > OK
> > 
> > > Checkpatch already has an exception list for such common macro types.
> > > Added a new exception for while (...) {...} style blocks to the same.
> > > This effectively fixed the wrong error message.
> > []
> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > []
> > > @@ -5342,6 +5342,7 @@ sub process {
> > >                           $dstat !~ /^\.$Ident\s*=/ &&                                # .foo =
> > >                           $dstat !~ /^(?:\#\s*$Ident|\#\s*$Constant)\s*$/ &&          # stringification #foo
> > >                           $dstat !~ /^do\s*$Constant\s*while\s*$Constant;?$/ &&       # do {...} while (...); // do {...} while (...)
> > > +                         $dstat !~ /^while\s*$Constant\s*$Constant\s*$/ &&           # while (...) {...}

Note the \s*
                                                              ^

> > Did you try to output $dstat for some matching cases?
> > What was the $dstat value for the cases you tried?
> > 
> > 
> Hi,
> I did check $dstat values.
> 
> For example on file mm/maccess.c, there were two such macros:
> 
> Case 1:
> 
> $ctx:
> +#define copy_from_kernel_nofault_loop(dst, src, len, type, err_label) \
> + while (len >= sizeof(type)) { \
> + __get_kernel_nofault(dst, src, type, err_label); \
> + dst += sizeof(type); \
> + src += sizeof(type); \
> + len -= sizeof(type); \
> + }
> 
> $dstat:
> while 1 1

And perhaps this test should use \s+ instead.
What is $dstat with a #define like:

#define foo(bar,baz)while(bar){bar--;baz++;}

(no spaces anywhere bot the required one after define
	
> Case 2:
> 
> $ctx:
> +#define copy_to_kernel_nofault_loop(dst, src, len, type, err_label) \
> + while (len >= sizeof(type)) { \
> + __put_kernel_nofault(dst, src, type, err_label); \
> + dst += sizeof(type); \
> + src += sizeof(type); \
> + len -= sizeof(type); \
> + }
> 
> $dstat:
> while 1 1
> 
> 
> Thanks,
> Dwaipayan.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
