Return-Path: <SRS0=Yqm+=IE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77D2C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Mar 2021 06:38:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6568064E42
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Mar 2021 06:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6568064E42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C31F82A57;
	Sat,  6 Mar 2021 06:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0GwVv29nH7EY; Sat,  6 Mar 2021 06:38:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F0182A2E;
	Sat,  6 Mar 2021 06:38:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13E6BC000A;
	Sat,  6 Mar 2021 06:38:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC0B9C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 06:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 854D243127
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 06:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JUk3lOzzba6X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 06:38:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B846442C99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 06:38:50 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id i8so4420825iog.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Mar 2021 22:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v/sw+/0dBPQokk2b5m8FztuNfd7xqS1fRXTj5tWyq3w=;
 b=GfVFKlEpTDkLf60dzJSRpQN0KurTd+Yl6BBM8eU8fNVlXhYDoeQ72Y8bF2Cdr2iCn4
 /Ee6mpsOPnM5aVdO9wvgtFdNq6CHZ6neuRxvjdyP6SAHNcljLDMgu76Q/4qvsitkOg2D
 sNMSsxT0iyCFZIBqmrCww1PC1Jh6M0peUnuisjhNKpDfR32HeFFfzBFIfAMo3CbLk9hE
 50RVlbz3vmPlGUXaA7o/hzIQkLsytSEnlY9Us0o7vSkaiI7SFjToc7p2zFlhOIGTO+tI
 +BDXN9avPgBkhWrqEDUAg6v12NP26gegy+wugT6n5yJsbje+0YQ2ynQnR2iF82vbCmZb
 b1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v/sw+/0dBPQokk2b5m8FztuNfd7xqS1fRXTj5tWyq3w=;
 b=mKCqyb0qGK3nSDisb5dYFE7wUPyBhSxGwDDL59DmgA0/fqXtNZTKSjifdoNtmKqT0Y
 7A8jg1hyRZph4n0J+W/sXtNrPukpKmuafbcqqwgpSnEU4kUIODFAn0VAmnvnn4PcmSOu
 MMYHsHfPJeXsk2BdL390Bw0ifmfPHT4zuNhO/irVrG58nIqgsjH8z4tDDU2fEyxh6dmK
 Zsa5N3DMiLtkF6A0MVjLs/YSCgk5eXxDYDyfhzwNFvc49GdMy5H+HqvoNqLkforoMrRO
 1+svBbYnSKE7+RUxnk94zx96UlBKv+DyfDtXdGAncEMQSfu4Evwb/mB9WBIKB/mmWVJt
 ZfRw==
X-Gm-Message-State: AOAM533YL1DPlDsJvpljFY04KblByU2XNu7cXAAcpaWrJVhtKdWWeBs8
 2rRHue8xdoWc97GTt413Ht6RDdWD8XqXvzSVReA=
X-Google-Smtp-Source: ABdhPJw4Wg/pG/DiNIEzk3AX99dPL7N8vAXKtJeSEjZ5UKsgj2ZPkr0U+dNvNEuVexUBCDsH3DMe6SMvGRyC8jGTMo8=
X-Received: by 2002:a05:6602:2191:: with SMTP id
 b17mr11293912iob.114.1615012729875; 
 Fri, 05 Mar 2021 22:38:49 -0800 (PST)
MIME-Version: 1.0
References: <20210305182000.8363-1-yashsri421@gmail.com>
 <20210305184322.GN2723601@casper.infradead.org>
 <bcd38964-bfff-99c2-eb24-1942836e9526@gmail.com>
In-Reply-To: <bcd38964-bfff-99c2-eb24-1942836e9526@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 6 Mar 2021 07:38:39 +0100
Message-ID: <CAKXUXMwoYa6xbCsqnUYL5uSA71h_3xV7-8erF6XTpmkck8ozaw@mail.gmail.com>
Subject: Re: [RFC] scripts: kernel-doc: fix attribute capture in function
 parsing
To: Aditya <yashsri421@gmail.com>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Jonathan Corbet <corbet@lwn.net>
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

On Fri, Mar 5, 2021 at 8:38 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 6/3/21 12:13 am, Matthew Wilcox wrote:
> > On Fri, Mar 05, 2021 at 11:50:00PM +0530, Aditya Srivastava wrote:
> >> Provide a simple fix by adding "__attribute_const__" in the corresponding
> >> regex expression.
> >>
> >> A quick evaluation by running 'kernel-doc -none' on kernel-tree reveals
> >> that no additional warning or error has been added or removed by the fix.
> >
> > I'm no perlmonger, but why isn't this simply:
> >
> > +++ b/scripts/kernel-doc
> > @@ -1753,6 +1753,7 @@ sub dump_function($$) {
> >      $prototype =~ s/^__inline +//;
> >      $prototype =~ s/^__always_inline +//;
> >      $prototype =~ s/^noinline +//;
> > +    $prototype =~ s/__attribute_const__ +//;
> >      $prototype =~ s/__init +//;
> >      $prototype =~ s/__init_or_module +//;
> >      $prototype =~ s/__meminit +//;
> >
> > (completely untested)
> >
> >> +++ b/scripts/kernel-doc
> >> @@ -1753,6 +1753,7 @@ sub dump_function($$) {
> >>      my $prototype = shift;
> >>      my $file = shift;
> >>      my $noret = 0;
> >> +    my $attribute_const = qr{__attribute_const__};
> >>
> >>      print_lineno($new_start_line);
> >>
> >> @@ -1808,7 +1809,7 @@ sub dump_function($$) {
> >>      $prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> >>      $prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> >>      $prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> >> -    $prototype =~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> >> +    $prototype =~ m/^(\w+\s+\w+\s*\*+$attribute_const?)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> >>      $prototype =~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> >>      $prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> >>      $prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
>
> Hi Matthew
> You are correct, it should be placed there. I was considering it as a
> return type instead.
> I'll send a modified v2 with the changes.
>

Aditya, I also ran:

git ls-files | xargs ./scripts/kernel-doc -none 2>&1 | tee kernel-doc-output

cat kernel-doc-output | grep "cannot understand function prototype:" |
sed 's/[^:].*:[0-9]*: \(.*\)$/\1/' | sort

and I found another instance of failed parsing function prototypes in
mm/percpu.c:2671:

struct pcpu_alloc_info * __flatten pcpu_build_alloc_info(size_t
reserved_size, size_t dyn_size, size_t atom_size,
pcpu_fc_cpu_distance_fn_t cpu_distance_fn)

Could you address that one in your patch as well?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
