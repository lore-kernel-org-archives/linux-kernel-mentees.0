Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B819C56201
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 20:57:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B22EA2098B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 20:57:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CItn4+dM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B22EA2098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1D06B87674;
	Fri, 23 Oct 2020 20:57:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4to9ksENEL8h; Fri, 23 Oct 2020 20:57:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AC7868760D;
	Fri, 23 Oct 2020 20:57:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A07D0C0052;
	Fri, 23 Oct 2020 20:57:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95EDDC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 20:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8267D207B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 20:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pywP+AGKqBL8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 20:57:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 5348920514
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 20:57:35 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id m22so2580897ots.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 13:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Q8U+/L+NAiRMdEBVnPpKYlruFlFQNzfDyRSymCS36c=;
 b=CItn4+dM+cWWmNiowOMFXvq9LN4GMPvAPD7XH8de04+O2R8pu8O3HFIeVGOE8PqtUc
 ZspxhlmfaEwDafnVzByaj/vrEY1JudiGizG+mcmam/4dx5G/zXbG3L456Y7nyFPEVDQq
 CFkYNkOPLHg8+H1O6NuugtrNZ1H+gArqi8waCIVeECZ+1gc5rcxlJDOa30OmdG7yo6Uz
 4xdt/agS32663/X+bhNEKix2ifHHJE+I1HPf220V7NeUTcq7dA10qavuyMML9TPSAJFF
 gOTG7EBIyuHei5muqksmsVTk0YBNfI1yCWrEJU8UDRs2SStbXozawXW1zCRjace47zWH
 tRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Q8U+/L+NAiRMdEBVnPpKYlruFlFQNzfDyRSymCS36c=;
 b=balZXT4hawCNoLye/QRAdxQS2XmeZwfV5Gvs+Hqjl7BeodFJMraA05SBpIyiv0TQac
 JV4put9dIVAX/67ub57USBmOOzy7mgyNTINgGH8CuhYfjvlhCOOXSqETENvg6hC0aokw
 e13EILP9uhGf3OmfJUBXliqIACgxGNBwyW/WFi7EAC3BJHunrMaMjqPXPD1xxZgSyP0S
 HJtYToqKuR6Oa28nR1FhAagC5fhjp9ONKMyXFNIXPx2o8hN1YXc7FiYsz9Rl2lginjR6
 El6CAlqv9OF0/6FjeKL5U6LLMXxy0dwbb8TLrKw5Yp/BcoBims4vKMEG4+5EKhf6h/nA
 BgBQ==
X-Gm-Message-State: AOAM531L4+uYjjR+PAgjwgay7lhVej75gyNscIFNujn+/HBc1UkacWAg
 yPslVL3gzNUmbslbwN1Fnin41YOC5xWVENKjt6g=
X-Google-Smtp-Source: ABdhPJyOLkHkxb4WQxUBzquEtUfl5S2mbcqKFZaUqbtDYYpTb7DpMjuz1m7knFJj9r+KXaBZtOc20iTkNUQ0vZOOldo=
X-Received: by 2002:a05:6830:1db1:: with SMTP id
 z17mr3510344oti.30.1603486654226; 
 Fri, 23 Oct 2020 13:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201023094307.20820-1-dwaipayanray1@gmail.com>
 <d2b05b45adbcf3f1d16692b054862a7aa7353f6d.camel@perches.com>
 <CABJPP5Dx4qj-_0gOx0bmaWvJj3okB-tNGJg5-8Y3KF2LnCjowQ@mail.gmail.com>
 <2e8279841d604dde8a3335c092db921007f6744e.camel@perches.com>
 <2a3b90ee-b9bd-2586-9d68-45cbf7e499a9@gmail.com>
 <8710630d8c01bf6f3749e3d11d193a805f2d2048.camel@perches.com>
In-Reply-To: <8710630d8c01bf6f3749e3d11d193a805f2d2048.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 24 Oct 2020 02:27:05 +0530
Message-ID: <CABJPP5AcjAq0kg0MMggd2D6YUwVhq96otm-qQB3Snddt77VxAA@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC v2] checkpatch: extend
	attributes check to handle more patterns
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

On Sat, Oct 24, 2020 at 2:12 AM Joe Perches <joe@perches.com> wrote:
>
> On Sat, 2020-10-24 at 00:44 +0530, Dwaipayan Ray wrote:
> > Hi,
>
> Hi again.
>
> > I modified the check to check the attributes from the map.
> > There are two checks - one for the normal attributes and
> > one for the ones with arguments, which needs just a bit more
> > processing.
> >
> > So attributes like __packed__ as well as those like
> > __aligned__(x) are handled.
> >
> > What do you think?
> >
> > ---
> > +            $line =~ /__attribute__\s*\(\s*($balanced_parens)\s*\)/)
> > {
> > +            my $attr = trim($1);
> > +            $attr =~ s/\(\s*_*(.*)\)/$1/;
> > +            while($attr =~ s/(.*)_$/$1/) {}  # Remove trailing
> > underscores
>
>         I think this could be a single test like:
>
>                 while ($attr =~ /\s*(\w+)\s*(${balanced_parens})?/g) {
>                         my $curr_attr = $1;
>                         my $parens = $2;
>                         $curr_attr = s/^_*(.*)_*$/$1/;
>

Thanks, I will do that.

Also I tried the pattern  attr =~ s/^_*(.*)_*$/$1/
for trimming the _ earlier. I think it doesn't trim the
trailing underscores in the suffix as (.*) captures everything greedily.

Is the iterative one perhaps okay instead?
while($attr =~ s/(.*)_$/$1/) {}

> > +            my %attr_list = (
> > +                "alias"            => "__alias",
> > +                "aligned"        => "__aligned",
>
> These might be better using tab alignment.
>
> And you might special case format(printf/scanf here too

Yes I think they are special cases now too. I didn't post the
entire context, so my mistake.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
