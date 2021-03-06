Return-Path: <SRS0=Yqm+=IE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A38C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Mar 2021 06:25:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8D7064FFD
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Mar 2021 06:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8D7064FFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72E2643020;
	Sat,  6 Mar 2021 06:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MYSmtyXx2CxA; Sat,  6 Mar 2021 06:25:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 914BF414E0;
	Sat,  6 Mar 2021 06:25:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79238C000A;
	Sat,  6 Mar 2021 06:25:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E6EDC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 06:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8445F844C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 06:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BU6ftSxXRgCa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 06:25:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0A50844A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 06:25:36 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id a7so4365279iok.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Mar 2021 22:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jdO1rf7D9EsXwVNciVZC9BRLn0JylmSd2lI++KNulbQ=;
 b=GaG/tbR38USl4WlqilVcCQVEmq0VZF26liI+vquXhzo/Bw30snBaYBdpqe6V0LYoO/
 b36VvrgbYtu8mrhEYqtKiSTAPyl/HrnyK0x/ISUQHuAE8tYCpKz7T1YbeZuRKpMUHZgt
 DHuufiyvtDKUohdVMA/Z/QNlhiIG7FuJZGp6a5R8QU9hxkAoewj+Rxq1JSgsqMkhTXKF
 kCczUhf+s9Wi8P77ZO0vIGW2ZTsRl4LRQt01y75rl1KB3l2Hmfdo3JYLvB0nq9YRouDL
 DK6viUNjy6zeuab+a7SUQ577iBQbO/HpC6F8sW7leaadWH1PsJofMIWzebMLFY/KpNxf
 hOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jdO1rf7D9EsXwVNciVZC9BRLn0JylmSd2lI++KNulbQ=;
 b=swEkN3c+LV7ae4mtCEWKtZ5Y5Am4/KmYVpSkHoChhvoLtt9ZUJeUDWZatvHlstzKX0
 AYDthhSoOIlYrS0rCElAE7bOTiHaMGT8nqgygRZewJO9HTy86RNllphLiITwHJoolAXb
 8U/EueGG4/lY89SS4a2HXGuJ14DgjKTN+uFeSWMKMe7NHh3iwmiNd7p9vQA+w9GJOSQe
 MwPRnohSW4L2d92/5U+VwN/VQcwlAPqnQsGmeKRH7EyejaHggJpVCEQm421YzMayguQn
 RcmdGkxv2ML8woxK2PIe7Fo5I77PBCl9CG+A9wKannCxpKMJtXZwduZE8UtA2RNGKSlI
 QGJw==
X-Gm-Message-State: AOAM530FQoFEPRn7MVf6g6xA7ekhAy09tm6kjr0pIQTOBueaPpqN/D/J
 PsbyojRlixqRIH3Tp/dpPc+vuiA2ynTDiWJbXNg=
X-Google-Smtp-Source: ABdhPJySV6iVcfmYrhCE3WKy3pV/m8SSKIZfQh7oC8hC2RiqNpAIeJ1i5Q9UPudju7pmM9R2mzcWMLCvvmuXy3m5GL4=
X-Received: by 2002:a5e:cb4c:: with SMTP id h12mr10716369iok.183.1615011936034; 
 Fri, 05 Mar 2021 22:25:36 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMzHPnM=ie06ZGuFXyJ7RcRjYomjyASbp3ND9-Mb2Es+2w@mail.gmail.com>
 <20210225145033.11431-1-yashsri421@gmail.com>
 <20210306043548.GO2723601@casper.infradead.org>
In-Reply-To: <20210306043548.GO2723601@casper.infradead.org>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 6 Mar 2021 07:25:25 +0100
Message-ID: <CAKXUXMwD_ZZA7EJaxZBRfMDEvwd4Ghsj2vy9KCfj0R-yx2_K0Q@mail.gmail.com>
Subject: Re: [RFC v3] scripts: kernel-doc: fix typedef support for
 struct/union parsing
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
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

On Sat, Mar 6, 2021 at 5:35 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Thu, Feb 25, 2021 at 08:20:33PM +0530, Aditya Srivastava wrote:
> > +++ b/scripts/kernel-doc
> > @@ -1201,12 +1201,23 @@ sub dump_union($$) {
> >  sub dump_struct($$) {
> >      my $x = shift;
> >      my $file = shift;
> > +    my $decl_type;
> > +    my $members;
> > +    my $type = qr{struct|union};
> > +    # For capturing struct/union definition body, i.e. "{members*}qualifiers*"
> > +    my $definition_body = qr{\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*};
> > -    if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
> > -     my $decl_type = $1;
> > +    if ($x =~ /($type)\s+(\w+)\s*$definition_body/) {
> > +     $decl_type = $1;
> >       $declaration_name = $2;
> > -     my $members = $3;
> > +     $members = $3;
> > +    } elsif ($x =~ /typedef\s+($type)\s*$definition_body\s*(\w+)\s*;/) {
> > +     $decl_type = $1;
> > +     $declaration_name = $3;
> > +     $members = $2;
> > +    }
>
> In the same spirit as dump_function, would something like this work?
>

I agree. That might be a suitable clean-up to keep the code for
functions and struct/union parsing similar in style/spirit.

Aditya, would you like to create a patch for that?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
