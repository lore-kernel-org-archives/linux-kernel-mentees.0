Return-Path: <SRS0=D/zP=C2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9264C2BBD1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 14:18:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 377E220708
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 14:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCPhJ/eg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 377E220708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A5AF720415;
	Thu, 17 Sep 2020 14:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iS92GDEN1hpX; Thu, 17 Sep 2020 14:18:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B81222035B;
	Thu, 17 Sep 2020 14:18:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB740C0864;
	Thu, 17 Sep 2020 14:18:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90CDAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8B66587615
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7QkNUP5QI90a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:18:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F05A6875FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:18:53 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id j11so3607627ejk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 07:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Vl7S810UVlPB2NeexGFgOiSpQm4FsEY9VKQAYaonf/k=;
 b=CCPhJ/egw15MiE7OJ/AbkxtjZqg6fw2ynGBLWP/dwtzmXGM6UBTeAV/GGsndHdL1h3
 mq79YdL7gynv4gSqQRXcaJYQUq8YWUCBzQnqo1pAOyFiMxehljSgFXg79EJzsNuDnB0N
 mqH8frpqLeRJgW0AhBca0Db3VP5h7LhLiM27/EnpK0dAZjk9w6ROxY+YwPofJYBYaXKH
 IAN/l6CNrnaNtpXizI524XlXajg8j7p2MhSCJcnaw1iZM2hAUHupv4DN+YQnk/ywQuYm
 3Ko2xi//5HvSRnqifQUhvtRgbUAQ7bK4ztYoYc5iwhYP6Mj918BMfZvH5OP/Xpt9O0eO
 7krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Vl7S810UVlPB2NeexGFgOiSpQm4FsEY9VKQAYaonf/k=;
 b=S2ZGer+hqw1mB007xzh/KX59nomugL6Q5m4BwQo0yelOsVQuO8I1aOzveTDvC/zqbE
 U2UhhFob2eqvcCsctQciF3V3Ty72V3DRzfZ0Coj3GG7e2IADDU8ibWzZMYZzKVs1Bifa
 ho0Rz3adxTvvjME/SWDQSWd3tahp1p9XZ3h3H1sQLm9btT/YUFKL/5QF8wJA1zAJPGEL
 w5AJU5/1CgxUZOHM/c7pBcM+rUJnRZR9N9KCdyK0q62vCo5m3K2xSvWFzBBDE0mQvDH8
 wj1tfSEZ+3aPLQunxdVR+BFgv6zAInMmmNE4A+/99xcnXNbhWbtsO5IeuqP2hisUFni2
 UPag==
X-Gm-Message-State: AOAM530MPbPc9w/SToYojjUjVdVSGQ48lCHUw1v4N6GgTW+RkJI57Mhg
 XRyP5z6G0hsth3l8Xm/6DWI=
X-Google-Smtp-Source: ABdhPJwe8HlzNJPK7/xbd0Miz6Tyh5lVL4+yf/I+so01ys5P7GMauIgOpJU15SKHfCeEQIeFAlk9Zg==
X-Received: by 2002:a17:906:68d2:: with SMTP id
 y18mr31537791ejr.197.1600352332468; 
 Thu, 17 Sep 2020 07:18:52 -0700 (PDT)
Received: from felia ([2001:16b8:2da3:1100:b096:8628:b410:46b3])
 by smtp.gmail.com with ESMTPSA id c22sm16592290edr.70.2020.09.17.07.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 07:18:51 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 17 Sep 2020 16:18:50 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5BBUsSQBDi1QbL7xgVdRUqMG7OWXcNSUKsMN601Y3EYbw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009171614150.9985@felia>
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009121419430.3770@felia>
 <CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com>
 <alpine.DEB.2.21.2009131301570.22585@felia>
 <CABJPP5BmRcC+OTSjuX_QrYononVq__DkhjGOgiKrP147MAXK+g@mail.gmail.com>
 <alpine.DEB.2.21.2009132010300.6806@felia>
 <CABJPP5BaUss9pWq=e+UDmVvr-puJsBtSVppST+CTcB8JkEdLmQ@mail.gmail.com>
 <alpine.DEB.2.21.2009140716420.7737@felia>
 <CABJPP5D87ZVTfZ4QHxp5vweTN16LQCy+rniq-uDVCvKkbYRDNg@mail.gmail.com>
 <alpine.DEB.2.21.2009141535010.17999@felia>
 <CABJPP5Aniv2kQ4wfAD9JuR_7Q5pjChasHZTAvBWOOaza4H3VSg@mail.gmail.com>
 <alpine.DEB.2.21.2009142016150.6496@felia>
 <CABJPP5DhzCHz6PM7bLzW9s1=VckN_+qnaUuYO148xSL59Q-pkA@mail.gmail.com>
 <alpine.DEB.2.21.2009160837380.10877@felia>
 <CABJPP5Dtz7VagfY+h2Qcm=XH6W7EQxXv1QReJLU9pnz2Jp_coQ@mail.gmail.com>
 <CABJPP5BBUsSQBDi1QbL7xgVdRUqMG7OWXcNSUKsMN601Y3EYbw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux kernel checkpatch.pl mentorship
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



On Thu, 17 Sep 2020, Dwaipayan Ray wrote:

> > So you see in all these cases non ascii characters are present. I looked
> > into checkpatch.pl .
> >
> > line 2662:
> >         if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
> >            $author = $1;
> >             $author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
> >             $author =~ s/"//g;
> >             $author = reformat_email($author);
> >         }
> >
> > When i looked into $line, it gave below:
> > From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie
> > =29?=
> > <zhouyanjie@wanyeetech.com>
> >
> > And at the end of this block, $author was equal to ''.
> > There seems to be a parsing problem there.
> 
> Also I looked into this output more, and I looked into the git
> history. For the FROM:
> parsing part, the author wrote this:
> 
> "Non-ASCII quoted printable encoding in From: headers and (lack of) double
> quotes are handled.  Split From: headers are not fully handled: only the
> the first part is compared."
> 
> So the problem instead seems to be the Split From: headers. In all the
> cases that I
> mentioned, due to formatting issues or something, the email address was
> pushed off into the next line, due to which parsing fails.
> 
> A solution would be to write logic for handling these Split From:
> headers, which the
> author left off.
>

Good investigation. Can you please share the commit of the commit message 
you refer to in the future?

I found it, commit cd2614967d8b ("checkpatch: warn if missing author 
Signed-off-by"), but to convince the maintainers and authors that you did 
your homework properly, it is good to refer to the commits you looked at.

The kernel documentation tells you how to refer to commits.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
