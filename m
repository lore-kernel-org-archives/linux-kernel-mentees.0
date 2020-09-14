Return-Path: <SRS0=UGpm=CX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8821C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 05:17:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F67F214F1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 05:17:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHrWfLEo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F67F214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F20EF871B3;
	Mon, 14 Sep 2020 05:17:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8FzHCF8f7D7u; Mon, 14 Sep 2020 05:17:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 92109871B0;
	Mon, 14 Sep 2020 05:17:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84F8DC088B;
	Mon, 14 Sep 2020 05:17:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDD8FC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 05:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C9837871B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 05:17:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCuqJJV79mJy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 05:17:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 150B7871B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 05:17:56 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id p9so21321948ejf.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 22:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=UstYmeKWrQjcjNdNIIZ+qe2AL1KRVlUaxxjcEdrHQHc=;
 b=AHrWfLEoNuNja12lUBrz9AYqzjUjUOnnrEhg38fXFROlrDGTVhN1VmkloJl0NT/drT
 V+Q587uk4UYFq3msi4pb8x2A4nybg4dKAG+O/aRlAvoWZYiZhRWQgm1ZZO0NoByNU01+
 t6On+geNejponi13LOHlpY5T6plwfYAzg/qcIPW1OYWjWIfWNOdB2ZUlVNZfg3cOVVAf
 i/W3HH0c4W/3WokpE7C7dmavn5KwNgevCl6yP2TRFjxJfa2YVJVHDQwYUVtpGS8gBnHr
 WxnLVE/zKmd/dzeYMTAHt2sMA9zSE8PeUn0c7UH6KM9z9xCQPlhY1Eez/AIfm6PRDyz2
 cRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=UstYmeKWrQjcjNdNIIZ+qe2AL1KRVlUaxxjcEdrHQHc=;
 b=qZEByHUpfgS/h3ubxjPT8KH7VUn0Nx2dOk0IqKEaQF0HIZ8buHWQJkOvkuocc6VIi8
 qOaclHWMUnZQ6wAK3OnK7vVi1WTZCgRomy9ECAg9YLiTvs1XKOtEfiK9OIHKzMJ7L6ms
 EMRLq7FqPiv93KnlWa04+W9y8Ae/FaYTqrnuPi/wF5z/wYllMGubcbNmYqyqByLJHX2I
 zYEVTSMKD3C9DuhFyc29vXCpiw1BqYz/xj4H81vq32mL6VDxnPB5pWDaPSiyDG76yAWV
 ETA/MGjHP/c16UInnG+JrjUUQ8VYg9KbT/DCI/5MWMSHGTlC+bbvqtlXV42+gHd5ssTt
 4AAA==
X-Gm-Message-State: AOAM530eWxJZpcztVkvXsFfillqyz3Fefo/K5BiAOFFHEiirmfRQPNXL
 grcM8wi6Wp0s575GNqjH+zYdCSokwXlf4w==
X-Google-Smtp-Source: ABdhPJxlVI+WXqt/m/uBhKezS0PLLJ4mRbj3YAYfreZe8ubYue3SeNYZUEdyGm7Oaor5D+oYLt2ztA==
X-Received: by 2002:a17:906:88d:: with SMTP id
 n13mr13240708eje.75.1600060674473; 
 Sun, 13 Sep 2020 22:17:54 -0700 (PDT)
Received: from felia ([2001:16b8:2ddc:3000:7936:d9d0:986e:cca5])
 by smtp.gmail.com with ESMTPSA id m2sm6807561ejo.4.2020.09.13.22.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 22:17:53 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 14 Sep 2020 07:17:52 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5BaUss9pWq=e+UDmVvr-puJsBtSVppST+CTcB8JkEdLmQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009140716420.7737@felia>
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009110925160.9220@felia>
 <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
 <alpine.DEB.2.21.2009121252280.13082@felia>
 <CABJPP5DMF9OpZR0agobunb3i3hLGkqedbeL-YohNn0X6Juk64w@mail.gmail.com>
 <alpine.DEB.2.21.2009121419430.3770@felia>
 <CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com>
 <alpine.DEB.2.21.2009131301570.22585@felia>
 <CABJPP5BmRcC+OTSjuX_QrYononVq__DkhjGOgiKrP147MAXK+g@mail.gmail.com>
 <alpine.DEB.2.21.2009132010300.6806@felia>
 <CABJPP5BaUss9pWq=e+UDmVvr-puJsBtSVppST+CTcB8JkEdLmQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1371501500-1600060673=:7737"
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1371501500-1600060673=:7737
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 14 Sep 2020, Dwaipayan Ray wrote:

> 
> 
> > You should also try to find a case where checkpatch.pl can be improved:
> >
> > - It is best if you look at the checkpatch.pl error/warning reports and
> > check if you can find a class of typical false positives in the reported
> > data. Then, think about how to make the pattern in checkpatch and propose
> > a patch to checkpatch.pl on this mailing list; with the evaluation data
> > backing that your patch really improves the situation. We will then test
> > and check your patch as well.
> >
> > - If you really cannot find a typical false positive, maybe you can take
> > the task from Ayush to fix checkpatch with git ranges?
> >
> Hi,I will try to find and evaluate the possiblity of such a case, and report my finding 
> as soon as I find something substantial.
> 
> I may also require some advice from you on the patch submission process.
> 

That is what a mentor is there for, but try hard to understand the 
warnings yourself first. This is a mentorship, not a tutorial.

Lukas
--8323329-1371501500-1600060673=:7737
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-1371501500-1600060673=:7737--
