Return-Path: <SRS0=DonT=C4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D551C43463
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 07:25:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DDEC2073A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 07:25:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuUwt65q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DDEC2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 33A6F20482;
	Sat, 19 Sep 2020 07:25:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LvDTszEpxq-a; Sat, 19 Sep 2020 07:25:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 82AF420464;
	Sat, 19 Sep 2020 07:25:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6EB76C1AD4;
	Sat, 19 Sep 2020 07:25:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84231C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 07:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 69B94873B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 07:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Br3nOJKXIXx0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 07:25:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0BEB4873A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 07:25:40 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id u21so11039834eja.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 00:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Y3foRLn1iif1Js5Y9jB9S5ISo69dDeV/Ham999ycssg=;
 b=KuUwt65qNAzsA6L7JJj8COXj+a9WOzpG+J94W2KzWWmrp+/cC1HrXL/5VJ7pIlmFsH
 qHxcO0TZenZD/tBtkhJhp72HRqrhsUr+sXyYm2+IU68GSeGWp5tXmESYfR5dUDBBFRJ7
 9/yWkCRudJi82ESsD0OIqfTdADA3xJJDOaBSdtgtRnySCQNhWMZ9vPCvdD/EvWXI8fRL
 H3qGAJx56EMcFnTsX+/iAN3FUddwkkpSRMQIfhbHb5i4vqXQPl+jQHZJ/dJJB5Mdbyt/
 xhwKfhzmpud9E8tpK7gYvJDF8YTPGIGLT3qF5n6FZGtPfSuIffB2BJokzVMyqFjINqvP
 z7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Y3foRLn1iif1Js5Y9jB9S5ISo69dDeV/Ham999ycssg=;
 b=Tkkepe6zzayC8y5Kzew0kpt2SMQmnJYjWX/JJcyFkeRPCYbdPrv2EboX36iVBamifo
 y8HkG546hd8Xg2OnSPIrc1Ykmz++bIFLfW6proK5dA0h2FwdL+aagAJ4HdtEiEf3ratv
 YTNb9Q+1MKREEQmQ12mKmQe/rXWf53EczAy+KAhUzHqYtE2JZ4dtK9mg0MEuPGfsuBXZ
 JnsGhUfYKbUG2ZvGf/JbSBVu8rGgzAeRcLQQzoAx4r5WGDFFTqDHfF6/R3a87vMo5oIx
 HfVrbVuW24aYfSREwJPTAFPy0f0WHf+Orn2LtZGure40FKtNqMftdJxbE66GS0iALQXW
 sDIQ==
X-Gm-Message-State: AOAM532o/P9ezv21kf0aJXQ9fquYkzQ3wxihK6lxkGppo8lhuFF79Nri
 YIZptfjT5kGvfbcYmhdIcT8=
X-Google-Smtp-Source: ABdhPJxznRGv3RRxD31vajJaY+sHeLmKrBfvLY4/F5JVWXxw2HJMMtLWfC6WfuL8IIfc+s7vX0vn+w==
X-Received: by 2002:a17:906:a00d:: with SMTP id
 p13mr41022777ejy.535.1600500338424; 
 Sat, 19 Sep 2020 00:25:38 -0700 (PDT)
Received: from felia ([2001:16b8:2dba:3d00:297f:f5f4:f870:61b])
 by smtp.gmail.com with ESMTPSA id lo25sm3839075ejb.53.2020.09.19.00.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 00:25:37 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 19 Sep 2020 09:25:32 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5D2h95X7WWzP0Nq+e2QcuPbrpp-noFmR9ZJvUw3GszVZA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009190911580.3948@felia>
References: <20200918122950.94098-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2009181439160.14717@felia>
 <CABJPP5D2h95X7WWzP0Nq+e2QcuPbrpp-noFmR9ZJvUw3GszVZA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix author
 Signed-off-by warning for split From: header
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



On Sat, 19 Sep 2020, Dwaipayan Ray wrote:

> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > index 504d2e431c60..8c4119ca7d17 100755
> > > --- a/scripts/checkpatch.pl
> > > +++ b/scripts/checkpatch.pl
> > > @@ -2347,6 +2347,7 @@ sub process {
> > >       my $signoff = 0;
> > >       my $author = '';
> > >       my $authorsignoff = 0;
> > > +     my $prevheader = 0;
> > >       my $is_patch = 0;
> > >       my $is_binding_patch = -1;
> > >       my $in_header_lines = $file ? 0 : 1;
> > > @@ -2658,12 +2659,22 @@ sub process {
> > >                       }
> > >               }
> > >
> > > +# Check the patch for a split From:
> > > +             if ($author eq '' && decode("MIME-Header", $prevheader) =~ /^From:\s*(.*)/) {
> >
> > How about extending to check if $prevheader is not 0?
> >
> > > +                     $author = $1.$line;
> > > +                     $author = encode("utf8", $author) if ($prevheader =~ /=\?utf-8\?/i);
> > > +                     $author =~ s/"//g;
> > > +                     $author = reformat_email($author);
> > > +                     $prevheader = '';
> > > +             }
> > > +
> > >  # Check the patch for a From:
> > >               if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
> > >                       $author = $1;
> > >                       $author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
> > >                       $author =~ s/"//g;
> > >                       $author = reformat_email($author);
> > > +                     $prevheader = $line;
> > >               }
> > >
> >
> > So here we see two almost identical parts of code now, right?
> >
> > Either use a small function or restructure the code such that the
> > differences are in two branches and the common code is part of one common
> > control flow. You are a good programmer, you can figure this out.
> >
> 
> Hi,
> I have changed the structure around a bit.
>

Next time, please just send a proper PATCH v2 when you rework a patch.

 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 504d2e431c60..86975baead22 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1210,6 +1210,16 @@ sub reformat_email {
>     return format_email($email_name, $email_address);
>  }
> 
> +sub format_author_email {
> +   my ($email, $from) = @_;
> +
> +   $email = encode("utf8", $email) if ($from =~ /=\?utf-8\?/i);
> +   $email =~ s/"//g;
> +   $email = reformat_email($email);
> +
> +   return $email;
> +}
> +
>  sub same_email_addresses {
>     my ($email1, $email2) = @_;
> 
> @@ -2347,6 +2357,7 @@ sub process {
>     my $signoff = 0;
>     my $author = '';
>     my $authorsignoff = 0;
> +   my $prevheader = '';
>     my $is_patch = 0;
>     my $is_binding_patch = -1;
>     my $in_header_lines = $file ? 0 : 1;
> @@ -2658,12 +2669,21 @@ sub process {
>             }
>         }
> 
> +# Check the patch for a split From:
> +       if($prevheader ne '') {
> +           if ($author eq '' && decode("MIME-Header", $prevheader) =~
> /^From:\s*(.*)/) {
> +               my $email = $1.$line;
> +               $author = format_author_email($email, $prevheader);
> +           }
> +           $prevheader = '';
> +       }
> +
>  # Check the patch for a From:
>         if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
> -           $author = $1;
> -           $author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
> -           $author =~ s/"//g;
> -           $author = reformat_email($author);
> +           $author = format_author_email($1, $line);
> +           if($author eq '') {
> +               $prevheader = $line;
> +           }
>         }
> 
>  # Check the patch for a signoff:
> 
> Is it good to go? I shall mail it in then.
>

Yes, I think it is good for a first submission.

Please use ./scripts/get_maintainers.pl to find the developers to send 
this patch to.

Also CC: me and the linux-kernel-mentees mailing list.

Once, the list is on the linux-kernel mailing list, we will start 
reviewing and testing your patch.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
